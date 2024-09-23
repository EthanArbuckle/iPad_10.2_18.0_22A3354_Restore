@implementation CDPRecoveryKeyEntryViewController

- (CDPRecoveryKeyEntryViewController)initWithRecoveryContext:(id)a3 cdpContext:(id)a4
{
  id v7;
  id v8;
  CDPRecoveryKeyEntryViewController *v9;
  CDPRecoveryKeyEntryViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryKeyEntryViewController;
  v9 = -[PSKeychainSyncSecurityCodeController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_cdpContext, a4);
    -[PSKeychainSyncSecurityCodeController setSecurityCodeType:](v10, "setSecurityCodeType:", 2);
    -[PSKeychainSyncSecurityCodeController setMode:](v10, "setMode:", objc_msgSend(v7, "mode"));
  }
  v10->_keyboardIsVisible = 1;

  return v10;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[PSKeychainSyncSecurityCodeController viewDidLoad](&v12, sel_viewDidLoad);
  -[CDPRecoveryKeyEntryViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[CDPRecoveryKeyEntryViewController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBounces:", 0);

  if (-[PSKeychainSyncSecurityCodeController mode](self, "mode") == 1)
  {
    -[CDPRecoveryKeyEntryViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }
  else
  {
    if (-[CDPRecoveryKeyEntryViewModel shouldSuppressCancelButton](self->_context, "shouldSuppressCancelButton"))
    {
      -[CDPRecoveryKeyEntryViewController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeftBarButtonItem:", 0);
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelFlow_);
      -[CDPRecoveryKeyEntryViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItem:", v7);

    }
    -[CDPRecoveryKeyEntryViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSeparatorStyle:", 1);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_keyboardCameraSessionDidDismiss_, CFSTR("_UIKeyboardCameraSessionDidDismiss"), 0);

  -[CDPRecoveryKeyEntryViewController _makeEventWithName:](self, "_makeEventWithName:", *MEMORY[0x24BE1A710]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", v10);

}

- (id)_makeEventWithName:(id)a3
{
  void *v3;
  CDPRecoveryKeyEntryViewModel *context;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDFC2A0];
  context = self->_context;
  v5 = a3;
  -[CDPRecoveryKeyEntryViewModel context](context, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "analyticsEventWithContext:eventName:category:", v6, v5, *MEMORY[0x24BE1A860]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  NSString *recoveryCode;
  NSString *v5;
  NSString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[PSKeychainSyncSecurityCodeController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PSKeychainSyncTextEntryController setSecureTextEntry:](self, "setSecureTextEntry:", 0);
  if (-[PSKeychainSyncSecurityCodeController mode](self, "mode") == 1)
  {
    recoveryCode = self->_recoveryCode;
    if (!recoveryCode)
    {
      -[CDPRecoveryKeyEntryViewModel recoveryKey](self->_context, "recoveryKey");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_recoveryCode;
      self->_recoveryCode = v5;

      recoveryCode = self->_recoveryCode;
    }
    -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", recoveryCode);
  }
}

- (void)keyboardCameraSessionDidDismiss:(id)a3
{
  NSObject *v4;
  void *v5;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPRecoveryKeyEntryViewController keyboardCameraSessionDidDismiss:].cold.1();

  -[CDPRecoveryKeyEntryViewController didTapUseKeyboard:](self, "didTapUseKeyboard:", 0);
  -[CDPRecoveryKeyEntryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (id)specifiers
{
  void *v3;
  UIButton *v4;
  UIButton *enterRecoveryKeyButton;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v22;
  uint8_t v23[16];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[PSKeychainSyncSecurityCodeController specifiers](&v24, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CDPRecoveryKeyEntryViewModel isFooterForVerifyFlow](self->_context, "isFooterForVerifyFlow")
    || -[CDPRecoveryKeyEntryViewModel isFooterForMismatchRepairFlow](self->_context, "isFooterForMismatchRepairFlow")
    || -[PSKeychainSyncSecurityCodeController mode](self, "mode") == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    enterRecoveryKeyButton = self->_enterRecoveryKeyButton;
    self->_enterRecoveryKeyButton = v4;

    -[CDPRecoveryKeyEntryViewController table](self, "table");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_enterRecoveryKeyButton);

  }
  -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePropertyForKey:", *MEMORY[0x24BE75A68]);

  -[CDPRecoveryKeyEntryViewModel footerLabelText](self->_context, "footerLabelText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_9:
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"Should show footer button\", v23, 2u);
    }

    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0);

    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeTarget:action:forControlEvents:", self, 0, 64);

    if (-[CDPRecoveryKeyEntryViewModel supportsRKRecovery](self->_context, "supportsRKRecovery"))
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20DC8F000, v12, OS_LOG_TYPE_DEFAULT, "\"Context supports RK recovery\", v23, 2u);
      }

      -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = sel_skipRecoveryKeyDuringPasswordResetFlow_;
    }
    else if (-[CDPRecoveryKeyEntryViewModel isFooterForVerifyFlow](self->_context, "isFooterForVerifyFlow"))
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_20DC8F000, v16, OS_LOG_TYPE_DEFAULT, "\"Context is footer button for verify flow\", v23, 2u);
      }

      -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = sel_handleForgotRecoveryKey_;
    }
    else
    {
      v17 = -[CDPRecoveryKeyEntryViewModel isDataRecoveryFlow](self->_context, "isDataRecoveryFlow");
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_20DC8F000, v18, OS_LOG_TYPE_DEFAULT, "\"Context is data recovery flow\", v23, 2u);
        }

        -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = sel_handleRecoveryKeyEscapeDuringDataRecoveryFlow_;
      }
      else
      {
        if (v19)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_20DC8F000, v18, OS_LOG_TYPE_DEFAULT, "\"Showing footer button for some other reason\", v23, 2u);
        }

        -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = sel_continueFlow_;
      }
    }
    objc_msgSend(v13, "addTarget:action:forEvents:", self, v15, 64);
    goto LABEL_27;
  }
  if (-[CDPRecoveryKeyEntryViewModel isFooterForVerifyFlow](self->_context, "isFooterForVerifyFlow")
    || -[CDPRecoveryKeyEntryViewModel isDataRecoveryFlow](self->_context, "isDataRecoveryFlow"))
  {
    goto LABEL_9;
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_20DC8F000, v22, OS_LOG_TYPE_DEFAULT, "\"Should not show footer button.\", v23, 2u);
  }

  -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 0.0);
LABEL_27:

  -[CDPRecoveryKeyEntryViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", 0);

  return v3;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[CDPRecoveryKeyEntryViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[CDPRecoveryKeyEntryViewModel footerLabelText](self->_context, "footerLabelText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextAlignment:", 1);

    -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEBB520];
    v8 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v11);

    -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v3);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  const __CFString *v20;
  const __CFString *v21;
  char **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  double MaxY;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double Width;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  CGFloat rect;
  CGFloat v58;
  CGFloat v59;
  uint8_t buf[16];
  objc_super v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v61.receiver = self;
  v61.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[PSKeychainSyncSecurityCodeController viewDidLayoutSubviews](&v61, sel_viewDidLayoutSubviews);
  -[CDPRecoveryKeyEntryViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v58 = v5;
  v59 = v4;
  v7 = v6;
  rect = v8;

  -[CDPRecoveryKeyEntryViewModel footerLabelText](self->_context, "footerLabelText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[CDPRecoveryKeyEntryViewController textEntryCell](self, "textEntryCell");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v19 = CGRectGetMaxY(v62) + 36.0;

    -[CDPRecoveryKeyEntryViewController footerTextLabel](self, "footerTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v13, v19, v15, v17);
  }
  else
  {
    objc_msgSend(v10, "setAlpha:", 0.0);
  }

  -[UIButton removeTarget:action:forControlEvents:](self->_enterRecoveryKeyButton, "removeTarget:action:forControlEvents:", self, 0, 64);
  if (self->_keyboardIsVisible)
    v20 = CFSTR("RECOVERY_KEY_ENTRY_SCAN_TEXT");
  else
    v20 = CFSTR("RECOVERY_KEY_ENTRY_USE_KEYBOARD");
  if (self->_keyboardIsVisible)
    v21 = CFSTR("text.viewfinder");
  else
    v21 = CFSTR("keyboard");
  if (self->_keyboardIsVisible)
    v22 = &selRef_didTapScanText;
  else
    v22 = &selRef_didTapUseKeyboard_;
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton addTarget:action:forEvents:](self->_enterRecoveryKeyButton, "addTarget:action:forEvents:", self, *v22, 64);
  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", v26);

  objc_msgSend(v25, "setImagePadding:", 3.0);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 14.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPreferredSymbolConfigurationForImage:", v27);

  -[UIButton setConfiguration:](self->_enterRecoveryKeyButton, "setConfiguration:", v25);
  -[UIButton setTitle:forState:](self->_enterRecoveryKeyButton, "setTitle:forState:", v24, 0);
  -[UIButton sizeToFit](self->_enterRecoveryKeyButton, "sizeToFit");
  -[UIButton frame](self->_enterRecoveryKeyButton, "frame");
  v29 = v28;
  v31 = v30 + 42.0;
  v32 = (v7 - (v30 + 42.0)) * 0.5;
  v33 = floorf(v32);
  -[CDPRecoveryKeyEntryViewController textEntryCell](self, "textEntryCell");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v35 = CGRectGetMaxY(v63) + 30.0;

  -[UIButton setFrame:](self->_enterRecoveryKeyButton, "setFrame:", v33, v35, v31, v29);
  -[CDPRecoveryKeyEntryViewModel footerButtonTitle](self->_context, "footerButtonTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAttributedTitle:forState:", v36, 0);

    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAttributedTitle:forState:", v36, 1);

    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sizeToFit");

    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v42 = v41;
    v44 = v43;

    v45 = (v7 - v42) * 0.5;
    v46 = floorf(v45);
    if (-[CDPRecoveryKeyEntryViewModel isFooterForVerifyFlow](self->_context, "isFooterForVerifyFlow")
      || -[CDPRecoveryKeyEntryViewModel isFooterForMismatchRepairFlow](self->_context, "isFooterForMismatchRepairFlow")
      || -[CDPRecoveryKeyEntryViewModel isDataRecoveryFlow](self->_context, "isDataRecoveryFlow"))
    {
      v64.origin.x = v33;
      v64.origin.y = v35;
      v64.size.width = v31;
      v64.size.height = v29;
      MaxY = CGRectGetMaxY(v64);
      v48 = 60.0;
    }
    else
    {
      v66.origin.y = v58;
      v66.origin.x = v59;
      v66.size.width = v7;
      v66.size.height = rect;
      MaxY = CGRectGetMaxY(v66) - v44;
      v48 = -50.0;
    }
    v49 = MaxY + v48;
    -[CDPRecoveryKeyEntryViewController footerActionButton](self, "footerActionButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v46, v49, v42, v44);

  }
  -[CDPRecoveryKeyEntryViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  Width = CGRectGetWidth(v65);

  if (-[PSKeychainSyncSecurityCodeController mode](self, "mode") == 1 && Width > 0.0 && Width <= 320.0)
  {
    _CDPLogSystem();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v53, OS_LOG_TYPE_DEFAULT, "\"Small screen detected, reducing font size\", buf, 2u);
    }

    -[CDPRecoveryKeyEntryViewController textEntryCell](self, "textEntryCell");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "textField");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFont:", v56);

  }
}

- (void)didTapScanText
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Scan Text button tapped.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didTapUseKeyboard:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPRecoveryKeyEntryViewController didTapUseKeyboard:].cold.1();

  self->_keyboardIsVisible = 1;
  -[PSKeychainSyncSecurityCodeController setMode:](self, "setMode:", -[CDPRecoveryKeyEntryViewModel mode](self->_context, "mode"));
  -[CDPRecoveryKeyEntryViewController textEntryCell](self, "textEntryCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

  -[CDPRecoveryKeyEntryViewController textEntryCell](self, "textEntryCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

  -[CDPRecoveryKeyEntryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (id)placeholderText
{
  return -[CDPRecoveryKeyEntryViewModel placeholderText](self->_context, "placeholderText");
}

- (void)cancelFlow:(id)a3
{
  -[CDPRecoveryKeyEntryViewModel handleCancel](self->_context, "handleCancel", a3);
}

- (void)showOtherRecoveryOptions:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  id v10;

  -[CDPRecoveryKeyEntryViewModel custodianRecoveryEscapeOption](self->_context, "custodianRecoveryEscapeOption", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  -[CDPRecoveryKeyEntryViewModel custodianRecoveryEscapeOption](self->_context, "custodianRecoveryEscapeOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "escapeAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPRecoveryKeyEntryViewModel custodianRecoveryEscapeOption](self->_context, "custodianRecoveryEscapeOption");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "escapeAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  else
  {
LABEL_4:
    -[CDPRecoveryKeyEntryViewModel deleteiCloudDataEscapeOffer](self->_context, "deleteiCloudDataEscapeOffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      return;
    -[CDPRecoveryKeyEntryViewModel deleteiCloudDataEscapeOffer](self->_context, "deleteiCloudDataEscapeOffer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleEscapeAction:", self);
  }

}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[CDPRecoveryKeyEntryViewModel context](self->_context, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_supportsCustodianRecovery");

  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      -[CDPRecoveryKeyEntryViewController handleRecoveryKeyEscapeDuringDataRecoveryFlow:].cold.1(v6, v8, v9);
    v10 = -5218;
  }
  else
  {
    if (v7)
      -[CDPRecoveryKeyEntryViewController handleRecoveryKeyEscapeDuringDataRecoveryFlow:].cold.2(v6, v8, v9);
    v10 = -5215;
  }

  -[CDPRecoveryKeyEntryViewModel handleNoRecoveryKeyWithCDPStateError:](self->_context, "handleNoRecoveryKeyWithCDPStateError:", v10);
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:(id)a3
{
  id v4;
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CDPEscapeOption *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CDPEscapeOption *v16;
  CDPEscapeOption *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CDPEscapeOption *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  CDPEscapeOption *v29;
  CDPRecoveryKeyEntryViewController *v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[4];
  CDPEscapeOption *v34;
  CDPRecoveryKeyEntryViewController *v35;
  _QWORD *v36;
  id v37;
  id location;
  _QWORD v39[5];
  id v40;

  v4 = a3;
  if (-[CDPRecoveryKeyEntryViewModel mandatesRecoveryKey](self->_context, "mandatesRecoveryKey"))
  {
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__0;
    v39[4] = __Block_byref_object_dispose__0;
    -[CDPRecoveryKeyEntryViewController _makeEventWithName:](self, "_makeEventWithName:", *MEMORY[0x24BE1A708]);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", self->_cdpContext);
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIP_RK_ALERT_TITLE_CANT_RESET_PASSWORD_TITLE_CASE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setTitle:](v5, "setTitle:", v7);

    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("SKIP_RK_ALERT_MESSAGE_CANT_RESET_PASSWORD"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v5, "setMessage:", v9);

    -[CDPRemoteValidationEscapeOffer setPresentingViewController:](v5, "setPresentingViewController:", self);
    v27 = v4;
    v10 = objc_alloc_init(CDPEscapeOption);
    -[CDPEscapeOption setTitleLocalizationKey:](v10, "setTitleLocalizationKey:", CFSTR("TRY_AGAIN"));
    -[CDPEscapeOption setTitleTelemetryKey:](v10, "setTitleTelemetryKey:", *MEMORY[0x24BE1A970]);
    v11 = (void *)MEMORY[0x24BE1A458];
    -[CDPEscapeOption titleLocalizationKey](v10, "titleLocalizationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "builderForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v10, "setTitle:", v14);

    objc_initWeak(&location, self);
    v15 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke;
    v33[3] = &unk_24C854E98;
    objc_copyWeak(&v37, &location);
    v36 = v39;
    v16 = v10;
    v34 = v16;
    v35 = self;
    -[CDPEscapeOption setEscapeAction:](v16, "setEscapeAction:", v33);
    -[CDPEscapeOption setStyle:](v16, "setStyle:", 0);
    v17 = objc_alloc_init(CDPEscapeOption);
    -[CDPEscapeOption setTitleLocalizationKey:](v17, "setTitleLocalizationKey:", CFSTR("DONT_RESET_PASSWORD"));
    -[CDPEscapeOption setTitleTelemetryKey:](v17, "setTitleTelemetryKey:", *MEMORY[0x24BE1A888]);
    v18 = (void *)MEMORY[0x24BE1A458];
    -[CDPEscapeOption titleLocalizationKey](v17, "titleLocalizationKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "builderForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v17, "setTitle:", v21);

    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_71;
    v28[3] = &unk_24C854E98;
    objc_copyWeak(&v32, &location);
    v31 = v39;
    v22 = v17;
    v29 = v22;
    v30 = self;
    -[CDPEscapeOption setEscapeAction:](v22, "setEscapeAction:", v28);
    -[CDPEscapeOption setStyle:](v22, "setStyle:", 0);
    v4 = v27;
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v16);
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v5, "addEscapeOptionsObject:", v22);
    _CDPLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[CDPRecoveryKeyEntryViewController skipRecoveryKeyDuringPasswordResetFlow:].cold.1();

    -[CDPRemoteValidationEscapeOffer handleEscapeAction:](v5, "handleEscapeAction:", self);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

    _Block_object_dispose(v39, 8);
  }
  else
  {
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CDPRecoveryKeyEntryViewController skipRecoveryKeyDuringPasswordResetFlow:].cold.2(v24, v25, v26);

    -[CDPRecoveryKeyEntryViewModel handleNoRecoveryKeyWithCDPStateError:](self->_context, "handleNoRecoveryKeyWithCDPStateError:", -5215);
  }

}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_addEscapeOption:forEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "dismissAlerts");

}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_71(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_71_cold_1();

  objc_msgSend(WeakRetained, "_addEscapeOption:forEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1520), "handleNoRecoveryKeyWithCDPStateError:", -5307);
}

- (id)_addEscapeOption:(id)a3 forEvent:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(a3, "titleTelemetryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE1A658]);

  return v5;
}

- (void)handleForgotRecoveryKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CDP_FORGOT_RECOVERY_KEY_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CDP_FORGOT_RECOVERY_KEY_ALERT_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CDP_FORGOT_RECOVERY_KEY_ALERT_REPLACE_KEY_OPTION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke;
  v20[3] = &unk_24C8548F8;
  v20[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  v15 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CANCEL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_83;
  v19[3] = &unk_24C8548F8;
  v19[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  -[CDPRecoveryKeyEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_cold_1();

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1520), "handleForgotRecoveryKeyWithCDPStateError:", -5308);
}

uint64_t __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_83(uint64_t a1)
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_83_cold_1();

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1520), "handleForgotRecoveryKeyWithCDPStateError:", -5307);
}

- (id)headerView
{
  CDPRecoveryKeyCreateHeaderView *headerView;
  CDPRecoveryKeyCreateHeaderView *v4;
  void *v5;
  CDPRecoveryKeyCreateHeaderView *v6;
  CDPRecoveryKeyCreateHeaderView *v7;
  void *v8;
  CDPRecoveryKeyCreateHeaderView *v9;
  void *v10;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [CDPRecoveryKeyCreateHeaderView alloc];
    -[CDPRecoveryKeyEntryViewController specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CDPRecoveryKeyCreateHeaderView initWithSpecifier:](v4, "initWithSpecifier:", v5);
    v7 = self->_headerView;
    self->_headerView = v6;

    headerView = self->_headerView;
  }
  -[CDPRecoveryKeyEntryViewModel headerTitle](self->_context, "headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncHeaderView setTitleText:](headerView, "setTitleText:", v8);

  v9 = self->_headerView;
  -[CDPRecoveryKeyEntryViewModel headerSubtitle](self->_context, "headerSubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncHeaderView setDetailText:](v9, "setDetailText:", v10);

  return self->_headerView;
}

- (void)didFinishEnteringText:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  CDPRecoveryKeyEntryViewModel *context;
  _QWORD v7[5];

  v4 = a3;
  if (-[PSKeychainSyncSecurityCodeController mode](self, "mode") == 1)
  {
    -[CDPRecoveryKeyEntryViewModel completionHandler](self->_context, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1, 0);

  }
  else
  {
    -[CDPRecoveryKeyEntryViewController disableUserInteractionAndStartSpinner](self, "disableUserInteractionAndStartSpinner");
    context = self->_context;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__CDPRecoveryKeyEntryViewController_didFinishEnteringText___block_invoke;
    v7[3] = &unk_24C854EC0;
    v7[4] = self;
    -[CDPRecoveryKeyEntryViewModel processCollectedRecoveryKey:completion:](context, "processCollectedRecoveryKey:completion:", v4, v7);
  }

}

uint64_t __59__CDPRecoveryKeyEntryViewController_didFinishEnteringText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRecoveryKeyValidationWithSuccess:error:", a2, a3);
}

- (void)_handleRecoveryKeyValidationWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5;
  int v6;
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
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];

  if (!a3)
  {
    v5 = a4;
    -[CDPRecoveryKeyEntryViewController enableUserInteractionAndStopSpinner](self, "enableUserInteractionAndStopSpinner");
    v6 = objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5213);

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CDP_MK_MAX_ATTEMPT_TITLE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("CDP_MK_MAX_ATTEMPT_DESCRIPTION"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke;
      v27[3] = &unk_24C8548F8;
      v27[4] = self;
      objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CDPRecoveryKeyEntryViewController _handleRecoveryKeyValidationWithSuccess:error:].cold.1();

      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_RECOVERY_ERROR_MESSAGE_RK"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_RECOVERY_ERROR_TITLE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", v22, v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke_96;
      v26[3] = &unk_24C8548F8;
      v26[4] = self;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "addAction:", v16);
    -[CDPRecoveryKeyEntryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

uint64_t __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1520), "handleCancel");
}

void __83__CDPRecoveryKeyEntryViewController__handleRecoveryKeyValidationWithSuccess_error___block_invoke_96(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setTextEntryText:", &stru_24C857A78);
  objc_msgSend(*(id *)(a1 + 32), "textEntryCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (id)textEntryCell
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDPRecoveryKeyEntryViewController;
  -[PSKeychainSyncSecurityCodeController textEntryCell](&v8, sel_textEntryCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray5Color");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

  }
  return v2;
}

- (id)footerTextLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x24BE756C0]));
}

- (id)footerActionButton
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x24BE756B8]));
}

- (void)disableUserInteractionAndStartSpinner
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a2, v4, "\"Starting spinner for item: %@\", (uint8_t *)&v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)enableUserInteractionAndStopSpinner
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a2, v4, "\"Stopping spinner for item: %@\", (uint8_t *)&v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"CDPRecoveryKeyEntryViewController is going away...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)insertText:(id)a3
{
  -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", a3);
  -[CDPRecoveryKeyEntryViewController didTapUseKeyboard:](self, "didTapUseKeyboard:", 0);
  self->hasText = 1;
  -[PSKeychainSyncTextEntryController setHidesNextButton:](self, "setHidesNextButton:", 0);
}

- (void)deleteBackward
{
  -[PSKeychainSyncTextEntryController setTextEntryText:](self, "setTextEntryText:", 0);
  self->hasText = 0;
  -[PSKeychainSyncTextEntryController setHidesNextButton:](self, "setHidesNextButton:", 1);
}

- (BOOL)hasText
{
  return self->hasText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_enterRecoveryKeyButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)keyboardCameraSessionDidDismiss:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"keyboardCameraSessionDidDismiss was invoked. Camera input was dismissed. Setting the text input mode to Keyboard.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didTapUseKeyboard:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Use Keyboard button tapped.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = -5218;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a1, a3, "\"iOS: Sending error %ld because user doesnt have their RK and has custodian recovery available.\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)handleRecoveryKeyEscapeDuringDataRecoveryFlow:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = -5215;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a1, a3, "\"iOS: Sending error %ld because user chose to try RK later.\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"iOS: RKMandate is true. Presenting the skip recovery alert\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)skipRecoveryKeyDuringPasswordResetFlow:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = -5215;
  OUTLINED_FUNCTION_5(&dword_20DC8F000, a1, a3, "\"iOS: RKMandate is false. Skipping recovery flow with error: %ld\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped try again in skip RK in password recovery flow.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __76__CDPRecoveryKeyEntryViewController_skipRecoveryKeyDuringPasswordResetFlow___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped don't reset password in password recovery flow.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped replace recovery key in forgot recovery key flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__CDPRecoveryKeyEntryViewController_handleForgotRecoveryKey___block_invoke_83_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"User tapped cancel in forgot recovery key flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleRecoveryKeyValidationWithSuccess:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_20DC8F000, v0, OS_LOG_TYPE_ERROR, "\"Invalid code entered... lets try again\", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
