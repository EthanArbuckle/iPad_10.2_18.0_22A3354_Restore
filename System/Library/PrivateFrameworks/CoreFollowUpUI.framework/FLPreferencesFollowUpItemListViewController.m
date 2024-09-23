@implementation FLPreferencesFollowUpItemListViewController

- (id)_viewModel
{
  FLViewModel *viewModel;
  void *v4;
  FLViewModel *v5;
  FLViewModel *v6;
  FLViewModel *v7;
  _QWORD v9[4];
  id v10;
  id location;

  viewModel = self->_viewModel;
  if (!viewModel)
  {
    -[FLPreferencesFollowUpItemListViewController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B2D0]);
    v5 = (FLViewModel *)objc_claimAutoreleasedReturnValue();
    v6 = self->_viewModel;
    self->_viewModel = v5;

    objc_initWeak(&location, self);
    v7 = self->_viewModel;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__FLPreferencesFollowUpItemListViewController__viewModel__block_invoke;
    v9[3] = &unk_24D55CE58;
    objc_copyWeak(&v10, &location);
    -[FLViewModel setItemChangeHandler:](v7, "setItemChangeHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    viewModel = self->_viewModel;
  }
  return viewModel;
}

void __57__FLPreferencesFollowUpItemListViewController__viewModel__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "followUpItemSpecifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    _FLLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: reloading specifiers due to change, specifiers count: %ld", (uint8_t *)&v8, 0xCu);
    }

    if (v2[173])
      v6 = 0;
    else
      v6 = v4 == 0;
    if (v6)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_21641D000, v7, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: dismissing, zero specifiers and no action handler", (uint8_t *)&v8, 2u);
      }

      objc_msgSend(v2, "_dismissFlowWithError:", 0);
    }
    else if (v4 >= 1)
    {
      objc_msgSend(v2, "reloadSpecifiers");
    }
  }

}

- (void)setSpecifier:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = *MEMORY[0x24BE75D50];
  v5 = a3;
  objc_msgSend(v5, "propertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLPreferencesFollowUpItemListViewController setTitle:](self, "setTitle:", v6);

  v7.receiver = self;
  v7.super_class = (Class)FLPreferencesFollowUpItemListViewController;
  -[FLPreferencesFollowUpItemListViewController setSpecifier:](&v7, sel_setSpecifier_, v5);

}

- (void)reloadSpecifiers
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FLPreferencesFollowUpItemListViewController;
  -[FLPreferencesFollowUpItemListViewController reloadSpecifiers](&v2, sel_reloadSpecifiers);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[FLPreferencesFollowUpItemListViewController followUpItemSpecifiers](self, "followUpItemSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)handleURL:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21641D000, v4, OS_LOG_TYPE_DEFAULT, "Processing preference URL: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)followUpItemSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  FLPreferencesFollowUpItemListViewController *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLPreferencesFollowUpItemListViewController _viewModel](self, "_viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPendingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __69__FLPreferencesFollowUpItemListViewController_followUpItemSpecifiers__block_invoke;
  v12 = &unk_24D55CE80;
  v13 = v3;
  v14 = self;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __69__FLPreferencesFollowUpItemListViewController_followUpItemSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "detailSpecifiersForFollowUpItem:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)detailSpecifiersForFollowUpItem:(id)a3
{
  return +[FLPreferencesFollowUpItemListSpeficierFactory detailSpecifiersForFollowUpItem:target:selector:](FLPreferencesFollowUpItemListSpeficierFactory, "detailSpecifiersForFollowUpItem:target:selector:", a3, self, sel_actionTapped_);
}

- (void)actionTapped:(id)a3
{
  id v4;
  NSObject *v5;
  FLSpecifierTapHandler *v6;
  FLSpecifierTapHandler *actionHandler;
  FLSpecifierTapHandler *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: action tapped, %@, handling it", buf, 0xCu);
  }

  if (!self->_actionHandler)
  {
    v6 = objc_alloc_init(FLSpecifierTapHandler);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v6;

    -[FLSpecifierTapHandler setDelegate:](self->_actionHandler, "setDelegate:", self);
    v8 = self->_actionHandler;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__FLPreferencesFollowUpItemListViewController_actionTapped___block_invoke;
    v9[3] = &unk_24D55CEA8;
    v9[4] = self;
    v10 = v4;
    -[FLSpecifierTapHandler actionTapped:eventSource:withCompletionHandler:](v8, "actionTapped:eventSource:withCompletionHandler:", v10, 4, v9);

  }
}

void __60__FLPreferencesFollowUpItemListViewController_actionTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FLLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("SUCCESS");
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_21641D000, v6, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: action handler success? %@", (uint8_t *)&v13, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", *MEMORY[0x24BE1B2C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", *MEMORY[0x24BE1B2C0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_showRadarPromptForItem:action:", v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "_dismissFlowWithError:", v5);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 1384);
  *(_QWORD *)(v11 + 1384) = 0;

}

- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4
{
  if (self->_presentationContext)
    self = (FLPreferencesFollowUpItemListViewController *)self->_presentationContext;
  -[FLPreferencesFollowUpItemListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  FLNetworkStatePrompter *v6;
  FLPreferencesFollowUpItemListViewController *presentationContext;
  FLNetworkStatePrompter *v8;

  v5 = a4;
  v6 = [FLNetworkStatePrompter alloc];
  if (self->_presentationContext)
    presentationContext = (FLPreferencesFollowUpItemListViewController *)self->_presentationContext;
  else
    presentationContext = self;
  v8 = -[FLNetworkStatePrompter initWithPresenter:](v6, "initWithPresenter:", presentationContext);
  -[FLNetworkStatePrompter preflightNetworkStateWithCompletionHandler:](v8, "preflightNetworkStateWithCompletionHandler:", v5);

}

- (void)_showRadarPromptForItem:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE1B398], "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInternal");

  if (v9)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __78__FLPreferencesFollowUpItemListViewController__showRadarPromptForItem_action___block_invoke;
    v15[3] = &unk_24D55CED0;
    v16 = v7;
    v17 = v6;
    +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", CFSTR("Tap-To-Radar"), 1, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    +[FLAlertControllerAction actionWithTitle:style:handler:](FLAlertControllerAction, "actionWithTitle:style:handler:", CFSTR("Dismiss"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Follow Up Error [INTERNAL]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Did you notice an error? If so, file a radar."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FLAlertControllerHelper presentAlertWithTitle:message:actions:presentingController:](FLAlertControllerHelper, "presentAlertWithTitle:message:actions:presentingController:", v13, v14, v12, self);

  }
}

void __78__FLPreferencesFollowUpItemListViewController__showRadarPromptForItem_action___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We failed to handle a CFU action [%@]"), v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE1B3E8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("CFU extension failure: [%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tapToRadarWithTitle:initialMessage:", v6, v2);

}

- (void)_dismissFlowWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FLPreferencesFollowUpItemListViewController followUpItemSpecifiers](self, "followUpItemSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_21641D000, v7, OS_LOG_TYPE_DEFAULT, "FLPreferencesFollowUpItemListViewController: Checking dismiss flow with error %@, specifiers count: %ld", (uint8_t *)&v8, 0x16u);
  }

  if (v6)
    -[FLPreferencesFollowUpItemListViewController reloadSpecifiers](self, "reloadSpecifiers");
  else
    -[FLPreferencesFollowUpItemListViewController popRecursivelyToRootController](self, "popRecursivelyToRootController");

}

- (UIViewController)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
