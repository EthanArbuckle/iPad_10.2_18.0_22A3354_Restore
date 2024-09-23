@implementation CBAppLaunch

- (CBAppLaunch)init
{
  return -[CBAppLaunch initWithBundleID:backgrounded:native:](self, "initWithBundleID:backgrounded:native:", &stru_1000769A0, 0, 1);
}

- (CBAppLaunch)initWithBundleID:(id)a3 backgrounded:(BOOL)a4 native:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  CBAppLaunch *v10;
  FBApplicationUpdateScenesTransaction *v11;
  FBApplicationUpdateScenesTransaction *sceneTransaction;
  double v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  CBWindowRepresentation *windowRepresentation;
  double v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  objc_super v36;
  uint8_t buf[4];
  double v38;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CBAppLaunch;
  v10 = -[CBAppLaunch init](&v36, "init");
  if (v10)
  {
    v11 = (FBApplicationUpdateScenesTransaction *)objc_msgSend(objc_alloc((Class)FBApplicationUpdateScenesTransaction), "initWithApplicationBundleID:executionContextProvider:", v9, &stru_100075CA0);
    sceneTransaction = v10->_sceneTransaction;
    v10->_sceneTransaction = v11;

    -[FBApplicationUpdateScenesTransaction setCompletionBlock:](v10->_sceneTransaction, "setCompletionBlock:", &stru_100075CC0);
    v13 = 1.0;
    if (v5)
    {
      v14 = CheckerBoardLogHandleForCategory(9);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Native App Launch", buf, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "createRepresentationWithIdentifier:", v9));
      windowRepresentation = v10->_windowRepresentation;
      v10->_windowRepresentation = (CBWindowRepresentation *)v17;

      -[CBWindowRepresentation windowLevel](v10->_windowRepresentation, "windowLevel");
      v13 = v19;
    }
    v20 = objc_alloc_init((Class)UIMutableApplicationSceneSettings);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationSceneSpecification specification](UIApplicationSceneSpecification, "specification"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v22, "_referenceBounds");
    objc_msgSend(v20, "setFrame:");

    v23 = CheckerBoardLogHandleForCategory(9);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v38 = v13;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Setting App Launch scene level to: %f", buf, 0xCu);
    }

    objc_msgSend(v20, "setLevel:", v13);
    objc_msgSend(v20, "setInterfaceOrientation:", 1);
    objc_msgSend(v20, "setForeground:", !v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager mainConfiguration](FBDisplayManager, "mainConfiguration"));
    objc_msgSend(v20, "setDisplayConfiguration:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "windows"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "windowScene"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "statusBarManager"));
    objc_msgSend(v30, "statusBarFrame");
    v32 = v31;

    objc_msgSend(v20, "setSafeAreaInsetsPortrait:", v32, 0.0, 0.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v33, "_peripheryInsets");
    objc_msgSend(v20, "setPeripheryInsets:");

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", v21));
    objc_msgSend(v34, "setSettings:", v20);
    -[FBApplicationUpdateScenesTransaction addObserver:](v10->_sceneTransaction, "addObserver:", v10);
    -[FBApplicationUpdateScenesTransaction updateSceneWithIdentifier:parameters:transitionContext:](v10->_sceneTransaction, "updateSceneWithIdentifier:parameters:transitionContext:", v9, v34, 0);
    objc_storeStrong((id *)&v10->_bundleID, a3);

  }
  return v10;
}

- (void)launch
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(9);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting transaction.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppLaunch sceneTransaction](self, "sceneTransaction"));
  objc_msgSend(v5, "begin");

}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020654;
  block[3] = &unk_1000753E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  objc_msgSend(a4, "addObserver:", self);
}

- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBAppLaunch windowRepresentation](self, "windowRepresentation", a3, a4));
  objc_msgSend(v4, "willLaunchApp");

}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CBAppLaunch windowRepresentation](self, "windowRepresentation", a3, a4));
  objc_msgSend(v4, "didLaunchApp");

}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAppLaunch onLaunch](self, "onLaunch", a3, a4));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CBAppLaunch onLaunch](self, "onLaunch"));
    v6[2](v6, 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBSceneManager sharedInstance](CBSceneManager, "sharedInstance"));
  objc_msgSend(v7, "addScene:", 2);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CBStatusBarStateAggregator sharedInstance](CBStatusBarStateAggregator, "sharedInstance"));
  objc_msgSend(v8, "forceUpdateStatusBarData");

}

- (id)onLaunch
{
  return self->_onLaunch;
}

- (void)setOnLaunch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)onExit
{
  return self->_onExit;
}

- (void)setOnExit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (FBApplicationUpdateScenesTransaction)sceneTransaction
{
  return self->_sceneTransaction;
}

- (void)setSceneTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTransaction, a3);
}

- (CBWindowRepresentation)windowRepresentation
{
  return self->_windowRepresentation;
}

- (void)setWindowRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_windowRepresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowRepresentation, 0);
  objc_storeStrong((id *)&self->_sceneTransaction, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_onExit, 0);
  objc_storeStrong(&self->_onLaunch, 0);
}

@end
