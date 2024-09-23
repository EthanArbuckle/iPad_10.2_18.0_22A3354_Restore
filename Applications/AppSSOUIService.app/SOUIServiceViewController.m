@implementation SOUIServiceViewController

- (SOUIServiceViewController)init
{
  id v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIServiceViewController *v10;

  v3 = sub_100004E98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIServiceViewController init]";
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SOUIServiceViewController;
  return -[SOUIServiceViewController init](&v6, "init");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SOUIServiceViewController *v11;

  v3 = a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOUIServiceViewController viewWillAppear:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SOUIServiceViewController *v11;

  v3 = a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOUIServiceViewController viewDidAppear:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  SOUIServiceViewController *v11;

  v3 = a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOUIServiceViewController viewWillDisappear:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  SORemoteExtensionViewController *extensionViewController;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SORemoteExtensionViewController *v12;
  __int16 v13;
  SOUIServiceViewController *v14;

  v3 = a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 136315650;
    v10 = "-[SOUIServiceViewController viewDidDisappear:]";
    v11 = 2114;
    v12 = extensionViewController;
    v13 = 2112;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@ on %@", buf, 0x20u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  if (self->_extensionViewController)
    -[SOUIServiceViewController _cancelAuthorization](self, "_cancelAuthorization");
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  NSObject *v7;

  v5 = (void (**)(_QWORD))a4;
  v6 = sub_100004E98();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100007770((uint64_t)self, v7);

  -[SOUIServiceViewController _checkScreenLockStatus](self, "_checkScreenLockStatus");
  if (v5)
    v5[2](v5);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  SOUIServiceViewController *v25;

  v6 = a3;
  v7 = a4;
  v8 = sub_100004E98();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[SOUIServiceViewController configureWithContext:completion:]";
    v22 = 2114;
    v23 = v6;
    v24 = 2112;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s context: %{public}@ on %@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  -[SOUIServiceViewController connectToDaemonWithXpcEndpoint:requestInfo:](self, "connectToDaemonWithXpcEndpoint:requestInfo:", v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v12, "setDesiredHardwareButtonEvents:", 16);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v13, "setDismissalAnimationStyle:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v14, "setAllowsAlertStacking:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "windowScene"));
  objc_msgSend(v15, "setLaunchingInterfaceOrientation:", objc_msgSend(v18, "interfaceOrientation"));

  v19.receiver = self;
  v19.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController configureWithContext:completion:](&v19, "configureWithContext:completion:", v6, v7);

}

- (void)connectToDaemonWithXpcEndpoint:(id)a3 requestInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  SOUIDaemonConnection *v11;
  SOUIDaemonConnection *daemonConnection;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SOExtension *v32;
  SOExtension *extension;
  void *v34;
  id v35;
  NSObject *v36;
  char *v37;
  void *v38;
  void *v39;
  void *v40;
  SOExtension *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  SOExtension *v47;
  void *v48;
  id v49;
  SOExtension *v50;
  id v51;
  SOUIServiceViewController *v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  id v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  id v80;
  __int16 v81;
  SOUIServiceViewController *v82;

  v7 = a3;
  v8 = a4;
  v9 = sub_100004E98();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316163;
    v74 = "-[SOUIServiceViewController connectToDaemonWithXpcEndpoint:requestInfo:]";
    v75 = 2114;
    v76 = v7;
    v77 = 2160;
    v78 = 1752392040;
    v79 = 2117;
    v80 = v8;
    v81 = 2112;
    v82 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s xpcEndpoint: %{public}@, requestInfo: %{sensitive, mask.hash}@ on %@", buf, 0x34u);
  }

  objc_storeStrong((id *)&self->_xpcDaemonEndpoint, a3);
  v11 = -[SOUIDaemonConnection initWithViewController:]([SOUIDaemonConnection alloc], "initWithViewController:", self);
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v11;

  if (self->_daemonConnection)
  {
    if (v8)
      goto LABEL_5;
LABEL_11:
    v20 = objc_msgSend(sub_100005C20(), "parameterErrorWithMessage:", CFSTR("no requestInfo for UI service"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[SOUIServiceViewController authorization:didCompleteWithCredential:error:](self, "authorization:didCompleteWithCredential:error:", 0, 0, v21);
LABEL_22:

    goto LABEL_23;
  }
  v18 = sub_100004E98();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_1000077F8();

  if (!v8)
    goto LABEL_11;
LABEL_5:
  if (!-[SOUIServiceViewController _checkScreenLockStatus](self, "_checkScreenLockStatus"))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("extensionBundleIdentifier")));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("httpHeaders")));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("httpBody")));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("url")));
    v69 = (void *)v15;
    v70 = (void *)v14;
    v64 = (void *)v16;
    if (v16)
      v17 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));
    else
      v17 = 0;
    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("realm")));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("extensionData")));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("callerBundleIdentifier")));
    v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("auditTokenData")));
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("requestedOperation")));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("authorizationOptions")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("useInternalExtensions")));
    v23 = objc_msgSend(v22, "BOOLValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("cfNetworkInterception")));
    v55 = objc_msgSend(v24, "BOOLValue");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("callerManaged")));
    v54 = objc_msgSend(v25, "BOOLValue");

    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("callerTeamIdentifier")));
    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("localizedCallerDisplayName")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("enableUserInteraction")));
    v53 = objc_msgSend(v26, "BOOLValue");

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("impersonationBundleIdentifier")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("screenLockedBehavior")));
    self->_screenLockedBehavior = (int64_t)objc_msgSend(v28, "integerValue");

    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("identifier")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("showOnCoverScreen")));
    self->_showOnCoverScreen = objc_msgSend(v29, "BOOLValue");

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SOExtensionManager sharedInstance](SOExtensionManager, "sharedInstance"));
    v31 = v30;
    v63 = (void *)v13;
    if (v23)
      v32 = (SOExtension *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "loadInternalExtension"));
    else
      v32 = (SOExtension *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "loadExtensionWithBundleIdentifier:", v13));
    extension = self->_extension;
    self->_extension = v32;
    v34 = (void *)v17;

    v35 = sub_100004E98();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (char *)objc_claimAutoreleasedReturnValue(-[SOExtension localizedExtensionDisplayName](self->_extension, "localizedExtensionDisplayName"));
      *(_DWORD *)buf = 138543362;
      v74 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "loadedExtensionWithBundleIdentifer: extension = %{public}@", buf, 0xCu);

    }
    v38 = (void *)v68;
    v39 = (void *)v61;
    v40 = (void *)v27;
    v62 = v7;

    v41 = self->_extension;
    v56 = v34;
    if (v41)
    {
      -[SOExtension saveDelegate:forRequestIdentifier:](v41, "saveDelegate:forRequestIdentifier:", self, v65);
      v42 = objc_alloc_init((Class)SOAuthorizationRequestParameters);
      objc_msgSend(v42, "setIdentifier:", v65);
      objc_msgSend(v42, "setUrl:", v34);
      objc_msgSend(v42, "setHttpHeaders:", v70);
      objc_msgSend(v42, "setHttpBody:", v69);
      objc_msgSend(v42, "setRealm:", v68);
      objc_msgSend(v42, "setExtensionData:", v67);
      objc_msgSend(v42, "setCallerBundleIdentifier:", v66);
      objc_msgSend(v42, "setRequestedOperation:", v59);
      objc_msgSend(v42, "setAuthorizationOptions:", v39);
      objc_msgSend(v42, "setCfNetworkInterception:", v55);
      objc_msgSend(v42, "setCallerManaged:", v54);
      v43 = (void *)v58;
      objc_msgSend(v42, "setCallerTeamIdentifier:", v58);
      v44 = (void *)v57;
      objc_msgSend(v42, "setLocalizedCallerDisplayName:", v57);
      v45 = (void *)v59;
      v46 = (void *)v60;
      objc_msgSend(v42, "setAuditTokenData:", v60);
      objc_msgSend(v42, "setEnableUserInteraction:", v53);
      objc_msgSend(v42, "setImpersonationBundleIdentifier:", v40);
      v47 = self->_extension;
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_100005CD8;
      v71[3] = &unk_10000C3D8;
      v71[4] = self;
      v72 = v42;
      v48 = (void *)v65;
      v49 = v42;
      v50 = v47;
      v38 = (void *)v68;
      -[SOExtension requestAuthorizationViewControllerWithCompletion:](v50, "requestAuthorizationViewControllerWithCompletion:", v71);

    }
    else
    {
      v51 = objc_msgSend(sub_100005C20(), "internalErrorWithMessage:", CFSTR("No active AppSSO IdP extension"));
      v49 = (id)objc_claimAutoreleasedReturnValue(v51);
      v52 = self;
      v48 = (void *)v65;
      -[SOUIServiceViewController authorization:didCompleteWithCredential:error:](v52, "authorization:didCompleteWithCredential:error:", v65, 0, v49);
      v45 = (void *)v59;
      v46 = (void *)v60;
      v44 = (void *)v57;
      v43 = (void *)v58;
    }

    v7 = v62;
    v21 = v63;
    goto LABEL_22;
  }
LABEL_23:

}

- (void)viewDidLoad
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SOUIServiceViewController *v12;

  v3 = sub_100004E98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SOUIServiceViewController viewDidLoad]";
    v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOUIServiceViewController;
  -[SOUIServiceViewController viewDidLoad](&v8, "viewDidLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController view](self, "view"));
  objc_msgSend(v7, "setHidden:", 1);

}

- (int)_preferredStatusBarVisibility
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = (unint64_t)objc_msgSend(v3, "userInterfaceIdiom");

  v5 = v4 & 0xFFFFFFFFFFFFFFFBLL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
  v9 = (char *)objc_msgSend(v8, "interfaceOrientation") - 3;

  return v5 != 1 && (unint64_t)v9 < 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)_checkScreenLockStatus
{
  int64_t screenLockedBehavior;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  char v13;

  v13 = 0;
  if (!SBSGetScreenLockStatus(&v13, a2))
    return 0;
  if (!v13 && (self->_showOnCoverScreen || objc_msgSend(sub_100006290(), "isInternalBuild")))
  {
    v10 = sub_100004E98();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100007824();
    v9 = 0;
  }
  else
  {
    screenLockedBehavior = self->_screenLockedBehavior;
    v4 = sub_100004E98();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (screenLockedBehavior == 2)
    {
      if (v6)
        sub_10000785C();

      v7 = sub_100005C20();
      v8 = -5;
    }
    else
    {
      if (v6)
        sub_100007888();

      v7 = sub_100005C20();
      v8 = -3;
    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "errorWithCode:", v8));
    -[SOUIServiceViewController authorization:didCompleteWithCredential:error:](self, "authorization:didCompleteWithCredential:error:", 0, 0, v11);
    v9 = 1;
  }

  return v9;
}

- (void)_dismiss
{
  id v3;
  NSObject *v4;
  SORemoteExtensionViewController *extensionViewController;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  SOUIServiceViewController *v10;

  v3 = sub_100004E98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[SOUIServiceViewController _dismiss]";
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extensionViewController = self->_extensionViewController;
  self->_extensionViewController = 0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006450;
  v6[3] = &unk_10000C400;
  v6[4] = self;
  -[SOUIServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v6);
}

- (void)_extensionCleanup
{
  id v3;
  NSObject *v4;
  SOExtension *extension;
  SOExtension *v6;
  SOExtension *v7;
  int v8;
  const char *v9;
  __int16 v10;
  SOExtension *v11;
  __int16 v12;
  SOUIServiceViewController *v13;

  v3 = sub_100004E98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    v8 = 136315650;
    v9 = "-[SOUIServiceViewController _extensionCleanup]";
    v10 = 2114;
    v11 = extension;
    v12 = 2112;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s extension = %{public}@ on %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = self->_extension;
  if (v6)
  {
    -[SOExtension unload](v6, "unload");
    v7 = self->_extension;
    self->_extension = 0;

  }
}

- (void)_cancelAuthorization
{
  id v3;
  NSObject *v4;
  SOExtension *extension;
  NSString *requestThatPresentedViewController;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  SOExtension *v12;
  __int16 v13;
  SOUIServiceViewController *v14;

  v3 = sub_100004E98();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    v9 = 136315650;
    v10 = "-[SOUIServiceViewController _cancelAuthorization]";
    v11 = 2112;
    v12 = extension;
    v13 = 2112;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s extension = %@ on %@", (uint8_t *)&v9, 0x20u);
  }

  -[SOExtension cancelAuthorization:completion:](self->_extension, "cancelAuthorization:completion:", self->_requestThatPresentedViewController, &stru_10000C440);
  requestThatPresentedViewController = self->_requestThatPresentedViewController;
  v7 = objc_msgSend(sub_100005C20(), "errorWithCode:", -2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[SOUIServiceViewController authorization:didCompleteWithCredential:error:](self, "authorization:didCompleteWithCredential:error:", requestThatPresentedViewController, 0, v8);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  SOUIServiceViewController *v12;

  v4 = a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[SOUIServiceViewController handleButtonActions:]";
    v9 = 2114;
    v10 = v4;
    v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", (uint8_t *)&v7, 0x20u);
  }

  -[SOUIServiceViewController _cancelAuthorization](self, "_cancelAuthorization");
}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  SORemoteExtensionViewController *extensionViewController;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  SORemoteExtensionViewController *v21;
  void *v22;
  SORemoteExtensionViewController *v23;
  _BOOL4 v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  _QWORD *v33;
  _BYTE *v34;
  _QWORD v35[5];
  id v36;
  _BYTE *v37;
  char v38;
  _QWORD v39[4];
  id v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  __int128 v43;

  v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100004E98();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SOUIServiceViewController presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = extensionViewController;
    *(_WORD *)&buf[22] = 2114;
    v42 = v8;
    LOWORD(v43) = 2112;
    *(_QWORD *)((char *)&v43 + 2) = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s extension viewController = %{public}@, hints = %{public}@ on %@", buf, 0x2Au);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100006BA8;
  v39[3] = &unk_10000C468;
  v14 = v10;
  v40 = v14;
  v15 = objc_retainBlock(v39);
  v38 = 0;
  if (SBSGetScreenLockStatus(&v38, v16)
    && (v38 || !self->_showOnCoverScreen && (objc_msgSend(sub_100006290(), "isInternalBuild") & 1) == 0))
  {
    v17 = sub_100004E98();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000078B4();

    v19 = objc_msgSend(sub_100005C20(), "errorWithCode:subcode:message:", -8, 1, CFSTR("presentation of authorization view controller was denied because the device screen is locked"));
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    ((void (*)(_QWORD *, _QWORD, id))v15[2])(v15, 0, v20);
  }
  else
  {
    v21 = self->_extensionViewController;
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController childViewControllers](self, "childViewControllers"));
      v23 = (SORemoteExtensionViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastObject"));
      v24 = v21 == v23;

      if (v24)
      {
        v31 = objc_msgSend(sub_100005C20(), "internalErrorWithMessage:", CFSTR("extension authorization view controller already presented"));
        v20 = (id)objc_claimAutoreleasedReturnValue(v31);
        ((void (*)(_QWORD *, _QWORD, id))v15[2])(v15, 0, v20);
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SOUIServiceViewController view](self, "view"));
        objc_msgSend(v25, "setHidden:", 0);

        v20 = objc_msgSend(objc_alloc((Class)SOUIAuthorizationViewController), "initWithExtensionViewController:hints:", self->_extensionViewController, v8);
        objc_msgSend(v20, "setDelegate:", self);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v42 = sub_100006BBC;
        *(_QWORD *)&v43 = sub_100006BCC;
        *((_QWORD *)&v43 + 1) = 0;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100006BD4;
        v35[3] = &unk_10000C490;
        v37 = buf;
        v35[4] = self;
        v26 = v15;
        v36 = v26;
        v27 = objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:repeats:block:](NSTimer, "timerWithTimeInterval:repeats:block:", 0, v35, 3.0));
        v28 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v27;

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
        objc_msgSend(v29, "addTimer:forMode:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), NSRunLoopCommonModes);

        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100006C74;
        v32[3] = &unk_10000C4B8;
        v34 = buf;
        v33 = v26;
        -[SOUIServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, v32);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      v30 = objc_msgSend(sub_100005C20(), "internalErrorWithMessage:", CFSTR("no extension authorization view controller"));
      v20 = (id)objc_claimAutoreleasedReturnValue(v30);
      ((void (*)(_QWORD *, _QWORD, id))v15[2])(v15, 0, v20);
    }
  }

}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  SOUIDaemonConnection *daemonConnection;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SOUIServiceViewController *v20;

  v7 = a4;
  v8 = a5;
  v9 = sub_100004E98();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "-[SOUIServiceViewController authorization:didCompleteWithCredential:error:]";
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s credential: %{public}@, %{public}@ on %@", buf, 0x2Au);
  }

  daemonConnection = self->_daemonConnection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006E14;
  v12[3] = &unk_10000C4E0;
  v12[4] = self;
  -[SOUIDaemonConnection authorizationDidCompleteWithCredential:error:completion:](daemonConnection, "authorizationDidCompleteWithCredential:error:completion:", v7, v8, v12);
  -[SOUIServiceViewController _dismiss](self, "_dismiss");

}

- (void)viewControllerDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  SORemoteExtensionViewController *extensionViewController;
  int v7;
  const char *v8;
  __int16 v9;
  SORemoteExtensionViewController *v10;
  __int16 v11;
  SOUIServiceViewController *v12;

  v4 = sub_100004E98();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    extensionViewController = self->_extensionViewController;
    v7 = 136315650;
    v8 = "-[SOUIServiceViewController viewControllerDidCancel:]";
    v9 = 2114;
    v10 = extensionViewController;
    v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s extensionViewController = %{public}@ on %@", (uint8_t *)&v7, 0x20u);
  }

  if (self->_extensionViewController)
    -[SOUIServiceViewController _cancelAuthorization](self, "_cancelAuthorization");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *requestThatPresentedViewController;
  id v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  SOUIServiceViewController *v12;

  v4 = sub_100004E98();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SOUIServiceViewController viewServiceDidTerminateWithError:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  requestThatPresentedViewController = self->_requestThatPresentedViewController;
  v7 = objc_msgSend(sub_100005C20(), "errorWithCode:message:", -3, CFSTR("connection to extension interrupted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[SOUIServiceViewController authorization:didCompleteWithCredential:error:](self, "authorization:didCompleteWithCredential:error:", requestThatPresentedViewController, 0, v8);

}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  SOExtension *extension;
  int v11;
  const char *v12;
  __int16 v13;
  SOExtension *v14;
  __int16 v15;
  SOUIServiceViewController *v16;

  v6 = a4;
  v7 = a3;
  v8 = sub_100004E98();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    extension = self->_extension;
    v11 = 136315650;
    v12 = "-[SOUIServiceViewController finishAuthorization:completion:]";
    v13 = 2112;
    v14 = extension;
    v15 = 2112;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s extension = %@ on %@", (uint8_t *)&v11, 0x20u);
  }

  -[SOExtension finishAuthorization:completion:](self->_extension, "finishAuthorization:completion:", v7, v6);
}

- (void)extensionCleanupWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  id v5;
  NSObject *v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = sub_100004E98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100007964((uint64_t)self, v6);

  -[SOUIServiceViewController _extensionCleanup](self, "_extensionCleanup");
  if (v4)
    v4[2](v4, 1, 0);

}

- (OS_xpc_object)xpcDaemonEndpoint
{
  return self->_xpcDaemonEndpoint;
}

- (void)setXpcDaemonEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcDaemonEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcDaemonEndpoint, 0);
  objc_storeStrong((id *)&self->_requestThatPresentedViewController, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
