@implementation NWSystemPathMonitor

- (NWSystemPathMonitor)init
{
  NWSystemPathMonitor *v2;
  NWSystemPathMonitor *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NWSystemPathMonitor *v9;
  void *v10;
  id v11;
  void *v12;
  NWSystemPathMonitor *v13;
  objc_class *v14;
  void *v15;
  id v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  char *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  os_log_type_t v23;
  void *v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  char *backtrace_string;
  os_log_type_t v30;
  _BOOL4 v31;
  os_log_type_t v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  NWSystemPathMonitor *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  char v40;
  os_log_type_t type;
  objc_super v42;
  _BYTE location[12];
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)NWSystemPathMonitor;
  v2 = -[NWSystemPathMonitor init](&v42, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446210;
    *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
    v26 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v40 = 0;
    if (__nwlog_fault(v26, &type, &v40))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_182FBE000, v27, v28, "%{public}s [super init] failed", location, 0xCu);
        }
      }
      else if (v40)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v30 = type;
        v31 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)location = 136446466;
            *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
            v44 = 2082;
            v45 = (const __CFString *)backtrace_string;
            _os_log_impl(&dword_182FBE000, v27, v30, "%{public}s [super init] failed, dumping backtrace:%{public}s", location, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_50;
        }
        if (v31)
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_182FBE000, v27, v30, "%{public}s [super init] failed, no backtrace", location, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        v32 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)location = 136446210;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          _os_log_impl(&dword_182FBE000, v27, v32, "%{public}s [super init] failed, backtrace limit exceeded", location, 0xCu);
        }
      }

    }
LABEL_50:
    if (v26)
      free(v26);
    goto LABEL_32;
  }
  if (init_onceToken[0] != -1)
    dispatch_once(init_onceToken, &__block_literal_global);
  if (!init_hasDelegateEntitlement)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)location = 136446722;
    *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
    v44 = 2114;
    v45 = CFSTR("com.apple.private.network.socket-delegate");
    v46 = 2114;
    v47 = v15;
    v17 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v40 = 0;
    if (__nwlog_fault(v17, &type, &v40))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v19 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)location = 136446722;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          v44 = 2114;
          v45 = CFSTR("com.apple.private.network.socket-delegate");
          v46 = 2114;
          v47 = v15;
          _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API", location, 0x20u);
        }
      }
      else if (v40)
      {
        v20 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v21 = type;
        v22 = os_log_type_enabled(v18, type);
        if (v20)
        {
          if (v22)
          {
            *(_DWORD *)location = 136446978;
            *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
            v44 = 2114;
            v45 = CFSTR("com.apple.private.network.socket-delegate");
            v46 = 2114;
            v47 = v15;
            v48 = 2082;
            v49 = v20;
            _os_log_impl(&dword_182FBE000, v18, v21, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, dumping backtrace:%{public}s", location, 0x2Au);
          }

          free(v20);
          if (!v17)
            goto LABEL_31;
          goto LABEL_30;
        }
        if (v22)
        {
          *(_DWORD *)location = 136446722;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          v44 = 2114;
          v45 = CFSTR("com.apple.private.network.socket-delegate");
          v46 = 2114;
          v47 = v15;
          _os_log_impl(&dword_182FBE000, v18, v21, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, no backtrace", location, 0x20u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v23 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)location = 136446722;
          *(_QWORD *)&location[4] = "-[NWSystemPathMonitor init]";
          v44 = 2114;
          v45 = CFSTR("com.apple.private.network.socket-delegate");
          v46 = 2114;
          v47 = v15;
          _os_log_impl(&dword_182FBE000, v18, v23, "%{public}s This process does not have the %{public}@ entitlement required to use the %{public}@ API, backtrace limit exceeded", location, 0x20u);
        }
      }

    }
    if (!v17)
    {
LABEL_31:

LABEL_32:
      v13 = 0;
      goto LABEL_33;
    }
LABEL_30:
    free(v17);
    goto LABEL_31;
  }
  -[NWSystemPathMonitor setVpnNotifyToken:](v2, "setVpnNotifyToken:", 0xFFFFFFFFLL);
  -[NWSystemPathMonitor setSymptomsNotifyToken:](v2, "setSymptomsNotifyToken:", 0xFFFFFFFFLL);
  v3 = v2;
  objc_sync_enter(v3);
  -[NWSystemPathMonitor registerForVPNNotifications](v3, "registerForVPNNotifications");
  -[NWSystemPathMonitor registerForSymptomsFallbackNotification](v3, "registerForSymptomsFallbackNotification");
  -[NWSystemPathMonitor updateVPNMonitor](v3, "updateVPNMonitor");
  +[NWPathEvaluator sharedDefaultEvaluator](NWPathEvaluator, "sharedDefaultEvaluator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWSystemPathMonitor setPrimaryEvaluator:](v3, "setPrimaryEvaluator:", v4);

  -[NWSystemPathMonitor primaryEvaluator](v3, "primaryEvaluator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v3, CFSTR("path"), 5, 0);

  objc_initWeak((id *)location, v3);
  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v6 = (id)NWCopyInternalQueue_nwQueue;
  v7 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __27__NWSystemPathMonitor_init__block_invoke_4;
  v38[3] = &unk_1E14A49C0;
  objc_copyWeak(&v39, (id *)location);
  -[NWSystemPathMonitor setFallbackWatcher:](v3, "setFallbackWatcher:", tcp_connection_fallback_watcher_create(0, v6, v38));

  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v8 = (id)NWCopyInternalQueue_nwQueue;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __27__NWSystemPathMonitor_init__block_invoke_2;
  v35[3] = &unk_1E1499B88;
  v9 = v3;
  v36 = v9;
  objc_copyWeak(&v37, (id *)location);
  network_config_mptcp_watcher_create((uint64_t)v8, (uint64_t)v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWSystemPathMonitor setMptcpWatcher:](v9, "setMptcpWatcher:", v10);

  if (NWCopyInternalQueue_init_once != -1)
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
  v11 = (id)NWCopyInternalQueue_nwQueue;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __27__NWSystemPathMonitor_init__block_invoke_7;
  v33[3] = &unk_1E149C288;
  objc_copyWeak(&v34, (id *)location);
  nw_interface_use_observer_create("com.apple.network.interface_use.airdrop", v11, v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWSystemPathMonitor setInterfaceUseObserver:](v9, "setInterfaceUseObserver:", v12);

  -[NWSystemPathMonitor updateFlags](v9, "updateFlags");
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)location);
  objc_sync_exit(v9);

  v13 = v9;
LABEL_33:

  return v13;
}

- (void)dealloc
{
  NWSystemPathMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NWSystemPathMonitor vpnNotifyToken](v2, "vpnNotifyToken") != -1)
  {
    notify_cancel(-[NWSystemPathMonitor vpnNotifyToken](v2, "vpnNotifyToken"));
    -[NWSystemPathMonitor setVpnNotifyToken:](v2, "setVpnNotifyToken:", 0xFFFFFFFFLL);
  }
  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:", v2, CFSTR("status"));

    -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", 0);
  }
  if (-[NWSystemPathMonitor symptomsNotifyToken](v2, "symptomsNotifyToken") != -1)
  {
    notify_cancel(-[NWSystemPathMonitor symptomsNotifyToken](v2, "symptomsNotifyToken"));
    -[NWSystemPathMonitor setSymptomsNotifyToken:](v2, "setSymptomsNotifyToken:", 0xFFFFFFFFLL);
  }
  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:", v2, CFSTR("path"));

    -[NWSystemPathMonitor setPrimaryEvaluator:](v2, "setPrimaryEvaluator:", 0);
  }
  -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[NWSystemPathMonitor setSmoothingTimer:](v2, "setSmoothingTimer:", 0);
  }
  if (-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher"))
  {
    tcp_connection_fallback_watcher_destroy((uint64_t)-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher"));
    -[NWSystemPathMonitor setFallbackWatcher:](v2, "setFallbackWatcher:", 0);
  }
  -[NWSystemPathMonitor mptcpWatcher](v2, "mptcpWatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NWSystemPathMonitor mptcpWatcher](v2, "mptcpWatcher");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v10);

    -[NWSystemPathMonitor setMptcpWatcher:](v2, "setMptcpWatcher:", 0);
  }
  -[NWSystemPathMonitor interfaceUseObserver](v2, "interfaceUseObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NWSystemPathMonitor interfaceUseObserver](v2, "interfaceUseObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    nw_interface_use_observer_cancel(v12);

    -[NWSystemPathMonitor setInterfaceUseObserver:](v2, "setInterfaceUseObserver:", 0);
  }
  -[NWSystemPathMonitor stopWatchingApplicationStates](v2, "stopWatchingApplicationStates");
  objc_sync_exit(v2);

  v13.receiver = v2;
  v13.super_class = (Class)NWSystemPathMonitor;
  -[NWSystemPathMonitor dealloc](&v13, sel_dealloc);
}

- (void)updateFlags
{
  NWSystemPathMonitor *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  int v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 1)
  {
    v5 = 1;
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v54, 16);
    if (v7)
    {
      v8 = 0;
      v5 = 0;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "status") == 1)
          {
            objc_msgSend(v14, "genericNetworkAgentsWithDomain:type:", CFSTR("NetworkExtension"), CFSTR("AppVPN"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v5 |= v15 != 0;
            v8 |= objc_msgSend(v14, "usesInterfaceType:", 1);
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v54, 16);
      }
      while (v7);

      if ((v8 & 1) != 0)
      {
        v16 = 1;
        goto LABEL_16;
      }
    }
    else
    {

      v5 = 0;
    }
  }
  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v18, "usesInterfaceType:", 1);

LABEL_16:
  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "usesInterfaceType:", 3);

  -[NWSystemPathMonitor primaryEvaluator](v2, "primaryEvaluator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "genericNetworkAgentsWithDomain:type:", CFSTR("AVConference"), CFSTR("CellularFallback"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v16)
  {
    v26 = 0;
    goto LABEL_20;
  }
  if (tcp_fallback_watcher_fallback_inuse((uint64_t)-[NWSystemPathMonitor fallbackWatcher](v2, "fallbackWatcher")))
  {
    v16 = 0;
    v25 = " (due to cellular fallback)";
    v26 = 1;
    goto LABEL_21;
  }
  v16 = 0;
  if (-[NWSystemPathMonitor getSymptomsFallback](v2, "getSymptomsFallback"))
  {
    v25 = " (due to reverse cellular fallback)";
    v26 = 1;
    goto LABEL_21;
  }
  if (sMptcpUsesCell)
    v25 = " (due to MPTCP sending on Cell)";
  else
    v25 = " (due to cellular fallback from AVConference)";
  v26 = 1;
  if ((sMptcpUsesCell & 1) == 0 && !v24)
  {
    if (-[NWSystemPathMonitor interfaceInUse](v2, "interfaceInUse"))
    {
      v16 = 0;
      v25 = " (due to AirDrop using cellular)";
      goto LABEL_21;
    }
    v26 = 0;
    v16 = 1;
LABEL_20:
    v25 = "";
  }
LABEL_21:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v27 = (id)gLogObj;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    if (v26)
      v28 = "fallback: Wi-Fi shown ";
    else
      v28 = "primary: ";
    v29 = -[NWSystemPathMonitor isWiFiPrimary](v2, "isWiFiPrimary");
    v30 = -[NWSystemPathMonitor isEthernetPrimary](v2, "isEthernetPrimary");
    v31 = -[NWSystemPathMonitor isVPNActive](v2, "isVPNActive");
    *(_DWORD *)buf = 136448258;
    v37 = "-[NWSystemPathMonitor updateFlags]";
    v38 = 2082;
    v39 = v28;
    v40 = 1024;
    v41 = v29;
    v42 = 1024;
    v43 = v16;
    v44 = 2082;
    v45 = v25;
    v46 = 1024;
    v47 = v30;
    v48 = 1024;
    v49 = v21;
    v50 = 1024;
    v51 = v31;
    v52 = 1024;
    v53 = v5 & 1;
    _os_log_impl(&dword_182FBE000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s Wi-Fi %{public}s%{BOOL}d->%{BOOL}d%{public}s, Ethernet primary: %{BOOL}d->%{BOOL}d, VPN active: %{BOOL}d->%{BOOL}d", buf, 0x44u);
  }

  if ((_DWORD)v16 != -[NWSystemPathMonitor isWiFiPrimary](v2, "isWiFiPrimary"))
    -[NWSystemPathMonitor setWifiPrimary:](v2, "setWifiPrimary:", v16);
  if ((_DWORD)v21 != -[NWSystemPathMonitor isEthernetPrimary](v2, "isEthernetPrimary"))
    -[NWSystemPathMonitor setEthernetPrimary:](v2, "setEthernetPrimary:", v21);
  if ((v5 & 1) != -[NWSystemPathMonitor isVPNActive](v2, "isVPNActive"))
    -[NWSystemPathMonitor setVpnActive:](v2, "setVpnActive:");
  objc_sync_exit(v2);

}

- (void)eventFired
{
  NWSystemPathMonitor *v2;
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  v2 = self;
  objc_sync_enter(v2);
  -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v4 = (id)NWCopyInternalQueue_nwQueue;
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    -[NWSystemPathMonitor setSmoothingTimer:](v2, "setSmoothingTimer:", v5);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__NWSystemPathMonitor_eventFired__block_invoke;
    handler[3] = &unk_1E14ACFD0;
    handler[4] = v2;
    dispatch_source_set_event_handler(v6, handler);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, 200000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);

    -[NWSystemPathMonitor smoothingTimer](v2, "smoothingTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);

  }
  objc_sync_exit(v2);

}

- (void)appStateChangedWithUserInfo:(id)a3
{
  id v4;
  double v5;
  NWSystemPathMonitor *v6;
  double v7;
  double Helper_x8__BKSApplicationStateDisplayIDKey;
  uint64_t v9;
  void *v10;
  double v11;
  double Helper_x8__BKSApplicationStateProcessIDKey;
  uint64_t v13;
  void *v14;
  double v15;
  double Helper_x8__BKSApplicationStateKey;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NWParameters *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NWPathEvaluator *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  char *backtrace_string;
  os_log_type_t v39;
  _BOOL4 v40;
  os_log_type_t v41;
  const char *string;
  void *v43;
  char v44;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v29 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
    v30 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v44 = 0;
    if (__nwlog_fault((const char *)v30, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_182FBE000, v31, v32, "%{public}s called with null userInfo", buf, 0xCu);
        }
      }
      else if (v44)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        v39 = type;
        v40 = os_log_type_enabled(v31, type);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446466;
            v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
            v48 = 2082;
            v49 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v31, v39, "%{public}s called with null userInfo, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v30)
            goto LABEL_37;
LABEL_36:
          free(v30);
          goto LABEL_37;
        }
        if (v40)
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_182FBE000, v31, v39, "%{public}s called with null userInfo, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        v41 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          _os_log_impl(&dword_182FBE000, v31, v41, "%{public}s called with null userInfo, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v30)
      goto LABEL_37;
    goto LABEL_36;
  }
  gotLoadHelper_x8__OBJC_CLASS___BKSApplicationStateMonitor(v5);
  if (objc_opt_class())
  {
    v6 = self;
    objc_sync_enter(v6);
    Helper_x8__BKSApplicationStateDisplayIDKey = gotLoadHelper_x8__BKSApplicationStateDisplayIDKey(v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(_QWORD **)(v9 + 672), Helper_x8__BKSApplicationStateDisplayIDKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Helper_x8__BKSApplicationStateProcessIDKey = gotLoadHelper_x8__BKSApplicationStateProcessIDKey(v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(_QWORD **)(v13 + 720), Helper_x8__BKSApplicationStateProcessIDKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    Helper_x8__BKSApplicationStateKey = gotLoadHelper_x8__BKSApplicationStateKey(v15);
    objc_msgSend(v4, "objectForKeyedSubscript:", **(_QWORD **)(v17 + 696), Helper_x8__BKSApplicationStateKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "unsignedIntValue") == 8)
    {
      -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v22 = objc_alloc_init(NWParameters);
        -[NWParameters setPid:](v22, "setPid:", objc_msgSend(v14, "intValue"));
        -[NWParameters setSourceApplicationWithBundleID:](v22, "setSourceApplicationWithBundleID:", v10);
        objc_msgSend(v10, "UTF8String");
        v23 = (void *)NEHelperCopyPerAppDomains();
        v24 = v23;
        if (v23
          && object_getClass(v23) == (Class)MEMORY[0x1E0C812C8]
          && xpc_array_get_count(v24)
          && (string = xpc_array_get_string(v24, 0)) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[NWHostEndpoint endpointWithHostname:port:](NWHostEndpoint, "endpointWithHostname:port:", v43, CFSTR("0"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v26 = (id)gLogObj;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          v48 = 2114;
          v49 = (char *)v10;
          _os_log_impl(&dword_182FBE000, v26, OS_LOG_TYPE_INFO, "%{public}s Start watching path for foreground app %{public}@", buf, 0x16u);
        }

        v27 = -[NWPathEvaluator initWithEndpoint:parameters:]([NWPathEvaluator alloc], "initWithEndpoint:parameters:", v25, v22);
        -[NWPathEvaluator addObserver:forKeyPath:options:context:](v27, "addObserver:forKeyPath:options:context:", v6, CFSTR("path"), 5, 0);
        -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v10);

LABEL_21:
      }
    }
    else
    {
      -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v35 = (id)gLogObj;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "-[NWSystemPathMonitor appStateChangedWithUserInfo:]";
          v48 = 2114;
          v49 = (char *)v10;
          _os_log_impl(&dword_182FBE000, v35, OS_LOG_TYPE_INFO, "%{public}s Stop watching path for background app %{public}@", buf, 0x16u);
        }

        -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v10);
        v22 = (NWParameters *)objc_claimAutoreleasedReturnValue();

        -[NWParameters removeObserver:forKeyPath:](v22, "removeObserver:forKeyPath:", v6, CFSTR("path"));
        -[NWSystemPathMonitor perAppVPNEvaluators](v6, "perAppVPNEvaluators");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, v10);

        -[NWSystemPathMonitor eventFired](v6, "eventFired");
        goto LABEL_21;
      }
    }

    objc_sync_exit(v6);
  }
LABEL_37:

}

- (void)startWatchingApplicationStates
{
  uint64_t v2;
  NWSystemPathMonitor *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;

  v3 = self;
  objc_sync_enter(v3);
  -[NWSystemPathMonitor applicationMonitor](v3, "applicationMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    gotLoadHelper_x21__OBJC_CLASS___BKSApplicationStateMonitor(v5);
    if (objc_opt_class())
    {
      objc_initWeak(&location, v3);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWSystemPathMonitor setPerAppVPNEvaluators:](v3, "setPerAppVPNEvaluators:", v6);

      v7 = objc_alloc_init(*(Class *)(v2 + 760));
      -[NWSystemPathMonitor setApplicationMonitor:](v3, "setApplicationMonitor:", v7);

      v9 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v10, &location);
      -[NWSystemPathMonitor applicationMonitor](v3, "applicationMonitor", v9, 3221225472, __53__NWSystemPathMonitor_startWatchingApplicationStates__block_invoke, &unk_1E1499BB0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHandler:", &v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v3);

}

- (void)stopWatchingApplicationStates
{
  NWSystemPathMonitor *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[NWSystemPathMonitor applicationMonitor](v2, "applicationMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
          -[NWSystemPathMonitor perAppVPNEvaluators](v2, "perAppVPNEvaluators");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "removeObserver:forKeyPath:", v2, CFSTR("path"));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    -[NWSystemPathMonitor applicationMonitor](v2, "applicationMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[NWSystemPathMonitor setApplicationMonitor:](v2, "setApplicationMonitor:", 0);
  }
  objc_sync_exit(v2);

}

- (void)registerForVPNNotifications
{
  NSObject *v3;
  uint32_t v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  os_log_type_t v12;
  char v13;
  os_log_type_t type;
  _QWORD handler[4];
  id v16;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint32_t v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NWSystemPathMonitor vpnNotifyToken](self, "vpnNotifyToken") == -1)
  {
    out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v3 = (id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke;
    handler[3] = &unk_1E1499BD8;
    objc_copyWeak(&v16, &location);
    v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (!v4)
    {
      -[NWSystemPathMonitor setVpnNotifyToken:](self, "setVpnNotifyToken:", out_token);
      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
    v21 = 2082;
    v22 = "com.apple.neconfigurationchanged";
    v23 = 1024;
    v24 = v4;
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          v21 = 2082;
          v22 = "com.apple.neconfigurationchanged";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed", buf, 0x1Cu);
        }
      }
      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v10 = type;
        v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
            v21 = 2082;
            v22 = "com.apple.neconfigurationchanged";
            v23 = 1024;
            v24 = v4;
            v25 = 2082;
            v26 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v6)
            goto LABEL_13;
          goto LABEL_11;
        }
        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          v21 = 2082;
          v22 = "com.apple.neconfigurationchanged";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForVPNNotifications]";
          v21 = 2082;
          v22 = "com.apple.neconfigurationchanged";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v12, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded", buf, 0x1Cu);
        }
      }

    }
    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }
LABEL_11:
    free(v6);
    goto LABEL_13;
  }
}

- (void)updateVPNMonitor
{
  NWSystemPathMonitor *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NWParameters *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  NWNetworkDescription *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  char *backtrace_string;
  os_log_type_t v21;
  _BOOL4 v22;
  os_log_type_t v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_INFO, "%{public}s Update VPN monitor due to configuration change", buf, 0xCu);
  }

  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", v2, CFSTR("status"));

    -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", 0);
  }
  v6 = objc_alloc_init(NWParameters);
  v7 = ne_session_always_on_vpn_configs_present();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring Always-On VPN", buf, 0xCu);
    }
    v10 = CFSTR("AOVPN");
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s Monitoring system VPN", buf, 0xCu);
    }
    v10 = CFSTR("VPN");
  }

  -[NWParameters requireNetworkAgentWithDomain:type:](v6, "requireNetworkAgentWithDomain:type:", CFSTR("NetworkExtension"), v10);
  v11 = objc_alloc_init(NWNetworkDescription);
  +[NWMonitor monitorWithNetworkDescription:endpoint:parameters:](NWMonitor, "monitorWithNetworkDescription:endpoint:parameters:", v11, 0, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWSystemPathMonitor setVpnMonitor:](v2, "setVpnMonitor:", v12);

  -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v13 == 0;

  if (!(_DWORD)v11)
  {
    -[NWSystemPathMonitor vpnMonitor](v2, "vpnMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v2, CFSTR("status"), 5, 0);

    if (ne_session_app_vpn_configs_present())
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
        _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_INFO, "%{public}s Monitoring Per-App VPN", buf, 0xCu);
      }

      -[NWSystemPathMonitor startWatchingApplicationStates](v2, "startWatchingApplicationStates");
    }
    else
    {
      -[NWSystemPathMonitor stopWatchingApplicationStates](v2, "stopWatchingApplicationStates");
    }
    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v16 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
  v17 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (!__nwlog_fault(v17, &type, &v24))
    goto LABEL_35;
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v19 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_182FBE000, v18, v19, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed", buf, 0xCu);
    }
LABEL_34:

LABEL_35:
    if (!v17)
      goto LABEL_37;
LABEL_36:
    free(v17);
    goto LABEL_37;
  }
  if (!v24)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    v23 = type;
    if (os_log_type_enabled(v18, type))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_182FBE000, v18, v23, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_34;
  }
  backtrace_string = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v18 = (id)gLogObj;
  v21 = type;
  v22 = os_log_type_enabled(v18, type);
  if (!backtrace_string)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
      _os_log_impl(&dword_182FBE000, v18, v21, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, no backtrace", buf, 0xCu);
    }
    goto LABEL_34;
  }
  if (v22)
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[NWSystemPathMonitor updateVPNMonitor]";
    v28 = 2082;
    v29 = backtrace_string;
    _os_log_impl(&dword_182FBE000, v18, v21, "%{public}s monitorWithNetworkDescription:endpoint:parameters: failed, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(backtrace_string);
  if (v17)
    goto LABEL_36;
LABEL_37:

  objc_sync_exit(v2);
}

- (void)registerForSymptomsFallbackNotification
{
  NSObject *v3;
  uint32_t v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char *backtrace_string;
  os_log_type_t v10;
  _BOOL4 v11;
  os_log_type_t v12;
  char v13;
  os_log_type_t type;
  _QWORD handler[4];
  id v16;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint32_t v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken") == -1)
  {
    out_token = -1;
    objc_initWeak(&location, self);
    if (NWCopyInternalQueue_init_once != -1)
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
    v3 = (id)NWCopyInternalQueue_nwQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke;
    handler[3] = &unk_1E1499BD8;
    objc_copyWeak(&v16, &location);
    v4 = notify_register_dispatch("com.apple.symptoms.celloutrankeffective", &out_token, v3, handler);

    if (!v4)
    {
      -[NWSystemPathMonitor setSymptomsNotifyToken:](self, "setSymptomsNotifyToken:", out_token);
      goto LABEL_13;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
    v21 = 2082;
    v22 = "com.apple.symptoms.celloutrankeffective";
    v23 = 1024;
    v24 = v4;
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v13 = 0;
    if (__nwlog_fault(v6, &type, &v13))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          v21 = 2082;
          v22 = "com.apple.symptoms.celloutrankeffective";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed", buf, 0x1Cu);
        }
      }
      else if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v10 = type;
        v11 = os_log_type_enabled(v7, type);
        if (backtrace_string)
        {
          if (v11)
          {
            *(_DWORD *)buf = 136446978;
            v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
            v21 = 2082;
            v22 = "com.apple.symptoms.celloutrankeffective";
            v23 = 1024;
            v24 = v4;
            v25 = 2082;
            v26 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v6)
            goto LABEL_13;
          goto LABEL_11;
        }
        if (v11)
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          v21 = 2082;
          v22 = "com.apple.symptoms.celloutrankeffective";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v10, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v12 = type;
        if (os_log_type_enabled(v7, type))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "-[NWSystemPathMonitor registerForSymptomsFallbackNotification]";
          v21 = 2082;
          v22 = "com.apple.symptoms.celloutrankeffective";
          v23 = 1024;
          v24 = v4;
          _os_log_impl(&dword_182FBE000, v7, v12, "%{public}s notify_register_dispatch(%{public}s) [status %u] failed, backtrace limit exceeded", buf, 0x1Cu);
        }
      }

    }
    if (!v6)
    {
LABEL_13:
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      return;
    }
LABEL_11:
    free(v6);
    goto LABEL_13;
  }
}

- (BOOL)getSymptomsFallback
{
  uint32_t state;
  uint32_t v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v12;
  _BOOL4 v13;
  NSObject *v14;
  os_log_type_t v15;
  char v16;
  os_log_type_t type;
  uint64_t state64;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint32_t v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken") == -1)
    return 0;
  state64 = 0;
  state = notify_get_state(-[NWSystemPathMonitor symptomsNotifyToken](self, "symptomsNotifyToken"), &state64);
  if (!state)
    return state64 != 0;
  v4 = state;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
  v21 = 1024;
  v22 = v4;
  v6 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_20;
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      v21 = 1024;
      v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed";
LABEL_18:
      v14 = v7;
      v15 = v8;
      goto LABEL_19;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_20;
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      v21 = 1024;
      v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed, backtrace limit exceeded";
      goto LABEL_18;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    v12 = type;
    v13 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v13)
      {
LABEL_20:

        if (!v6)
          return 0;
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136446466;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      v21 = 1024;
      v22 = v4;
      v9 = "%{public}s notify_get_state [%u] failed, no backtrace";
      v14 = v7;
      v15 = v12;
LABEL_19:
      _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0x12u);
      goto LABEL_20;
    }
    if (v13)
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[NWSystemPathMonitor getSymptomsFallback]";
      v21 = 1024;
      v22 = v4;
      v23 = 2082;
      v24 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v7, v12, "%{public}s notify_get_state [%u] failed, dumping backtrace:%{public}s", buf, 0x1Cu);
    }

    free(backtrace_string);
  }
  if (v6)
LABEL_14:
    free(v6);
  return 0;
}

- (BOOL)isWiFiPrimary
{
  return self->_wifiPrimary;
}

- (void)setWifiPrimary:(BOOL)a3
{
  self->_wifiPrimary = a3;
}

- (BOOL)isEthernetPrimary
{
  return self->_ethernetPrimary;
}

- (void)setEthernetPrimary:(BOOL)a3
{
  self->_ethernetPrimary = a3;
}

- (BOOL)isVPNActive
{
  return self->_vpnActive;
}

- (void)setVpnActive:(BOOL)a3
{
  self->_vpnActive = a3;
}

- (NWMonitor)vpnMonitor
{
  return (NWMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVpnMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NWPathEvaluator)primaryEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrimaryEvaluator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)vpnNotifyToken
{
  return self->_vpnNotifyToken;
}

- (void)setVpnNotifyToken:(int)a3
{
  self->_vpnNotifyToken = a3;
}

- (int)symptomsNotifyToken
{
  return self->_symptomsNotifyToken;
}

- (void)setSymptomsNotifyToken:(int)a3
{
  self->_symptomsNotifyToken = a3;
}

- (BKSApplicationStateMonitor)applicationMonitor
{
  return (BKSApplicationStateMonitor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)perAppVPNEvaluators
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPerAppVPNEvaluators:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)smoothingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSmoothingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)fallbackWatcher
{
  return self->_fallbackWatcher;
}

- (void)setFallbackWatcher:(void *)a3
{
  self->_fallbackWatcher = a3;
}

- (OS_dispatch_source)mptcpWatcher
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMptcpWatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_nw_interface_use_observer)interfaceUseObserver
{
  return (OS_nw_interface_use_observer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInterfaceUseObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)interfaceInUse
{
  return self->_interfaceInUse;
}

- (void)setInterfaceInUse:(BOOL)a3
{
  self->_interfaceInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceUseObserver, 0);
  objc_storeStrong((id *)&self->_mptcpWatcher, 0);
  objc_storeStrong((id *)&self->_smoothingTimer, 0);
  objc_storeStrong((id *)&self->_perAppVPNEvaluators, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_primaryEvaluator, 0);
  objc_storeStrong((id *)&self->_vpnMonitor, 0);
}

void __62__NWSystemPathMonitor_registerForSymptomsFallbackNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventFired");

}

void __50__NWSystemPathMonitor_registerForVPNNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVPNMonitor");

}

void __53__NWSystemPathMonitor_startWatchingApplicationStates__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "appStateChangedWithUserInfo:", v3);

}

uint64_t __33__NWSystemPathMonitor_eventFired__block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "smoothingTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "setSmoothingTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateFlags");
}

void __27__NWSystemPathMonitor_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventFired");

}

void __27__NWSystemPathMonitor_init__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v8 = "-[NWSystemPathMonitor init]_block_invoke_2";
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_ERROR, "%{public}s Error: %d, destroying the MPTCP-watcher", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "mptcpWatcher");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    objc_msgSend(*(id *)(a1 + 32), "setMptcpWatcher:", 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "eventFired");

  }
}

void __27__NWSystemPathMonitor_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setInterfaceInUse:", a2);
    objc_msgSend(v4, "eventFired");
    WeakRetained = v4;
  }

}

BOOL __27__NWSystemPathMonitor_init__block_invoke()
{
  _BOOL8 result;

  result = NWUtilsCurrentProcessHasEntitlement(CFSTR("com.apple.private.network.socket-delegate"));
  init_hasDelegateEntitlement = result;
  return result;
}

+ (id)sharedSystemPathMonitor
{
  if (sharedSystemPathMonitor_initEvaluator != -1)
    dispatch_once(&sharedSystemPathMonitor_initEvaluator, &__block_literal_global_9);
  return (id)sharedSystemPathMonitor_sharedEvaluator;
}

void __46__NWSystemPathMonitor_sharedSystemPathMonitor__block_invoke()
{
  NWSystemPathMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(NWSystemPathMonitor);
  v1 = (void *)sharedSystemPathMonitor_sharedEvaluator;
  sharedSystemPathMonitor_sharedEvaluator = (uint64_t)v0;

}

@end
