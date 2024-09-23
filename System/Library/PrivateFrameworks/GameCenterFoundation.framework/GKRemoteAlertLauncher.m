@implementation GKRemoteAlertLauncher

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  return (id)shared_sharedInstance;
}

void __31__GKRemoteAlertLauncher_shared__block_invoke()
{
  GKRemoteAlertLauncher *v0;
  void *v1;

  v0 = objc_alloc_init(GKRemoteAlertLauncher);
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;

}

- (GKRemoteAlertLauncher)init
{
  GKRemoteAlertLauncher *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKRemoteAlertLauncher;
  v2 = -[GKRemoteAlertLauncher init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.gamed.remoteAlertQueue", 0);
    -[GKRemoteAlertLauncher setQueue:](v2, "setQueue:", v3);

  }
  return v2;
}

- (void)startLaunchTimeoutTimer
{
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD handler[5];

  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v4 = dispatch_walltime(0, 5000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__GKRemoteAlertLauncher_startLaunchTimeoutTimer__block_invoke;
  handler[3] = &unk_1E75B1590;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer started.", v7, 2u);
  }
  dispatch_resume(v3);
  -[GKRemoteAlertLauncher setLaunchTimeoutTimer:](self, "setLaunchTimeoutTimer:", v3);

}

void __48__GKRemoteAlertLauncher_startLaunchTimeoutTimer__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer fired. Did the dashboard successfully launch? GKRemoteAlertLauncher.isLaunching is set to %d", (uint8_t *)v5, 8u);
  }
}

- (void)notifyDashboardDidLaunch
{
  id v3;
  NSObject *v4;
  _BOOL4 isLaunching;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_isLaunching = 0;
  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    isLaunching = self->_isLaunching;
    v6[0] = 67109120;
    v6[1] = isLaunching;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: notifyDashboardDidLaunch -> GKRemoteAlertLauncher.isLaunching is set to %d", (uint8_t *)v6, 8u);
  }
  -[GKRemoteAlertLauncher cancelLaunchTimeoutTimer](self, "cancelLaunchTimeoutTimer");
}

- (void)cancelLaunchTimeoutTimer
{
  id v3;
  NSObject *v4;
  NSObject *launchTimeoutTimer;
  uint8_t v6[16];

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: _launchTimeoutTimer cancelled.", v6, 2u);
  }
  launchTimeoutTimer = self->_launchTimeoutTimer;
  if (launchTimeoutTimer)
    dispatch_source_cancel(launchTimeoutTimer);
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[GKRemoteAlertLauncher dealloc]";
    _os_log_impl(&dword_1BCDE3000, v4, OS_LOG_TYPE_INFO, "RemoteAlert: %s", buf, 0xCu);
  }
  -[GKRemoteAlertLauncher cancelLaunchTimeoutTimer](self, "cancelLaunchTimeoutTimer");
  v5.receiver = self;
  v5.super_class = (Class)GKRemoteAlertLauncher;
  -[GKRemoteAlertLauncher dealloc](&v5, sel_dealloc);
}

- (void)launchBypassingPreAuthentication:(BOOL)a3 forGame:(id)a4 hostPID:(int)a5 deeplink:(id)a6 launchContext:(id)a7 observer:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 isLaunching;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _BOOL4 v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  _QWORD v48[4];
  uint8_t buf[4];
  _BOOL4 v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v11 = *(_QWORD *)&a5;
  v43 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v44 = a6;
  v14 = a7;
  v45 = a8;
  if (!os_log_GKGeneral)
    v15 = GKOSLoggers();
  v16 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    objc_msgSend(v13, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v19 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    v50 = v43;
    v51 = 2112;
    v52 = v18;
    v53 = 2112;
    v54 = v20;
    v55 = 2112;
    v56 = v44;
    v57 = 2112;
    v58 = v14;
    v59 = 2112;
    v60 = v45;
    _os_log_impl(&dword_1BCDE3000, v17, OS_LOG_TYPE_INFO, "RemoteAlert: launchBypassingPreAuthentication:%d\n forGame:%@\n hostPID:%@\n deeplink:%@\n launchContext:%@\n observer:%@", buf, 0x3Au);

    v13 = v19;
  }
  self->_isLaunching = 1;
  if (!os_log_GKGeneral)
    v21 = GKOSLoggers();
  v22 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    isLaunching = self->_isLaunching;
    *(_DWORD *)buf = 67109120;
    v50 = isLaunching;
    _os_log_impl(&dword_1BCDE3000, v22, OS_LOG_TYPE_INFO, "RemoteAlert: GKRemoteAlertLauncher.isLaunching is set to %d", buf, 8u);
  }
  -[GKRemoteAlertLauncher cancelLaunchTimeoutTimer](self, "cancelLaunchTimeoutTimer");
  -[GKRemoteAlertLauncher startLaunchTimeoutTimer](self, "startLaunchTimeoutTimer");
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v46;
  if (v25)
  {
    if (!os_log_GKGeneral)
      v26 = GKOSLoggers();
    v27 = os_log_GKError;
    v28 = v44;
    v29 = v45;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      -[GKRemoteAlertLauncher launchBypassingPreAuthentication:forGame:hostPID:deeplink:launchContext:observer:].cold.1((uint64_t)v25, v27);
  }
  else
  {
    v42 = v13;
    v48[0] = v24;
    v47[0] = CFSTR("serialized-game");
    v47[1] = CFSTR("host-pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v30;
    v47[2] = CFSTR("bypass-pre-authentication");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = CFSTR("dashboard-launch-context");
    v48[2] = v31;
    v48[3] = v14;
    v32 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");

    v28 = v44;
    if (v44)
    {
      objc_msgSend(v44, "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36)
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v44, CFSTR("deeplink"));
    }
    v37 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    objc_msgSend(v37, "setUserInfo:", v34);
    v38 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    objc_msgSend(v38, "setUserInfo:", v34);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.GameCenterRemoteAlert"), CFSTR("GKRemoteAlertViewController"));
    objc_msgSend(MEMORY[0x1E0DAAF88], "lookupHandlesForDefinition:creatingIfNone:configurationContext:", v39, 1, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v45;
    if (v45)
      objc_msgSend(v41, "registerObserver:", v45);
    objc_msgSend(v41, "activateWithContext:", v38);

    v13 = v42;
    v14 = v32;
  }

}

- (BOOL)isLaunching
{
  return self->_isLaunching;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)launchTimeoutTimer
{
  return self->_launchTimeoutTimer;
}

- (void)setLaunchTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_launchTimeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)launchBypassingPreAuthentication:(uint64_t)a1 forGame:(NSObject *)a2 hostPID:deeplink:launchContext:observer:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "RemoteAlert: Could not activate the remote alert due to archiving error=%@", (uint8_t *)&v2, 0xCu);
}

@end
