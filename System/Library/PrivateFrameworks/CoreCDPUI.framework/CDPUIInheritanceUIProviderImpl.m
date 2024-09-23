@implementation CDPUIInheritanceUIProviderImpl

- (CDPUIInheritanceUIProviderImpl)initWithPresentingViewController:(id)a3
{
  id v5;
  CDPUIInheritanceUIProviderImpl *v6;
  CDPUIInheritanceUIProviderImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPUIInheritanceUIProviderImpl;
  v6 = -[CDPUIInheritanceUIProviderImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_presentingViewController, a3);

  return v7;
}

- (void)promptForAccessCodeForAccessKey:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  -[CDPUIInheritanceUIProviderImpl setCompletion:](self, "setCompletion:", a4);
  -[CDPUIInheritanceUIProviderImpl setAccessKey:](self, "setAccessKey:", v6);

  -[CDPUIInheritanceUIProviderImpl _buildViewController](self, "_buildViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  objc_msgSend(v10, "setModalPresentationStyle:", 2 * ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  -[CDPUIInheritanceUIProviderImpl presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

}

- (id)_buildViewController
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  CDPLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "primaryAccountFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:symbolName:", v40, v39, 0);
  -[CDPUIInheritanceUIProviderImpl _contentStackView](self, "_contentStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  v29 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v33;
  objc_msgSend(v7, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v28;
  v38 = v7;
  objc_msgSend(v7, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v12;
  objc_msgSend(v7, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v17);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v19, 0);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__keyOptionsTapped_, 64);
  objc_msgSend(v6, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v18);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E420]), "initWithRootViewController:", v6);
  -[CDPUIInheritanceUIProviderImpl setNavigationController:](self, "setNavigationController:", v21);

  v22 = objc_alloc(MEMORY[0x24BEBD410]);
  CDPLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 0, self, sel__skipTapped_);
  objc_msgSend(v6, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLeftBarButtonItem:", v24);

  -[CDPUIInheritanceUIProviderImpl navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_contentStackView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[CDPUIInheritanceUIProviderImpl _cameraView](self, "_cameraView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIInheritanceUIProviderImpl _cameraLabel](self, "_cameraLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BEBD978]);
  v17[0] = v3;
  v17[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArrangedSubviews:", v6);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setAxis:", 1);
  objc_msgSend(v7, "setSpacing:", 15.0);
  v8 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintLessThanOrEqualToConstant:", 308.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(v3, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v12, 1.4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v14);

  return v7;
}

- (id)_cameraView
{
  CDPUIInheritanceAccessCodeScannerView *v3;
  CDPUIInheritanceAccessCodeScannerView *v4;

  v3 = [CDPUIInheritanceAccessCodeScannerView alloc];
  v4 = -[CDPUIInheritanceAccessCodeScannerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CDPUIInheritanceAccessCodeScannerView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CDPUIInheritanceAccessCodeScannerView setDelegate:](v4, "setDelegate:", self);
  return v4;
}

- (id)_cameraLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BEBD708]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  return v3;
}

- (void)_keyOptionsTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id buf[2];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20DC8F000, v5, OS_LOG_TYPE_DEFAULT, "\"User asked for access code options.\", (uint8_t *)buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  v7 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke;
  v20[3] = &unk_24C854A10;
  objc_copyWeak(&v21, buf);
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke_2;
  v18[3] = &unk_24C854A10;
  objc_copyWeak(&v19, buf);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  objc_msgSend(v6, "addAction:", v13);
  objc_msgSend(v6, "addAction:", v16);
  -[CDPUIInheritanceUIProviderImpl navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentViewController:animated:completion:", v6, 1, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);

}

void __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showManualCodeEntryPage");

}

void __52__CDPUIInheritanceUIProviderImpl__keyOptionsTapped___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showEnterCodeLaterAlert");

}

- (void)_showManualCodeEntryPage
{
  void *v3;
  CDPUIManualAccessCodeEntryViewController *v4;

  v4 = objc_alloc_init(CDPUIManualAccessCodeEntryViewController);
  -[CDPUIManualAccessCodeEntryViewController setDelegate:](v4, "setDelegate:", self);
  -[CDPUIInheritanceUIProviderImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

- (void)_showEnterCodeLaterAlert
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
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAccountFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __58__CDPUIInheritanceUIProviderImpl__showEnterCodeLaterAlert__block_invoke;
  v17[3] = &unk_24C854A10;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v12);
  objc_msgSend(v9, "addAction:", v15);
  -[CDPUIInheritanceUIProviderImpl navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v9, 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __58__CDPUIInheritanceUIProviderImpl__showEnterCodeLaterAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_skipTapped:", 0);

}

- (void)_skipTapped:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5308);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIInheritanceUIProviderImpl _dismissViewControllerWithAccessKey:error:](self, "_dismissViewControllerWithAccessKey:error:", 0, v4);

}

- (void)_dismissViewControllerWithAccessKey:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  CDPUIInheritanceUIProviderImpl *v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1;
  v15[4] = __Block_byref_object_dispose__1;
  v16 = self;
  -[CDPUIInheritanceUIProviderImpl presentingViewController](v16, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__CDPUIInheritanceUIProviderImpl__dismissViewControllerWithAccessKey_error___block_invoke;
  v11[3] = &unk_24C855190;
  v14 = v15;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v11);

  _Block_object_dispose(v15, 8);
}

void __76__CDPUIInheritanceUIProviderImpl__dismissViewControllerWithAccessKey_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "completion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, a1[4], a1[5]);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCompletion:", 0);
  }
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)_presentWelcomePage
{
  id v3;

  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIInheritanceUIProviderImpl _dismissViewControllerWithAccessKey:error:](self, "_dismissViewControllerWithAccessKey:error:", v3, 0);

}

- (BOOL)manualAccessCodeEntry:(id)a3 shouldFinishWithAccessCode:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CDPUIInheritanceUIProviderImpl manualAccessCodeEntry:shouldFinishWithAccessCode:].cold.1(v6);

  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWrappedKeyString:", v5);

  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWrappingKeyString:", v5);

  v9 = objc_alloc_init(MEMORY[0x24BE1A438]);
  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isInheritanceAccessKeyValid:", v10);

  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Manual key is valid.\", buf, 2u);
    }

    -[CDPUIInheritanceUIProviderImpl _presentWelcomePage](self, "_presentWelcomePage");
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Entered code is not a valid inheritance key.\", v15, 2u);
    }

  }
  return v11;
}

- (void)manualAccessCodeEntryDidCancel:(id)a3
{
  id v3;
  id v4;

  -[CDPUIInheritanceUIProviderImpl navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (BOOL)accessCodeScanner:(id)a3 didScanCode:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEFAULT, "\"Successfully scanned the access key, checking if it's a valid inheritance key.\", buf, 2u);
  }

  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWrappingKeyString:", v5);

  v8 = objc_alloc_init(MEMORY[0x24BE1A438]);
  -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isInheritanceAccessKeyValid:", v9);

  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Scanned code is valid.\", v15, 2u);
    }

    -[CDPUIInheritanceUIProviderImpl _presentWelcomePage](self, "_presentWelcomePage");
  }
  else
  {
    if (v12)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Scanned code is not a valid inheritance key.\", v14, 2u);
    }

  }
  return v10;
}

- (void)accessCodeScanner:(id)a3 didFailToStarCapture:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CDPUIInheritanceUIProviderImpl accessCodeScanner:didFailToStarCapture:].cold.1((uint64_t)v5, v6);

  -[CDPUIInheritanceUIProviderImpl _dismissViewControllerWithAccessKey:error:](self, "_dismissViewControllerWithAccessKey:error:", 0, v5);
}

- (void)welcomeViewController:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  v9 = v5;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    -[CDPUIInheritanceUIProviderImpl accessKey](self, "accessKey");
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = (void *)v8;
  }
  -[CDPUIInheritanceUIProviderImpl _dismissViewControllerWithAccessKey:error:](self, "_dismissViewControllerWithAccessKey:error:", v7, v6);

}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (OBNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
  objc_storeStrong((id *)&self->_accessKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

- (void)manualAccessCodeEntry:(os_log_t)log shouldFinishWithAccessCode:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DC8F000, log, OS_LOG_TYPE_DEBUG, "\"Manual code was entered, checking if it's a valid inheritance key.\", v1, 2u);
}

- (void)accessCodeScanner:(uint64_t)a1 didFailToStarCapture:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "\"Error scanning the code: %@\", (uint8_t *)&v2, 0xCu);
}

@end
