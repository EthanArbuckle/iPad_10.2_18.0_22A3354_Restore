@implementation CNFRegFirstRunController

- (CNFRegFirstRunController)initWithRegController:(id)a3
{
  CNFRegFirstRunController *v3;
  CNFRegFirstRunController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFRegFirstRunController;
  v3 = -[CNFRegListController initWithRegController:](&v6, sel_initWithRegController_, a3);
  v4 = v3;
  if (v3)
    -[CNFRegFirstRunController _refreshNavBarAnimated:](v3, "_refreshNavBarAnimated:", 0);
  return v4;
}

- (CNFRegFirstRunController)initWithRegController:(id)a3 account:(id)a4
{
  id v6;
  CNFRegFirstRunController *v7;
  CNFRegFirstRunController *v8;

  v6 = a4;
  v7 = -[CNFRegFirstRunController initWithRegController:](self, "initWithRegController:", a3);
  v8 = v7;
  if (v7)
    -[CNFRegFirstRunController setAccount:](v7, "setAccount:", v6);

  return v8;
}

- (CNFRegFirstRunController)initWithParentController:(id)a3 account:(id)a4
{
  id v6;
  CNFRegFirstRunController *v7;
  CNFRegFirstRunController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegFirstRunController;
  v7 = -[CNFRegListController initWithParentController:](&v10, sel_initWithParentController_, a3);
  v8 = v7;
  if (v7)
    -[CNFRegFirstRunController setAccount:](v7, "setAccount:", v6);

  return v8;
}

- (void)dealloc
{
  CNFRegFirstRunController *v3;
  CNFRegFirstRunController *v4;
  objc_super v5;

  self->_delegate = 0;
  -[CNFRegFirstRunController _stopTimeout](self, "_stopTimeout");
  -[UIBarButtonItem target](self->_customRightButton, "target");
  v3 = (CNFRegFirstRunController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[UIBarButtonItem setTarget:](self->_customRightButton, "setTarget:", 0);
  -[UIBarButtonItem target](self->_customLeftButton, "target");
  v4 = (CNFRegFirstRunController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[UIBarButtonItem setTarget:](self->_customLeftButton, "setTarget:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController dealloc](&v5, sel_dealloc);
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  Class v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController setSpecifier:](&v8, sel_setSpecifier_, v4);
  if (!-[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass"))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("cnf-completionclass"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = NSClassFromString(v5);
      if (v7)
        -[CNFRegFirstRunController setCompletionControllerClass:](self, "setCompletionControllerClass:", v7);
    }

  }
}

- (void)_startListeningForReturnKey
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleReturnKeyTapped_, *MEMORY[0x24BEBE568], 0);

}

- (void)_stopListeningForReturnKey
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE568], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[CNFRegFirstRunController _setupEventHandlers](self, "_setupEventHandlers");
  -[CNFRegFirstRunController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "registrationStatus");

  if (v5 == -1)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Account state was failed so refreshing current state", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    -[CNFRegFirstRunController _refreshCurrentState](self, "_refreshCurrentState");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNFRegFirstRunController _refreshNavBarAnimated:](self, "_refreshNavBarAnimated:", 0);
  -[CNFRegFirstRunController _startListeningForReturnKey](self, "_startListeningForReturnKey");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEBUG, "Removing event handlers", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
  -[CNFRegFirstRunController _stopListeningForReturnKey](self, "_stopListeningForReturnKey");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNFRegFirstRunController _stopTimeout](self, "_stopTimeout");
  v5.receiver = self;
  v5.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (id)titleString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  -[CNFRegListController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 != 2)
  {
    if (v3 == 1)
    {
      CommunicationsSetupUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = CFSTR("IMESSAGE");
      goto LABEL_6;
    }
    if (v3)
    {
      v7 = &stru_24D077260;
      return v7;
    }
  }
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("FACETIME");
LABEL_6:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D077260, v5);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)validationString
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VERIFYING"), &stru_24D077260, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_refreshNavBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  -[CNFRegFirstRunController _leftButtonItem](self, "_leftButtonItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController _rightButtonItem](self, "_rightButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNFRegFirstRunController _hidesBackButton](self, "_hidesBackButton");
  -[CNFRegFirstRunController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
    objc_msgSend(v7, "setRightBarButtonItem:animated:", v5, v3);
  objc_msgSend(v7, "leftBarButtonItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
    objc_msgSend(v7, "setLeftBarButtonItem:animated:");
  if (v6 != objc_msgSend(v7, "hidesBackButton"))
    objc_msgSend(v7, "setHidesBackButton:animated:", v6, v3);

}

- (id)_rightButtonItem
{
  UIBarButtonItem *customRightButton;
  UIBarButtonItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  customRightButton = self->_customRightButton;
  if (customRightButton)
  {
    v4 = customRightButton;
    -[UIBarButtonItem target](v4, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[UIBarButtonItem setTarget:](v4, "setTarget:", self);
    if (!-[UIBarButtonItem action](v4, "action"))
      -[UIBarButtonItem setAction:](v4, "setAction:", sel__rightButtonTapped);
  }
  else
  {
    CommunicationsSetupUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24D077260, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v8, 2, self, sel__rightButtonTapped);
  }
  return v4;
}

- (void)_cancelValidationMode
{
  self->_cancelled = 1;
  -[CNFRegFirstRunController _handleValidationModeCancelled](self, "_handleValidationModeCancelled");
}

- (id)_leftButtonItem
{
  UIBarButtonItem *customLeftButton;
  UIBarButtonItem *v4;
  void *v5;

  customLeftButton = self->_customLeftButton;
  if (customLeftButton)
  {
    v4 = customLeftButton;
    -[UIBarButtonItem target](v4, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[UIBarButtonItem setTarget:](v4, "setTarget:", self);
    if (!-[UIBarButtonItem action](v4, "action"))
      -[UIBarButtonItem setAction:](v4, "setAction:", sel__leftButtonTapped);
  }
  return customLeftButton;
}

- (BOOL)_hidesBackButton
{
  return self->_customLeftButton != 0;
}

- (void)_startTimeoutWithDuration:(double)a3
{
  NSTimer *v5;
  NSTimer *timeoutTimer;

  if (!self->_timeoutTimer)
  {
    -[CNFRegFirstRunController setTimedOut:](self, "setTimedOut:", 0);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timeoutFired_, 0, 0, a3);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v5;

  }
}

- (void)_stopTimeout
{
  NSTimer *timeoutTimer;
  NSTimer *v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    -[NSTimer invalidate](timeoutTimer, "invalidate");
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
}

- (void)_timeoutFired:(id)a3
{
  -[CNFRegFirstRunController _stopTimeout](self, "_stopTimeout", a3);
  -[CNFRegFirstRunController setTimedOut:](self, "setTimedOut:", 1);
  -[CNFRegFirstRunController _handleTimeout](self, "_handleTimeout");
}

- (id)_validationModeCancelButton
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelValidationMode);
}

- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4 allowCancel:(BOOL)a5
{
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  v9 = v8;
  if (!self->_showingActivityIndicator)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__CNFRegFirstRunController__startActivityIndicatorWithTitle_animated_allowCancel___block_invoke;
    block[3] = &unk_24D0760E0;
    block[4] = self;
    v11 = v8;
    v12 = a5;
    v13 = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __82__CNFRegFirstRunController__startActivityIndicatorWithTitle_animated_allowCancel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CNFRegNavigationBarTitleView *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreviousLeftButton:", v2);

  objc_msgSend(v8, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreviousRightButton:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setPreviousHidesBackButton:", objc_msgSend(v8, "hidesBackButton"));
  objc_msgSend(v8, "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationBar:", v5);

  v6 = -[CNFRegNavigationBarTitleView initWithNavigationItem:]([CNFRegNavigationBarTitleView alloc], "initWithNavigationItem:", v8);
  -[CNFRegNavigationBarTitleView sizeToFit](v6, "sizeToFit");
  objc_msgSend(v8, "setTitleView:", v6);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_validationModeCancelButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v8, "setLeftBarButtonItem:animated:", v7, *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v8, "setRightBarButtonItem:animated:", 0, *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v8, "setHidesBackButton:animated:", 1, *(unsigned __int8 *)(a1 + 49));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1408) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_setFieldsEnabled:animated:", 0, *(unsigned __int8 *)(a1 + 49));

}

- (void)_startActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4
{
  -[CNFRegFirstRunController _startActivityIndicatorWithTitle:animated:allowCancel:](self, "_startActivityIndicatorWithTitle:animated:allowCancel:", a3, a4, 0);
}

- (void)_stopActivityIndicatorWithTitle:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CNFRegFirstRunController__stopActivityIndicatorWithTitle_animated___block_invoke;
  block[3] = &unk_24D076108;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__CNFRegFirstRunController__stopActivityIndicatorWithTitle_animated___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1408])
  {
    objc_msgSend(v2, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "setTitleView:", 0);
    objc_msgSend(*(id *)(a1 + 32), "previousLeftButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", v3, *(unsigned __int8 *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "previousRightButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:animated:", v4, *(unsigned __int8 *)(a1 + 48));

    objc_msgSend(v5, "setHidesBackButton:animated:", objc_msgSend(*(id *)(a1 + 32), "previousHidesBackButton"), *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setPreviousLeftButton:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPreviousRightButton:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setPreviousHidesBackButton:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setFieldsEnabled:animated:", 1, *(unsigned __int8 *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1408) = 0;

  }
}

- (void)_stopActivityIndicatorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CNFRegFirstRunController titleString](self, "titleString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController _stopActivityIndicatorWithTitle:animated:](self, "_stopActivityIndicatorWithTitle:animated:", v5, v3);

}

- (void)_startValidationModeAnimated:(BOOL)a3 allowCancel:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  self->_cancelled = 0;
  -[CNFRegFirstRunController validationString](self, "validationString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController _startActivityIndicatorWithTitle:animated:allowCancel:](self, "_startActivityIndicatorWithTitle:animated:allowCancel:", v7, v5, v4);

}

- (void)_startValidationModeAnimated:(BOOL)a3
{
  -[CNFRegFirstRunController _startValidationModeAnimated:allowCancel:](self, "_startValidationModeAnimated:allowCancel:", a3, 0);
}

- (void)setCellsChecked:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = (int)*MEMORY[0x24BE75700];
    do
    {
      v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
      -[CNFRegFirstRunController indexPathForIndex:](self, "indexPathForIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "setChecked:", v3);

      ++v7;
    }
    while (v6 != v7);
  }
}

- (void)systemApplicationWillEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController systemApplicationWillEnterForeground](&v3, sel_systemApplicationWillEnterForeground);
  -[CNFRegFirstRunController _setupEventHandlers](self, "_setupEventHandlers");
  -[CNFRegFirstRunController _updateUI](self, "_updateUI");
}

- (void)systemApplicationDidEnterBackground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController systemApplicationDidEnterBackground](&v3, sel_systemApplicationDidEnterBackground);
  -[CNFRegFirstRunController _stopTimeout](self, "_stopTimeout");
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
}

- (void)_updateControllerState
{
  void *v3;
  char v4;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isServiceSupported");

  if ((v4 & 1) != 0)
    -[CNFRegFirstRunController _updateUI](self, "_updateUI");
  else
    -[CNFRegFirstRunController dismissWithState:](self, "dismissWithState:", 0);
}

- (void)_refreshCurrentState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "_refreshCurrentState", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "accountStateForAccount:", v5);

  if ((v6 & 0x40000000) == 0)
    goto LABEL_7;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "_refreshCurrentState: finished", v8, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  if (!-[CNFRegFirstRunController pushCompletionControllerIfPossible](self, "pushCompletionControllerIfPossible")
    && !-[CNFRegFirstRunController dismissWithState:](self, "dismissWithState:", v6))
  {
LABEL_7:
    -[CNFRegFirstRunController _updateControllerState](self, "_updateControllerState");
  }
}

- (BOOL)pushCompletionControllerIfPossible
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(-[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Pushing completion controller %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    NSStringFromClass(-[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  v5 = -[CNFRegFirstRunController completionControllerClass](self, "completionControllerClass", v22);
  v6 = v5;
  if (v5)
  {
    v7 = [v5 alloc];
    -[CNFRegListController regController](self, "regController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithRegController:", v8);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "conformsToProtocol:", &unk_254D15480))
    {
      objc_msgSend(v9, "setParentController:", self);
      -[CNFRegFirstRunController rootController](self, "rootController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRootController:", v10);

      -[CNFRegFirstRunController specifier](self, "specifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSpecifier:", v11);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "setShouldRerootPreferences:", 1);
      v12 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A0]);
      WeakRetained = objc_loadWeakRetained(v12);
      objc_msgSend(WeakRetained, "viewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v16 = objc_alloc_init(MEMORY[0x24BDD1698]);
      if (objc_msgSend(v15, "count"))
      {
        v17 = 0;
        do
        {
          objc_msgSend(v15, "objectAtIndex:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "conformsToProtocol:", &unk_254D2AA48))
          {
            objc_msgSend(v18, "setDelegate:", 0);
            objc_msgSend(v16, "addIndex:", v17);
          }

          ++v17;
        }
        while (v17 < objc_msgSend(v15, "count"));
      }
      objc_msgSend(v15, "removeObjectsAtIndexes:", v16);
      objc_msgSend(v15, "addObject:", v9);
      v6 = objc_loadWeakRetained(v12);
      objc_msgSend(v6, "setViewControllers:animated:", v15, 1);

      LOBYTE(v6) = 1;
    }
    else
    {
      OSLogHandleForIDSCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_2138BA000, v19, OS_LOG_TYPE_DEFAULT, "Unexpected completion controller %@", buf, 0xCu);

      }
      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
      {
        LOBYTE(v6) = 0;
        goto LABEL_24;
      }
      NSStringFromClass((Class)v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogString();
      LOBYTE(v6) = 0;
    }

LABEL_24:
  }
  return (char)v6;
}

- (BOOL)dismissWithState:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[CNFRegFirstRunController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CNFRegFirstRunController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNFRegFirstRunController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstRunController:finishedWithState:", self, a3);

      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)_setupEventHandlers
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegFirstRunController;
  -[CNFRegListController _setupEventHandlers](&v7, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__CNFRegFirstRunController__setupEventHandlers__block_invoke;
  v6[3] = &unk_24D075180;
  v6[4] = self;
  objc_msgSend(v3, "setResetBlock:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47__CNFRegFirstRunController__setupEventHandlers__block_invoke_2;
  v5[3] = &unk_24D075180;
  v5[4] = self;
  objc_msgSend(v3, "setServiceDidBecomeUnsupportedBlock:", v5);

}

uint64_t __47__CNFRegFirstRunController__setupEventHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshCurrentState");
}

void __47__CNFRegFirstRunController__setupEventHandlers__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isServiceSupported");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateControllerState");
}

- (int64_t)currentAppearanceStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegFirstRunController;
  return -[CNFRegListController currentAppearanceStyle](&v3, sel_currentAppearanceStyle);
}

- (void)_executeDismissBlock:(id)a3
{
  void (**v4)(void);
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void (**v9)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v9 = v4;
    -[CNFRegFirstRunController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CNFRegFirstRunController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, "setSkipReloadOnNextViewWillAppear:", 1);

      }
    }
    v9[2]();
    v4 = v9;
  }

}

- (Class)completionControllerClass
{
  return self->_completionControllerClass;
}

- (void)setCompletionControllerClass:(Class)a3
{
  self->_completionControllerClass = a3;
}

- (UIBarButtonItem)previousLeftButton
{
  return self->_previousLeftButton;
}

- (void)setPreviousLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_previousLeftButton, a3);
}

- (UIBarButtonItem)previousRightButton
{
  return self->_previousRightButton;
}

- (void)setPreviousRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_previousRightButton, a3);
}

- (BOOL)previousHidesBackButton
{
  return self->_previousHidesBackButton;
}

- (void)setPreviousHidesBackButton:(BOOL)a3
{
  self->_previousHidesBackButton = a3;
}

- (CNFRegFirstRunDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegFirstRunDelegate *)a3;
}

- (UIBarButtonItem)customLeftButton
{
  return self->_customLeftButton;
}

- (void)setCustomLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_customLeftButton, a3);
}

- (UIBarButtonItem)customRightButton
{
  return self->_customRightButton;
}

- (void)setCustomRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_customRightButton, a3);
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_customLeftButton, 0);
  objc_storeStrong((id *)&self->_customRightButton, 0);
  objc_storeStrong((id *)&self->_previousRightButton, 0);
  objc_storeStrong((id *)&self->_previousLeftButton, 0);
}

@end
