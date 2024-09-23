@implementation DSPasscodePopupViewController

- (DSPasscodePopupViewController)init
{
  DSPasscodePopupViewController *v3;
  uint64_t v4;
  os_log_t v5;
  void *v6;
  DSWifiSyncStore *v7;
  DSWifiSyncStore *wifiSyncStore;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DSPasscodePopupViewController;
  v3 = -[DSPasscodePopupViewController init](&v10, sel_init);
  if (v3 == self)
  {
    v4 = objc_opt_class();
    if (v4 == objc_opt_class())
    {
      v5 = os_log_create("com.apple.DigitalSeparation", "DSPasscodeController");
      v6 = (void *)DSLog_2;
      DSLog_2 = (uint64_t)v5;

    }
    -[DSPasscodePopupViewController _setupFirstEntry](self, "_setupFirstEntry");
    v7 = (DSWifiSyncStore *)objc_alloc_init(MEMORY[0x24BE2CCA0]);
    wifiSyncStore = self->_wifiSyncStore;
    self->_wifiSyncStore = v7;

  }
  return v3;
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
  double v11;
  double v12;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)DSPasscodePopupViewController;
  -[DSPasscodePopupViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[DSPasscodePopupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_opt_new();
  -[DSPasscodePopupViewController setPasscodeView:](self, "setPasscodeView:", v5);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasscodeViewController:", self);

  -[DSPasscodePopupViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSPasscodePopupViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11 * 0.15;

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyboardLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTitle:", 0);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController passcodeInputView](self, "passcodeInputView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "transitionToPasscodeInput:delegate:", v31, self);

  -[DSPasscodePopupViewController configurePasscodeOptionsSheet](self, "configurePasscodeOptionsSheet");
  -[DSPasscodePopupViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, *MEMORY[0x24BEBE448], 0);

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "passcodeInputView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "becomeFirstResponder");
}

+ (BOOL)isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (void)_setupFirstEntry
{
  void *v3;
  int v4;
  uint64_t v5;
  DSPasscodePopupViewController *v6;
  DSPasscodePopupViewController *v7;
  uint64_t v8;
  int v9;

  if (+[DSPasscodePopupViewController isPasscodeSet](DSPasscodePopupViewController, "isPasscodeSet"))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unlockScreenTypeWithOutSimplePasscodeType:", &v9);

    if (v4 == 1)
    {
      -[DSPasscodePopupViewController setNumeric:](self, "setNumeric:", 1);
      v6 = self;
      v5 = 0;
    }
    else
    {
      if (v4)
      {
        -[DSPasscodePopupViewController setNumeric:](self, "setNumeric:", 0);
        goto LABEL_12;
      }
      -[DSPasscodePopupViewController setNumeric:](self, "setNumeric:", 1);
      if (v9)
        v5 = 6;
      else
        v5 = 4;
      v6 = self;
    }
    -[DSPasscodePopupViewController setNumericLength:](v6, "setNumericLength:", v5);
LABEL_12:
    v7 = self;
    v8 = 0;
    goto LABEL_13;
  }
  -[DSPasscodePopupViewController setNumeric:](self, "setNumeric:", 1);
  -[DSPasscodePopupViewController setNumericLength:](self, "setNumericLength:", 6);
  v7 = self;
  v8 = 5;
LABEL_13:
  -[DSPasscodePopupViewController setPasscodeState:](v7, "setPasscodeState:", v8);
  -[DSPasscodePopupViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 0);
  -[DSPasscodePopupViewController configurePasscodeOptionsSheet](self, "configurePasscodeOptionsSheet");
}

- (BOOL)usesSimplePasscodeEntry
{
  _BOOL4 v3;

  v3 = -[DSPasscodePopupViewController isNumeric](self, "isNumeric");
  if (v3)
    LOBYTE(v3) = -[DSPasscodePopupViewController numericLength](self, "numericLength") == 4
              || -[DSPasscodePopupViewController numericLength](self, "numericLength") == 6;
  return v3;
}

- (void)reset
{
  -[DSPasscodePopupViewController setPasscodeOld:](self, "setPasscodeOld:", 0);
  -[DSPasscodePopupViewController setPasscodeNew:](self, "setPasscodeNew:", 0);
  -[DSPasscodePopupViewController _setupFirstEntry](self, "_setupFirstEntry");
  -[DSPasscodePopupViewController _transitionToPasscodePaneWithState:animationType:](self, "_transitionToPasscodePaneWithState:animationType:", -[DSPasscodePopupViewController passcodeState](self, "passcodeState"), 0);
}

- (void)configurePasscodeTypeUsingAnimations:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  if (-[DSPasscodePopupViewController usesSimplePasscodeEntry](self, "usesSimplePasscodeEntry"))
  {
    -[DSPasscodePopupViewController navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BEBD410]);
    DSUILocStringForKey(CFSTR("QUICK_EXIT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodePopupViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, v7, sel_quickExit);
    objc_msgSend(v11, "setRightBarButtonItem:", v8);

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BEBD410]);
    DSUILocStringForKey(CFSTR("NEXT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 2, self, sel_nextButtonTapped);

    -[DSPasscodePopupViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:animated:", v11, v3);
  }

}

- (void)_animatePasscodeViewTransition
{
  void *v3;
  id v4;

  -[DSPasscodePopupViewController passcodeInputView](self, "passcodeInputView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animateTransitionToPasscodeInput:animation:", v4, 3);

}

- (id)passcodeInputView
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v10;

  if (-[DSPasscodePopupViewController usesSimplePasscodeEntry](self, "usesSimplePasscodeEntry"))
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE858F8]), "initWithFrame:numberOfEntryFields:", -[DSPasscodePopupViewController numericLength](self, "numericLength"), 0.0, 0.0, 0.0, 0.0);
  else
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE858D0]), "initWithFrame:numericOnly:", -[DSPasscodePopupViewController isNumeric](self, "isNumeric"), 0.0, 0.0, 0.0, 0.0);
  v4 = (void *)v3;
  switch(-[DSPasscodePopupViewController passcodeState](self, "passcodeState"))
  {
    case 0:
      v5 = CFSTR("PASSCODE_ENTER_OLD");
      goto LABEL_11;
    case 1:
      v7 = CFSTR("PASSCODE_ENTER_NEW");
      goto LABEL_13;
    case 2:
      v5 = CFSTR("PASSCODE_ENTER_NEW_AGAIN");
      goto LABEL_11;
    case 3:
      v5 = CFSTR("PASSCODE_REENTRY_FAILURE");
      goto LABEL_11;
    case 4:
      v5 = CFSTR("PASSCODE_ENTRY_FAILURE");
LABEL_11:
      DSUILocStringForKey(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      v7 = CFSTR("PASSCODE_ENTER_CREATE");
LABEL_13:
      DSUILocStringForKey(v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[DSPasscodePopupViewController optionsSheetIsEmpty](self, "optionsSheetIsEmpty"))
      {
LABEL_14:
        objc_msgSend(v4, "setFooterButtonText:", 0);
      }
      else
      {
        DSUILocStringForKey(CFSTR("PASSCODE_OPTIONS"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setFooterButtonText:", v10);

      }
      break;
    default:
      v6 = 0;
      break;
  }
  objc_msgSend(v4, "instructions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  objc_msgSend(v4, "setFooterView:", 0);
  return v4;
}

- (void)nextButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController userEnteredPasscode:](self, "userEnteredPasscode:", v4);

}

- (void)handleCurrentPasscodeEntry:(id)a3
{
  DSPasscodePopupViewController *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[DSPasscodePopupViewController validatePIN:](self, "validatePIN:"))
  {
    -[DSPasscodePopupViewController setPasscodeOld:](self, "setPasscodeOld:", v7);
    v4 = self;
    v5 = 1;
    v6 = 2;
  }
  else
  {
    v4 = self;
    v5 = 4;
    v6 = 1;
  }
  -[DSPasscodePopupViewController _transitionToPasscodePaneWithState:animationType:](v4, "_transitionToPasscodePaneWithState:animationType:", v5, v6);

}

- (void)handleNewPasscodeEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "passcode:meetsCurrentConstraintsOutError:", v4, &v8);
  v7 = v8;

  if (!v6)
  {
LABEL_6:
    -[DSPasscodePopupViewController handlePasscodeDoesNotMeetConstraints:](self, "handlePasscodeDoesNotMeetConstraints:", v7);
    goto LABEL_7;
  }
  -[DSPasscodePopupViewController setPasscodeNew:](self, "setPasscodeNew:", v4);
  -[DSPasscodePopupViewController usesSimplePasscodeEntry](self, "usesSimplePasscodeEntry");
  if (SecPasswordIsPasswordWeak2())
    -[DSPasscodePopupViewController _showWeakWarningAlert](self, "_showWeakWarningAlert");
  else
    -[DSPasscodePopupViewController _transitionToPasscodePaneWithState:animationType:](self, "_transitionToPasscodePaneWithState:animationType:", 2, 3);
LABEL_7:

}

- (void)handlePasscodeDoesNotMeetConstraints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasscode:", &stru_24EFF4790);

  if (v4
    && (objc_msgSend(v4, "domain"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE63B70]),
        v7,
        v8))
  {
    objc_msgSend(v4, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodePopupViewController _showPasswordRequirementAlertWithText:](self, "_showPasswordRequirementAlertWithText:", v9);

    v10 = (void *)DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      objc_msgSend(v4, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_2278DF000, v11, OS_LOG_TYPE_INFO, "Passcode did not meet constraint: %{public}@", (uint8_t *)&v19, 0xCu);

LABEL_7:
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedDescriptionOfCurrentPasscodeConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPasscodePopupViewController _showPasswordRequirementAlertWithText:](self, "_showPasswordRequirementAlertWithText:", v14);

    v15 = (void *)DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)MEMORY[0x24BE63CB0];
      v11 = v15;
      objc_msgSend(v16, "sharedConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedDescriptionOfCurrentPasscodeConstraints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2278DF000, v11, OS_LOG_TYPE_INFO, "Passcode did not meet constraints. Constraints are: %{public}@", (uint8_t *)&v19, 0xCu);

      goto LABEL_7;
    }
  }

}

- (void)handlePasscodeConfirmationEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[DSPasscodePopupViewController passcodeNew](self, "passcodeNew");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[DSPasscodePopupViewController _applyPasscode](self, "_applyPasscode");
  else
    -[DSPasscodePopupViewController _transitionToPasscodePaneWithState:animationType:](self, "_transitionToPasscodePaneWithState:animationType:", 3, 3);
}

- (void)userEnteredPasscode:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[DSPasscodePopupViewController passcodeState](self, "passcodeState")
    || -[DSPasscodePopupViewController passcodeState](self, "passcodeState") == 4)
  {
    -[DSPasscodePopupViewController handleCurrentPasscodeEntry:](self, "handleCurrentPasscodeEntry:", v6);
LABEL_10:
    v5 = v6;
    goto LABEL_11;
  }
  if (-[DSPasscodePopupViewController passcodeState](self, "passcodeState") == 1
    || -[DSPasscodePopupViewController passcodeState](self, "passcodeState") == 5)
  {
    -[DSPasscodePopupViewController handleNewPasscodeEntry:](self, "handleNewPasscodeEntry:", v6);
    goto LABEL_10;
  }
  if (-[DSPasscodePopupViewController passcodeState](self, "passcodeState") == 2
    || (v4 = -[DSPasscodePopupViewController passcodeState](self, "passcodeState"), v5 = v6, v4 == 3))
  {
    -[DSPasscodePopupViewController handlePasscodeConfirmationEntry:](self, "handlePasscodeConfirmationEntry:", v6);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_transitionToPasscodePaneWithState:(int64_t)a3 animationType:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[DSPasscodePopupViewController setPasscodeState:](self, "setPasscodeState:", a3);
  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passcodeInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasscode:", &stru_24EFF4790);

  -[DSPasscodePopupViewController passcodeInputView](self, "passcodeInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animateTransitionToPasscodeInput:animation:", v7, a4);

}

- (void)_applyPasscode
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DSPasscodePopupViewController *v12;
  id v13;
  uint64_t v14;

  -[DSPasscodePopupViewController _createAndShowAnimatedNavBarSpinner](self, "_createAndShowAnimatedNavBarSpinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.DigitalSeparation.passcode"), 0);

  -[DSPasscodePopupViewController passcodeOld](self, "passcodeOld");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke;
  v10[3] = &unk_24EFF3BE0;
  v11 = v6;
  v12 = self;
  v13 = v3;
  v14 = v5;
  v8 = v3;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  id *v6;
  char v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "passcodeNew");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    v18 = 0;
    v6 = (id *)&v18;
    v7 = objc_msgSend(v2, "changePasscodeFrom:to:skipRecovery:outError:", v4, v5, 1, &v18);
  }
  else
  {
    v17 = 0;
    v6 = (id *)&v17;
    v7 = objc_msgSend(v2, "changePasscodeFrom:to:outError:", v4, v5, &v17);
  }
  v8 = v7;
  v9 = *v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2;
  block[3] = &unk_24EFF3BB8;
  v16 = v8;
  v10 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v14 = v10;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Passcode update successful.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveDeviceUnlockPasscodeInputModes");

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", *(_QWORD *)(a1 + 56));

    objc_msgSend(MEMORY[0x24BE75520], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "passcodeNew");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_234;
    v15[3] = &unk_24EFF3B90;
    v7 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v7;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v5, "promptForDevicePasscodeChangeToPasscode:overController:completion:", v6, v16, v15);

  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = DSLog_2;
      if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
        __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2_cold_1(a1 + 40, v8, v9, v10, v11, v12, v13, v14);
    }
    objc_msgSend(*(id *)(a1 + 48), "stopAnimating");
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(a1 + 56));
  }

}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_234(id *a1, uint64_t a2, void *a3)
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
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
      __47__DSPasscodePopupViewController__applyPasscode__block_invoke_234_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  objc_msgSend(a1[4], "wifiSyncStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_235;
  v15[3] = &unk_24EFF3B68;
  v16 = a1[5];
  v13 = a1[6];
  v14 = a1[4];
  v17 = v13;
  v18 = v14;
  objc_msgSend(v12, "removeAllPairedDevicesOnQueue:completion:", MEMORY[0x24BDAC9B8], v15);

}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_235(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
  {
    v4 = DSLog_2;
    if (os_log_type_enabled((os_log_t)DSLog_2, OS_LOG_TYPE_ERROR))
      __47__DSPasscodePopupViewController__applyPasscode__block_invoke_235_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__DSPasscodePopupViewController__applyPasscode__block_invoke_236;
  v13[3] = &unk_24EFF3A78;
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v14 = v11;
  v15 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __47__DSPasscodePopupViewController__applyPasscode__block_invoke_236(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
  objc_msgSend(*(id *)(a1 + 40), "reset");
  return objc_msgSend(*(id *)(a1 + 40), "pushNextPane");
}

- (BOOL)validatePIN:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v8;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPasscodeSet"))
  {
    v8 = 0;
    v6 = objc_msgSend(v5, "unlockDeviceWithPasscode:outError:", v4, &v8);

    v4 = v8;
  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", &stru_24EFF4790);
  }

  return v6;
}

- (void)pushNextPane
{
  id v3;

  -[DSPasscodePopupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[DSPasscodePopupViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  -[DSPasscodePopupViewController userEnteredPasscode:](self, "userEnteredPasscode:", a4);
}

- (void)passcodeInput:(id)a3 tappedFooterButton:(id)a4
{
  id v5;

  -[DSPasscodePopupViewController passcodeOptionAlertController](self, "passcodeOptionAlertController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSPasscodePopupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_showWeakWarningAlert
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
  _QWORD v14[5];
  _QWORD v15[5];

  DSUILocStringForKey(CFSTR("WEAK_PASSCODE_DETAILS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("WEAK_PASSCODE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CHANGE_PASSCODE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke;
  v15[3] = &unk_24EFF3418;
  v15[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("USE_WEAK_PASSCODE_ANYWAY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke_2;
  v14[3] = &unk_24EFF3418;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

  -[DSPasscodePopupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptWeakPasscode:", 0);
}

uint64_t __54__DSPasscodePopupViewController__showWeakWarningAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptWeakPasscode:", 1);
}

- (void)_showPasswordRequirementAlertWithText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BEBD3B0];
  v5 = a3;
  DSUILocStringForKey(CFSTR("WEAK_PASSCODE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v5, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("OK"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, &__block_literal_global_7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v9);

  -[DSPasscodePopupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)acceptWeakPasscode:(BOOL)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = 2;
  }
  else
  {
    -[DSPasscodePopupViewController setPasscodeNew:](self, "setPasscodeNew:", 0);
    v4 = 1;
  }
  -[DSPasscodePopupViewController _transitionToPasscodePaneWithState:animationType:](self, "_transitionToPasscodePaneWithState:animationType:", v4, 3);
}

- (void)_commitPasscodeEntryTypeChange
{
  -[DSPasscodePopupViewController configurePasscodeTypeUsingAnimations:](self, "configurePasscodeTypeUsingAnimations:", 1);
  -[DSPasscodePopupViewController _animatePasscodeViewTransition](self, "_animatePasscodeViewTransition");
  -[DSPasscodePopupViewController configurePasscodeOptionsSheet](self, "configurePasscodeOptionsSheet");
}

- (void)configurePasscodeOptionsSheet
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
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
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  int v27;

  v27 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v27);

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DSPasscodePopupViewController isNumeric](self, "isNumeric"))
  {
    v6 = (void *)MEMORY[0x24BEBD3A8];
    DSUILocStringForKey(CFSTR("CUSTOM_ALPHANUMERIC_CODE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke;
    v26[3] = &unk_24EFF3418;
    v26[4] = self;
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

  }
  if (v4 <= 1)
  {
    v9 = -[DSPasscodePopupViewController isNumeric](self, "isNumeric");
    v10 = MEMORY[0x24BDAC760];
    if (!v9 || -[DSPasscodePopupViewController numericLength](self, "numericLength"))
    {
      v11 = (void *)MEMORY[0x24BEBD3A8];
      DSUILocStringForKey(CFSTR("CUSTOM_NUMERIC_CODE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v10;
      v25[1] = 3221225472;
      v25[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_2;
      v25[3] = &unk_24EFF3418;
      v25[4] = self;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v13);

    }
    if (!v4)
    {
      if (-[DSPasscodePopupViewController numericLength](self, "numericLength") != 6)
      {
        v14 = (void *)MEMORY[0x24BEBD3A8];
        DSUILocStringForKey(CFSTR("6_DIGIT_CODE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_3;
        v24[3] = &unk_24EFF3418;
        v24[4] = self;
        objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAction:", v16);

      }
      if (!v27 && -[DSPasscodePopupViewController numericLength](self, "numericLength") != 4)
      {
        v17 = (void *)MEMORY[0x24BEBD3A8];
        DSUILocStringForKey(CFSTR("4_DIGIT_CODE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_4;
        v23[3] = &unk_24EFF3418;
        v23[4] = self;
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAction:", v19);

      }
    }
  }
  v20 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v22);

  -[DSPasscodePopupViewController setPasscodeOptionAlertController:](self, "setPasscodeOptionAlertController:", v5);
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumeric:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNumericLength:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumeric:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNumericLength:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumeric:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNumericLength:", 6);
  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

uint64_t __62__DSPasscodePopupViewController_configurePasscodeOptionsSheet__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumeric:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setNumericLength:", 4);
  return objc_msgSend(*(id *)(a1 + 32), "_commitPasscodeEntryTypeChange");
}

- (BOOL)optionsSheetIsEmpty
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[DSPasscodePopupViewController passcodeOptionAlertController](self, "passcodeOptionAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DSPasscodePopupViewController passcodeOptionAlertController](self, "passcodeOptionAlertController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)objc_msgSend(v5, "count") < 2;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "userInfo");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEBE468]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passcodeInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  -[DSPasscodePopupViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v10 > v12 - v6;
  -[DSPasscodePopupViewController passcodeView](self, "passcodeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setScrollEnabled:", v13);

}

- (id)_createAndShowAnimatedNavBarSpinner
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  -[DSPasscodePopupViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleView:", v3);

  objc_msgSend(v3, "startAnimating");
  return v3;
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(int64_t)a3
{
  self->_passcodeState = a3;
}

- (NSString)passcodeNew
{
  return self->_passcodeNew;
}

- (void)setPasscodeNew:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeNew, a3);
}

- (NSString)passcodeOld
{
  return self->_passcodeOld;
}

- (void)setPasscodeOld:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeOld, a3);
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (void)setNumeric:(BOOL)a3
{
  self->_numeric = a3;
}

- (unint64_t)numericLength
{
  return self->_numericLength;
}

- (void)setNumericLength:(unint64_t)a3
{
  self->_numericLength = a3;
}

- (BFFPasscodeView)passcodeView
{
  return self->_passcodeView;
}

- (void)setPasscodeView:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeView, a3);
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (void)setContentHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentHeightConstraint, a3);
}

- (UIAlertController)passcodeOptionAlertController
{
  return self->_passcodeOptionAlertController;
}

- (void)setPasscodeOptionAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeOptionAlertController, a3);
}

- (DSWifiSyncStore)wifiSyncStore
{
  return self->_wifiSyncStore;
}

- (void)setWifiSyncStore:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSyncStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSyncStore, 0);
  objc_storeStrong((id *)&self->_passcodeOptionAlertController, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
  objc_storeStrong((id *)&self->_passcodeOld, 0);
  objc_storeStrong((id *)&self->_passcodeNew, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Passcode update unsuccessful: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_234_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Passcode sync unsuccessful: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

void __47__DSPasscodePopupViewController__applyPasscode__block_invoke_235_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, a2, a3, "Failure to remove synced devices after a passcode change %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

@end
