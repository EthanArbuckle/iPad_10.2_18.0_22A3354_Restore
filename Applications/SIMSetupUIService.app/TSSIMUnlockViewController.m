@implementation TSSIMUnlockViewController

- (TSSIMUnlockViewController)init
{
  TSSIMUnlockViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *subscriptionContexts;
  NSMutableDictionary *v5;
  NSMutableDictionary *subscriptionActions;
  CoreTelephonyClient *v7;
  CoreTelephonyClient *telephonyClient;
  TSScreenLockObserver *v9;
  TSScreenLockObserver *screenLockObserver;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSSIMUnlockViewController;
  v2 = -[TSSIMUnlockViewController init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subscriptionContexts = v2->_subscriptionContexts;
    v2->_subscriptionContexts = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    subscriptionActions = v2->_subscriptionActions;
    v2->_subscriptionActions = v5;

    v7 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v7;

    -[CoreTelephonyClient setDelegate:](v2->_telephonyClient, "setDelegate:", v2);
    v9 = -[TSScreenLockObserver initWithDelegate:]([TSScreenLockObserver alloc], "initWithDelegate:", v2);
    screenLockObserver = v2->_screenLockObserver;
    v2->_screenLockObserver = v9;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v8.receiver = self;
  v8.super_class = (Class)TSSIMUnlockViewController;
  -[TSSIMUnlockViewController viewDidLoad](&v8, "viewDidLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v6, "_setHidesShadow:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v7, "setTranslucent:", 0);

  -[TSScreenLockObserver registerForLockNotifications](self->_screenLockObserver, "registerForLockNotifications");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockViewController;
  -[TSSIMUnlockViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  dispatch_group_leave((dispatch_group_t)self->_subscriptionInfoAndDidAppearGroup);
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

- (BOOL)canResignFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  const char *v19;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setAllowsMenuButtonDismissal:", 0);
  objc_msgSend(v8, "setAllowsAlertStacking:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));

  v10 = sub_10000CE68();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v9;
    v18 = 2080;
    v19 = "-[TSSIMUnlockViewController configureWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User info: %@ @%s", (uint8_t *)&v16, 0x16u);
  }

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCTSubscriberUnlockPromptReasonKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCTSubscriberSuppressUnlockCancellationKey));
    v14 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
      self->_userSelectedSlot = (int64_t)objc_msgSend(v12, "integerValue");
    v15 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
      self->_suppressCancellation = objc_msgSend(v13, "BOOLValue");

  }
  if (v6)
    v6[2](v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  OS_dispatch_group *v8;
  OS_dispatch_group *subscriptionInfoAndDidAppearGroup;
  NSObject *v10;
  CoreTelephonyClient *telephonyClient;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  v8 = (OS_dispatch_group *)dispatch_group_create();
  subscriptionInfoAndDidAppearGroup = self->_subscriptionInfoAndDidAppearGroup;
  self->_subscriptionInfoAndDidAppearGroup = v8;

  dispatch_group_enter((dispatch_group_t)self->_subscriptionInfoAndDidAppearGroup);
  dispatch_group_enter((dispatch_group_t)self->_subscriptionInfoAndDidAppearGroup);
  v10 = self->_subscriptionInfoAndDidAppearGroup;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003CD8;
  block[3] = &unk_10001C6A0;
  objc_copyWeak(&v15, &location);
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  telephonyClient = self->_telephonyClient;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003D08;
  v12[3] = &unk_10001C758;
  objc_copyWeak(&v13, &location);
  -[CoreTelephonyClient getSubscriptionInfo:](telephonyClient, "getSubscriptionInfo:", v12);
  if (v7)
    v7[2](v7);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)handleButtonActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003EF8;
  v3[3] = &unk_10001C780;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)unlockListViewControllerDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = sub_10000CE68();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[TSSIMUnlockViewController unlockListViewControllerDidComplete:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " @%s", (uint8_t *)&v6, 0xCu);
  }

  -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
}

- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  const char *v13;

  v6 = a3;
  v7 = sub_10000CE68();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = a4;
    v12 = 2080;
    v13 = "-[TSSIMUnlockViewController unlockDetailViewController:didCompleteWithResult:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "result %ld @%s", buf, 0x16u);
  }

  if ((unint64_t)a4 < 3)
    goto LABEL_6;
  if (a4 == 3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004124;
    v9[3] = &unk_10001C7A8;
    v9[4] = self;
    -[TSSIMUnlockViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
    goto LABEL_7;
  }
  if (a4 == 6)
  {
LABEL_6:
    objc_msgSend(v6, "resignFirstResponder");
    -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
  }
LABEL_7:

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000CE68();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = CTSubscriptionSlotAsString(objc_msgSend(v6, "slotID"));
    v12 = 2112;
    v13 = v7;
    v14 = 2080;
    v15 = "-[TSSIMUnlockViewController simStatusDidChange:status:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "context %s, status %@ @%s", (uint8_t *)&v10, 0x20u);
  }

  -[TSSIMUnlockViewController _queue_processSubscriptionContext:withSubscriptionSIMStatus:](self, "_queue_processSubscriptionContext:withSubscriptionSIMStatus:", v6, v7);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  if (-[TSSIMUnlockViewController _indexForSubscriptionContextWithUUID:](self, "_indexForSubscriptionContextWithUUID:", v5) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = sub_10000CE68();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000F614(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
    v15 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](self->_telephonyClient, "copyCarrierBundleValue:key:bundleType:error:", v4, CFSTR("CarrierName"), v7, 0);
    v16 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000043E4;
      block[3] = &unk_10001C7D0;
      objc_copyWeak(&v30, &location);
      v27 = v5;
      v28 = v15;
      v29 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = sub_10000CE68();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10000F684(v18, v19, v20, v21, v22, v23, v24, v25);

    }
  }

}

- (void)phoneNumberChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  if (-[TSSIMUnlockViewController _indexForSubscriptionContextWithUUID:](self, "_indexForSubscriptionContextWithUUID:", v5) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = sub_10000CE68();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000F6F4(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getPhoneNumber:error:](self->_telephonyClient, "getPhoneNumber:error:", v4, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject number](v7, "number"));
    if (v15)
    {
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000046C0;
      block[3] = &unk_10001C7D0;
      objc_copyWeak(&v29, &location);
      v26 = v5;
      v27 = v15;
      v28 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v16 = sub_10000CE68();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10000F764(v17, v18, v19, v20, v21, v22, v23, v24);

    }
  }

}

- (void)screenLockDidUpdate:(BOOL)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  if (a3)
  {
    v4 = sub_10000CE68();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[TSSIMUnlockViewController screenLockDidUpdate:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " @%s", (uint8_t *)&v6, 0xCu);
    }

    -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
  }
}

- (void)_queue_processSubscriptionContext:(id)a3 withSubscriptionSIMStatus:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000CE68();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10000F7D4(v6, (uint64_t)v7, v9);

  if ((objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusNotReady) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", kCTSIMSupportSIMStatusInserted) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TSSubscriptionAction subscriptionActionForSubscriptionSIMStatus:](TSSubscriptionAction, "subscriptionActionForSubscriptionSIMStatus:", v7));
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
      v12 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](self->_telephonyClient, "copyCarrierBundleValue:key:bundleType:error:", v6, CFSTR("CarrierName"), v11, 0);
      v13 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        objc_msgSend(v10, "setCarrierName:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CoreTelephonyClient getPhoneNumber:error:](self->_telephonyClient, "getPhoneNumber:error:", v6, 0));
      v15 = v14;
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "number"));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayPhoneNumber"));
          objc_msgSend(v10, "setPhoneNumber:", v17);

        }
      }

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004AC4;
    block[3] = &unk_10001C7F8;
    block[4] = self;
    v20 = v6;
    v21 = v10;
    v18 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_applySubscriptionContext:(id)a3 withSubscriptionAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  const char *v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000CE68();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v7;
    v20 = 2080;
    v21 = "-[TSSIMUnlockViewController _applySubscriptionContext:withSubscriptionAction:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ @%s", (uint8_t *)&v18, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v11 = -[TSSIMUnlockViewController _indexForSubscriptionContextWithUUID:](self, "_indexForSubscriptionContextWithUUID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController _presentedUnlockViewController](self, "_presentedUnlockViewController"));
  if (v7 && v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_subscriptionContexts, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[NSMutableArray count](self->_subscriptionContexts, "count"), 1024, &stru_10001C730);
    -[NSMutableArray insertObject:atIndex:](self->_subscriptionContexts, "insertObject:atIndex:", v6, v13);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", v7, v10);
    v14 = objc_opt_class(TSSIMUnlockListViewController);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
      objc_msgSend(v12, "addSubscriptionContext:withSubscriptionAction:atIndex:", v6, v7, v13);
  }
  else if (!v7 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v7 && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_subscriptionContexts, "removeObjectAtIndex:", v11);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", 0, v10);
      v16 = objc_opt_class(TSSIMUnlockListViewController);
      if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
        objc_msgSend(v12, "removeSubscriptionContextAtIndex:", v11);
    }
  }
  else
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_subscriptionContexts, "replaceObjectAtIndex:withObject:", v11, v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionActions, "setObject:forKeyedSubscript:", v7, v10);
    v15 = objc_opt_class(TSSIMUnlockListViewController);
    if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
      objc_msgSend(v12, "updateSubscriptionContext:withSubscriptionAction:atIndex:", v6, v7, v11);
  }
  v17 = -[TSSIMUnlockViewController _numberOfLockedSubscriptionContexts](self, "_numberOfLockedSubscriptionContexts");
  if (!v12 || v17)
  {
    if (!v12)
      goto LABEL_21;
  }
  else
  {
    -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
  }
  if (!-[NSMutableArray count](self->_subscriptionContexts, "count"))
    -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
LABEL_21:

}

- (unint64_t)_numberOfLockedSubscriptionContexts
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_subscriptionActions, "allValues", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if (((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "actionType") & 0xFFFFFFFFFFFFFFFELL) == 2)
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_presentUnlockViewController
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  TSSIMUnlockListViewController *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[TSSIMUnlockViewController _presentUnlockViewController]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " @%s", (uint8_t *)&v16, 0xCu);
  }

  if (SBSGetScreenLockStatus(0))
  {
    v5 = sub_10000CE68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[TSSIMUnlockViewController _presentUnlockViewController]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "coversheet active, not initializing @%s", (uint8_t *)&v16, 0xCu);
    }

    -[TSSIMUnlockViewController _deactivate](self, "_deactivate");
    return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController presentedViewController](self, "presentedViewController"));

  if (v7)
    return;
  v8 = (const char *)-[NSMutableArray count](self->_subscriptionContexts, "count");
  v9 = sub_10000CE68();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218242;
    v17 = v8;
    v18 = 2080;
    v19 = "-[TSSIMUnlockViewController _presentUnlockViewController]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Number of subscription contexts %lu @%s", (uint8_t *)&v16, 0x16u);
  }

  if ((unint64_t)v8 > 1 || +[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    v11 = -[TSSIMUnlockListViewController initWithSubscriptionContexts:subscriptionActions:suppressCancellation:delegate:]([TSSIMUnlockListViewController alloc], "initWithSubscriptionContexts:subscriptionActions:suppressCancellation:delegate:", self->_subscriptionContexts, self->_subscriptionActions, self->_suppressCancellation, self);
    if (v11)
      goto LABEL_13;
LABEL_19:
    -[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate](self, "_dismissUnlockViewControllerAndDeactivate");
    return;
  }
  if (v8 != (const char *)1)
    goto LABEL_19;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_subscriptionContexts, "firstObject"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionActions, "objectForKeyedSubscript:", v14));
  v11 = -[TSSIMUnlockDetailViewController initWithSubscriptionContext:subscriptionAction:suppressCancellation:delegate:]([TSSIMUnlockDetailViewController alloc], "initWithSubscriptionContext:subscriptionAction:suppressCancellation:delegate:", v13, v15, self->_suppressCancellation, self);

  if (!v11)
    goto LABEL_19;
LABEL_13:
  v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v11);
  objc_msgSend(v12, "setModalPresentationStyle:", 0);
  if (+[SSServiceUtilities isPad](SSServiceUtilities, "isPad"))
    objc_msgSend(v12, "setPreferredContentSize:", 320.0, 480.0);
  else
    objc_msgSend(v12, "setModalTransitionStyle:", 0);
  -[TSSIMUnlockViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)_dismissUnlockViewControllerAndDeactivate
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[TSSIMUnlockViewController _dismissUnlockViewControllerAndDeactivate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " @%s", buf, 0xCu);
  }

  -[TSScreenLockObserver unregisterFromLockNotifications](self->_screenLockObserver, "unregisterFromLockNotifications");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000053E8;
  v5[3] = &unk_10001C7A8;
  v5[4] = self;
  -[TSSIMUnlockViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

- (void)_deactivate
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10000F884(v4);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054A8;
  block[3] = &unk_10001C7A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)_indexForSubscriptionContextWithUUID:(id)a3
{
  id v4;
  NSMutableArray *subscriptionContexts;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  subscriptionContexts = self->_subscriptionContexts;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000055BC;
  v9[3] = &unk_10001C820;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](subscriptionContexts, "enumerateObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_presentedUnlockViewController
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMUnlockViewController presentedViewController](self, "presentedViewController"));
  v3 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

    v2 = (void *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenLockObserver, 0);
  objc_storeStrong((id *)&self->_subscriptionActions, 0);
  objc_storeStrong((id *)&self->_subscriptionContexts, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionInfoAndDidAppearGroup, 0);
}

@end
