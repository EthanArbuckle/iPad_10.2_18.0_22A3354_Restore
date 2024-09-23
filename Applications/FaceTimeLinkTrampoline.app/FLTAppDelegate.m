@implementation FLTAppDelegate

- (TUFeatureFlags)featureFlags
{
  TUFeatureFlags *featureFlags;
  TUFeatureFlags *v4;
  TUFeatureFlags *v5;

  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }
  return featureFlags;
}

+ (BOOL)isFaceTimeApplicationInstalled
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = TUPreferredFaceTimeBundleIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "applicationIsInstalled:", v4);

  return v5;
}

- (BOOL)transferUserActivity:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v11;

  v3 = a3;
  v4 = objc_alloc((Class)LSApplicationRecord);
  v11 = 0;
  v5 = objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:error:", TUBundleIdentifierInCallServiceApplication, 0, &v11);
  v6 = v11;
  if (v5)
  {
    v7 = objc_opt_new(_LSOpenConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v8, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v3, v5, v7, &stru_100004180);

  }
  else
  {
    v9 = sub_100001F00();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100001FE0();
  }

  return v5 != 0;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;

  v4 = a4;
  v5 = sub_100001F00();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished launching: %@", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  BOOL v28;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100001F00();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "open url %@ with options %@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FLTAppDelegate featureFlags](self, "featureFlags"));
  if (objc_msgSend(v13, "ftAppDeletionEnabled"))
  {
    v14 = objc_msgSend((id)objc_opt_class(self), "isFaceTimeApplicationInstalled");

    if ((v14 & 1) == 0)
    {
      v15 = sub_100001F00();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FaceTime application is not installed - just opening url", buf, 2u);
      }

      objc_msgSend(v8, "openURL:options:completionHandler:", v9, &__NSDictionary0__struct, 0);
      goto LABEL_17;
    }
  }
  else
  {

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("facetime-open-link"));

  if (!v18)
  {
LABEL_17:
    v28 = 0;
    goto LABEL_18;
  }
  v19 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v9, 0);
  objc_msgSend(v19, "setScheme:", CFSTR("incallservice-open-link"));
  v20 = sub_100001F00();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
    *(_DWORD *)buf = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "rewrote the original url: %@ to %@", buf, 0x16u);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
  v30 = 0;
  objc_msgSend(v23, "openSensitiveURL:withOptions:error:", v24, 0, &v30);
  v25 = v30;

  if (v25)
  {
    v26 = sub_100001F00();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1000020A0();

  }
  v28 = 1;
LABEL_18:

  return v28;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned int v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  int v31;
  const __CFString *v32;

  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = sub_100001F00();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412290;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Continue user activity %@", (uint8_t *)&v31, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v8, "activityType"));
  if ((objc_msgSend(v11, "isEqual:", NSUserActivityTypeBrowsingWeb) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v8, "webpageURL"));

    if (v12)
    {
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString webpageURL](v8, "webpageURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FLTAppDelegate featureFlags](self, "featureFlags"));
      if (objc_msgSend(v14, "ftAppDeletionEnabled"))
      {
        v15 = objc_msgSend((id)objc_opt_class(self), "isFaceTimeApplicationInstalled");

        if ((v15 & 1) == 0)
          goto LABEL_21;
      }
      else
      {

      }
      v20 = objc_claimAutoreleasedReturnValue(+[TUConversationLink conversationLinkForURL:](TUConversationLink, "conversationLinkForURL:", v13));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = -[FLTAppDelegate transferUserActivity:](self, "transferUserActivity:", v8);

        if ((v22 & 1) != 0)
        {
          v19 = 1;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
        v23 = sub_100001F00();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_100002100();

      }
LABEL_21:
      v25 = sub_100001F00();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 138412290;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received user activity with URL %@, but URL was not recognized, diiverting user back to browser", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend(v7, "openURL:options:completionHandler:", v13, &__NSDictionary0__struct, 0);
      v19 = 0;
      goto LABEL_24;
    }
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FLTAppDelegate featureFlags](self, "featureFlags"));
  if ((objc_msgSend(v16, "conversationHandoffEnabled") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString activityType](v8, "activityType"));
    v18 = objc_msgSend(v17, "isEqualToString:", TUUserActivityTypeConversationHandoff);

    if (v18)
    {
      v19 = -[FLTAppDelegate transferUserActivity:](self, "transferUserActivity:", v8);
      goto LABEL_25;
    }
  }
  else
  {

  }
  v19 = 0;
LABEL_25:
  v27 = sub_100001F00();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = CFSTR("NO");
    if (v19)
      v29 = CFSTR("YES");
    v31 = 138412290;
    v32 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Link trampoline did continue user activity: %@", (uint8_t *)&v31, 0xCu);
  }

  return v19;
}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;

  v4 = a4;
  v5 = sub_100001F00();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will continue activity %@", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
