@implementation PBADevicePasscodeViewController

- (PBADevicePasscodeViewController)initWithContainingStackViewController:(id)a3 authenticationPolicy:(id)a4
{
  id v7;
  id v8;
  PBADevicePasscodeViewController *v9;
  PBADevicePasscodeViewController *v10;
  SBFAuthenticationAssertionManager *v11;
  SBFAuthenticationAssertionManager *assertionManager;
  SBFUserAuthenticationController *v13;
  SBFUserAuthenticationController *authenticationController;
  SBFLockOutStatusProvider *v15;
  SBFLockOutStatusProvider *deviceLockController;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PBADevicePasscodeViewController;
  v9 = -[PBADevicePasscodeViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stackViewController, a3);
    v11 = (SBFAuthenticationAssertionManager *)objc_alloc_init((Class)SBFAuthenticationAssertionManager);
    assertionManager = v10->_assertionManager;
    v10->_assertionManager = v11;

    objc_storeStrong((id *)&v10->_authenticationPolicy, a4);
    v13 = (SBFUserAuthenticationController *)objc_msgSend(objc_alloc((Class)SBFUserAuthenticationController), "initWithAssertionManager:policy:", v10->_assertionManager, v10->_authenticationPolicy);
    authenticationController = v10->_authenticationController;
    v10->_authenticationController = v13;

    v15 = (SBFLockOutStatusProvider *)objc_msgSend(objc_alloc((Class)SBFDeviceLockOutController), "initWithThermalController:authenticationController:", 0, v10->_authenticationController);
    deviceLockController = v10->_deviceLockController;
    v10->_deviceLockController = v15;

    -[SBFUserAuthenticationController revokeAuthenticationImmediatelyIfNecessaryForPublicReason:](v10->_authenticationController, "revokeAuthenticationImmediatelyIfNecessaryForPublicReason:", CFSTR("PreBoard"));
    v10->_attemptingUnlock = 0;
  }

  return v10;
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  PBASimpleLockScreenView *v5;
  void *v6;
  PBASimpleLockScreenView *v7;
  PBASimpleLockScreenView *newLockScreenView;
  PBASimpleLockScreenView *v9;
  void *v10;
  PBASimpleLockScreenView *v11;
  void *v12;
  PBASimpleLockScreenView *v13;
  void *v14;
  PBASimpleLockScreenView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD block[5];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PBADevicePasscodeViewController;
  v3 = -[PBADevicePasscodeViewController viewDidLoad](&v23, "viewDidLoad");
  v4 = SBFEffectiveHomeButtonType(v3);
  v5 = [PBASimpleLockScreenView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = -[PBASimpleLockScreenView initWithFrame:](v5, "initWithFrame:");
  newLockScreenView = self->_newLockScreenView;
  self->_newLockScreenView = v7;

  -[PBASimpleLockScreenView setAutoresizingMask:](self->_newLockScreenView, "setAutoresizingMask:", 18);
  v9 = self->_newLockScreenView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController lockScreenIconSystemName](self, "lockScreenIconSystemName"));
  -[PBASimpleLockScreenView setIconSystemName:](v9, "setIconSystemName:", v10);

  v11 = self->_newLockScreenView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController lockScreenTitle](self, "lockScreenTitle"));
  -[PBASimpleLockScreenView setTitle:](v11, "setTitle:", v12);

  v13 = self->_newLockScreenView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController lockScreenMessage](self, "lockScreenMessage"));
  -[PBASimpleLockScreenView setMessage:](v13, "setMessage:", v14);

  v15 = self->_newLockScreenView;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController lockScreenActionTitleWithHomeButton:](self, "lockScreenActionTitleWithHomeButton:", v4 != 2));
  -[PBASimpleLockScreenView setPressToOpenText:](v15, "setPressToOpenText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController view](self, "view"));
  objc_msgSend(v17, "addSubview:", self->_newLockScreenView);

  v18 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_homeButtonPressed:");
  objc_msgSend(v18, "setAllowedTouchTypes:", &__NSArray0__struct);
  objc_msgSend(v18, "setAllowedPressTypes:", &off_1000194C0);
  objc_msgSend(v18, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v18, "setCancelsTouchesInView:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController view](self, "view"));
  objc_msgSend(v19, "addGestureRecognizer:", v18);

  if (v4 == 2)
  {
    v20 = objc_msgSend(objc_alloc((Class)UIScreenEdgePanGestureRecognizer), "initWithTarget:action:type:options:", self, "_handleEdgeSwipe:", 5, 0);
    objc_msgSend(v20, "setEdges:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController view](self, "view"));
    objc_msgSend(v21, "addGestureRecognizer:", v20);

  }
  -[PBADevicePasscodeViewController registerForUnlockNotification](self, "registerForUnlockNotification");
  if (-[SBFLockOutStatusProvider isBlocked](self->_deviceLockController, "isBlocked"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000082E0;
    block[3] = &unk_100018748;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBADevicePasscodeViewController;
  -[PBADevicePasscodeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PBASimpleLockScreenView becomeFirstResponder](self->_newLockScreenView, "becomeFirstResponder");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)handlePasscodeEntrySuccessful:(id)a3
{
  id v4;
  PBAAppleLogoViewController *v5;

  v4 = a3;
  v5 = -[PBAAppleLogoViewController initWithNibName:bundle:]([PBAAppleLogoViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PBAStackViewController pushViewController:animated:completion:](self->_stackViewController, "pushViewController:animated:completion:", v5, 1, v4);

}

- (void)registerForUnlockNotification
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handlePasscodeLockStatusChangeNotification:", SBFUserAuthenticationStateDidChangeNotification, 0);

}

- (void)handlePasscodeLockStatusChangeNotification:(id)a3
{
  if (!self->_attemptingUnlock)
  {
    if (-[SBFUserAuthenticationController isAuthenticated](self->_authenticationController, "isAuthenticated", a3))-[PBADevicePasscodeViewController handlePasscodeEntrySuccessful:](self, "handlePasscodeEntrySuccessful:", &stru_100018BD8);
  }
}

- (void)_handleBlockedDevice
{
  PBADeviceBlockOverlayViewController *v3;
  PBADeviceBlockOverlayViewController *blockOverlayController;
  PBADeviceBlockOverlayViewController *v5;

  if (!self->_blockOverlayController)
  {
    v3 = -[PBADeviceBlockOverlayViewController initWithBlockStatusProvider:]([PBADeviceBlockOverlayViewController alloc], "initWithBlockStatusProvider:", self->_deviceLockController);
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
    -[PBADevicePasscodeViewController _configurePasscodeEntryViewController:](self, "_configurePasscodeEntryViewController:", self->_passcodeEntryViewController);
    v4 = self->_blockOverlayController;
    self->_blockOverlayController = 0;

  }
}

- (void)_evaluateDeviceBlockState
{
  if (-[SBFLockOutStatusProvider isBlocked](self->_deviceLockController, "isBlocked"))
    -[PBADevicePasscodeViewController _handleBlockedDevice](self, "_handleBlockedDevice");
  else
    -[PBADevicePasscodeViewController _handleUnblockedDevice](self, "_handleUnblockedDevice");
}

- (void)_homeButtonPressed:(id)a3
{
  -[PBADevicePasscodeViewController _pushPasscodeEntryViewIfNeeded](self, "_pushPasscodeEntryViewIfNeeded", a3);
}

- (void)_handleEdgeSwipe:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[PBADevicePasscodeViewController _pushPasscodeEntryViewIfNeeded](self, "_pushPasscodeEntryViewIfNeeded");
}

- (void)_pushPasscodeEntryViewIfNeeded
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008728;
  v3[3] = &unk_100018C00;
  objc_copyWeak(&v4, &location);
  -[PBADevicePasscodeViewController confirmTransitionToPasscodeWithCompletion:](self, "confirmTransitionToPasscodeWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)passcodeEntryViewControllerEntryBegan:(id)a3
{
  -[SBFUserAuthenticationController notePasscodeEntryBegan](self->_authenticationController, "notePasscodeEntryBegan", a3);
}

- (void)passcodeEntryViewControllerEntryCancelled:(id)a3
{
  -[SBFUserAuthenticationController notePasscodeEntryCancelled](self->_authenticationController, "notePasscodeEntryCancelled", a3);
}

- (void)passcodeEntryViewControllerEntryCompleted:(id)a3 passcode:(id)a4
{
  id v6;
  SBFUserAuthenticationController *authenticationController;
  id v8;
  SBFAuthenticationAssertion *v9;
  SBFAuthenticationAssertion *transientAssertion;
  id v11;
  void *v12;
  SBFUserAuthenticationController *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v6 = a3;
  authenticationController = self->_authenticationController;
  v8 = a4;
  v9 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue(-[SBFUserAuthenticationController createGracePeriodAssertionWithReason:](authenticationController, "createGracePeriodAssertionWithReason:", CFSTR("com.apple.PreBoard.UnlockAttempt")));
  transientAssertion = self->_transientAssertion;
  self->_transientAssertion = v9;

  -[SBFAuthenticationAssertion activate](self->_transientAssertion, "activate");
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v8, 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController makeAuthenticationRequestWithPasscode:](self, "makeAuthenticationRequestWithPasscode:", v11));
  self->_attemptingUnlock = 1;
  v13 = self->_authenticationController;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100008A14;
  v23[3] = &unk_100018C28;
  v23[4] = self;
  v24 = v12;
  v25 = v6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008A4C;
  v20[3] = &unk_100018798;
  v20[4] = self;
  v21 = v24;
  v22 = v25;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008A88;
  v17[3] = &unk_100018C28;
  v17[4] = self;
  v18 = v21;
  v19 = v22;
  v14 = v22;
  v15 = v21;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SBFUserAuthenticationResponder responderWithSuccessHandler:failureHandler:invalidHandler:](SBFUserAuthenticationResponder, "responderWithSuccessHandler:failureHandler:invalidHandler:", v23, v20, v17));
  -[SBFUserAuthenticationController processAuthenticationRequest:responder:](v13, "processAuthenticationRequest:responder:", v15, v16);

}

- (void)passcodeEntryViewControllerCancelButtonPressed:(id)a3
{
  -[PBADevicePasscodeViewController handlePasscodeEntryCancelledForViewController:](self, "handlePasscodeEntryCancelledForViewController:", a3);
}

- (void)_authenticateWithEmptyPasscode
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController makeAuthenticationRequestWithPasscode:](self, "makeAuthenticationRequestWithPasscode:", &stru_100018D78));
  -[PBADevicePasscodeViewController successfulAuthHandler:](self, "successfulAuthHandler:", v3);

}

- (void)_configurePasscodeEntryViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController passcodeEntryScreenTitle](self, "passcodeEntryScreenTitle"));
  v5 = objc_claimAutoreleasedReturnValue(-[PBADevicePasscodeViewController passcodeEntryScreenSubtitle](self, "passcodeEntryScreenSubtitle"));
  if (v4 | v5)
    objc_msgSend(v6, "setTitleText:subtitleText:animated:", v4, v5, 0);

}

- (void)_resetStateAfterHandlingAuthenticationResult
{
  SBFAuthenticationAssertion *transientAssertion;

  self->_attemptingUnlock = 0;
  -[SBFAuthenticationAssertion invalidate](self->_transientAssertion, "invalidate");
  transientAssertion = self->_transientAssertion;
  self->_transientAssertion = 0;

}

- (void)handlePasscodeEntryCancelledForViewController:(id)a3
{
  PBAPasscodeEntryViewController *passcodeEntryViewController;
  id v5;

  passcodeEntryViewController = self->_passcodeEntryViewController;
  self->_passcodeEntryViewController = 0;
  v5 = a3;

  -[PBAStackViewController removeViewController:animated:](self->_stackViewController, "removeViewController:animated:", v5, 1);
}

- (id)makeAuthenticationRequestWithPasscode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)SBFAuthenticationRequest), "initForPasscode:source:skipSEKeepUserDataOperation:handler:", v3, 0, 1, 0);

  return v4;
}

- (void)successfulAuthHandler:(id)a3
{
  -[PBADevicePasscodeViewController handlePasscodeEntrySuccessful:](self, "handlePasscodeEntrySuccessful:", &stru_100018C48);
}

- (void)failedAuthHandler:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = sub_100006038();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PreBoard result", v7, 2u);
  }

  if (-[SBFLockOutStatusProvider isBlocked](self->_deviceLockController, "isBlocked"))
    -[PBADevicePasscodeViewController _handleBlockedDevice](self, "_handleBlockedDevice");
}

- (void)invalidAuthHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100006038();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PreBoard result", v6, 2u);
  }

  if (-[SBFLockOutStatusProvider isBlocked](self->_deviceLockController, "isBlocked"))
    -[PBADevicePasscodeViewController _handleBlockedDevice](self, "_handleBlockedDevice");
}

- (id)lockScreenIconSystemName
{
  return 0;
}

- (id)lockScreenTitle
{
  return 0;
}

- (id)lockScreenMessage
{
  return 0;
}

- (id)lockScreenActionTitleWithHomeButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("PREBOARD_PRESS_FOR_UPGRADE");
  else
    v6 = CFSTR("PREBOARD_SWIPE_FOR_UPGRADE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100018D78, CFSTR("PreBoard")));

  return v7;
}

- (id)passcodeEntryScreenTitle
{
  return 0;
}

- (id)passcodeEntryScreenSubtitle
{
  return 0;
}

- (void)confirmTransitionToPasscodeWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (SBFUserAuthenticationController)authenticationController
{
  return self->_authenticationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_authenticationPolicy, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_deviceLockController, 0);
  objc_storeStrong((id *)&self->_transientAssertion, 0);
  objc_storeStrong((id *)&self->_passcodeEntryViewController, 0);
  objc_storeStrong((id *)&self->_blockOverlayController, 0);
  objc_storeStrong((id *)&self->_newLockScreenView, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
}

@end
