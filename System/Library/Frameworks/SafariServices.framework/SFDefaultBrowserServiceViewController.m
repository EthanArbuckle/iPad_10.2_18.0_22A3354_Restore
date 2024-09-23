@implementation SFDefaultBrowserServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE72F188);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78C200);
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  id v5;
  void *v6;
  UINavigationController *v7;
  UINavigationController *navigationController;
  void *v9;
  void *v10;
  void *v11;
  SFDefaultBrowserListView *v12;
  SFDefaultBrowserListView *v13;
  SFDefaultBrowserListView *browserListView;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, char);
  void *v18;
  id v19;
  id location;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[SFDefaultBrowserServiceViewController _makeDefaultBrowserInformationViewController](self, "_makeDefaultBrowserInformationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UINavigationController *)objc_msgSend(v5, "initWithRootViewController:", v6);
  navigationController = self->_navigationController;
  self->_navigationController = v7;

  -[UINavigationController view](self->_navigationController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDefaultBrowserServiceViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v9, "setAutoresizingMask:", 18);
  -[SFDefaultBrowserServiceViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  -[SFDefaultBrowserServiceViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v9);

  -[UINavigationController didMoveToParentViewController:](self->_navigationController, "didMoveToParentViewController:", self);
  v4[2](v4, 1);
  objc_initWeak(&location, self);
  v12 = [SFDefaultBrowserListView alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __80__SFDefaultBrowserServiceViewController_prepareForDisplayWithCompletionHandler___block_invoke;
  v18 = &unk_1E4AC1AA8;
  objc_copyWeak(&v19, &location);
  v13 = -[SFDefaultBrowserListView initWithCompletionHandler:](v12, "initWithCompletionHandler:", &v15);
  browserListView = self->_browserListView;
  self->_browserListView = v13;

  -[SFDefaultBrowserListView setDelegate:](self->_browserListView, "setDelegate:", self, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __80__SFDefaultBrowserServiceViewController_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_showConnectionErrorAlert");
    WeakRetained = v4;
  }

}

- (void)_showListOfAvailableBrowsers
{
  UINavigationController *navigationController;
  id v3;

  navigationController = self->_navigationController;
  -[SFDefaultBrowserServiceViewController _makeDefaultBrowserSelectionViewController](self, "_makeDefaultBrowserSelectionViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](navigationController, "pushViewController:animated:", v3, 1);

}

- (id)_makeDefaultBrowserInformationViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SFDeviceIsPad();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)getOBWelcomeControllerClass_0());
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("network"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:detailText:icon:contentLayout:", v3, v4, v6, 2);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getOBBoldTrayButtonClass_softClass_0;
  v18 = getOBBoldTrayButtonClass_softClass_0;
  if (!getOBBoldTrayButtonClass_softClass_0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getOBBoldTrayButtonClass_block_invoke_0;
    v14[3] = &unk_1E4ABFC78;
    v14[4] = &v15;
    __getOBBoldTrayButtonClass_block_invoke_0((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v9, "boldButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__showListOfAvailableBrowsers, 64);
  objc_msgSend(v7, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v10);

  return v7;
}

- (id)_makeDefaultBrowserSelectionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc((Class)getOBWelcomeControllerClass_0()), "initWithTitle:detailText:icon:contentLayout:", v24, 0, 0, 2);
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_browserListView);

  -[SFDefaultBrowserListView setTranslatesAutoresizingMaskIntoConstraints:](self->_browserListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)MEMORY[0x1E0CB3718];
  -[SFDefaultBrowserListView topAnchor](self->_browserListView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 20.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  -[SFDefaultBrowserListView leadingAnchor](self->_browserListView, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  -[SFDefaultBrowserListView trailingAnchor](self->_browserListView, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  -[SFDefaultBrowserListView bottomAnchor](self->_browserListView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

  return v3;
}

- (void)_showConnectionErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __66__SFDefaultBrowserServiceViewController__showConnectionErrorAlert__block_invoke;
  v12 = &unk_1E4AC0A90;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);
  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v5, 1, 0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __66__SFDefaultBrowserServiceViewController__showConnectionErrorAlert__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_remoteViewControllerProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceViewControllerFailed");

}

- (void)didCommitDefaultBrowserChoice:(int64_t)a3
{
  id v4;

  -[SFDefaultBrowserServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceViewControllerDidFinishWithResult:", a3);

}

- (void)didChangeDefaultBrowserWithIdentifier:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v23 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", a3, &v23);
  v5 = v23;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke;
    v21 = &unk_1E4AC3AF0;
    v7 = v4;
    v22 = v7;
    objc_msgSend(v6, "setDefaultWebBrowserToApplicationRecord:completionHandler:", v7, &v18);

    objc_msgSend(v7, "bundleIdentifier", v18, v19, v20, v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_sf_reportBrowserChoice:", v10);

    }
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFDefaultBrowserServiceViewController didChangeDefaultBrowserWithIdentifier:].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  }
  -[SFDefaultBrowserServiceViewController didCommitDefaultBrowserChoice:](self, "didCommitDefaultBrowserChoice:", 1);

}

void __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v12 = (void *)objc_opt_new();
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    v14 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBody:", v17);

    v18 = (void *)MEMORY[0x1E0C99E98];
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("prefs:root=%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaultActionURL:", v22);

    v23 = (void *)MEMORY[0x1E0CEC740];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requestWithIdentifier:content:trigger:", v25, v12, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
    objc_msgSend(v27, "addNotificationRequest:withCompletionHandler:", v26, &__block_literal_global_73);

  }
}

void __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_93(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
      __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_93_cold_2((uint64_t)v2, v3, v5, v6, v7, v8, v9, v10);
  }
  else if (v4)
  {
    __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_93_cold_1(v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserListView, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)didChangeDefaultBrowserWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1A3B2D000, a2, a3, "Failed to get app record with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_2();
}

void __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1A3B2D000, a2, a3, "Failed to set default browser app with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_2();
}

void __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_93_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Successfully posted default web browser updated notification", v1, 2u);
}

void __79__SFDefaultBrowserServiceViewController_didChangeDefaultBrowserWithIdentifier___block_invoke_93_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_4(&dword_1A3B2D000, a2, a3, "Failed to post default web browser updated notification: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_2();
}

@end
