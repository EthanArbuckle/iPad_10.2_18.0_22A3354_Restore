@implementation APHideEducationViewController

- (id)initForApplication:(id)a3
{
  id v5;
  APHideEducationViewController *v6;
  APHideEducationViewController *v7;
  APWrappingView *v8;
  APWrappingView *containerView;
  APWrappingView *v10;
  void *v11;
  APApplication *app;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  objc_super v65;

  v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)APHideEducationViewController;
  v6 = -[APHideEducationViewController initWithNibName:bundle:](&v65, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_app, a3);
    v8 = -[APWrappingView initWithFrame:]([APWrappingView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v64 = v5;
    containerView = v7->_containerView;
    v7->_containerView = v8;

    v10 = v7->_containerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[APWrappingView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[APHideEducationViewController setView:](v7, "setView:", v7->_containerView);
    app = v7->_app;
    v13 = v7;
    -[APApplication findApplicationRecordWithError:](app, "findApplicationRecordWithError:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = v15;
    APGetPreferredAuthenticationMechanismLocKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("HIDE_PROMPT_%@_FMT"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v17;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v20, v17);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("HIDE_PROMPT_DETAIL_%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v23);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc(MEMORY[0x24BE6E458]);
    APEducationIconForEnableableFeature(2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithTitle:detailText:icon:", v62, v61, v25);

    APUIFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("HIDDEN_ON_HOME_SCREEN"), &stru_2507A0B80, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    APUIFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("HIDDEN_ON_HOME_SCREEN_DETAIL"), &stru_2507A0B80, CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addBulletedListItemWithTitle:description:symbolName:", v28, v30, CFSTR("app.dashed"));

    +[APFeatureSemioticsManager sharedManager](APFeatureSemioticsManager, "sharedManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "systemImageNameForCurrentBestAuthenticationMechanism");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("AUTH_REQUIRED_ITEM_HEADER_%@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDD17C8];
    APGetPreferredAuthenticationMechanismLocKey();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("AUTH_REQUIRED_ITEM_BODY_%@"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    APUILocStr(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addBulletedListItemWithTitle:description:symbolName:", v36, v40, v32);
    APUIFrameworkBundle();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("NOTIFICATIONS_TURNED_OFF"), &stru_2507A0B80, CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    APUIFrameworkBundle();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("NOTIFICATIONS_TURNED_OFF_DETAIL"), &stru_2507A0B80, CFSTR("Localizable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addBulletedListItemWithTitle:description:symbolName:", v42, v44, CFSTR("bell.badge.slash"));

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[APFeatureSemioticsManager sharedManager](APFeatureSemioticsManager, "sharedManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "titleForEnablementAction:ofFeature:", 1, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "setTitle:forState:", v47, 0);
    objc_msgSend(v26, "buttonTray");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addButton:", v45);

    objc_msgSend(v45, "addTarget:action:forControlEvents:", v13, sel_phase1ViewContinueButtonPressed_, 0x2000);
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2507A0B80, CFSTR("Localizable"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTitle:forState:", v51, 0);

    objc_msgSend(v26, "buttonTray");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addButton:", v49);

    objc_msgSend(v49, "addTarget:action:forControlEvents:", v13, sel_phase1ViewCancelButtonPressed_, 0x2000);
    v53 = v13[123];
    v13[123] = v26;

    objc_msgSend(v13, "addChildViewController:", v13[123]);
    objc_msgSend(v13[123], "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bounds");
    objc_msgSend(v54, "setFrame:");

    objc_msgSend(v13, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13[123], "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v57);

    v5 = v64;
    objc_msgSend(v13[123], "didMoveToParentViewController:", v13);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "userInterfaceIdiom");

    if (!v59)
      objc_msgSend(v13, "setModalPresentationStyle:", 5);
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
    _os_log_impl(&dword_2362EA000, v4, OS_LOG_TYPE_DEFAULT, "Cancel pressed for hide edu VC", v6, 2u);
  }

  -[APHideEducationViewController delegate](self, "delegate");
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
    _os_log_impl(&dword_2362EA000, v5, OS_LOG_TYPE_DEFAULT, "Continue pressed for hide edu VC", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "setEnabled:", 0);
  -[APHideEducationViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke;
  v10[3] = &unk_25079FE58;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "educationViewController:requestAuthenticationWithCompletion:", self, v10);

}

void __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke(uint64_t a1, int a2)
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
    v7[2] = __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2;
    v7[3] = &unk_25079FE58;
    v7[4] = v5;
    v8 = v4;
    objc_msgSend(v3, "educationViewController:requestHideOfApplication:completion:", v5, v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
  }
}

uint64_t __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "educationViewControllerRequestsDismissal:withResult:", *(_QWORD *)(a1 + 32), 2);

  }
  return objc_msgSend(*(id *)(a1 + 40), "setEnabled:", 1);
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
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

@end
