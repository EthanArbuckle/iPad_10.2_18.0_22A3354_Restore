@implementation CDPSingleICSCEntryViewController

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDPSingleICSCEntryViewController;
  -[PSKeychainSyncTextEntryController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CDPSingleICSCEntryViewController enableUserInteractionAndStopSpinner](self, "enableUserInteractionAndStopSpinner");
}

- (void)forgotSecurityCode
{
  void *v3;
  void *v4;
  void *v5;
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
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  CDPLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke;
  v18[3] = &unk_24C8548F8;
  v18[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_2;
  v17[3] = &unk_24C8548F8;
  v17[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v16);

  -[CDPSingleICSCEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainSyncController:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), CFSTR("approveFromOtherDevice"), 0);

}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v2 = (void *)MEMORY[0x24BEBD3B0];
  CDPLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  v9 = (void *)MEMORY[0x24BEBD3A8];
  CDPLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_3;
  v12[3] = &unk_24C8548F8;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v11);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
}

void __54__CDPSingleICSCEntryViewController_forgotSecurityCode__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "disableUserInteractionAndStartSpinner");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainSyncController:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), CFSTR("resetKeychain"), 0);

}

- (void)disableUserInteractionAndStartSpinner
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPSingleICSCEntryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v4, CFSTR("singleICSCEntryController"), 1);

  -[CDPSingleICSCEntryViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

}

- (void)enableUserInteractionAndStopSpinner
{
  void *v2;
  id v3;

  -[CDPSingleICSCEntryViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimatingForIdentifier:", CFSTR("singleICSCEntryController"));

}

@end
