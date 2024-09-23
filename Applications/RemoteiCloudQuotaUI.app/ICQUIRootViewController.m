@implementation ICQUIRootViewController

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init((Class)UIView);
  -[ICQUIRootViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  ICQRemoteContext *remoteContext;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ICQUIRootViewController;
  -[ICQUIRootViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICQUIRootViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  remoteContext = self->_remoteContext;
  v7 = _ICQGetLogSystem(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (remoteContext)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote context found. Proceeding to launch the upgrade flow.", v22, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext offer](self->_remoteContext, "offer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
    v12 = objc_msgSend(v11, "isEqualToString:", ICQBundleId);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverUIURL"));
    if (v13)
    {
      v14 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext link](self->_remoteContext, "link"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionURL"));
      v14 = v16 == 0;

    }
    if ((v12 | v14) == 1)
    {
      v18 = _ICQGetLogSystem(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10000775C();

      -[ICQUIRootViewController _fetchDefaultOfferAndLaunchUpgradeFlow](self, "_fetchDefaultOfferAndLaunchUpgradeFlow");
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext offer](self->_remoteContext, "offer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext link](self->_remoteContext, "link"));
      -[ICQUIRootViewController _launchUpgradeFlowWithOffer:icqLink:](self, "_launchUpgradeFlowWithOffer:icqLink:", v20, v21);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100007730();

    -[ICQUIRootViewController _dismissAndExit](self, "_dismissAndExit");
  }
}

- (void)dismissUpgradeFlow
{
  -[ICQUIRootViewController upgradeFlowManagerDidCancel:](self, "upgradeFlowManagerDidCancel:", self->_flowManager);
}

- (void)_launchUpgradeFlowWithOffer:(id)a3 icqLink:(id)a4
{
  id v6;
  id v7;
  ICQUpgradeFlowManager *flowManager;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  ICQUpgradeFlowManager *v13;
  ICQUpgradeFlowManager *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSString *v22;
  void *v23;
  NSString *sceneIdentifier;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v27;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  flowManager = self->_flowManager;
  v10 = _ICQGetLogSystem(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (flowManager)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Upgrade flow manager already presented; ignoring.",
        buf,
        2u);
    }

  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting upgrade flow within hidden app.", buf, 2u);
    }

    v13 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initWithOffer:", v6);
    v14 = self->_flowManager;
    self->_flowManager = v13;

    -[ICQUpgradeFlowManager setDelegate:](self->_flowManager, "setDelegate:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext flowOptionsData](self->_remoteContext, "flowOptionsData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICQUpgradeFlowOptions flowOptionsFromData:](ICQUpgradeFlowOptions, "flowOptionsFromData:", v15));
    -[ICQUpgradeFlowManager setFlowOptions:](self->_flowManager, "setFlowOptions:", v16);

    -[ICQUpgradeFlowManager setIcqLink:](self->_flowManager, "setIcqLink:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext presentingSceneIdentifier](self->_remoteContext, "presentingSceneIdentifier"));

    v19 = _ICQGetLogSystem(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v21)
      {
        v22 = (NSString *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext presentingSceneIdentifier](self->_remoteContext, "presentingSceneIdentifier"));
        *(_DWORD *)buf = 138412290;
        v27 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting OOP parent/host's app sceneIdentifier: %@", buf, 0xCu);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext presentingSceneIdentifier](self->_remoteContext, "presentingSceneIdentifier"));
      -[ICQUpgradeFlowManager setPresentingSceneIdentifier:](self->_flowManager, "setPresentingSceneIdentifier:", v23);

    }
    else
    {
      if (v21)
      {
        sceneIdentifier = self->_sceneIdentifier;
        *(_DWORD *)buf = 138412290;
        v27 = sceneIdentifier;
      }

      -[ICQUpgradeFlowManager setPresentingSceneIdentifier:](self->_flowManager, "setPresentingSceneIdentifier:", self->_sceneIdentifier);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006530;
    block[3] = &unk_10000C3E0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_fetchDefaultOfferAndLaunchUpgradeFlow
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000065C4;
  v4[3] = &unk_10000C470;
  v4[4] = self;
  objc_msgSend(v3, "getOfferForBundleIdentifier:completion:", ICQBundleId, v4);

}

- (void)_handleFallback
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  int v15;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICQRemoteContext offer](self->_remoteContext, "offer"));
  v3 = _ICQGetLogSystem(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "context"));
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to launch upgrade flow with context = %@", (uint8_t *)&v15, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

  v8 = objc_msgSend(v7, "icq_isICQLaunchURL");
  v9 = (int)v8;
  v10 = _ICQGetLogSystem(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      LOWORD(v15) = 0;
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", ICQManageStoragePreferencesURL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v14, "openSensitiveURL:withOptions:", v13, 0);
  }
  else
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launching link %@ in safari", (uint8_t *)&v15, 0xCu);
    }

    v13 = objc_alloc_init((Class)_LSOpenConfiguration);
    objc_msgSend(v13, "setAllowURLOverrides:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v14, "openURL:configuration:completionHandler:", v7, v13, &stru_10000C490);
  }

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  ICQUpgradeFlowManager *flowManager;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  const char *v15;

  v4 = _ICQGetLogSystem(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100007788();

  flowManager = self->_flowManager;
  v8 = _ICQGetLogSystem(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (flowManager)
  {
    if (v10)
    {
      LOWORD(v14) = 0;
      v11 = "Upgrade flow has been cancelled.";
      v12 = v9;
      v13 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else if (v10)
  {
    v14 = 136315138;
    v15 = "-[ICQUIRootViewController upgradeFlowManagerDidCancel:]";
    v11 = "Upgrade flow has been dismissed already, %s will be ignored.";
    v12 = v9;
    v13 = 12;
    goto LABEL_8;
  }

  -[ICQUIRootViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 0);
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  ICQUpgradeFlowManager *flowManager;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  const char *v20;

  v4 = _ICQGetLogSystem(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000077B4();

  flowManager = self->_flowManager;
  v8 = _ICQGetLogSystem(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!flowManager)
  {
    if (v10)
    {
      v19 = 136315138;
      v20 = "-[ICQUIRootViewController upgradeFlowManagerDidComplete:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Upgrade flow has been dismissed already, %s will be ignored.", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_16;
  }
  if (v10)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Upgrade flow has been completed.", (uint8_t *)&v19, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICQUpgradeFlowManager offer](self->_flowManager, "offer"));
  v12 = objc_msgSend(v11, "isPremiumOffer");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICQUpgradeFlowManager offer](self->_flowManager, "offer"));
  v14 = objc_msgSend(v13, "isDefaultOffer");

  if ((v14 & 1) == 0)
  {
    v16 = _ICQGetLogSystem(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v18)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up pending premium followup item", (uint8_t *)&v19, 2u);
      }

      v9 = objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
      -[NSObject teardownCachedPremiumOffer](v9, "teardownCachedPremiumOffer");
    }
    else
    {
      if (v18)
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up pending regular followup item", (uint8_t *)&v19, 2u);
      }

      v9 = objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
      -[NSObject teardownCachedOffer](v9, "teardownCachedOffer");
    }
LABEL_16:

  }
  -[ICQUIRootViewController _dismissFlowWithSuccess:](self, "_dismissFlowWithSuccess:", 1);
}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  uint64_t v4;
  NSObject *v5;

  v4 = _ICQGetLogSystem(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000077E0();

}

- (void)_dismissFlowWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = _ICQGetLogSystem(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing upgrade flow with success: %d", (uint8_t *)v7, 8u);
  }

  -[ICQUIRootViewController _notifyFlowCompletionToDaemonWithSuccess:](self, "_notifyFlowCompletionToDaemonWithSuccess:", v3);
  -[ICQUIRootViewController _dismissAndExit](self, "_dismissAndExit");
}

- (void)_notifyFlowCompletionToDaemonWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.ind.xpc"), 0);
  v5 = _ICQGetLogSystem(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection to ind initiated successfully.", (uint8_t *)v13, 2u);
    }

    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v8 = (void *)qword_100012220;
    v17 = qword_100012220;
    if (!qword_100012220)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007420;
      v13[3] = &unk_10000C430;
      v13[4] = &v14;
      sub_100007420((uint64_t)v13);
      v8 = (void *)v15[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v14, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "XPCInterface"));
    objc_msgSend(v4, "setRemoteObjectInterface:", v10);

    objc_msgSend(v4, "resume");
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_10000C4D0));
    v11 = _ICQGetLogSystem(v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Let the daemon know about flow completion.", (uint8_t *)v13, 2u);
    }

    -[NSObject remoteFreshmintFlowCompletedWithSuccess:error:](v7, "remoteFreshmintFlowCompletedWithSuccess:error:", v3, 0);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000780C();
  }

}

- (void)_dismissAndExit
{
  ICQUpgradeFlowManager *flowManager;

  -[ICQUpgradeFlowManager setDelegate:](self->_flowManager, "setDelegate:", 0);
  flowManager = self->_flowManager;
  self->_flowManager = 0;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10000C510);
}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (void)setRemoteContext:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContext, a3);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
}

@end
