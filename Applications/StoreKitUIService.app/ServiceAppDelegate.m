@implementation ServiceAppDelegate

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  unsigned __int8 v28;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  _UNKNOWN **v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  unsigned int v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned __int8 v76;
  id v77;
  void *v78;
  unsigned int v79;
  unsigned int v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  _QWORD v93[6];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _QWORD v100[4];
  dispatch_semaphore_t v101;
  _BYTE v102[24];
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("itms-ui")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ams-ui"));

    if (v13)
      goto LABEL_4;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("itms-services"));

    if (v31)
    {
      v32 = objc_msgSend(objc_alloc((Class)SKUIURL), "initWithURL:", v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "actionString"));
      if (objc_msgSend(v33, "isEqualToString:", SSScriptURLSafariDataUpdate))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
        v35 = objc_msgSend(v34, "shouldLog");
        if (objc_msgSend(v34, "shouldLogToDisk"))
          LODWORD(v36) = v35 | 2;
        else
          LODWORD(v36) = v35;
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "OSLogObject"));
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          v36 = v36;
        else
          v36 &= 2u;
        if ((_DWORD)v36)
        {
          *(_DWORD *)v102 = 138543618;
          *(_QWORD *)&v102[4] = objc_opt_class(self);
          *(_WORD *)&v102[12] = 2112;
          *(_QWORD *)&v102[14] = v9;
          v38 = *(id *)&v102[4];
          v39 = (void *)_os_log_send_and_compose_impl(v36, 0, 0, 0, &_mh_execute_header, v37, 0, "%{public}@: Received safari data update URL: %@", v102, 22);

          if (v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4));
            free(v39);
            SSFileLog(v34, CFSTR("%@"));

          }
        }
        else
        {

        }
        v28 = -[ServiceAppDelegate _handleSafariScriptDataUpdate:](self, "_handleSafariScriptDataUpdate:", v32);
        goto LABEL_97;
      }
      if (objc_msgSend(v33, "isEqualToString:", CFSTR("purchaseIntent")))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig"));
        if (!v52)
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
        v53 = objc_msgSend(v52, "shouldLog");
        if (objc_msgSend(v52, "shouldLogToDisk"))
          LODWORD(v54) = v53 | 2;
        else
          LODWORD(v54) = v53;
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "OSLogObject"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          v54 = v54;
        else
          v54 &= 2u;
        if ((_DWORD)v54)
        {
          *(_DWORD *)v102 = 138412546;
          *(_QWORD *)&v102[4] = objc_opt_class(self);
          *(_WORD *)&v102[12] = 2112;
          *(_QWORD *)&v102[14] = v9;
          v56 = *(id *)&v102[4];
          v57 = (void *)_os_log_send_and_compose_impl(v54, 0, 0, 0, &_mh_execute_header, v55, 1, "%@: Opening  from URL: %@", v102, 22);

          if (v57)
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4));
            free(v57);
            v90 = v58;
            SSFileLog(v52, CFSTR("%@"));

          }
        }
        else
        {

        }
        *(_QWORD *)v102 = 0;
        *(_QWORD *)&v102[8] = v102;
        *(_QWORD *)&v102[16] = 0x3032000000;
        v103 = sub_10001073C;
        v104 = sub_10001074C;
        v105 = 0;
        v94 = 0;
        v95 = &v94;
        v96 = 0x3032000000;
        v97 = sub_10001073C;
        v98 = sub_10001074C;
        v99 = 0;
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_100010754;
        v93[3] = &unk_1000496E8;
        v93[4] = v102;
        v93[5] = &v94;
        objc_msgSend(v9, "enumerateQueryWithBlock:", v93);
        if (!*(_QWORD *)(*(_QWORD *)&v102[8] + 40) || !v95[5])
          goto LABEL_95;
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", _UIApplicationOpenURLOptionsSourceProcessHandleKey));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bundleIdentifier"));
        v92 = v74;
        if ((objc_msgSend(v75, "isEqualToString:", CFSTR("com.apple.appstored")) & 1) != 0)
        {
          v76 = objc_msgSend(v74, "hasEntitlement:", CFSTR("com.apple.itunesstored.private"));

          if ((v76 & 1) != 0)
            goto LABEL_91;
        }
        else
        {

        }
        v77 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", *(_QWORD *)(*(_QWORD *)&v102[8] + 40), v90));
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "appState"));
        v79 = objc_msgSend(v78, "isValid");

        if (v79)
        {
          v80 = objc_msgSend(v77, "profileValidated");

          if (!v80)
            goto LABEL_94;
        }
        else
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[LSPlugInKitProxy pluginKitProxyForIdentifier:](LSPlugInKitProxy, "pluginKitProxyForIdentifier:", *(_QWORD *)(*(_QWORD *)&v102[8] + 40)));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "containingBundle"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "bundleType"));
          v87 = objc_msgSend(v86, "isEqualToString:", LSUserApplicationType);

          if ((v87 & 1) == 0)
          {

            goto LABEL_93;
          }
          v88 = objc_msgSend(v84, "profileValidated");

          if ((v88 & 1) == 0)
          {
LABEL_94:

LABEL_95:
            _Block_object_dispose(&v94, 8);

            _Block_object_dispose(v102, 8);
LABEL_96:
            v28 = 1;
LABEL_97:

            goto LABEL_15;
          }
        }
LABEL_91:
        v89 = objc_alloc((Class)SKPurchaseIntent);
        v77 = objc_msgSend(v89, "initWithBundleId:productIdentifier:appName:productName:", *(_QWORD *)(*(_QWORD *)&v102[8] + 40), v95[5], 0, 0);
        objc_msgSend(v77, "send:", &stru_100049708);
LABEL_93:

        goto LABEL_94;
      }
      if (objc_msgSend(v9, "isStoreServicesURL"))
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
        v60 = objc_msgSend(v59, "shouldLog");
        if (objc_msgSend(v59, "shouldLogToDisk"))
          LODWORD(v61) = v60 | 2;
        else
          LODWORD(v61) = v60;
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "OSLogObject"));
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          v61 = v61;
        else
          v61 &= 2u;
        if ((_DWORD)v61)
        {
          *(_DWORD *)v102 = 138543618;
          *(_QWORD *)&v102[4] = objc_opt_class(self);
          *(_WORD *)&v102[12] = 2112;
          *(_QWORD *)&v102[14] = v9;
          v63 = *(id *)&v102[4];
          v64 = (void *)_os_log_send_and_compose_impl(v61, 0, 0, 0, &_mh_execute_header, v62, 0, "%{public}@: Performing itms connection with URL: %@", v102, 22);

          if (v64)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v64, 4));
            free(v64);
            SSFileLog(v59, CFSTR("%@"));

          }
        }
        else
        {

        }
        v81 = objc_alloc((Class)SSURLConnectionRequest);
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v9));
        v83 = objc_msgSend(v81, "initWithURLRequest:", v82);

        objc_msgSend(v83, "start");
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 5.0);

        goto LABEL_96;
      }

LABEL_76:
      v28 = 0;
      goto LABEL_15;
    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
    v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("appstore-ui"));

    if (!v42)
      goto LABEL_76;
    v43 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsSourceApplicationKey));
    v44 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v46 = objc_msgSend(v45, "shouldLog");
    if (objc_msgSend(v45, "shouldLogToDisk"))
      LODWORD(v47) = v46 | 2;
    else
      LODWORD(v47) = v46;
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "OSLogObject"));
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      v47 = v47;
    else
      v47 &= 2u;
    if ((_DWORD)v47)
    {
      *(_DWORD *)v102 = 138543874;
      *(_QWORD *)&v102[4] = objc_opt_class(self);
      *(_WORD *)&v102[12] = 2112;
      *(_QWORD *)&v102[14] = v9;
      *(_WORD *)&v102[22] = 2112;
      v103 = v43;
      v49 = *(id *)&v102[4];
      v50 = (void *)_os_log_send_and_compose_impl(v47, 0, 0, 0, &_mh_execute_header, v48, 0, "%{public}@: Performing app launch trampoline with URL: %@, sourceApp: %@", v102, 32);

      v44 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
      if (v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v50, 4));
        free(v50);
        v90 = v51;
        SSFileLog(v45, CFSTR("%@"));

      }
    }
    else
    {

    }
    v28 = objc_msgSend(&off_10004CF40, "containsObject:", v43);
    if ((v28 & 1) != 0)
    {
      v66 = objc_alloc_init((Class)ASCAppLaunchTrampoline);
      v67 = objc_msgSend(v66, "handleURL:", v9);
LABEL_74:

      goto LABEL_15;
    }
    v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[188], "sharedConfig"));
    v68 = objc_msgSend(v66, "shouldLog");
    if (objc_msgSend(v66, "shouldLogToDisk"))
      LODWORD(v69) = v68 | 2;
    else
      LODWORD(v69) = v68;
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "OSLogObject", v90));
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      v69 = v69;
    else
      v69 &= 2u;
    if ((_DWORD)v69)
    {
      v71 = (void *)objc_opt_class(self);
      *(_DWORD *)v102 = 138543618;
      *(_QWORD *)&v102[4] = v71;
      *(_WORD *)&v102[12] = 2112;
      *(_QWORD *)&v102[14] = v43;
      v72 = v71;
      LODWORD(v91) = 22;
      v73 = (void *)_os_log_send_and_compose_impl(v69, 0, 0, 0, &_mh_execute_header, v70, 16, "%{public}@: Source application is not allowed to perform app launch trampoline action: %@", v102, v91);

      if (!v73)
        goto LABEL_74;
      v70 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v73, 4));
      free(v73);
      SSFileLog(v66, CFSTR("%@"));
    }

    goto LABEL_74;
  }

LABEL_4:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", _UIApplicationOpenURLOptionsSourceProcessHandleKey));
  v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    LODWORD(v18) = v17 | 2;
  else
    LODWORD(v18) = v17;
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    v18 = v18;
  else
    v18 &= 2u;
  if ((_DWORD)v18)
  {
    *(_DWORD *)v102 = 138543874;
    *(_QWORD *)&v102[4] = objc_opt_class(self);
    *(_WORD *)&v102[12] = 2112;
    *(_QWORD *)&v102[14] = v9;
    *(_WORD *)&v102[22] = 2114;
    v103 = v15;
    v20 = *(id *)&v102[4];
    v21 = (void *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v19, 0, "%{public}@: Presenting remote UI with URL: %@ from: %{public}@", v102, 32);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4));
      free(v21);
      SSFileLog(v16, CFSTR("%@"));

    }
  }
  else
  {

  }
  v23 = dispatch_semaphore_create(0);
  v24 = objc_alloc_init((Class)SSRemoteWebViewRequest);
  objc_msgSend(v24, "setReferrer:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  objc_msgSend(v24, "setURLString:", v25);

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100010734;
  v100[3] = &unk_100048F38;
  v101 = v23;
  v26 = v23;
  objc_msgSend(v24, "startWithCompletionBlock:", v100);
  v27 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v26, v27);

  v28 = 1;
LABEL_15:

  return v28;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[ServiceAppDelegate _handleUniversalLinkInUserActivity:forApplication:](self, "_handleUniversalLinkInUserActivity:forApplication:", a4, a3, a5);
}

- (BOOL)_handleUniversalLinkInUserActivity:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v9 = objc_msgSend(v8, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webpageURL"));
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v10, 1);
      if (v11)
        v12 = -[ServiceAppDelegate _handleUniversalLinkInURLComponents:forApplication:](self, "_handleUniversalLinkInURLComponents:forApplication:", v11, v7);
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_handleUniversalLinkInURLComponents:(id)a3 forApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("one.apple.com"));

  if (v9)
  {
    objc_msgSend(v6, "setScheme:", CFSTR("ams-ui"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
    v11 = -[ServiceAppDelegate application:openURL:options:](self, "application:openURL:options:", v7, v10, &__NSDictionary0__struct);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_handleSafariScriptDataUpdate:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "underlyingURL"));
  v5 = +[SSScriptURLHandler shouldHandleSafariScriptURL:](SSScriptURLHandler, "shouldHandleSafariScriptURL:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", SSScriptSafariViewControllerDataUpdateNotification, v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceHostRegistry sharedInstance](ServiceHostRegistry, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "registeredHostBundleId"));

    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      LODWORD(v11) = v10 | 2;
    else
      LODWORD(v11) = v10;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 = v11;
    else
      v11 &= 2u;
    if ((_DWORD)v11)
    {
      v17 = 138543618;
      v18 = (id)objc_opt_class(self);
      v19 = 2114;
      v20 = v8;
      v13 = v18;
      v14 = (void *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v12, 0, "%{public}@: Detected scriptdataupdate while backgrounded. Launching: %{public}@", &v17, 22);

      if (!v14)
      {
LABEL_13:

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](FBSSystemService, "sharedService"));
        objc_msgSend(v15, "openApplication:options:withResult:", v8, 0, 0);

        goto LABEL_14;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4));
      free(v14);
      SSFileLog(v9, CFSTR("%@"));
    }

    goto LABEL_13;
  }
LABEL_15:

  return v5;
}

- (UIWindow)window
{
  return self->window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->window, 0);
}

@end
