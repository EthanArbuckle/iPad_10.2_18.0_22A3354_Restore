@implementation ASCredentialRequestEnableICloudKeychainViewController

- (ASCredentialRequestEnableICloudKeychainViewController)init
{
  ASCredentialRequestEnableICloudKeychainViewController *v2;
  void *v3;
  ASCredentialRequestEnableICloudKeychainViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestEnableICloudKeychainViewController;
  v2 = -[ASCredentialRequestPaneViewController initRequiringTableView:](&v6, sel_initRequiringTableView_, 1);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_canKeychainSyncBeEnabled = objc_msgSend(v3, "canKeychainSyncBeEnabled");

    v4 = v2;
  }

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  ASCredentialRequestInfoLabelSubPane *v6;
  void *v7;
  ASCredentialRequestButtonContinue *v8;
  ASCredentialRequestButtonContinue *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)ASCredentialRequestEnableICloudKeychainViewController;
  -[ASCredentialRequestPaneViewController viewDidLoad](&v17, sel_viewDidLoad);
  if (self->_canKeychainSyncBeEnabled)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE82CC8], "isAppleAccountBrandingEnabled");
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCredentialRequestIconGenerator passwordManagerIcon](ASCredentialRequestIconGenerator, "passwordManagerIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  v6 = -[ASCredentialRequestInfoLabelSubPane initWithString:labelStyle:]([ASCredentialRequestInfoLabelSubPane alloc], "initWithString:labelStyle:", v4, 3);
  -[ASCredentialRequestPaneViewController headerPaneContext](self, "headerPaneContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIcon:iconStyle:title:titleStyle:subtitlePane:subtitleStyle:subtitleBottomSpacing:", v5, 0, v3, 2, v6, 3, &unk_24C96E128);

  if (self->_canKeychainSyncBeEnabled)
  {
    v8 = [ASCredentialRequestButtonContinue alloc];
    v9 = -[ASCredentialRequestButtonContinue initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialRequestButton setButtonText:](v9, "setButtonText:", v10);

    -[ASCredentialRequestButton addTarget:action:](v9, "addTarget:action:", self, sel__turnOnICloudKeychain);
    v11 = (void *)MEMORY[0x24BDD1628];
    -[ASCredentialRequestButtonContinue heightAnchor](v9, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASViewServiceInterfaceUtilities continueButtonHeight](ASViewServiceInterfaceUtilities, "continueButtonHeight");
    objc_msgSend(v12, "constraintEqualToConstant:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v14);

    -[ASCredentialRequestPaneViewController paneFooterStackView](self, "paneFooterStackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addArrangedSubview:", v9);

    -[ASCredentialRequestPaneViewController footerPaneContext](self, "footerPaneContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEmptyViewWithSpacing:", 3.40282347e38);

  }
}

- (void)_turnOnICloudKeychain
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE38310];
  v6[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, v4);

}

@end
