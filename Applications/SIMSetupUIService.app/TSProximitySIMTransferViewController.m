@implementation TSProximitySIMTransferViewController

- (void)dealloc
{
  objc_super v3;

  -[TSProximitySIMTransferViewController setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSProximitySIMTransferViewController;
  -[TSProximitySIMTransferViewController dealloc](&v3, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  Block_layout *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;

  v6 = (Block_layout *)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v8 = sub_10000CE68();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v7;
    v37 = 2080;
    v38 = "-[TSProximitySIMTransferViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "options:%@ @%s", buf, 0x16u);
  }

  self->_isResumeTransferProxCard = 0;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", TSUserInfoResumeTransferProxCardKey));
  v11 = (void *)v10;
  if (v10)
  {
    v12 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      LOBYTE(v10) = objc_msgSend(v11, "BOOLValue");
    else
      LOBYTE(v10) = 0;
  }
  self->_isResumeTransferProxCard = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("device")));
  if (!v13)
  {
    v14 = sub_10000CE68();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10000FAD0(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_storeStrong((id *)&self->_peerDeviceInfo, v13);
  v34 = 0;
  v23 = objc_msgSend(objc_alloc((Class)CBDevice), "initWithDictionary:error:", v13, &v34);
  if (!v23)
  {
    v24 = sub_10000CE68();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10000FA60(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  if (!v6)
    v6 = &stru_10001C8A8;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TSProximitySIMTransferViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v33, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v33, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v33, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v33, "setAllowsMenuButtonDismissal:", 0);
  objc_msgSend(v33, "setAllowsAlertStacking:", 1);
  v6->invoke(v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *peerDeviceInfo;
  NSDictionary *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  TSSIMSetupFlow *v15;
  TSSIMSetupFlow *setupFlow;
  TSSIMSetupFlow *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _QWORD v23[4];
  _QWORD v24[4];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v23[0] = TSUserInfoFlowTypeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", TSFlowTypeProximityTransfer));
  v24[0] = v9;
  v24[1] = &__kCFBooleanTrue;
  v23[1] = TSUserInfoIsClientKey;
  v23[2] = TSUserInfoPeerDeviceKey;
  peerDeviceInfo = self->_peerDeviceInfo;
  if (peerDeviceInfo)
    v11 = self->_peerDeviceInfo;
  else
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v12 = peerDeviceInfo == 0;
  v23[3] = TSUserInfoResumeTransferProxCardKey;
  if (self->_isResumeTransferProxCard)
    v13 = &__kCFBooleanTrue;
  else
    v13 = &__kCFBooleanFalse;
  v24[2] = v11;
  v24[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
  v15 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v14));
  setupFlow = self->_setupFlow;
  self->_setupFlow = v15;

  if (v12)
  -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
  objc_initWeak(&location, self);
  v17 = self->_setupFlow;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000A794;
  v19[3] = &unk_10001C8D0;
  objc_copyWeak(&v21, &location);
  v18 = v7;
  v20 = v18;
  -[TSSIMSetupFlow firstViewController:](v17, "firstViewController:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)handleButtonActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A8DC;
  v3[3] = &unk_10001C780;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];

  if (sub_10000CED8())
  {
    v5 = sub_10000CE68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10000FBC4(a3, v6);

  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AA08;
  v7[3] = &unk_10001C7A8;
  v7[4] = self;
  -[TSProximitySIMTransferViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, v7);
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 idleTimerDisabled;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;

  if (self->_idleTimerDisabled != a3)
  {
    self->_idleTimerDisabled = a3;
    v4 = sub_10000CE68();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      idleTimerDisabled = self->_idleTimerDisabled;
      v8[0] = 67109378;
      v8[1] = idleTimerDisabled;
      v9 = 2080;
      v10 = "-[TSProximitySIMTransferViewController setIdleTimerDisabled:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "set idle timer disabled : %d @%s", (uint8_t *)v8, 0x12u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSProximitySIMTransferViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v7, "setIdleTimerDisabled:forReason:", self->_idleTimerDisabled, CFSTR("SIMTransfer"));

  }
}

- (void)setViewDisappearHandler:(id)a3
{
  id v4;
  id viewDisappearHandler;

  v4 = objc_retainBlock(a3);
  viewDisappearHandler = self->_viewDisappearHandler;
  self->_viewDisappearHandler = v4;

}

- (void)proxCardFlowDidDismiss
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TSProximitySIMTransferViewController proxCardFlowDidDismiss]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PRXFlowDelegate: proxCardFlowDidDismiss @%s", (uint8_t *)&v5, 0xCu);
  }

  -[TSSIMSetupFlow userDidTapCancel](self->_setupFlow, "userDidTapCancel");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSProximitySIMTransferViewController;
  -[TSProximitySIMTransferViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSProximitySIMTransferViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v6, "_setHidesShadow:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v7, "setTranslucent:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**viewDisappearHandler)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSProximitySIMTransferViewController;
  -[TSProximitySIMTransferViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  viewDisappearHandler = (void (**)(void))self->_viewDisappearHandler;
  if (viewDisappearHandler)
    viewDisappearHandler[2]();
}

- (BOOL)shouldAutorotate
{
  return +[SSServiceUtilities isPad](SSServiceUtilities, "isPad");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[SSServiceUtilities isPad](SSServiceUtilities, "isPad"))
    return 30;
  else
    return 2;
}

- (void)_deactivate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADDC;
  block[3] = &unk_10001C7A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UINavigationController)pkNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPkNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)peerDeviceInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPeerDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TSSIMSetupFlow)setupFlow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSetupFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isResumeTransferProxCard
{
  return self->_isResumeTransferProxCard;
}

- (void)setIsResumeTransferProxCard:(BOOL)a3
{
  self->_isResumeTransferProxCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_peerDeviceInfo, 0);
  objc_storeStrong((id *)&self->_pkNavigationController, 0);
  objc_storeStrong(&self->_viewDisappearHandler, 0);
}

@end
