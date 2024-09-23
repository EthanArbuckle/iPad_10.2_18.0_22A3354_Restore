@implementation ICQRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteViewController;
  -[ICQRemoteViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[ICQRemoteViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[ICQRemoteViewController _setupRemoteProxy](self, "_setupRemoteProxy");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteViewController;
  -[ICQRemoteViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (!self->_isDismissing)
    -[ICQRemoteViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 0);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_setupRemoteProxy
{
  -[SBUIRemoteAlertHostInterface setShouldDisableFadeInAnimation:](self->_remoteVCProxy, "setShouldDisableFadeInAnimation:", 1);
  -[SBUIRemoteAlertHostInterface setAllowsMenuButtonDismissal:](self->_remoteVCProxy, "setAllowsMenuButtonDismissal:", 1);
  -[SBUIRemoteAlertHostInterface setAllowsAlertStacking:](self->_remoteVCProxy, "setAllowsAlertStacking:", 1);
  -[SBUIRemoteAlertHostInterface setDesiredHardwareButtonEvents:](self->_remoteVCProxy, "setDesiredHardwareButtonEvents:", 16);
  -[SBUIRemoteAlertHostInterface setSwipeDismissalStyle:](self->_remoteVCProxy, "setSwipeDismissalStyle:", 0);
  -[SBUIRemoteAlertHostInterface setDismissalAnimationStyle:](self->_remoteVCProxy, "setDismissalAnimationStyle:", 1);
}

- (void)_presentFreshmintWithOffer:(id)a3 link:(id)a4 flowOptions:(id)a5 preloadedRemoteUIData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  ICQRemoteViewController *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_flowManager)
  {
    v14 = _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "flow manager already presented; ignoring",
        buf,
        2u);
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    +[ICQMLBiomePublisher publishOfferDisplayActionEventWithBundleId:](ICQMLBiomePublisher, "publishOfferDisplayActionEventWithBundleId:", v16);

    v17 = objc_msgSend(objc_alloc((Class)ICQRemoteContainerViewController), "initWithRootViewController:", self);
    objc_msgSend(v17, "setModalPresentationCapturesStatusBarAppearance:", 1);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100003F84;
    v18[3] = &unk_10000C2D8;
    v19 = v10;
    v20 = v11;
    v21 = self;
    v22 = v17;
    v23 = v12;
    v24 = v13;
    v15 = v17;
    -[ICQRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, v18);

  }
}

- (void)_presentFlowWithOffer:(id)a3 flowOptions:(id)a4 containerViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  ICQRemoteViewController *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(objc_alloc((Class)AAUISpinnerViewController), "initWithNibName:bundle:", 0, 0);
  v12 = objc_msgSend(objc_alloc((Class)ICQRemoteUINavigationController), "initWithRootViewController:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
  objc_msgSend(v13, "setTranslucent:", 1);

  objc_msgSend(v12, "setModalInPresentation:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 == (id)1)
    v16 = 2;
  else
    v16 = -2;
  objc_msgSend(v12, "setModalPresentationStyle:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "universalLinkForContext:", v17));

  if (objc_msgSend(v18, "action") == (id)118)
  {
    v19 = _ICQGetLogSystem(118);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_presentFlowWithOffer detected action direct to oslo, skipping presentation", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, 1, 0);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
  v22 = ICQBundleId;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100004370;
  v27[3] = &unk_10000C390;
  v28 = v8;
  v29 = self;
  v30 = v10;
  v31 = v12;
  v32 = v9;
  v23 = v9;
  v24 = v12;
  v25 = v10;
  v26 = v8;
  objc_msgSend(v21, "getOfferForBundleIdentifier:completion:", v22, v27);

}

- (void)_presentOSLOWithOffer:(id)a3 link:(id)a4 presenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  ICQUpgradeFlowManager *v14;
  ICQUpgradeFlowManager *flowManager;
  int v16;
  const char *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self->_flowManager)
  {
    v12 = _ICQGetLogSystem(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[ICQRemoteViewController _presentOSLOWithOffer:link:presenter:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    v14 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", v8);
    flowManager = self->_flowManager;
    self->_flowManager = v14;

    -[ICQUpgradeFlowManager setDelegate:](self->_flowManager, "setDelegate:", self);
    -[ICQUpgradeFlowManager setIcqLink:](self->_flowManager, "setIcqLink:", v9);
    -[ICQUpgradeFlowManager beginOSLOFlowWithPresentingViewController:](self->_flowManager, "beginOSLOFlowWithPresentingViewController:", v11);
  }

}

- (void)_dismissFlowWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v5 = (void *)objc_opt_new(NSXPCListenerEndpoint, a2);
  objc_msgSend(v5, "_setEndpoint:", self->_xpcEndpoint);
  v6 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)qword_100012210;
  v20 = qword_100012210;
  if (!qword_100012210)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = sub_10000579C;
    location[3] = &unk_10000C430;
    location[4] = &v17;
    sub_10000579C((uint64_t)location);
    v7 = (void *)v18[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "XPCInterface"));
  objc_msgSend(v6, "setRemoteObjectInterface:", v9);

  objc_msgSend(v6, "resume");
  objc_initWeak(location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100004D34;
  v14 = &unk_10000C3B8;
  objc_copyWeak(&v15, location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v11));
  objc_msgSend(v10, "remoteFreshmintFlowCompletedWithSuccess:error:", v3, 0, v11, v12, v13, v14);
  -[ICQRemoteViewController _dismissAndExit](self, "_dismissAndExit");

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);

}

- (void)_dismissAndExit
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E54;
  block[3] = &unk_10000C3E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_main_dismissAndExit
{
  _QWORD v3[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004F34;
  v3[3] = &unk_10000C3E0;
  v3[4] = self;
  -[ICQRemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  SBUIRemoteAlertHostInterface *v8;
  SBUIRemoteAlertHostInterface *remoteVCProxy;
  OS_xpc_object *v10;
  OS_xpc_object *xpcEndpoint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v6 = (void (**)(_QWORD))a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005150;
  v18[3] = &unk_10000C408;
  v18[4] = self;
  v7 = a3;
  v8 = (SBUIRemoteAlertHostInterface *)objc_claimAutoreleasedReturnValue(-[ICQRemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", v18));
  remoteVCProxy = self->_remoteVCProxy;
  self->_remoteVCProxy = v8;

  v10 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcEndpoint"));
  xpcEndpoint = self->_xpcEndpoint;
  self->_xpcEndpoint = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICQRemoteContext ICQContextFromRemoteAlertContext:](ICQRemoteContext, "ICQContextFromRemoteAlertContext:", v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flowOptionsData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICQUpgradeFlowOptions flowOptionsFromData:](ICQUpgradeFlowOptions, "flowOptionsFromData:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "offer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "link"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preloadedRemoteUIData"));
  -[ICQRemoteViewController _presentFreshmintWithOffer:link:flowOptions:preloadedRemoteUIData:](self, "_presentFreshmintWithOffer:link:flowOptions:preloadedRemoteUIData:", v15, v16, v14, v17);

  if (v6)
    v6[2](v6);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "events") & 0x10) != 0)
          -[ICQRemoteViewController _cancelFlow](self, "_cancelFlow");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_cancelFlow
{
  self->_isDismissing = 1;
  if (self->_flowManager)
    -[ICQUpgradeFlowManager _cancelFlow](self->_flowManager, "_cancelFlow");
  else
    -[ICQRemoteViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 0);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  ICQUpgradeFlowManager *v4;
  ICQUpgradeFlowManager *v5;
  ICQUpgradeFlowManager *flowManager;
  uint64_t v7;
  ICQUpgradeFlowManager *v8;
  _BOOL4 v9;
  ICQUpgradeFlowManager *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  ICQUpgradeFlowManager *v18;

  v4 = (ICQUpgradeFlowManager *)a3;
  v5 = v4;
  flowManager = self->_flowManager;
  if (flowManager)
  {
    v7 = _ICQGetLogSystem(v4);
    v8 = (ICQUpgradeFlowManager *)objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
    if (flowManager == v5)
    {
      if (v9)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController UpgradeFlowManager did cancel", (uint8_t *)&v15, 2u);
      }

      -[ICQUpgradeFlowManager setDelegate:](self->_flowManager, "setDelegate:", 0);
      v8 = self->_flowManager;
      self->_flowManager = 0;
    }
    else if (v9)
    {
      v10 = self->_flowManager;
      v15 = 138412546;
      v16 = (const char *)v5;
      v17 = 2112;
      v18 = v10;
      v11 = "ICQRemoteViewController UpgradeFlowManager did cancel for manager %@ instead of %@";
      v12 = v8;
      v13 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
    }
  }
  else
  {
    v14 = _ICQGetLogSystem(v4);
    v8 = (ICQUpgradeFlowManager *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[ICQRemoteViewController upgradeFlowManagerDidCancel:]";
      v11 = "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored";
      v12 = v8;
      v13 = 12;
      goto LABEL_7;
    }
  }

  self->_isDismissing = 1;
  -[ICQRemoteViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 0);

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  ICQUpgradeFlowManager *v4;
  ICQUpgradeFlowManager *v5;
  ICQUpgradeFlowManager *flowManager;
  uint64_t v7;
  ICQUpgradeFlowManager *v8;
  _BOOL4 v9;
  ICQUpgradeFlowManager *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  ICQUpgradeFlowManager *v27;

  v4 = (ICQUpgradeFlowManager *)a3;
  v5 = v4;
  flowManager = self->_flowManager;
  if (flowManager)
  {
    v7 = _ICQGetLogSystem(v4);
    v8 = (ICQUpgradeFlowManager *)objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
    if (flowManager == v5)
    {
      if (v9)
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "ICQRemoteViewController local UpgradeFlowManager did complete!", (uint8_t *)&v24, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICQUpgradeFlowManager offer](self->_flowManager, "offer"));
      v16 = objc_msgSend(v15, "isPremiumOffer");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICQUpgradeFlowManager offer](self->_flowManager, "offer"));
      v18 = objc_msgSend(v17, "isDefaultOffer");

      if ((v18 & 1) == 0)
      {
        v20 = _ICQGetLogSystem(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v22)
          {
            LOWORD(v24) = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cleaning up pending premium followup item", (uint8_t *)&v24, 2u);
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
          objc_msgSend(v23, "teardownCachedPremiumOffer");
        }
        else
        {
          if (v22)
          {
            LOWORD(v24) = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cleaning up pending regular followup item", (uint8_t *)&v24, 2u);
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
          objc_msgSend(v23, "teardownCachedOffer");
        }

      }
      v8 = self->_flowManager;
      self->_flowManager = 0;
    }
    else if (v9)
    {
      v10 = self->_flowManager;
      v24 = 138412546;
      v25 = (const char *)v5;
      v26 = 2112;
      v27 = v10;
      v11 = "ICQRemoteViewController local UpgradeFlowManager did complete for manager %@ instead of %@";
      v12 = v8;
      v13 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v24, v13);
    }
  }
  else
  {
    v14 = _ICQGetLogSystem(v4);
    v8 = (ICQUpgradeFlowManager *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315138;
      v25 = "-[ICQRemoteViewController upgradeFlowManagerDidComplete:]";
      v11 = "ICQRemoteViewController UpgradeFlowManager has already been dismissed, %s will be ignored";
      v12 = v8;
      v13 = 12;
      goto LABEL_7;
    }
  }

  self->_isDismissing = 1;
  -[ICQRemoteViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteVCProxy, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
}

@end
