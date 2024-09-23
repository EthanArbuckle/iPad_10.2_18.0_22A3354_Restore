@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable", a3, a4));
  -[AppDelegate setViewControllers:](self, "setViewControllers:", v5);

  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[AppDelegate _handleUniversalLinkInUserActivity:](self, "_handleUniversalLinkInUserActivity:", a4);
}

- (BOOL)_handleUniversalLinkInUserActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v5 = objc_msgSend(v4, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webpageURL"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cps_fallbackBundleIdentifier"));
      v9 = v8 != 0;
      v10 = sub_100003DCC();
      v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138739971;
          *(_QWORD *)((char *)&buf + 4) = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received out-of-box app clip URL: %{sensitive}@", (uint8_t *)&buf, 0xCu);
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v21 = 0x3032000000;
        v22 = sub_100003CBC;
        v23 = sub_100003CCC;
        v12 = objc_alloc((Class)CPSClipRequest);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_wp_urlByRemovingTrackingInformation"));
        v24 = objc_msgSend(v12, "initWithURL:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "sessionProxy"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_sourceApplication"));
        objc_msgSend(v15, "setReferrerBundleID:", v16);

        objc_msgSend(v15, "setLaunchReason:", CPSSessionLaunchReasonInApp);
        v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100003CD4;
        v19[3] = &unk_100008268;
        v19[4] = &buf;
        objc_msgSend(v17, "requestClipWithCompletion:", v19);

        _Block_object_dispose(&buf, 8);
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_100004E3C((uint64_t)v7, v11);
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSHashTable)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
