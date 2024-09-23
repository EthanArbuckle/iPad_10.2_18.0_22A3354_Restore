@implementation PassbookUISSApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  id v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "userActivities", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = PKPassbookUISSUserActivityTypeInAppPayment;
    v12 = PKPassbookUISSUserActivityTypePeerPaymentRegistration;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "activityType"));
      if (objc_msgSend(v14, "isEqualToString:", v11))
      {
        v15 = objc_alloc((Class)UISceneConfiguration);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
        v17 = CFSTR("InAppPaymentConfiguration");
        goto LABEL_13;
      }
      if (objc_msgSend(v14, "isEqualToString:", v12))
        break;

      if (v9 == (id)++v13)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v15 = objc_alloc((Class)UISceneConfiguration);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
    v17 = CFSTR("PeerPaymentRegistrationConfiguration");
LABEL_13:
    v18 = objc_msgSend(v15, "initWithName:sessionRole:", v17, v16);

    if (v18)
      goto LABEL_15;
  }
  else
  {
LABEL_10:

  }
  v19 = objc_alloc((Class)UISceneConfiguration);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
  v18 = objc_msgSend(v19, "initWithName:sessionRole:", CFSTR("Default Configuration"), v20);

LABEL_15:
  return v18;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  UISceneSession **p_inAppSceneSession;
  id WeakRetained;
  id v7;

  v7 = a4;
  p_inAppSceneSession = &self->_inAppSceneSession;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inAppSceneSession);
  if (WeakRetained && objc_msgSend(v7, "containsObject:", WeakRetained))
  {
    objc_storeWeak((id *)p_inAppSceneSession, 0);

    WeakRetained = 0;
  }

}

- (void)inAppPaymentInterfaceWillPresentWithSceneSession:(id)a3
{
  id v4;
  UISceneSession **p_inAppSceneSession;
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_inAppSceneSession = &self->_inAppSceneSession;
  WeakRetained = objc_loadWeakRetained((id *)p_inAppSceneSession);
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = WeakRetained == v4;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005C54;
    v10[3] = &unk_10000C3C0;
    v11 = v7;
    objc_msgSend(v9, "requestSceneSessionDestruction:options:errorHandler:", v11, 0, v10);

  }
  objc_storeWeak((id *)p_inAppSceneSession, v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inAppSceneSession);
}

@end
