@implementation DSTouchIDController

- (DSTouchIDController)init
{
  os_log_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DSTouchIDController *v8;
  DSTouchIDController *v9;
  objc_super v11;
  objc_super v12;

  v3 = os_log_create("com.apple.DigitalSeparation", "DSBiometrics");
  v4 = (void *)DSLogBiometrics_0;
  DSLogBiometrics_0 = (uint64_t)v3;

  if (+[DSTouchIDController isTouchIDEnrolled](DSTouchIDController, "isTouchIDEnrolled"))
  {
    DSUILocStringForKey(CFSTR("TOUCH_ID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("TOUCH_ID_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("touchid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DSTouchIDController initWithTitle:detailText:icon:](&v12, sel_initWithTitle_detailText_icon_, v5, v6, v7, v11.receiver, v11.super_class, self, DSTouchIDController);
  }
  else
  {
    DSUILocStringForKey(CFSTR("TOUCH_ID_ENROLL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("TOUCH_ID_ENROLL_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("touchid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DSTouchIDController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v5, v6, v7, self, DSTouchIDController, v12.receiver, v12.super_class);
  }
  v9 = v8;

  return v9;
}

- (void)shouldShowWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sharedWorkQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__DSTouchIDController_shouldShowWithCompletion___block_invoke;
  v7[3] = &unk_24EFF3B40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__DSTouchIDController_shouldShowWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[16];

  if (objc_msgSend(MEMORY[0x24BE2CC70], "isFingerprintModificationRestricted"))
  {
    v2 = DSLogBiometrics_0;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2278DF000, v2, OS_LOG_TYPE_INFO, "Cannot reset TouchID due to device restrictions", v6, 2u);
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if ((objc_msgSend(*(id *)(a1 + 32), "hasMultipleFingerprints") & 1) != 0
      || !+[DSTouchIDController isTouchIDEnrolled](DSTouchIDController, "isTouchIDEnrolled"))
    {
      v5 = PSSupportsMesa();
    }
    else
    {
      v5 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  }
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  BOOL v4;
  __CFString *v5;
  char **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DSTouchIDController;
  -[DSOBWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = +[DSTouchIDController isTouchIDEnrolled](DSTouchIDController, "isTouchIDEnrolled");
  v4 = !v3;
  if (v3)
    v5 = CFSTR("RESET_TOUCH_ID");
  else
    v5 = CFSTR("CONTINUE");
  if (v4)
    v6 = &selRef_enrollTouchID;
  else
    v6 = &selRef_resetTouchID;
  DSUILocStringForKey(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v7, self, *v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTouchIDController setBoldButton:](self, "setBoldButton:", v8);

  DSUILocStringForKey(CFSTR("NOT_NOW"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTouchIDController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v9, v10, sel_pushNextPane);

}

+ (BOOL)isTouchIDEnrolled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE75480], "identities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasMultipleFingerprints
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE75480], "identities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)resetTouchID
{
  if (objc_msgSend(MEMORY[0x24BE2CC98], "shouldShowBioRatchetFlow"))
  {
    -[DSTouchIDController startRatchetEvalInPresentationContext:](self, "startRatchetEvalInPresentationContext:", self);
  }
  else
  {
    -[DSTouchIDController deleteAllIdentities](self, "deleteAllIdentities");
    -[DSTouchIDController beginEnrollment](self, "beginEnrollment");
  }
}

- (void)updateTouchIDPaneConfiguration
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char **v9;
  void *v10;
  id v11;

  v3 = +[DSTouchIDController isTouchIDEnrolled](DSTouchIDController, "isTouchIDEnrolled");
  -[DSTouchIDController boldButton](self, "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  -[DSTouchIDController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DSUILocStringForKey(CFSTR("TOUCH_ID_DETAIL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetailText:", v6);

    -[DSTouchIDController boldButton](self, "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("RESET_TOUCH_ID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);
    v9 = &selRef_resetTouchID;
  }
  else
  {
    DSUILocStringForKey(CFSTR("TOUCH_ID_ENROLL_DETAIL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetailText:", v10);

    -[DSTouchIDController boldButton](self, "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("CONTINUE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);
    v9 = &selRef_enrollTouchID;
  }

  -[DSTouchIDController boldButton](self, "boldButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, *v9, 64);

}

- (void)deleteAllIdentities
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75480], "identities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x24BE75480], "removeIdentity:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BiometricKitUIEnrollViewController setDelegate:](self->_enrollController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)DSTouchIDController;
  -[DSTouchIDController dealloc](&v3, sel_dealloc);
}

- (void)beginEnrollment
{
  void *v3;
  id v4;
  void *v5;
  BiometricKitUIEnrollViewController *v6;
  BiometricKitUIEnrollViewController *enrollController;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v3 = (void *)getBiometricKitUIClass_softClass;
  v17 = getBiometricKitUIClass_softClass;
  if (!getBiometricKitUIClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getBiometricKitUIClass_block_invoke;
    v13[3] = &unk_24EFF3F88;
    v13[4] = &v14;
    __getBiometricKitUIClass_block_invoke((uint64_t)v13);
    v3 = (void *)v15[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnrollUIViewController:bundleName:", 1, 0);
  v6 = (BiometricKitUIEnrollViewController *)objc_claimAutoreleasedReturnValue();
  enrollController = self->_enrollController;
  self->_enrollController = v6;

  if (self->_enrollController)
  {
    -[DSTouchIDController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__DSTouchIDController_beginEnrollment__block_invoke;
    v11[3] = &unk_24EFF40E0;
    v11[4] = self;
    v12 = v9;
    v10 = v9;
    objc_msgSend(v10, "evaluatePolicy:options:reply:", 1007, MEMORY[0x24BDBD1B8], v11);

  }
}

void __38__DSTouchIDController_beginEnrollment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id location;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DSLogBiometrics_0;
    if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_ERROR))
      __38__DSTouchIDController_beginEnrollment__block_invoke_cold_1((uint64_t)v6, v7);
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __38__DSTouchIDController_beginEnrollment__block_invoke_223;
    v10[3] = &unk_24EFF3F18;
    objc_copyWeak(&v13, &location);
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __38__DSTouchIDController_beginEnrollment__block_invoke_223(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "enrollController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "externalizedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v3, CFSTR("credset"));

  objc_msgSend(WeakRetained, "enrollController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", a1[5]);

  v5 = objc_alloc(MEMORY[0x24BEBD7A0]);
  objc_msgSend(WeakRetained, "enrollController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRootViewController:", v6);

  objc_msgSend(v7, "setModalPresentationStyle:", 0);
  objc_msgSend(a1[5], "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)restartEnrollment
{
  -[DSTouchIDController deleteIdentity](self, "deleteIdentity");
  -[BiometricKitUIEnrollViewController restartEnroll](self->_enrollController, "restartEnroll");
}

- (void)deleteIdentity
{
  BiometricKitIdentity *identity;

  if (self->_identity)
  {
    objc_msgSend(MEMORY[0x24BE75480], "removeIdentity:");
    identity = self->_identity;
    self->_identity = 0;

  }
}

- (void)addNavigationItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[DSTouchIDController enrollController](self, "enrollController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  DSUILocStringForKey(CFSTR("QUICK_EXIT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTouchIDController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, v7, sel_quickExit);
  objc_msgSend(v4, "setRightBarButtonItem:", v8);

  -[DSTouchIDController enrollController](self, "enrollController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTouchIDController _cancelLeftNavigationItem](self, "_cancelLeftNavigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:animated:", v10, 1);

}

- (id)_cancelLeftNavigationItem
{
  UIBarButtonItem *cancelLeftNavigationItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  if (!cancelLeftNavigationItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userDidTapCancelButton_);
    v5 = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v4;

    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
  }
  return cancelLeftNavigationItem;
}

- (void)_userDidTapCancelButton:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = DSLogBiometrics_0;
  if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2278DF000, v4, OS_LOG_TYPE_INFO, "Touch ID user did tap cancel", v6, 2u);
  }
  -[DSTouchIDController deleteIdentity](self, "deleteIdentity");
  -[DSTouchIDController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  -[DSTouchIDController updateTouchIDPaneConfiguration](self, "updateTouchIDPaneConfiguration");
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BiometricKitIdentity *identity;
  NSObject *v14;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE0CE60], "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getIdentityFromUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  switch(a3)
  {
    case 0:
      self->_enrollComplete = 0;
      -[DSTouchIDController addNavigationItems](self, "addNavigationItems");
      break;
    case 1:
      if (v9)
      {
        objc_msgSend(v9, "setType:", 1);
        objc_msgSend(MEMORY[0x24BE75480], "nextIdentityName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setName:", v11);

        objc_msgSend(MEMORY[0x24BE0CE60], "manager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateIdentity:", v9);
        goto LABEL_11;
      }
      v14 = DSLogBiometrics_0;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_ERROR))
        -[DSTouchIDController enrollResult:bkIdentity:].cold.1(v14);
      break;
    case 3:
    case 6:
    case 7:
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BE0CE60], "manager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeIdentity:", v9);
        goto LABEL_11;
      }
      break;
    case 4:
      self->_enrollComplete = 1;
      -[DSTouchIDController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

      -[DSTouchIDController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushNextPane");
LABEL_11:

      break;
    case 9:
      identity = self->_identity;
      self->_identity = 0;

      -[DSTouchIDController restartEnrollment](self, "restartEnrollment");
      break;
    default:
      break;
  }

}

- (void)startRatchetEvalInPresentationContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  LARatchetViewController *v15;
  LARatchetViewController *ratchetVC;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDDAA08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ACTION_BUTTON_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCountdownPrimaryActionTitle:", v7);

  -[DSTouchIDController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deepLinkForCurrentFlowAndPane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDDAA00];
  v17[0] = &unk_24F00B328;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_REASON_TOUCHID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = &unk_24F00B340;
  DSUIDTOLocStringForKey(CFSTR("RATCHET_ENDED_DETAIL_TOUCHID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = &unk_24F00B358;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = &unk_24F00B370;
  v18[2] = v13;
  v18[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeViewControllerWithOptions:configuration:", v14, v6);
  v15 = (LARatchetViewController *)objc_claimAutoreleasedReturnValue();
  ratchetVC = self->_ratchetVC;
  self->_ratchetVC = v15;

  -[LARatchetViewController setDelegate:](self->_ratchetVC, "setDelegate:", self);
  -[LARatchetViewController evaluateAndShowViewController](self->_ratchetVC, "evaluateAndShowViewController");

}

- (void)ratchetViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[DSTouchIDController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", &unk_24F00B340);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__DSTouchIDController_ratchetViewController_didFinishWithResult_error___block_invoke;
    block[3] = &unk_24EFF3778;
    block[4] = self;
    v24 = v11;
    v25 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(v9, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDDA928]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "code") || !v14)
    {
      v16 = DSLogBiometrics_0;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl(&dword_2278DF000, v16, OS_LOG_TYPE_INFO, "TouchID Change Ratchet not armed. Reason: %@", buf, 0xCu);
      }
      -[DSTouchIDController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v20 = objc_opt_class();

      if (v19 == v20)
      {
        -[DSTouchIDController navigationController](self, "navigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v21, "popToViewController:animated:", self, 0);

        objc_msgSend(v11, "pushNextPane");
      }
    }
    else if (objc_msgSend(v14, "rawValue") == 1)
    {
      v15 = DSLogBiometrics_0;
      if (os_log_type_enabled((os_log_t)DSLogBiometrics_0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2278DF000, v15, OS_LOG_TYPE_INFO, "TouchID Change Ratchet initiated, timer counting down. User exiting Safety Check.", buf, 2u);
      }
      objc_msgSend(v11, "exitFlowForRatchetWait");
    }

  }
}

void __71__DSTouchIDController_ratchetViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deleteAllIdentities");
  objc_msgSend(*(id *)(a1 + 32), "beginEnrollment");
  objc_msgSend(*(id *)(a1 + 40), "sendSummaryAnalyticsWithEventName:", CFSTR("com.apple.DigitalSeparation.RatchedEnded"));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewControllers:", v5);

  }
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollController, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ratchetVC, 0);
  objc_storeStrong((id *)&self->_cancelLeftNavigationItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

void __38__DSTouchIDController_beginEnrollment__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278DF000, a2, OS_LOG_TYPE_ERROR, "Error while evaluating Touch ID authentication policy, error %@", (uint8_t *)&v2, 0xCu);
}

- (void)enrollResult:(os_log_t)log bkIdentity:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2278DF000, log, OS_LOG_TYPE_ERROR, "Error creating serverIdentity", v1, 2u);
}

@end
