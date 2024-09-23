@implementation AFUIApplicationSiriTaskDeliverer

- (AFUIApplicationSiriTaskDeliverer)initWithAppBundleIdentifier:(id)a3
{
  id v5;
  AFUIApplicationSiriTaskDeliverer *v6;
  uint64_t v7;
  NSString *appBundleIdentifier;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  dispatch_group_t v12;
  OS_dispatch_group *bKSAssertionSetupGroup;
  void *v15;
  objc_super v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUIApplicationSiriTaskDeliverer.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

  }
  v16.receiver = self;
  v16.super_class = (Class)AFUIApplicationSiriTaskDeliverer;
  v6 = -[AFUIApplicationSiriTaskDeliverer init](&v16, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    appBundleIdentifier = v6->_appBundleIdentifier;
    v6->_appBundleIdentifier = (NSString *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("AFUIApplicationSiriTaskDeliverer", v9);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v12 = dispatch_group_create();
    bKSAssertionSetupGroup = v6->_bKSAssertionSetupGroup;
    v6->_bKSAssertionSetupGroup = (OS_dispatch_group *)v12;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AFUIApplicationSiriTaskDeliverer _invalidateAssertionTimer](self, "_invalidateAssertionTimer");
  -[AFUIApplicationSiriTaskDeliverer _invalidateBackboardServices](self, "_invalidateBackboardServices");
  v3.receiver = self;
  v3.super_class = (Class)AFUIApplicationSiriTaskDeliverer;
  -[AFUIApplicationSiriTaskDeliverer dealloc](&v3, sel_dealloc);
}

- (void)_startAppStateMonitoringForRequest:(id)a3
{
  id v4;
  NSString *v5;
  id v6;
  void *v7;
  BKSApplicationStateMonitor *v8;
  BKSApplicationStateMonitor *appStateMonitor;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_appBundleIdentifier;
  v6 = objc_alloc((Class)getBKSApplicationStateMonitorClass());
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (BKSApplicationStateMonitor *)objc_msgSend(v6, "initWithBundleIDs:states:", v7, getBKSApplicationStateAll());
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = v8;

  if (self->_appStateMonitor)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__AFUIApplicationSiriTaskDeliverer__startAppStateMonitoringForRequest___block_invoke;
    v12[3] = &unk_1E3A33960;
    v13 = v4;
    v10 = (void *)MEMORY[0x1A1AC0C3C](v12);
    -[BKSApplicationStateMonitor setHandler:](self->_appStateMonitor, "setHandler:", v10);
    -[BKSApplicationStateMonitor applicationInfoForApplication:completion:](self->_appStateMonitor, "applicationInfoForApplication:completion:", v5, v10);

  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFUIApplicationSiriTaskDeliverer _startAppStateMonitoringForRequest:]";
      _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Unable to start app state monitoring because BKSApplicationStateMonitor is nil.", buf, 0xCu);
    }
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; %@>"),
                       objc_opt_class(),
                       self,
                       self->_appBundleIdentifier);
}

- (void)_processAssertionWasInvalidatedForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  BKSApplicationStateMonitor *appStateMonitor;
  id v7;
  void *v8;
  BKSApplicationStateMonitor *v9;
  BKSApplicationStateMonitor *v10;
  NSObject *v11;
  NSString *v12;
  id v13;
  BKSProcessAssertion *bKSAssertionForBgLaunch;
  _QWORD v15[5];
  id v16;
  NSString *appBundleIdentifier;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]";
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s BKS assertion was unexpectedly dropped", buf, 0xCu);
  }
  appStateMonitor = self->_appStateMonitor;
  if (!appStateMonitor)
  {
    v7 = objc_alloc((Class)getBKSApplicationStateMonitorClass());
    appBundleIdentifier = self->_appBundleIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &appBundleIdentifier, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (BKSApplicationStateMonitor *)objc_msgSend(v7, "initWithBundleIDs:states:", v8, getBKSApplicationStateAll());
    v10 = self->_appStateMonitor;
    self->_appStateMonitor = v9;

    appStateMonitor = self->_appStateMonitor;
    if (!appStateMonitor)
    {
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]";
        _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Unable to restart app state monitoring because BKSApplicationStateMonitor is nil.", buf, 0xCu);
        appStateMonitor = self->_appStateMonitor;
      }
      else
      {
        appStateMonitor = 0;
      }
    }
  }
  v12 = self->_appBundleIdentifier;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__AFUIApplicationSiriTaskDeliverer__processAssertionWasInvalidatedForRequest___block_invoke;
  v15[3] = &unk_1E3A33988;
  v15[4] = self;
  v16 = v4;
  v13 = v4;
  -[BKSApplicationStateMonitor applicationInfoForApplication:completion:](appStateMonitor, "applicationInfoForApplication:completion:", v12, v15);
  -[AFUIApplicationSiriTaskDeliverer _invalidateAssertionTimer](self, "_invalidateAssertionTimer");
  bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
  self->_bKSAssertionForBgLaunch = 0;

}

- (void)processAssertionWasInvalidatedForRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__AFUIApplicationSiriTaskDeliverer_processAssertionWasInvalidatedForRequest___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_processAssertionWasAcquired:(BOOL)a3
{
  double v4;
  NSString *v5;
  BKSApplicationStateMonitor *v6;
  AFWatchdogTimer *v7;
  OS_dispatch_queue *queue;
  NSString *v9;
  BKSApplicationStateMonitor *v10;
  uint64_t v11;
  id *p_assertionTimer;
  AFWatchdogTimer *assertionTimer;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NSString *v19;
  BKSApplicationStateMonitor *v20;
  id v21[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = AFPreferencesSiriTaskBackgroundAssertionTimeout();
    v5 = self->_appBundleIdentifier;
    objc_initWeak(location, self);
    v6 = self->_appStateMonitor;
    v7 = [AFWatchdogTimer alloc];
    queue = self->_queue;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke;
    v18 = &unk_1E3A339B0;
    v9 = v5;
    v19 = v9;
    v21[1] = *(id *)&v4;
    v10 = v6;
    v20 = v10;
    objc_copyWeak(v21, location);
    v11 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v7, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, &v15, v4);
    assertionTimer = self->_assertionTimer;
    p_assertionTimer = (id *)&self->_assertionTimer;
    *p_assertionTimer = (id)v11;

    objc_msgSend(*p_assertionTimer, "start", v15, v16, v17, v18);
    objc_destroyWeak(v21);

    objc_destroyWeak(location);
  }
  else
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]";
      _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Could not acquire BKS assertion", (uint8_t *)location, 0xCu);
    }
    -[AFUIApplicationSiriTaskDeliverer _invalidateBackboardServices](self, "_invalidateBackboardServices");
  }
}

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSString *appBundleIdentifier;
  void *v22;
  void *v23;
  NSString *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  char v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id UISiriTaskActionClass;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)getUISiriTaskActionClass()), "initWithPayload:", v6);
  if (v8)
  {
    objc_msgSend(v6, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIApplicationSiriTaskDeliverer _startAppStateMonitoringForRequest:](self, "_startAppStateMonitoringForRequest:", v9);
    v10 = objc_msgSend(v9, "_makeAppFrontmost") ^ 1;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    getFBSOpenApplicationOptionKeyActions();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v37 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, v12);

    }
    getFBSOpenApplicationOptionKeyActivateSuspended();
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v15, v14);

    }
    v30 = v10;
    getFBSOpenApplicationOptionKeyUnlockDevice();
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v16);
    v31 = (void *)v16;
    getFBSOpenApplicationOptionKeyPromptUnlockDevice();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v17);
    v32 = (void *)v14;
    dispatch_group_enter((dispatch_group_t)self->_bKSAssertionSetupGroup);
    objc_msgSend(getFBSOpenApplicationServiceClass(), "serviceWithDefaultShellEndpoint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v29 = v12;
      v19 = v8;
      v20 = v6;
      appBundleIdentifier = self->_appBundleIdentifier;
      objc_msgSend(getFBSOpenApplicationOptionsClass(), "optionsWithDictionary:", v11);
      v22 = v11;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke;
      v33[3] = &unk_1E3A33A00;
      v33[4] = self;
      v35 = v7;
      v36 = v30;
      v34 = v9;
      v24 = appBundleIdentifier;
      v6 = v20;
      v8 = v19;
      v12 = v29;
      objc_msgSend(v18, "openApplication:withOptions:completion:", v24, v23, v33);

    }
    else
    {
      v22 = v11;
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[AFUIApplicationSiriTaskDeliverer deliverSiriTask:completionHandler:]";
        v40 = 2112;
        v41 = (uint64_t)v6;
        _os_log_error_impl(&dword_19AF50000, v26, OS_LOG_TYPE_ERROR, "%s Unable to launch apps because FBSOpenApplicationService is nil %@", buf, 0x16u);
      }
      +[AFError errorWithCode:](AFError, "errorWithCode:", 13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v27);

    }
  }
  else
  {
    v25 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      if (UIKitLibrary_sOnce != -1)
        dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_129);
      *(_DWORD *)buf = 136315650;
      v39 = "-[AFUIApplicationSiriTaskDeliverer deliverSiriTask:completionHandler:]";
      v40 = 2050;
      v41 = UIKitLibrary_sLib;
      v42 = 2114;
      UISiriTaskActionClass = getUISiriTaskActionClass();
      v28 = UISiriTaskActionClass;
      _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, "%s Couldn't create a SiriTask action %{public}p %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 705, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }

}

- (void)siriTaskDidFinish
{
  NSObject *v3;
  NSObject *bKSAssertionSetupGroup;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[AFUIApplicationSiriTaskDeliverer siriTaskDidFinish]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  bKSAssertionSetupGroup = self->_bKSAssertionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AFUIApplicationSiriTaskDeliverer_siriTaskDidFinish__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_group_notify(bKSAssertionSetupGroup, queue, block);
}

- (void)_handleSuccessfulAppLaunchToBackground:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  uint64_t v11;
  NSString *appBundleIdentifier;
  uint64_t v13;
  BKSProcessAssertion **p_bKSAssertionForBgLaunch;
  BKSProcessAssertion *bKSAssertionForBgLaunch;
  BKSProcessAssertion *v16;
  void *v17;
  void *v18;
  AFSiriTaskmaster **p_taskmaster;
  id WeakRetained;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  void (**v28)(_QWORD);
  id location;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v6)
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc((Class)getBKSProcessAssertionClass());
    v11 = MEMORY[0x1E0C809B0];
    appBundleIdentifier = self->_appBundleIdentifier;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke;
    v27[3] = &unk_1E3A34420;
    v27[4] = self;
    v28 = v9;
    v13 = objc_msgSend(v10, "initWithBundleIdentifier:flags:reason:name:withHandler:", appBundleIdentifier, 33, 4, CFSTR("SiriTaskDelivererBackground"), v27);
    bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
    p_bKSAssertionForBgLaunch = &self->_bKSAssertionForBgLaunch;
    *p_bKSAssertionForBgLaunch = (BKSProcessAssertion *)v13;

    v16 = *p_bKSAssertionForBgLaunch;
    if (*p_bKSAssertionForBgLaunch)
    {
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_3;
      v24[3] = &unk_1E3A33A28;
      objc_copyWeak(&v26, &location);
      v25 = v8;
      -[BKSProcessAssertion setInvalidationHandler:](v16, "setInvalidationHandler:", v24);

      objc_destroyWeak(&v26);
    }
    else
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFUIApplicationSiriTaskDeliverer _handleSuccessfulAppLaunchToBackground:forRequest:completion:]";
        v32 = 2112;
        v33 = v8;
        _os_log_error_impl(&dword_19AF50000, v23, OS_LOG_TYPE_ERROR, "%s Unable to take process assertion for background launch because BKSProcessAssertion is nil %@", buf, 0x16u);
      }
    }

    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v8, "_refId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    p_taskmaster = &self->_taskmaster;
    WeakRetained = objc_loadWeakRetained((id *)&self->_taskmaster);
    objc_msgSend(WeakRetained, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained((id *)p_taskmaster);
    objc_msgSend(v21, "taskmaster:didLaunchApplicationForRequestWithId:", v22, v18);

    v9[2](v9);
  }

}

- (void)_invalidateBackboardServices
{
  BKSApplicationStateMonitor *appStateMonitor;
  BKSProcessAssertion *bKSAssertionForBgLaunch;

  -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = 0;

  -[BKSProcessAssertion invalidate](self->_bKSAssertionForBgLaunch, "invalidate");
  bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
  self->_bKSAssertionForBgLaunch = 0;

}

- (void)_invalidateAssertionTimer
{
  AFWatchdogTimer *assertionTimer;

  -[AFWatchdogTimer cancel](self->_assertionTimer, "cancel");
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;

}

- (AFSiriTaskmaster)taskmaster
{
  return (AFSiriTaskmaster *)objc_loadWeakRetained((id *)&self->_taskmaster);
}

- (void)setTaskmaster:(id)a3
{
  objc_storeWeak((id *)&self->_taskmaster, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_taskmaster);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bKSAssertionSetupGroup, 0);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_bKSAssertionForBgLaunch, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

void __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_2;
  block[3] = &unk_1E3A356F8;
  block[4] = v2;
  v7 = a2;
  v6 = v3;
  dispatch_async(v4, block);

}

void __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "processAssertionWasInvalidatedForRequest:", *(_QWORD *)(a1 + 32));

}

uint64_t __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_processAssertionWasAcquired:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __53__AFUIApplicationSiriTaskDeliverer_siriTaskDidFinish__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertionTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBackboardServices");
}

void __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  char v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2;
  v25[3] = &unk_1E3A36E10;
  v25[4] = *(_QWORD *)(a1 + 32);
  v27 = *(id *)(a1 + 48);
  v6 = v4;
  v26 = v6;
  v7 = (void *)MEMORY[0x1A1AC0C3C](v25);
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getFBSOpenApplicationServiceErrorDomain();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;

      v6 = v13;
    }

  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v16 = *(NSObject **)(v14 + 48);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3;
  v19[3] = &unk_1E3A339D8;
  v20 = v6;
  v21 = v14;
  v24 = *(_BYTE *)(a1 + 56);
  v22 = v15;
  v23 = v7;
  v17 = v7;
  v18 = v6;
  dispatch_async(v16, v19);

}

uint64_t __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 40));
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

uint64_t __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 40), "_handleSuccessfulAppLaunchToBackground:forRequest:completion:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    v11 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]_block_invoke";
    v12 = 2114;
    v13 = v6;
    v14 = 2050;
    v15 = v7;
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s BKS assertion for %{public}@ timed out after %{public}.2f seconds", buf, 0x20u);
  }
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke_17;
  v8[3] = &unk_1E3A33960;
  v9 = v3;
  objc_msgSend(v4, "applicationInfoForApplication:completion:", v9, v8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_invalidateBackboardServices");

}

void __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]_block_invoke";
    v8 = 2114;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s After timing out, recipient %{public}@ state was %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

uint64_t __77__AFUIApplicationSiriTaskDeliverer_processAssertionWasInvalidatedForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAssertionWasInvalidatedForRequest:", *(_QWORD *)(a1 + 40));
}

void __78__AFUIApplicationSiriTaskDeliverer__processAssertionWasInvalidatedForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _LogAppStateInfo(v3);
  if (!v3
    || (getSBApplicationStateKey(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        _SafelyGetObject(v3, (uint64_t)v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5)
    || (v6 = objc_msgSend(v5, "unsignedIntValue"), v5, v6 <= 1))
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = 136315394;
      v14 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]_block_invoke";
      v15 = 2114;
      v16 = v12;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@ appears to have crashed", (uint8_t *)&v13, 0x16u);
    }
    +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_af_analyticsContextDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logEventWithType:context:", 505, v9);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("kAFAssistantErrorDomain"), 706, MEMORY[0x1E0C9AA70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(WeakRetained, "handleFailureOfRequest:error:atTime:", *(_QWORD *)(a1 + 40), v10, 0);

  }
}

void __71__AFUIApplicationSiriTaskDeliverer__startAppStateMonitoringForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(id *)(a1 + 32);
  _LogAppStateInfo(v11);
  objc_msgSend(v3, "_af_analyticsContextDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  getSBApplicationStateKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SafelyGetObject(v11, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AFDescriptionOfBKSApplicationState(objc_msgSend(v6, "unsignedIntValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("appState"));

  getBKSApplicationStateAppIsFrontmostKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SafelyGetObject(v11, (uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("appIsFrontmost"));
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 504, v4);

}

@end
