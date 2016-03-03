//
//  SettingsRouter.swift
//  P-effect
//
//  Created by AndrewPetrov on 3/1/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

class SettingsRouter: AlertManagerDelegate, FeedPresenter, CredentialsPresenter, AuthorizationPresenter {
    
    private(set) weak var currentViewController: UIViewController!
    private(set) weak var locator: ServiceLocator!
    
    init(locator: ServiceLocator) {
        self.locator = locator
    }
    
}

extension SettingsRouter: Router {
    
    typealias Context = UIViewController
    
    func execute(context: UIViewController) {
        let settingsController = SettingsViewController.create()
        settingsController.router = self
        settingsController.setLocator(locator)
        currentViewController = settingsController
        context.navigationController!.showViewController(settingsController, sender: self)
    }
    
}

