@implementation TransitionViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (TransitionViewController)init
{
  id v2;
  TransitionViewController *v3;
  void *v4;
  unint64_t v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  TransitionViewController *v17;
  __CFString *v18;
  TransitionViewController *v19;
  uint64_t v20;
  unsigned __int8 v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v24;
  uint8_t buf[4];
  TransitionViewController *v26;
  __int16 v27;
  __CFString *v28;

  v24.receiver = self;
  v24.super_class = (Class)TransitionViewController;
  v3 = -[TransitionViewController init](&v24, "init");
  if (!v3)
    return v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = (unint64_t)objc_msgSend(v4, "userInterfaceIdiom");

  v3->_allowsLandscape = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v3->_instanceId = +[TransitionViewController newInstanceId](TransitionViewController, "newInstanceId");
  WeakRetained = objc_loadWeakRetained(&qword_1000921B0);

  if (!WeakRetained)
  {
LABEL_11:
    objc_storeWeak(&qword_1000921B0, v3);
    goto LABEL_12;
  }
  if (-[TransitionViewController _isRootControllerClass](v3, "_isRootControllerClass"))
  {
    v9 = -[TransitionViewController _shouldSkipStaleRootControllerRecovery](v3, "_shouldSkipStaleRootControllerRecovery");
    v12 = LALogForCategory(0, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v14)
        sub_100055C48(v13);

      goto LABEL_12;
    }
    if (v14)
      sub_100055CDC((uint64_t)v3, v13);

    goto LABEL_11;
  }
LABEL_12:
  v15 = LALogForCategory(0, v7, v8);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (TransitionViewController *)objc_loadWeakRetained(&qword_1000921B0);
    if (v3 == v17)
    {
      v18 = CFSTR("will become a new root VC");
    }
    else
    {
      v2 = objc_loadWeakRetained(&qword_1000921B0);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("root VC: %@"), v2));
    }
    *(_DWORD *)buf = 138543618;
    v26 = v3;
    v27 = 2114;
    v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@, %{public}@", buf, 0x16u);
    if (v3 != v17)
    {

    }
  }

  if ((+[LAUtils usesFrontBoardServicesForRemoteUI](LAUtils, "usesFrontBoardServicesForRemoteUI") & 1) != 0|| !_os_feature_enabled_impl("LocalAuthentication", "useTransitionViewModel"))
  {
    goto LABEL_24;
  }
  v19 = (TransitionViewController *)objc_loadWeakRetained(&qword_1000921B0);
  if (v3 != v19)
  {

    goto LABEL_25;
  }
  v21 = -[TransitionViewController isMemberOfClass:](v3, "isMemberOfClass:", objc_opt_class(TransitionViewController, v20));

  if ((v21 & 1) == 0)
LABEL_24:
    -[TransitionViewController _setupConnection](v3, "_setupConnection");
LABEL_25:
  if (-[TransitionViewController _shouldRegisterForApplicationChange](v3, "_shouldRegisterForApplicationChange"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1000106A4, CLFApplicationDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v4 = LALogForCategory(0, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100055D84();

  if (-[TransitionViewController _shouldRegisterForApplicationChange](self, "_shouldRegisterForApplicationChange"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CLFApplicationDidChangeNotification, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)TransitionViewController;
  -[TransitionViewController dealloc](&v7, "dealloc");
}

- (BOOL)_isRootControllerClass
{
  if ((-[TransitionViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(TransitionViewController, a2)) & 1) != 0)return 1;
  else
    return -[TransitionViewController isRemoteViewController](self, "isRemoteViewController");
}

- (void)_resetUI
{
  id disappearedNotification;
  id appearedNotification;
  _QWORD v5[4];
  id v6;
  id location;

  disappearedNotification = self->_disappearedNotification;
  self->_disappearedNotification = 0;

  appearedNotification = self->_appearedNotification;
  self->_appearedNotification = 0;

  self->_hasRequestedReset = 1;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010874;
  v5[3] = &unk_100079B80;
  objc_copyWeak(&v6, &location);
  -[TransitionViewController dismissRemoteUIWasInvalidated:completionHandler:](self, "dismissRemoteUIWasInvalidated:completionHandler:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setupConnection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  LARemoteUIHost *v7;
  LARemoteUIHost *remoteUIHost;
  LARemoteUIHost *v9;
  void *v10;
  unsigned int v11;
  dispatch_semaphore_t v12;
  LAUIMechanism *mechanism;
  NSObject *v14;
  dispatch_time_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;

  objc_initWeak(&location, self);
  if (qword_1000921B8)
  {
    objc_msgSend((id)qword_1000921B8, "suspend");
  }
  else
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.LocalAuthentication.RemoteUIHost"), 0);
    v4 = (void *)qword_1000921B8;
    qword_1000921B8 = (uint64_t)v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAInternalProtocols interfaceWithInternalProtocol:](LAInternalProtocols, "interfaceWithInternalProtocol:", &OBJC_PROTOCOL___LARemoteUIHost));
    objc_msgSend((id)qword_1000921B8, "setRemoteObjectInterface:", v5);

  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100010BD0;
  v27[3] = &unk_100079B80;
  objc_copyWeak(&v28, &location);
  objc_msgSend((id)qword_1000921B8, "setInterruptionHandler:", v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100010BFC;
  v25[3] = &unk_100079B80;
  objc_copyWeak(&v26, &location);
  objc_msgSend((id)qword_1000921B8, "setInvalidationHandler:", v25);
  objc_msgSend((id)qword_1000921B8, "resume");
  v6 = (void *)qword_1000921B8;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100010C34;
  v23[3] = &unk_100079F10;
  objc_copyWeak(&v24, &location);
  v7 = (LARemoteUIHost *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v23));
  remoteUIHost = self->_remoteUIHost;
  self->_remoteUIHost = v7;

  v9 = self->_remoteUIHost;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100010CA8;
  v22[3] = &unk_100079F38;
  v22[4] = self;
  -[LARemoteUIHost connectRemoteUI:reply:](v9, "connectRemoteUI:reply:", self, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController mechanism](self, "mechanism"));
  if (v10)
  {
    v11 = -[TransitionViewController isRemoteViewController](self, "isRemoteViewController");

    if (v11)
    {
      v12 = dispatch_semaphore_create(0);
      mechanism = self->_mechanism;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100010D74;
      v20[3] = &unk_100079F60;
      v20[4] = self;
      v14 = v12;
      v21 = v14;
      -[LAUIMechanism internalInfoWithReply:](mechanism, "internalInfoWithReply:", v20);
      v15 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v14, v15))
      {
        v18 = LALogForCategory(0, v16, v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          sub_100055DF0(v19);

      }
    }
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (TransitionViewController)initWithInternalInfo:(id)a3 parent:(id)a4 allowsLandscape:(BOOL)a5
{
  id v9;
  id v10;
  TransitionViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  LAUIMechanism *mechanism;
  uint64_t v18;
  LABackoffCounter *backoffCounter;
  uint64_t v20;
  LARemoteUIHost *remoteUIHost;
  objc_super v23;
  uint8_t buf[4];
  TransitionViewController *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TransitionViewController;
  v11 = -[TransitionViewController init](&v23, "init");
  if (v11)
  {
    v11->_instanceId = +[TransitionViewController newInstanceId](TransitionViewController, "newInstanceId");
    v14 = LALogForCategory(0, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v11;
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ is initializing as a child of %{public}@ with %{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v11->_internalInfo, a3);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mechanism"));
    mechanism = v11->_mechanism;
    v11->_mechanism = (LAUIMechanism *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "backoffCounter"));
    backoffCounter = v11->_backoffCounter;
    v11->_backoffCounter = (LABackoffCounter *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteUIHost"));
    remoteUIHost = v11->_remoteUIHost;
    v11->_remoteUIHost = (LARemoteUIHost *)v20;

    v11->_allowsLandscape = a5;
    -[TransitionViewController didReceiveAuthenticationData](v11, "didReceiveAuthenticationData");
  }

  return v11;
}

- (TransitionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TransitionViewController *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TransitionViewController;
  v16 = -[TransitionViewController init](&v18, "init");
  if (v16)
  {
    v16->_instanceId = +[TransitionViewController newInstanceId](TransitionViewController, "newInstanceId");
    objc_storeStrong((id *)&v16->_backoffCounter, a5);
    objc_storeStrong((id *)&v16->_remoteUIHost, a6);
    v16->_allowsLandscape = a7;
    -[TransitionViewController viewModelDidReceiveAuthenticationDataWithInternalInfo:mechanism:](v16, "viewModelDidReceiveAuthenticationDataWithInternalInfo:mechanism:", v12, v13);
  }

  return v16;
}

- (void)didReceiveAuthenticationData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  id v20;
  void *v21;
  id *p_options;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *callerName;
  void *v29;
  uint64_t v30;
  NSString *callerBundleId;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *authenticationTitle;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *authenticationSubtitle;
  LACachedExternalizedContext *v40;
  LACachedExternalizedContext *cachedExternalizedContext;
  TransitionViewController *v42;
  id v43;
  _QWORD v44[5];
  unsigned __int8 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_internalInfo, "objectForKey:", CFSTR("Policy")));
  self->_policy = (int64_t)objc_msgSend(v3, "integerValue");

  v42 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_internalInfo, "objectForKey:", CFSTR("Options")));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v47;
      v10 = &NSStringFromLACPasscodeType_ptr;
      do
      {
        v11 = 0;
        v43 = v8;
        do
        {
          if (*(_QWORD *)v47 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12));
          v15 = objc_opt_class(NSString, v14);
          if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0
            && objc_msgSend(v10[9], "isLocalizationKey:", v13))
          {
            v45 = 0;
            v16 = v9;
            v17 = v6;
            v18 = v10;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[9], "decodeLocalizationKeyFromString:shouldUseDeviceVariant:", v13, &v45));
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_1000114C0;
            v44[3] = &unk_100079F88;
            v44[4] = v42;
            v20 = sub_1000114C0((uint64_t)v44, v19, v45);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v12);

            v10 = v18;
            v6 = v17;
            v9 = v16;
            v8 = v43;
          }

          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v8);
    }

  }
  p_options = (id *)&v42->_options;
  objc_storeStrong((id *)&v42->_options, v5);
  if (v42->_options)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v42->_options, "objectForKey:", &off_10007E378));
    v24 = v23;
    if (v23)
      -[TransitionViewController setModalPresentationStyle:](v42, "setModalPresentationStyle:", objc_msgSend(v23, "integerValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_options, "objectForKey:", &off_10007E390));
    v26 = v25;
    if (v25)
      -[TransitionViewController setModalTransitionStyle:](v42, "setModalTransitionStyle:", objc_msgSend(v25, "integerValue"));

  }
  v27 = objc_claimAutoreleasedReturnValue(-[TransitionViewController localizedCallerName](v42, "localizedCallerName"));
  callerName = v42->_callerName;
  v42->_callerName = (NSString *)v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_options, "objectForKeyedSubscript:", &off_10007E3A8));
  v42->_callerNameOverride = objc_msgSend(v29, "isEqualToString:", v42->_callerName);

  v30 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v42->_internalInfo, "objectForKey:", CFSTR("CallerId")));
  callerBundleId = v42->_callerBundleId;
  v42->_callerBundleId = (NSString *)v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](v42, "options"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", &off_10007E3C0));
  v34 = objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v33, 512));
  authenticationTitle = v42->_authenticationTitle;
  v42->_authenticationTitle = (NSString *)v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController options](v42, "options"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", &off_10007E3D8));
  v38 = objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v37, 512));
  authenticationSubtitle = v42->_authenticationSubtitle;
  v42->_authenticationSubtitle = (NSString *)v38;

  v40 = (LACachedExternalizedContext *)objc_msgSend(objc_alloc((Class)LACachedExternalizedContext), "initWithExternalizationDelegate:", v42->_mechanism);
  cachedExternalizedContext = v42->_cachedExternalizedContext;
  v42->_cachedExternalizedContext = v40;

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%u]"), v5, -[TransitionViewController instanceId](self, "instanceId")));

  return (NSString *)v6;
}

- (id)localizedCallerName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_internalInfo, "objectForKeyedSubscript:", CFSTR("CallerName")));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v2, 0, 0));
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
      v6 = v5;
      if (v5)
      {
        v7 = v5;
        v8 = v2;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedShortName"));
        v8 = v9;
        if (v9)
        {
          v7 = v9;
        }
        else
        {
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
          v11 = (void *)v10;
          if (v10)
            v12 = (void *)v10;
          else
            v12 = v2;
          v7 = v12;

          v2 = v11;
        }

      }
      v2 = v7;
    }

  }
  return v2;
}

+ (unsigned)newInstanceId
{
  return ++dword_1000921C0;
}

+ (unsigned)newTaskId
{
  return ++dword_1000921C4;
}

- (void)_dismissRemoteUIWithCompletionHandler:(id)a3
{
  -[TransitionViewController dismissRemoteUIWasInvalidated:completionHandler:](self, "dismissRemoteUIWasInvalidated:completionHandler:", 0, a3);
}

- (void)dismissRemoteUIWasInvalidated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id appearedNotification;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  id v22;
  unsigned int v23;
  _QWORD block[4];
  void (**v25)(_QWORD);
  id v26;
  unsigned int v27;
  uint8_t v28[4];
  unsigned int v29;
  uint8_t buf[4];
  TransitionViewController *v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  unsigned int v35;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = +[TransitionViewController newTaskId](TransitionViewController, "newTaskId");
  v10 = LALogForCategory(0, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    v32 = 1024;
    v33 = v4;
    v34 = 1024;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing %{public}@, invalidated: %d, created tid:%u", buf, 0x18u);
  }

  if (self->_disappeared)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    if (v4 && !self->_appeared)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000119CC;
      block[3] = &unk_100079FB0;
      objc_copyWeak(&v26, (id *)buf);
      v27 = v7;
      v25 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v26);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100011A38;
      v20[3] = &unk_10007A000;
      v23 = v7;
      v20[4] = self;
      v21 = v6;
      objc_copyWeak(&v22, (id *)buf);
      v12 = objc_retainBlock(v20);
      v15 = v12;
      if (self->_appeared)
      {
        ((void (*)(_QWORD *))v12[2])(v12);
      }
      else
      {
        v16 = LALogForCategory(0, v13, v14);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v28 = 67109120;
          v29 = v7;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Scheduling disappearBlock when controller appears, tid:%u", v28, 8u);
        }

        v18 = objc_retainBlock(v15);
        appearedNotification = self->_appearedNotification;
        self->_appearedNotification = v18;

      }
      objc_destroyWeak(&v22);

    }
    objc_destroyWeak((id *)buf);
  }

}

- (void)transitionToController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  BOOL v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  int64_t v44;
  unsigned int v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  TransitionViewController *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  __int16 v54;
  unsigned int v55;

  v8 = a4;
  v9 = a5;
  v10 = +[TransitionViewController newTaskId](TransitionViewController, "newTaskId");
  v13 = LALogForCategory(0, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v49 = self;
    v50 = 1024;
    v51 = a3;
    v52 = 2114;
    v53 = v8;
    v54 = 1024;
    v55 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ transitioning to %d (%{public}@), created tid:%u", buf, 0x22u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v16 = (unint64_t)objc_msgSend(v15, "userInterfaceIdiom");

  v19 = v16 & 0xFB;
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v20 = _os_feature_enabled_impl("LocalAuthentication", "allowLandscapeTouchID");
    if (a3 == 1)
      v19 = v20;
    else
      v19 = 0;
  }
  self->_allowsLandscape = v19;
  v21 = LALogForCategory(0, v17, v18);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_allowsLandscape)
      v23 = "YES";
    else
      v23 = "NO";
    *(_DWORD *)buf = 136315138;
    v49 = (TransitionViewController *)v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting _allowsLandscape = %s", buf, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("CallerId")));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("BackgroundUi")));
    v26 = objc_msgSend(v25, "BOOLValue");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Policy")));
    v28 = objc_msgSend(v27, "integerValue");

    if ((v26 & 1) == 0
      && (+[LAUtils isApplePayPolicy:](LAUtils, "isApplePayPolicy:", v28) & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ProcessId")));
      if (+[LAUtils callerRunningOnForeground:pid:](LAUtils, "callerRunningOnForeground:pid:", v24, objc_msgSend(v29, "unsignedIntValue")))
      {

      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleIdentifier"));
        v32 = +[LAUtils callerRunningOnForeground:pid:](LAUtils, "callerRunningOnForeground:pid:", v31, geteuid());

        if ((v32 & 1) == 0)
        {
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100012010;
          v46[3] = &unk_10007A028;
          v47 = v9;
          v40 = v9;
          -[TransitionViewController _dismissRemoteUIWithCompletionHandler:](self, "_dismissRemoteUIWithCompletionHandler:", v46);
          v39 = v47;
          goto LABEL_24;
        }
      }
    }
  }
  if (-[TransitionViewController _shouldHideStatusBarForController:](self, "_shouldHideStatusBarForController:", a3))
  {
    v35 = LALogForCategory(0, v33, v34);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = self;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@ will hide status bar, because the child controller needs it", buf, 0xCu);
    }

    v37 = 1;
  }
  else
  {
    v37 = 0;
  }
  self->_hideStatusBar = v37;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100012080;
  v41[3] = &unk_10007A098;
  v45 = v10;
  v44 = a3;
  v41[4] = self;
  v42 = v8;
  v43 = v9;
  v38 = v9;
  -[TransitionViewController _performOnMainQueueWhenAppeared:](self, "_performOnMainQueueWhenAppeared:", v41);

  v39 = v42;
LABEL_24:

}

- (void)_performOnMainQueueWhenAppeared:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  TransitionViewController *v10;
  TransitionViewController *v11;
  id v12;
  _QWORD block[4];
  TransitionViewController *v14;
  TransitionViewController *v15;
  id v16;
  id v17;
  unsigned int v18;
  uint8_t buf[4];
  TransitionViewController *v20;
  __int16 v21;
  unsigned int v22;

  v4 = a3;
  v5 = +[TransitionViewController newTaskId](TransitionViewController, "newTaskId");
  v8 = LALogForCategory(0, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 1024;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@ will perform task when appeared, created tid:%u", buf, 0x12u);
  }

  v10 = self->_childController;
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012700;
  block[3] = &unk_10007A0E8;
  v14 = v10;
  v11 = v10;
  objc_copyWeak(&v17, (id *)buf);
  v18 = v5;
  v15 = self;
  v16 = v4;
  v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (BOOL)_shouldHideStatusBarForController:(int64_t)a3
{
  id v4;

  v4 = +[LACMobileGestalt currentDeviceScreenSize](LACMobileGestalt, "currentDeviceScreenSize");
  return a3 == 2 && !v4 || a3 == 1 && (sub_100010238() & 1) != 0;
}

- (void)viewDidLoad
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  objc_super v13;
  void *v14;
  uint8_t buf[4];
  TransitionViewController *v16;

  v4 = LALogForCategory(0, a2, v2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidLoad", buf, 0xCu);
  }

  v13.receiver = self;
  v13.super_class = (Class)TransitionViewController;
  -[TransitionViewController viewDidLoad](&v13, "viewDidLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController view](self, "view"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("authentication_ui"));

  objc_initWeak((id *)buf, self);
  v7 = objc_opt_self(UITraitUserInterfaceStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100012C54;
  v11[3] = &unk_10007A110;
  objc_copyWeak(&v12, (id *)buf);
  v10 = -[TransitionViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v9, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void (**appearedNotification)(void);
  id v8;
  objc_super v9;
  uint8_t buf[4];
  TransitionViewController *v11;

  v3 = a3;
  v5 = LALogForCategory(0, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidAppear", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)TransitionViewController;
  -[TransitionViewController viewDidAppear:](&v9, "viewDidAppear:", v3);
  self->_disappeared = 0;
  self->_appeared = 1;
  self->_awaitingDissappear = 0;
  appearedNotification = (void (**)(void))self->_appearedNotification;
  if (appearedNotification)
  {
    appearedNotification[2]();
    v8 = self->_appearedNotification;
    self->_appearedNotification = 0;

  }
  if (-[TransitionViewController isUiReady](self, "isUiReady"))
    -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  uint8_t buf[4];
  TransitionViewController *v17;

  v3 = a3;
  v5 = LALogForCategory(0, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ viewWillAppear", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)TransitionViewController;
  -[TransitionViewController viewWillAppear:](&v15, "viewWillAppear:", v3);
  v8 = objc_opt_class(self, v7);
  if (v8 == objc_opt_class(TransitionViewController, v9))
  {
    v14.receiver = self;
    v14.super_class = (Class)TransitionViewController;
    v10 = -[TransitionViewController _remoteViewControllerProxy](&v14, "_remoteViewControllerProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v11, "setDesiredHardwareButtonEvents:", 16);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "setDismissalAnimationStyle:", 1);

}

- (BOOL)prefersStatusBarHidden
{
  return -[TransitionViewController isFullScreenController](self, "isFullScreenController") || self->_hideStatusBar;
}

- (void)idleTimerDisable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TransitionViewController;
  v4 = -[TransitionViewController _remoteViewControllerProxy](&v6, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", v3, CFSTR("com.apple.LocalAuthentication"));

}

+ (id)rootController
{
  return objc_loadWeakRetained(&qword_1000921B0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  TransitionViewController *childController;
  TransitionViewController *v13;
  void (**disappearedNotification)(void);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  TransitionViewController *v22;

  v3 = a3;
  v5 = LALogForCategory(0, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ viewDidDisappear", buf, 0xCu);
  }

  v20.receiver = self;
  v20.super_class = (Class)TransitionViewController;
  -[TransitionViewController viewDidDisappear:](&v20, "viewDidDisappear:", v3);
  v9 = !self->_awaitingDissappear;
  if (self->_awaitingDissappear)
  {
    v10 = LALogForCategory(0, v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignoring expected UI disappearance", buf, 2u);
    }
  }
  else
  {
    -[LAUIMechanism uiEvent:options:](self->_mechanism, "uiEvent:options:", 1, 0);
    childController = self->_childController;
    if (!childController || -[TransitionViewController disappeared](childController, "disappeared"))
    {
      v9 = 0;
      goto LABEL_11;
    }
    v13 = self->_childController;
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("viewDidDisappear on %@, needs to dismiss child"), self));
    -[TransitionViewController _dismissChild:andRoot:reason:completion:](self, "_dismissChild:andRoot:reason:completion:", v13, 1, v11, 0);
  }

LABEL_11:
  disappearedNotification = (void (**)(void))self->_disappearedNotification;
  if (disappearedNotification)
  {
    disappearedNotification[2]();
    v15 = self->_disappearedNotification;
    self->_disappearedNotification = 0;

  }
  if (!+[LAUtils usesFrontBoardServicesForRemoteUI](LAUtils, "usesFrontBoardServicesForRemoteUI")|| (v17 = objc_opt_class(self, v16), v17 != objc_opt_class(TransitionViewController, v18))|| !self->_awaitingDissappear)
  {
    if (!v9)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("viewDidDisappear on %@, no active child"), self));
      -[TransitionViewController _dismissRootWithReason:completion:](self, "_dismissRootWithReason:completion:", v19, 0);

    }
    self->_disappeared = 1;
    self->_appeared = 0;
    -[TransitionViewModel suspendConnection](self->_viewModel, "suspendConnection");
  }
}

- (void)_scheduleIdleExit
{
  TransitionViewController *v3;
  _BOOL4 hasRequestedReset;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  TransitionViewController *childController;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id obj;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];

  v3 = (TransitionViewController *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
  if (v3 == self)
  {

  }
  else
  {
    hasRequestedReset = self->_hasRequestedReset;

    if (!hasRequestedReset)
      return;
  }
  if (-[TransitionViewController _shouldSimulateStaleRootController](self, "_shouldSimulateStaleRootController"))
  {
    v7 = LALogForCategory(0, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100055FBC();

  }
  else
  {
    objc_storeWeak(&qword_1000921B0, 0);
    childController = self->_childController;
    self->_childController = 0;

    if (+[LAUtils usesFrontBoardServicesForRemoteUI](LAUtils, "usesFrontBoardServicesForRemoteUI"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController _sceneSessions](self, "_sceneSessions"));
      v11 = objc_msgSend(v10, "count");
      v14 = LALogForCategory(0, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = 16 * (v11 == 0);
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v35) = (_DWORD)v11;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Will destroy %d sessions", buf, 8u);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v10;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v17)
      {
        v20 = v17;
        v21 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v24 = LALogForCategory(0, v18, v19);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentIdentifier"));
              *(_DWORD *)buf = 138543362;
              v35 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Will destroy scene %{public}@", buf, 0xCu);

            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100013550;
            v29[3] = &unk_10007A138;
            v29[4] = v23;
            objc_msgSend(v27, "requestSceneSessionDestruction:options:errorHandler:", v23, 0, v29);

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v20);
      }

    }
    else
    {
      -[TransitionViewController _checkClearForIdleExit](self, "_checkClearForIdleExit");
    }
  }
}

- (void)_checkClearForIdleExit
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController remoteUIHost](self, "remoteUIHost"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013678;
  v4[3] = &unk_10007A188;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "checkClearForIdleExitWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleIdleExitResponse:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v6 = a3;
  v9 = a4;
  if (!v6)
  {
    v24 = LALogForCategory(0, v7, v8);
    v16 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100056094();
    goto LABEL_10;
  }
  objc_msgSend(v6, "timeIntervalSinceNow");
  v11 = v10;
  v14 = LALogForCategory(0, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v11 >= 0.0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CoreAuthUI won't idle-exit", v25, 2u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000560F4(v16, v17, v18, v19, v20, v21, v22, v23);

  -[TransitionViewController _checkClearForIdleExit](self, "_checkClearForIdleExit");
LABEL_11:

}

- (BOOL)isFullScreenController
{
  return 0;
}

- (BOOL)isRemoteViewController
{
  return 0;
}

- (BOOL)isUiReady
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class(self, a2);
  return v2 != objc_opt_class(TransitionViewController, v3);
}

- (void)uiEvent:(int64_t)a3 options:(id)a4
{
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  TransitionViewController *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;

  v6 = (__CFString *)a4;
  v9 = LALogForCategory(0, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("with options: ");
    v13 = 138544130;
    v12 = &stru_10007CCD0;
    v14 = self;
    v15 = 1024;
    if (v6)
      v12 = v6;
    else
      v11 = &stru_10007CCD0;
    v16 = a3;
    v17 = 2112;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ has generated UI event:%d %@%{public}@", (uint8_t *)&v13, 0x26u);
  }

  -[LAUIMechanism uiEvent:options:](self->_mechanism, "uiEvent:options:", a3, v6);
}

- (void)uiOpenURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[URLOpener sharedInstance](URLOpener, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openURL:", v3));

  if (v5)
  {
    v8 = LALogForCategory(0, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v3;
      v12 = 2114;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to open URL: %{public}@ error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)uiContinue
{
  -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 12, 0);
}

- (void)uiDismissed
{
  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 11, 0);
}

- (void)uiCancel
{
  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 2, 0);
}

- (void)uiCancelWithError:(id)a3
{
  id v4;
  void *v5;
  NSErrorUserInfoKey v6;
  id v7;

  v4 = a3;
  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  if (v4)
  {
    v6 = NSUnderlyingErrorKey;
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  else
  {
    v5 = 0;
  }
  -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 2, v5);

}

- (void)uiFallback
{
  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  -[TransitionViewController uiEvent:options:](self, "uiEvent:options:", 3, 0);
}

- (void)uiSuccessWithResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  TransitionViewController *v10;

  v4 = a3;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ UI success", (uint8_t *)&v9, 0xCu);
  }

  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  -[LAUIMechanism uiSuccessWithResult:](self->_mechanism, "uiSuccessWithResult:", v4);

}

- (void)uiFailureWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  TransitionViewController *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ UI failure: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[TransitionViewController _setActivityWatchdog](self, "_setActivityWatchdog");
  -[LAUIMechanism uiFailureWithError:](self->_mechanism, "uiFailureWithError:", v4);

}

- (void)externalizedContextWithReply:(id)a3
{
  -[LAUIMechanism externalizedContextWithReply:](self->_mechanism, "externalizedContextWithReply:", a3);
}

- (void)authMethodWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](LAErrorHelper, "internalErrorWithMessage:", CFSTR("No auth blob on mechanism.")));
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (void)_setActivityWatchdog
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 3000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013EEC;
  v3[3] = &unk_100079B80;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)internalInfoWithReply:(id)a3
{
  -[LAUIMechanism internalInfoWithReply:](self->_mechanism, "internalInfoWithReply:", a3);
}

- (void)mechanismEvent:(int64_t)a3 reply:(id)a4
{
  -[TransitionViewController mechanismEvent:value:reply:](self, "mechanismEvent:value:reply:", a3, 0, a4);
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014074;
  block[3] = &unk_10007A1B0;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)_mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  __CFString *v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  const __CFString *v16;
  const __CFString *v17;
  TransitionViewController *childController;
  int v19;
  TransitionViewController *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;

  v8 = (__CFString *)a4;
  v9 = (void (**)(_QWORD))a5;
  v12 = LALogForCategory(0, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (self->_childController)
    v15 = OS_LOG_TYPE_INFO;
  else
    v15 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v13, v15))
  {
    v16 = CFSTR(", value:");
    v19 = 138544130;
    v17 = &stru_10007CCD0;
    v20 = self;
    v21 = 1024;
    if (v8)
      v17 = v8;
    else
      v16 = &stru_10007CCD0;
    v22 = a3;
    v23 = 2112;
    v24 = v16;
    v25 = 2114;
    v26 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@ has received mechanism event %d%@%{public}@", (uint8_t *)&v19, 0x26u);
  }

  childController = self->_childController;
  if (childController)
  {
    -[TransitionViewController mechanismEvent:value:reply:](childController, "mechanismEvent:value:reply:", a3, v8, v9);
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 8)
      self->_resetUiEvent = a3;
    v9[2](v9);
  }

}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  TransitionViewController *v16;

  v4 = a3;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[TransitionViewController dismissChildWithCompletionHandler:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  self->_awaitingDissappear = 1;
  v9 = -[TransitionViewController isFullScreenController](self, "isFullScreenController");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014360;
  v11[3] = &unk_10007A070;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[TransitionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v9, v11);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  TransitionViewController *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v7 = LALogForCategory(0, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is handling button action %@", (uint8_t *)&v9, 0x16u);
  }

  if (!-[TransitionViewController processHomeButtonPressed](self->_childController, "processHomeButtonPressed"))
    -[TransitionViewController uiCancel](self, "uiCancel");

}

- (BOOL)processHomeButtonPressed
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2;
  BOOL *p_allowsLandscape;
  _BOOL4 allowsLandscape;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;

  p_allowsLandscape = &self->_allowsLandscape;
  allowsLandscape = self->_allowsLandscape;
  v5 = LALogForCategory(0, a2, v2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1000561C8(!allowsLandscape, p_allowsLandscape, v6);
  if (allowsLandscape)
    v7 = 30;
  else
    v7 = 2;

  return v7;
}

- (int)_preferredStatusBarVisibility
{
  if (self->_hideStatusBar)
    return 1;
  if (-[TransitionViewController isFullScreenController](self, "isFullScreenController"))
    return 2;
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == (id)2)
    return 1;
  else
    return 3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  TransitionViewController *v16;
  __int16 v17;
  TransitionViewController *v18;

  v5 = (void (**)(_QWORD))a4;
  v8 = LALogForCategory(0, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = (TransitionViewController *)"-[TransitionViewController configureWithContext:completion:]";
    v17 = 2112;
    v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v15, 0x16u);
  }

  if (!self->_allowsLandscape)
  {
    v12 = LALogForCategory(0, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Enforcing portrait mode regardless of the current orientation", (uint8_t *)&v15, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v14, "setLaunchingInterfaceOrientation:", 1);

  }
  if (v5)
    v5[2](v5);

}

- (void)noteActivatedWithPresentationMode:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _TtC10CoreAuthUI19TransitionViewModel *v9;
  _TtC10CoreAuthUI19TransitionViewModel *viewModel;
  void *v11;
  void *v12;
  id v13;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TransitionViewController;
  -[TransitionViewController noteActivatedWithPresentationMode:](&v15, "noteActivatedWithPresentationMode:");
  self->_presentationMode = a3;
  if (_os_feature_enabled_impl("LocalAuthentication", "useTransitionViewModel"))
  {
    if (a3)
    {
      v7 = LALogForCategory(0, v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We are in multiscreen environment. Initializing TransitionViewModel.", v14, 2u);
      }

      v9 = (_TtC10CoreAuthUI19TransitionViewModel *)objc_claimAutoreleasedReturnValue(+[TransitionViewModel shared](_TtC10CoreAuthUI19TransitionViewModel, "shared"));
      viewModel = self->_viewModel;
      self->_viewModel = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewModel delegates](self->_viewModel, "delegates"));
      objc_msgSend(v11, "addObject:", self);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewModel delegates](self->_viewModel, "delegates"));
      v13 = objc_msgSend(v12, "count");

      if ((unint64_t)v13 >= 2)
        -[TransitionViewModel setupConnection](self->_viewModel, "setupConnection");
    }
    else
    {
      -[TransitionViewController _setupConnection](self, "_setupConnection");
    }
  }
}

- (void)_dismissChild:(id)a3 andRoot:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  void ***v18;
  uint64_t v19;
  uint64_t v20;
  void ***v21;
  uint64_t v22;
  NSObject *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  TransitionViewController *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100014A50;
  v32[3] = &unk_10007A1D8;
  objc_copyWeak(&v35, &location);
  v13 = v11;
  v33 = v13;
  v14 = v12;
  v34 = v14;
  v15 = objc_retainBlock(v32);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100014B2C;
  v27 = &unk_10007A200;
  v31 = a4;
  objc_copyWeak(&v30, &location);
  v16 = v13;
  v28 = v16;
  v17 = v15;
  v29 = v17;
  v18 = objc_retainBlock(&v24);
  v21 = v18;
  if (v10)
  {
    v22 = LALogForCategory(0, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v10;
      v41 = 2114;
      v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ will dismiss %{public}@ (%{public}@)", buf, 0x20u);
    }

    objc_msgSend(v10, "dismissChildWithCompletionHandler:", v21, v24, v25, v26, v27, v28);
  }
  else
  {
    ((void (*)(void ***))v18[2])(v18);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)_dismissRootWithReason:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  TransitionViewController *v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitionViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  if (v10)
  {
    v11 = LALogForCategory(0, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ RVC proxy was dismissed (%{public}@)", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(v10, "dismiss");
  }
  -[TransitionViewController _scheduleIdleExit](self, "_scheduleIdleExit");
  if (v7)
    v7[2](v7);

}

- (BOOL)_shouldSkipStaleRootControllerRecovery
{
  return -[TransitionViewController _internalBooleanDefaultNamed:](self, "_internalBooleanDefaultNamed:", CFSTR("LA.SkipStaleRootControllerRecovery"));
}

- (BOOL)_shouldSimulateStaleRootController
{
  return -[TransitionViewController _internalBooleanDefaultNamed:](self, "_internalBooleanDefaultNamed:", CFSTR("LA.StaleRootControllerSimulation"));
}

- (BOOL)_internalBooleanDefaultNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  if (os_variant_allows_internal_security_policies(LACLogSubsystem))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentDomainForName:", NSGlobalDomain));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v3));
    v7 = v6;
    if (!v6)
      v6 = &__kCFBooleanFalse;
    v8 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_sceneSessions
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v2 = objc_alloc_init((Class)NSMutableSet);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "openSessions"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedScenes"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "session"));
        objc_msgSend(v2, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  return v2;
}

- (void)_cancelForApplicationChangeIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  TransitionViewController *v8;

  if (-[TransitionViewController _shouldCancelForApplicationChange](self, "_shouldCancelForApplicationChange"))
  {
    v5 = LALogForCategory(0, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@ due to application change.", (uint8_t *)&v7, 0xCu);
    }

    -[TransitionViewController uiCancel](self, "uiCancel");
  }
}

- (BOOL)_shouldRegisterForApplicationChange
{
  return +[LAUtils isClarityBoardRunning](LAUtils, "isClarityBoardRunning");
}

- (BOOL)_shouldCancelForApplicationChange
{
  TransitionViewController *v3;
  BOOL v4;

  if (!-[TransitionViewController _shouldRegisterForApplicationChange](self, "_shouldRegisterForApplicationChange"))
    return 0;
  v3 = (TransitionViewController *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
  v4 = v3 == self;

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showWithController:(int64_t)a3 internalInfo:(id)a4 completionHandler:(id)a5
{
  -[TransitionViewController transitionToController:internalInfo:completionHandler:](self, "transitionToController:internalInfo:completionHandler:", a3, a4, a5);
}

- (void)viewModelDidReceiveAuthenticationDataWithInternalInfo:(id)a3 mechanism:(id)a4
{
  NSDictionary *v6;
  id v7;
  NSDictionary *internalInfo;

  v6 = (NSDictionary *)a3;
  objc_storeStrong((id *)&self->_mechanism, a4);
  v7 = a4;
  internalInfo = self->_internalInfo;
  self->_internalInfo = v6;

  -[TransitionViewController didReceiveAuthenticationData](self, "didReceiveAuthenticationData");
}

- (LAUIMechanism)mechanism
{
  return self->_mechanism;
}

- (LARemoteUIHost)remoteUIHost
{
  return self->_remoteUIHost;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSDictionary)options
{
  return self->_options;
}

- (LABackoffCounter)backoffCounter
{
  return self->_backoffCounter;
}

- (void)setBackoffCounter:(id)a3
{
  objc_storeStrong((id *)&self->_backoffCounter, a3);
}

- (NSString)callerName
{
  return self->_callerName;
}

- (BOOL)callerNameOverride
{
  return self->_callerNameOverride;
}

- (NSString)callerBundleId
{
  return self->_callerBundleId;
}

- (LACachedExternalizedContext)cachedExternalizedContext
{
  return self->_cachedExternalizedContext;
}

- (NSDictionary)internalInfo
{
  return self->_internalInfo;
}

- (NSString)authenticationTitle
{
  return self->_authenticationTitle;
}

- (void)setAuthenticationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationTitle, a3);
}

- (NSString)authenticationSubtitle
{
  return self->_authenticationSubtitle;
}

- (void)setAuthenticationSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationSubtitle, a3);
}

- (BOOL)awaitingDissappear
{
  return self->_awaitingDissappear;
}

- (void)setAwaitingDissappear:(BOOL)a3
{
  self->_awaitingDissappear = a3;
}

- (BOOL)disappeared
{
  return self->_disappeared;
}

- (void)setDisappeared:(BOOL)a3
{
  self->_disappeared = a3;
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (id)disappearedNotification
{
  return self->_disappearedNotification;
}

- (void)setDisappearedNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)appearedNotification
{
  return self->_appearedNotification;
}

- (void)setAppearedNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appearedNotification, 0);
  objc_storeStrong(&self->_disappearedNotification, 0);
  objc_storeStrong((id *)&self->_authenticationSubtitle, 0);
  objc_storeStrong((id *)&self->_authenticationTitle, 0);
  objc_storeStrong((id *)&self->_internalInfo, 0);
  objc_storeStrong((id *)&self->_cachedExternalizedContext, 0);
  objc_storeStrong((id *)&self->_callerBundleId, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
  objc_storeStrong((id *)&self->_backoffCounter, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_remoteUIHost, 0);
  objc_storeStrong((id *)&self->_mechanism, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_childController, 0);
}

@end
