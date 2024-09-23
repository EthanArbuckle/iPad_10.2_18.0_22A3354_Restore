@implementation PBADataRecoveryViewController

- (PBADataRecoveryViewController)initWithContainingStackViewController:(id)a3
{
  id v5;
  PBADataRecoveryViewController *v6;
  PBADataRecoveryViewController *v7;
  NSData *firstPasscode;
  uint64_t v9;
  PBAIdleSleepController *idleSleepController;
  SBFAuthenticationAssertionManager *v11;
  SBFAuthenticationAssertionManager *assertionManager;
  PBAAuthenticationPolicy *v13;
  SBFAuthenticationPolicy *authenticationPolicy;
  SBFUserAuthenticationController *v15;
  SBFUserAuthenticationController *authenticationController;
  SBFDeviceLockOutController *v17;
  SBFDeviceLockOutController *deviceLockOutController;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PBADataRecoveryViewController;
  v6 = -[PBADataRecoveryViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    firstPasscode = v6->_firstPasscode;
    v6->_firstPasscode = 0;

    objc_storeStrong((id *)&v7->_stackViewController, a3);
    v9 = objc_claimAutoreleasedReturnValue(+[PBAIdleSleepController sharedController](PBAIdleSleepController, "sharedController"));
    idleSleepController = v7->_idleSleepController;
    v7->_idleSleepController = (PBAIdleSleepController *)v9;

    v11 = (SBFAuthenticationAssertionManager *)objc_alloc_init((Class)SBFAuthenticationAssertionManager);
    assertionManager = v7->_assertionManager;
    v7->_assertionManager = v11;

    v13 = objc_alloc_init(PBAAuthenticationPolicy);
    authenticationPolicy = v7->_authenticationPolicy;
    v7->_authenticationPolicy = (SBFAuthenticationPolicy *)v13;

    v15 = (SBFUserAuthenticationController *)objc_msgSend(objc_alloc((Class)SBFUserAuthenticationController), "initWithAssertionManager:policy:", v7->_assertionManager, v7->_authenticationPolicy);
    authenticationController = v7->_authenticationController;
    v7->_authenticationController = v15;

    v17 = (SBFDeviceLockOutController *)objc_msgSend(objc_alloc((Class)SBFDeviceLockOutController), "initWithThermalController:authenticationController:", 0, v7->_authenticationController);
    deviceLockOutController = v7->_deviceLockOutController;
    v7->_deviceLockOutController = v17;

  }
  return v7;
}

- (void)loadView
{
  PBASimpleLockScreenView *v3;

  v3 = -[PBASimpleLockScreenView initWithFrame:]([PBASimpleLockScreenView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PBADataRecoveryViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBADataRecoveryViewController;
  v3 = -[PBADataRecoveryViewController viewDidLoad](&v9, "viewDidLoad");
  v4 = SBFEffectiveHomeButtonType(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBADataRecoveryViewController view](self, "view"));
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBADataRecoveryViewController _localizedRecoveryStringForHomeButtonType:](self, "_localizedRecoveryStringForHomeButtonType:", v4));
  objc_msgSend(v5, "setPressToOpenText:", v6);

  v7 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_homeButtonPressed:");
  objc_msgSend(v7, "setAllowedTouchTypes:", &__NSArray0__struct);
  objc_msgSend(v7, "setAllowedPressTypes:", &off_1000194A8);
  objc_msgSend(v7, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v7, "setCancelsTouchesInView:", 0);
  objc_msgSend(v5, "addGestureRecognizer:", v7);
  if (v4 == 2)
  {
    v8 = objc_msgSend(objc_alloc((Class)UIScreenEdgePanGestureRecognizer), "initWithTarget:action:type:options:", self, "_handleEdgeSwipe:", 5, 0);
    objc_msgSend(v8, "setEdges:", 4);
    objc_msgSend(v5, "addGestureRecognizer:", v8);

  }
  -[PBADataRecoveryViewController _evaluateDeviceBlockState](self, "_evaluateDeviceBlockState");

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PBADataRecoveryViewController;
  -[PBADataRecoveryViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBADataRecoveryViewController;
  -[PBADataRecoveryViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBADataRecoveryViewController view](self, "view"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_localizedRecoveryStringForHomeButtonType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (a3 == 2)
    v6 = CFSTR("PREBOARD_SWIPE_FOR_RECOVERY");
  else
    v6 = CFSTR("PREBOARD_PRESS_FOR_RECOVERY");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100018D78, CFSTR("PreBoard")));

  return v7;
}

- (void)_homeButtonPressed:(id)a3
{
  -[PBADataRecoveryViewController _pushPasscodeView](self, "_pushPasscodeView", a3);
}

- (void)_handleEdgeSwipe:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[PBADataRecoveryViewController _pushPasscodeView](self, "_pushPasscodeView");
}

- (void)_pushPasscodeView
{
  void *v3;
  void *v4;
  PBAPasscodeEntryViewController *v5;

  v5 = -[PBAPasscodeEntryViewController initWithNibName:bundle:]([PBAPasscodeEntryViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PBAPasscodeEntryViewController setDelegate:](v5, "setDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_ENTER_PASSCODE"), &stru_100018D78, CFSTR("PreBoard")));
  -[PBAPasscodeEntryViewController setTitleText:subtitleText:animated:](v5, "setTitleText:subtitleText:animated:", v4, 0, 0);

  -[PBAStackViewController pushViewController:animated:completion:](self->_stackViewController, "pushViewController:animated:completion:", v5, 1, 0);
}

- (void)_beginRecovery:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  PBADataRecoveryProgressViewController *v8;
  void *v9;
  void *v10;
  PBADataRecoveryEngine *dataRecoveryEngine;
  PBADataRecoveryProgressViewController *v12;
  id v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  PBADataRecoveryViewController *v18;
  id v19;
  PBADataRecoveryProgressViewController *v20;
  _QWORD v21[4];
  PBADataRecoveryProgressViewController *v22;

  v6 = a3;
  v7 = a4;
  v8 = -[PBADataRecoveryProgressViewController initWithNibName:bundle:]([PBADataRecoveryProgressViewController alloc], "initWithNibName:bundle:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_IN_PROGRESS"), &stru_100018D78, CFSTR("PreBoard")));
  -[PBADataRecoveryProgressViewController setStatusText:](v8, "setStatusText:", v10);

  dataRecoveryEngine = self->_dataRecoveryEngine;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100003774;
  v21[3] = &unk_1000186F8;
  v22 = v8;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100003800;
  v17 = &unk_100018798;
  v18 = self;
  v19 = v6;
  v20 = v22;
  v12 = v22;
  v13 = v6;
  -[PBADataRecoveryEngine performDataRecoveryWithPasscode:progressHandler:completion:](dataRecoveryEngine, "performDataRecoveryWithPasscode:progressHandler:completion:", v13, v21, &v14);
  -[PBAStackViewController replaceViewController:withViewController:animated:](self->_stackViewController, "replaceViewController:withViewController:animated:", v7, v12, 1, v14, v15, v16, v17, v18);

}

- (void)_handleBlockedDevice
{
  PBADeviceBlockOverlayViewController *v3;
  PBADeviceBlockOverlayViewController *blockOverlayController;
  PBADeviceBlockOverlayViewController *v5;

  if (!self->_blockOverlayController)
  {
    v3 = -[PBADeviceBlockOverlayViewController initWithBlockStatusProvider:]([PBADeviceBlockOverlayViewController alloc], "initWithBlockStatusProvider:", self->_deviceLockOutController);
    -[PBADeviceBlockOverlayViewController setDelegate:](v3, "setDelegate:", self);
    -[PBADeviceBlockOverlayViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 0);
    -[PBADeviceBlockOverlayViewController setModalTransitionStyle:](v3, "setModalTransitionStyle:", 2);
    blockOverlayController = self->_blockOverlayController;
    self->_blockOverlayController = v3;
    v5 = v3;

    -[PBAStackViewController pushViewController:animated:completion:](self->_stackViewController, "pushViewController:animated:completion:", self->_blockOverlayController, 1, 0);
  }
}

- (void)_handleUnblockedDevice
{
  PBADeviceBlockOverlayViewController *blockOverlayController;
  PBADeviceBlockOverlayViewController *v4;

  blockOverlayController = self->_blockOverlayController;
  if (blockOverlayController)
  {
    -[PBAStackViewController removeViewController:animated:](self->_stackViewController, "removeViewController:animated:", blockOverlayController, 1);
    v4 = self->_blockOverlayController;
    self->_blockOverlayController = 0;

  }
}

- (void)_evaluateDeviceBlockState
{
  -[SBFUserAuthenticationController _noteDeviceLockStateMayHaveChangedForExternalReasons](self->_authenticationController, "_noteDeviceLockStateMayHaveChangedForExternalReasons");
  if (-[SBFDeviceLockOutController isBlocked](self->_deviceLockOutController, "isBlocked"))
    -[PBADataRecoveryViewController _handleBlockedDevice](self, "_handleBlockedDevice");
  else
    -[PBADataRecoveryViewController _handleUnblockedDevice](self, "_handleUnblockedDevice");
}

- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSData *v9;
  NSData *v10;
  NSData *firstPasscode;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_firstPasscode)
  {
    v10 = (NSData *)objc_msgSend(v6, "copy");
    firstPasscode = self->_firstPasscode;
    self->_firstPasscode = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_CONFIRM_PASSCODE"), &stru_100018D78, CFSTR("PreBoard")));
    objc_msgSend(v21, "setTitleText:subtitleText:animated:", v13, 0, 1);

    v14 = v21;
    v15 = 0;
LABEL_6:
    objc_msgSend(v14, "resetPasscodeEntryFieldForFailure:", v15);
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "isEqualToData:"))
  {
    v16 = self->_firstPasscode;
    self->_firstPasscode = 0;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_ENTER_PASSCODE"), &stru_100018D78, CFSTR("PreBoard")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PREBOARD_RECOVERY_SUBTITLE_MISMATCH"), &stru_100018D78, CFSTR("PreBoard")));
    objc_msgSend(v21, "setTitleText:subtitleText:animated:", v18, v20, 1);

    v14 = v21;
    v15 = 1;
    goto LABEL_6;
  }
  objc_msgSend(v21, "resetPasscodeEntryFieldForFailure:", 0);
  v8 = -[NSData copy](self->_firstPasscode, "copy");
  v9 = self->_firstPasscode;
  self->_firstPasscode = 0;

  -[PBADataRecoveryViewController _beginRecovery:fromViewController:](self, "_beginRecovery:fromViewController:", v8, v21);
LABEL_7:

}

- (void)passcodeEntryViewControllerCancelButtonPressed:(id)a3
{
  NSData *firstPasscode;
  id v5;

  firstPasscode = self->_firstPasscode;
  self->_firstPasscode = 0;
  v5 = a3;

  -[PBAStackViewController removeViewController:animated:](self->_stackViewController, "removeViewController:animated:", v5, 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return 1;
}

- (PBADataRecoveryEngine)dataRecoveryEngine
{
  return self->_dataRecoveryEngine;
}

- (void)setDataRecoveryEngine:(id)a3
{
  objc_storeStrong((id *)&self->_dataRecoveryEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockOverlayController, 0);
  objc_storeStrong((id *)&self->_deviceLockOutController, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_authenticationPolicy, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_idleSleepController, 0);
  objc_storeStrong((id *)&self->_firstPasscode, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_storeStrong((id *)&self->_dataRecoveryEngine, 0);
}

@end
