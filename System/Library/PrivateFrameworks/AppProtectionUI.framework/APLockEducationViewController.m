@implementation APLockEducationViewController

- (id)initForApplication:(id)a3
{
  id v5;
  APLockEducationViewController *v6;
  APLockEducationViewController *v7;
  APWrappingView *v8;
  APWrappingView *containerView;
  APWrappingView *v10;
  void *v11;
  OBNavigationController *v12;
  OBNavigationController *navController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  APApplication *app;
  APLockEducationViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  OBWelcomeController *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  OBWelcomeController *welcomeController;
  void *v58;
  id v59;
  APLockEducationViewController *v60;
  void *v61;
  void *v62;
  void *v63;
  APTCCDisclosureController *v64;
  OBWelcomeController *TCCDisclosureController;
  void *v66;
  uint64_t v67;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v72.receiver = self;
  v72.super_class = (Class)APLockEducationViewController;
  v6 = -[APLockEducationViewController initWithNibName:bundle:](&v72, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_app, a3);
    v8 = -[APWrappingView initWithFrame:]([APWrappingView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    v10 = v7->_containerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[APWrappingView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[APLockEducationViewController setView:](v7, "setView:", v7->_containerView);
    v12 = (OBNavigationController *)objc_alloc_init(MEMORY[0x24BE6E420]);
    navController = v7->_navController;
    v7->_navController = v12;

    -[APLockEducationViewController addChildViewController:](v7, "addChildViewController:", v7->_navController);
    -[OBNavigationController view](v7->_navController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[APLockEducationViewController view](v7, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v14, "setFrame:");

    -[APLockEducationViewController view](v7, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBNavigationController view](v7->_navController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    -[OBNavigationController didMoveToParentViewController:](v7->_navController, "didMoveToParentViewController:", v7);
    app = v7->_app;
    v19 = v7;
    -[APApplication findApplicationRecordWithError:](app, "findApplicationRecordWithError:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v20;
    objc_msgSend(v20, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.Passbook"));

    v71 = v5;
    if (v23)
    {
      APUILocStr(CFSTR("WALLET_AND_APPLE_PAY"));
      v24 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v24;
    }
    v25 = objc_alloc(MEMORY[0x24BE6E458]);
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = v21;
    APGetPreferredAuthenticationMechanismLocKey();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("REQUIRE_AUTH_PROMPT_%@_FMT"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v30, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    APEducationIconForEnableableFeature(1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (OBWelcomeController *)objc_msgSend(v25, "initWithTitle:detailText:icon:", v31, 0, v32);

    +[APFeatureSemioticsManager sharedManager](APFeatureSemioticsManager, "sharedManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "systemImageNameForCurrentBestAuthenticationMechanism");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("AUTH_REQUIRED_ITEM_HEADER_%@"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("AUTH_REQUIRED_ITEM_BODY_%@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBWelcomeController addBulletedListItemWithTitle:description:symbolName:](v33, "addBulletedListItemWithTitle:description:symbolName:", v38, v42, v69);
    APUIFrameworkBundle();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_CONTENT_HIDDEN"), &stru_2507A0B80, CFSTR("Localizable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    APUIFrameworkBundle();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_CONTENT_HIDDEN_DETAIL"), &stru_2507A0B80, CFSTR("Localizable"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController addBulletedListItemWithTitle:description:symbolName:](v33, "addBulletedListItemWithTitle:description:symbolName:", v44, v46, CFSTR("bell.badge.slash"));

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("REQUIRE_AUTH_%@"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "setTitle:forState:", v51, 0);
    -[OBWelcomeController buttonTray](v33, "buttonTray");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addButton:", v47);

    objc_msgSend(v47, "addTarget:action:forControlEvents:", v19, sel_phase1ViewContinueButtonPressed_, 0x2000);
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2507A0B80, CFSTR("Localizable"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTitle:forState:", v55, 0);

    -[OBWelcomeController buttonTray](v33, "buttonTray");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addButton:", v53);

    objc_msgSend(v53, "addTarget:action:forControlEvents:", v19, sel_phase1ViewCancelButtonPressed_, 0x2000);
    welcomeController = v19->_welcomeController;
    v19->_welcomeController = v33;

    v73[0] = v19->_welcomeController;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBNavigationController setViewControllers:](v7->_navController, "setViewControllers:", v58);

    v5 = v71;
    v59 = v71;
    v60 = v19;
    objc_msgSend(MEMORY[0x24BE04338], "sharedManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bundleIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "TCCServicesForBundleIdentifier:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v63, "count"))
    {
      v64 = -[APTCCDisclosureController initWithApplication:TCCServices:includeDoneButton:scrollViewAssistant:]([APTCCDisclosureController alloc], "initWithApplication:TCCServices:includeDoneButton:scrollViewAssistant:", v59, v63, 1, 0);
      -[APTCCDisclosureController addDoneButtonTarget:action:](v64, "addDoneButtonTarget:action:", v60, sel_phase3ViewContinueButtonPressed_);
      -[APTCCDisclosureController beginLoadUsers](v64, "beginLoadUsers");
    }
    else
    {
      v64 = 0;
    }

    TCCDisclosureController = v60->_TCCDisclosureController;
    v60->_TCCDisclosureController = &v64->super.super;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "userInterfaceIdiom");

    if (!v67)
      -[APLockEducationViewController setModalPresentationStyle:](v60, "setModalPresentationStyle:", 5);
  }

  return v7;
}

- (BOOL)wantsAnimatedPresentation
{
  return 1;
}

- (void)phase1ViewCancelButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  APUIDefaultFrameworkLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2362EA000, v4, OS_LOG_TYPE_DEFAULT, "Cancel pressed for lock edu VC", v6, 2u);
  }

  -[APLockEducationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "educationViewControllerRequestsDismissal:withResult:", self, 0);

}

- (void)phase1ViewContinueButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  APUIDefaultFrameworkLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "Continue pressed for lock edu VC", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "setEnabled:", 0);
  -[APLockEducationViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke;
  v10[3] = &unk_25079FE58;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "educationViewController:requestAuthenticationWithCompletion:", self, v10);

}

void __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(v5 + 968);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2;
    v7[3] = &unk_25079FE58;
    v7[4] = v5;
    v8 = v4;
    objc_msgSend(v3, "educationViewController:requestLockOfApplication:completion:", v5, v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
  }
}

uint64_t __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "continueFlowAfterPhase1");
  return objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
}

- (void)continueFlowAfterPhase1
{
  OBWelcomeController *TCCDisclosureController;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  TCCDisclosureController = self->_TCCDisclosureController;
  if (TCCDisclosureController)
  {
    -[OBNavigationController pushViewController:animated:](self->_navController, "pushViewController:animated:", TCCDisclosureController, 1);
  }
  else
  {
    APUIDefaultFrameworkLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2362EA000, v4, OS_LOG_TYPE_DEFAULT, "No TCC services, dismiss now.", v6, 2u);
    }

    -[APLockEducationViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "educationViewControllerRequestsDismissal:withResult:", self, 1);

  }
}

- (void)phase3ViewContinueButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  APUIDefaultFrameworkLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2362EA000, v4, OS_LOG_TYPE_DEFAULT, "phase 3 continue button pressed -> dismiss", v6, 2u);
  }

  -[APLockEducationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "educationViewControllerRequestsDismissal:withResult:", self, 1);

}

- (void)phase3ViewCancelButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  APUIDefaultFrameworkLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2362EA000, v4, OS_LOG_TYPE_DEFAULT, "phase 3 cancel button pressed -> dismiss", v6, 2u);
  }

  -[APLockEducationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "educationViewControllerRequestsDismissal:withResult:", self, 1);

}

- (APEducationViewControllerDelegate)delegate
{
  return (APEducationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_TCCDisclosureController, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end
