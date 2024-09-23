@implementation ICQLinkAppDelegate_iOS

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6;
  ACAccountStore *v7;
  int64_t v8;

  v6 = a4;
  v7 = objc_opt_new(ACAccountStore);
  v8 = +[ICQLinkHandler resultFromURL:store:](ICQLinkHandler, "resultFromURL:store:", v6, v7);

  LOBYTE(self) = -[ICQLinkAppDelegate handleICQLinkResult:url:](self, "handleICQLinkResult:url:", v8, v6);
  return (char)self;
}

- (void)launchSettingsDeeplink
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = _ICQGetLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User is not logged in. Redirect to Settings", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", ICQChangeStoragePlanPreferencesURL));
  -[ICQLinkAppDelegate_iOS launchURL:](self, "launchURL:", v5);

}

- (void)launchFlowWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  v4 = a3;
  v6 = _ICQGetLogSystem(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Launching freshmint flow with context: %@", (uint8_t *)&v12, 0xCu);
  }

  v8 = objc_alloc((Class)ICQOffer);
  v9 = objc_alloc_init((Class)NSDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = objc_msgSend(v8, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", v9, &stru_100008230, &stru_100008230, v10, 0, ICQBundleId, 978307200.0);

  -[ICQLinkAppDelegate_iOS launchFlowWithContext:offer:](self, "launchFlowWithContext:offer:", v4, v11);
}

- (void)launchFlowWithContext:(id)a3 offer:(id)a4
{
  id v6;
  ICQUpgradeFlowManager *v7;
  ICQUpgradeFlowManager *upgradeFlowManager;
  _QWORD block[5];

  v6 = a4;
  objc_msgSend(v6, "setContext:", a3);
  v7 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)ICQUpgradeFlowManager), "initSubclassWithOffer:", v6);

  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = v7;

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
  -[ICQUpgradeFlowManager setFlowOptions:](self->_upgradeFlowManager, "setFlowOptions:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004104;
  block[3] = &unk_1000081E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[ICQLinkAppDelegate handleUniversalLinkWithUserActivity:](self, "handleUniversalLinkWithUserActivity:", a4);
}

- (void)launchURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (BOOL)launchURLWithDeviceUnlockPrompt:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v9 = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, v5);

  return v6;
}

- (BOOL)handleSkipCFUWithURL:(id)a3
{
  id v4;
  uint64_t v5;
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
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v5 = ICQActionParameterFollowUpIdentifierKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icq_queryItemForName:", ICQActionParameterFollowUpIdentifierKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = (void *)ICQiCloudSettingsUniversalURL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), ICQActionParameterSkipCFUKey));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "icq_URLByAppendingQueryParamName:value:", v5, v7));

  v13 = ICQActionParameterServerLinkIdentifierKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icq_queryItemForName:", ICQActionParameterServerLinkIdentifierKey));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "icq_URLByAppendingQueryParamName:value:", v13, v16));

    v12 = (void *)v18;
  }
  v19 = -[ICQLinkAppDelegate_iOS launchURLWithDeviceUnlockPrompt:](self, "launchURLWithDeviceUnlockPrompt:", v12);
  v21 = v19;
  if (v19)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icq_queryItemForName:", ICQActionParameterDismissLockScreenKey));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));

    if (-[NSObject isEqualToString:](v23, "isEqualToString:", CFSTR("true")))
      +[FLFollowUpController icq_dismissFollowUpWithIdentifier:](FLFollowUpController, "icq_dismissFollowUpWithIdentifier:", v7);
  }
  else
  {
    v24 = _ICQGetLogSystem(v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100005210((uint64_t)v12, v23, v25, v26, v27, v28, v29, v30);
  }

  return v21;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _ICQGetLogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v5, 2u);
  }

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _ICQGetLogSystem(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed.", v5, 2u);
  }

}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  v6 = _ICQGetLogSystem(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100005278((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
}

@end
