@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[AppDelegate handleUniversalLinkInUserActivity:](self, "handleUniversalLinkInUserActivity:", a4);
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  NSObject *v66;
  __int16 v67;
  void *v68;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v5 = objc_msgSend(v4, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if ((v5 & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webpageURL"));
    v7 = _NDOLogSystem();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (!v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100002240(v9, v29, v30, v31, v32, v33, v34, v35);
      v20 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v64 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
      v65 = 2112;
      v66 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: found url: %@", buf, 0x16u);
    }

    v10 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v6, 1);
    v9 = v10;
    if (!v10)
    {
      v36 = _NDOLogSystem();
      v13 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000022B0(v13, v37, v38, v39, v40, v41, v42, v43);
      v20 = 0;
      goto LABEL_30;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v10, "path"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/launch"));

    if ((v12 & 1) != 0)
    {
      v13 = CFSTR("prefs:");
LABEL_8:
      v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
      v15 = _NDOLogSystem();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v9, "path"));
        *(_DWORD *)buf = 136446722;
        v64 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
        v65 = 2112;
        v66 = v14;
        v67 = 2114;
        v68 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: launching: %@ with path: %{public}@", buf, 0x20u);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v61[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v61[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v62[0] = &__kCFBooleanTrue;
      v62[1] = &__kCFBooleanTrue;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 2));
      objc_msgSend(v18, "openSensitiveURL:withOptions:", v14, v19);

      v20 = 1;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    v44 = objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v6, "lastPathComponent"));
    if (v44)
    {
      v45 = (void *)v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v6, "lastPathComponent"));
      if (objc_msgSend(v46, "length"))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v6, "lastPathComponent"));
        v48 = objc_msgSend(v47, "isEqual:", CFSTR("/"));

        if ((v48 & 1) == 0)
        {
          v49 = objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v6, "lastPathComponent"));
          v50 = (void *)v49;
          v51 = &stru_1000041E0;
          if (v49)
            v51 = (const __CFString *)v49;
          v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("prefs:root=General&path=COVERAGE/"), v51));

          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    v52 = _NDOLogSystem();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v64 = "-[AppDelegate handleUniversalLinkInUserActivity:]";
      v65 = 2112;
      v66 = v6;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}s: unable to handle deeplink url: %@", buf, 0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v59[0] = FBSOpenApplicationOptionKeyUnlockDevice;
    v59[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v60[0] = &__kCFBooleanTrue;
    v60[1] = &__kCFBooleanTrue;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000020D0;
    v57[3] = &unk_100004120;
    v58 = v6;
    objc_msgSend(v54, "openURL:options:completionHandler:", v58, v55, v57);

    v20 = 0;
    v13 = v58;
    goto LABEL_30;
  }
  v21 = _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100002320(v6, v22, v23, v24, v25, v26, v27, v28);
  v20 = 0;
LABEL_32:

  return v20;
}

@end
