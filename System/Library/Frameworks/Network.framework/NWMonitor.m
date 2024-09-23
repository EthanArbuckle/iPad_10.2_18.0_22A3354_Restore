@implementation NWMonitor

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("status")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("bestAvailableNetworkDescription")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWMonitor;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)savedMonitors;
    savedMonitors = v2;

    v4 = objc_opt_new();
    v5 = (void *)savedMonitorsLock;
    savedMonitorsLock = v4;

  }
}

+ (id)copySavedMonitorForNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (id)savedMonitorsLock;
  objc_sync_enter(v10);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)savedMonitors;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "matchesNetworkDescriptionArray:endpoint:parameters:", v7, v8, v9, (_QWORD)v17))
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v10);
  return v12;
}

+ (void)saveMonitor:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)savedMonitorsLock;
  objc_sync_enter(v3);
  ++saveMonitor__sMonitorID;
  objc_msgSend(v4, "setMID:");
  objc_msgSend((id)savedMonitors, "addObject:", v4);
  objc_sync_exit(v3);

}

+ (NWMonitor)monitorWithNetworkDescription:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  NSObject *v22;
  os_log_type_t v23;
  char v24;
  os_log_type_t type;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (__nwlog_fault(v14, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (!os_log_type_enabled(v15, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        v17 = "%{public}s called with null networkDescription";
LABEL_18:
        v22 = v15;
        v23 = v16;
        goto LABEL_19;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (!os_log_type_enabled(v15, type))
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        v17 = "%{public}s called with null networkDescription, backtrace limit exceeded";
        goto LABEL_18;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v19 = type;
      v20 = os_log_type_enabled(v15, type);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_20:

          if (!v14)
            goto LABEL_14;
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        v17 = "%{public}s called with null networkDescription, no backtrace";
        v22 = v15;
        v23 = v19;
LABEL_19:
        _os_log_impl(&dword_182FBE000, v22, v23, v17, buf, 0xCu);
        goto LABEL_20;
      }
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        v28 = "+[NWMonitor monitorWithNetworkDescription:endpoint:parameters:]";
        v29 = 2082;
        v30 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s called with null networkDescription, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v14)
    {
LABEL_14:
      v12 = 0;
      goto LABEL_15;
    }
LABEL_13:
    free(v14);
    goto LABEL_14;
  }
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monitorWithNetworkDescriptionArray:endpoint:parameters:", v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return (NWMonitor *)v12;
}

+ (NWMonitor)monitorWithNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  id v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  __CFString *v26;
  id v27;
  os_log_type_t v28;
  const char *v29;
  char *backtrace_string;
  os_log_type_t v31;
  _BOOL4 v32;
  const char *v33;
  _BOOL4 v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  __CFString *v38;
  NWParameters *v39;
  id v40;
  os_log_type_t v41;
  NSObject *v42;
  os_log_type_t v43;
  os_log_type_t v44;
  _BOOL4 v45;
  NSObject *v46;
  os_log_type_t v47;
  uint32_t v48;
  id v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  NWParameters *v54;
  NWPathEvaluator *v55;
  void *v56;
  void *v57;
  NWPathEvaluator *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  NSObject *v63;
  id v64;
  char *v65;
  _BOOL4 v66;
  const char *v67;
  _BOOL4 v68;
  objc_super v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char v75;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  char *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  nw_allow_use_of_dispatch_internal();
  if (!v8)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v75 = 0;
    if (!__nwlog_fault(v18, &type, &v75))
      goto LABEL_86;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v20 = type;
      if (!os_log_type_enabled(v19, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v21 = "%{public}s called with null networkDescriptionArray";
    }
    else
    {
      if (v75)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        v31 = type;
        v32 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136446466;
            v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
            v79 = 2082;
            v80 = (const __CFString *)backtrace_string;
            v33 = "%{public}s called with null networkDescriptionArray, dumping backtrace:%{public}s";
LABEL_35:
            v35 = v19;
            v36 = v31;
            v37 = 22;
LABEL_36:
            _os_log_impl(&dword_182FBE000, v35, v36, v33, buf, v37);
          }
LABEL_37:

          free(backtrace_string);
          goto LABEL_86;
        }
        if (!v32)
        {
LABEL_49:

          if (!v18)
            goto LABEL_88;
          goto LABEL_87;
        }
        *(_DWORD *)buf = 136446210;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        v21 = "%{public}s called with null networkDescriptionArray, no backtrace";
        v42 = v19;
        v43 = v31;
LABEL_48:
        _os_log_impl(&dword_182FBE000, v42, v43, v21, buf, 0xCu);
        goto LABEL_49;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v20 = type;
      if (!os_log_type_enabled(v19, type))
        goto LABEL_49;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v21 = "%{public}s called with null networkDescriptionArray, backtrace limit exceeded";
    }
    v42 = v19;
    v43 = v20;
    goto LABEL_48;
  }
  if (!objc_msgSend(v8, "count"))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v27 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v18 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v75 = 0;
    if (!__nwlog_fault(v18, &type, &v75))
      goto LABEL_86;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v28 = type;
      if (!os_log_type_enabled(v19, type))
        goto LABEL_85;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty)";
      goto LABEL_59;
    }
    if (!v75)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v28 = type;
      if (!os_log_type_enabled(v19, type))
        goto LABEL_85;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty), backtrace limit exceeded";
LABEL_59:
      v46 = v19;
      v47 = v28;
      goto LABEL_60;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v19 = (id)gLogObj;
    v31 = type;
    v34 = os_log_type_enabled(v19, type);
    if (!backtrace_string)
    {
      if (!v34)
        goto LABEL_85;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v29 = "%{public}s called with null networkDescriptionArray (empty), no backtrace";
      v46 = v19;
      v47 = v31;
LABEL_60:
      v48 = 12;
LABEL_84:
      _os_log_impl(&dword_182FBE000, v46, v47, v29, buf, v48);
      goto LABEL_85;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v79 = 2082;
      v80 = (const __CFString *)backtrace_string;
      v33 = "%{public}s called with null networkDescriptionArray (empty), dumping backtrace:%{public}s";
      goto LABEL_35;
    }
    goto LABEL_37;
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (!v12)
    goto LABEL_11;
  v13 = v12;
  v14 = *(_QWORD *)v72;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v72 != v14)
        objc_enumerationMutation(v11);
      objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "ssidOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {

        if (currentProcessHasSSIDEntitlement_onceToken != -1)
          dispatch_once(&currentProcessHasSSIDEntitlement_onceToken, &__block_literal_global_214);
        if (currentProcessHasSSIDEntitlement_hasSSIDEntitlement)
          goto LABEL_19;
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v40 = (id)gLogObj;
        *(_DWORD *)buf = 136446466;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        v79 = 2114;
        v80 = CFSTR("com.apple.private.corewifi");
        v18 = (char *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v75 = 0;
        if (!__nwlog_fault(v18, &type, &v75))
          goto LABEL_86;
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v19 = (id)gLogObj;
          v41 = type;
          if (!os_log_type_enabled(v19, type))
            goto LABEL_85;
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2114;
          v80 = CFSTR("com.apple.private.corewifi");
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID";
LABEL_82:
          v46 = v19;
          v47 = v41;
LABEL_83:
          v48 = 22;
          goto LABEL_84;
        }
        if (!v75)
        {
          __nwlog_obj();
          v19 = objc_claimAutoreleasedReturnValue();
          v41 = type;
          if (!os_log_type_enabled(v19, type))
            goto LABEL_85;
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2114;
          v80 = CFSTR("com.apple.private.corewifi");
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, backtrace limit exceeded";
          goto LABEL_82;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v19 = (id)gLogObj;
        v44 = type;
        v45 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (!v45)
            goto LABEL_37;
          *(_DWORD *)buf = 136446722;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2114;
          v80 = CFSTR("com.apple.private.corewifi");
          v81 = 2082;
          v82 = backtrace_string;
          v33 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, dumping backtrace:%{public}s";
          v35 = v19;
          v36 = v44;
          v37 = 32;
          goto LABEL_36;
        }
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2114;
          v80 = CFSTR("com.apple.private.corewifi");
          v29 = "%{public}s This process does not have the %{public}@ entitlement required to monitor SSID, no backtrace";
          v46 = v19;
          v47 = v44;
          goto LABEL_83;
        }
LABEL_85:

LABEL_86:
        if (!v18)
        {
LABEL_88:
          v26 = 0;
          goto LABEL_111;
        }
LABEL_87:
        free(v18);
        goto LABEL_88;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v13)
      continue;
    break;
  }
LABEL_11:

LABEL_19:
  v22 = +[NWMonitor copySavedMonitorForNetworkDescriptionArray:endpoint:parameters:](NWMonitor, "copySavedMonitorForNetworkDescriptionArray:endpoint:parameters:", v11, v9, v10);
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "privateDescription");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v79 = 2114;
      v80 = v24;
      _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}s found matching monitor %{public}@", buf, 0x16u);
    }

    v26 = v23;
    goto LABEL_110;
  }
  v70.receiver = a1;
  v70.super_class = (Class)&OBJC_METACLASS___NWMonitor;
  v38 = (__CFString *)objc_msgSend(objc_msgSendSuper2(&v70, sel_alloc), "init");
  v24 = v38;
  if (!a1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v49 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v50 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v75 = 0;
    if (!__nwlog_fault(v50, &type, &v75))
      goto LABEL_107;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v51 = (id)gLogObj;
      v52 = type;
      if (os_log_type_enabled(v51, type))
      {
        *(_DWORD *)buf = 136446210;
        v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
        v53 = "%{public}s super alloc init failed";
        goto LABEL_105;
      }
      goto LABEL_106;
    }
    if (v75)
    {
      v65 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = type;
      v66 = os_log_type_enabled(v51, type);
      if (v65)
      {
        if (v66)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2082;
          v80 = (const __CFString *)v65;
          v67 = "%{public}s super alloc init failed, dumping backtrace:%{public}s";
LABEL_93:
          _os_log_impl(&dword_182FBE000, v51, v52, v67, buf, 0x16u);
        }
LABEL_94:

        free(v65);
        goto LABEL_107;
      }
      if (!v66)
        goto LABEL_106;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s super alloc init failed, no backtrace";
    }
    else
    {
      __nwlog_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = type;
      if (!os_log_type_enabled(v51, type))
        goto LABEL_106;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s super alloc init failed, backtrace limit exceeded";
    }
LABEL_105:
    _os_log_impl(&dword_182FBE000, v51, v52, v53, buf, 0xCu);
    goto LABEL_106;
  }
  -[__CFString setEndpoint:](v38, "setEndpoint:", v9);
  if (v10)
    v39 = (NWParameters *)objc_msgSend(v10, "copy");
  else
    v39 = objc_alloc_init(NWParameters);
  v54 = v39;
  -[__CFString setParameters:](v24, "setParameters:", v39);

  v55 = [NWPathEvaluator alloc];
  -[__CFString endpoint](v24, "endpoint");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString parameters](v24, "parameters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[NWPathEvaluator initWithEndpoint:parameters:](v55, "initWithEndpoint:parameters:", v56, v57);
  -[__CFString setPathEvaluator:](v24, "setPathEvaluator:", v58);

  -[__CFString pathEvaluator](v24, "pathEvaluator");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v11, 1);
    -[__CFString setNetworkDescriptionArray:](v24, "setNetworkDescriptionArray:", v60);

    -[__CFString setStatus:](v24, "setStatus:", 0);
    -[__CFString setBestAvailableNetworkDescription:](v24, "setBestAvailableNetworkDescription:", 0);
    +[NWMonitor saveMonitor:](NWMonitor, "saveMonitor:", v24);
    -[__CFString pathEvaluator](v24, "pathEvaluator");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObserver:forKeyPath:options:context:", v24, CFSTR("path"), 5, 0);

    objc_msgSend(0, "privateDescription");
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v63 = (id)gLogObj;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v79 = 2114;
      v80 = v62;
      _os_log_impl(&dword_182FBE000, v63, OS_LOG_TYPE_DEBUG, "%{public}s created monitor %{public}@", buf, 0x16u);
    }

    v24 = v24;
    v26 = v24;
    goto LABEL_110;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v64 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
  v50 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v75 = 0;
  if (!__nwlog_fault(v50, &type, &v75))
    goto LABEL_107;
  if (type != OS_LOG_TYPE_FAULT)
  {
    if (v75)
    {
      v65 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = type;
      v68 = os_log_type_enabled(v51, type);
      if (v65)
      {
        if (v68)
        {
          *(_DWORD *)buf = 136446466;
          v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
          v79 = 2082;
          v80 = (const __CFString *)v65;
          v67 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, dumping backtrace:%{public}s";
          goto LABEL_93;
        }
        goto LABEL_94;
      }
      if (!v68)
        goto LABEL_106;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, no backtrace";
    }
    else
    {
      __nwlog_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = type;
      if (!os_log_type_enabled(v51, type))
        goto LABEL_106;
      *(_DWORD *)buf = 136446210;
      v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
      v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed, backtrace limit exceeded";
    }
    goto LABEL_105;
  }
  __nwlog_obj();
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = type;
  if (os_log_type_enabled(v51, type))
  {
    *(_DWORD *)buf = 136446210;
    v78 = "+[NWMonitor monitorWithNetworkDescriptionArray:endpoint:parameters:]";
    v53 = "%{public}s NWPathEvaluator alloc initWithEndpoint:parameters: failed";
    goto LABEL_105;
  }
LABEL_106:

LABEL_107:
  if (v50)
    free(v50);
  v26 = 0;
LABEL_110:

LABEL_111:
  return (NWMonitor *)v26;
}

+ (id)mainOperationQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__NWMonitor_mainOperationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mainOperationQueue_opQueueToken != -1)
    dispatch_once(&mainOperationQueue_opQueueToken, block);
  return (id)mainOperationQueue_opQueue;
}

+ (id)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_10519);
  return (id)queue_mQueue;
}

void __18__NWMonitor_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.network.monitor_queue", v2);
  v1 = (void *)queue_mQueue;
  queue_mQueue = (uint64_t)v0;

}

void __31__NWMonitor_mainOperationQueue__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)mainOperationQueue_opQueue;
  mainOperationQueue_opQueue = (uint64_t)v0;

  objc_msgSend((id)objc_opt_class(), "queue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)mainOperationQueue_opQueue, "setUnderlyingQueue:", v2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[NWMonitor observeValueForKeyPath:ofObject:change:context:]";
      v14 = 1024;
      v15 = -[NWMonitor mID](self, "mID");
      v16 = 2114;
      v17 = v9;
      v11 = "%{public}s %u invalid object %{public}@";
LABEL_8:
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x1Cu);
    }
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("path")) & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[NWMonitor observeValueForKeyPath:ofObject:change:context:]";
      v14 = 1024;
      v15 = -[NWMonitor mID](self, "mID");
      v16 = 2114;
      v17 = v8;
      v11 = "%{public}s %u invalid keypath %{public}@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:](self, "evaluateStartingAtIndex:probeUUID:probeWasSuccessful:", 0, 0, 0);
LABEL_10:

}

- (void)evaluateStartingAtIndex:(unint64_t)a3 probeUUID:(id)a4 probeWasSuccessful:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NWMonitor *v13;
  unint64_t v14;
  BOOL v15;

  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke;
  v11[3] = &unk_1E149B800;
  v12 = v8;
  v13 = self;
  v14 = a3;
  v15 = a5;
  v10 = v8;
  dispatch_async(v9, v11);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  void (**v8)(id, _QWORD);
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a7;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "-[NWMonitor URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]";
    v12 = 1024;
    v13 = -[NWMonitor mID](self, "mID");
    _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %u received a redirect on probe URL request, not following redirect", (uint8_t *)&v10, 0x12u);
  }

  v8[2](v8, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NWMonitor pathEvaluator](self, "pathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("path"));

  v4.receiver = self;
  v4.super_class = (Class)NWMonitor;
  -[NWMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)matchesNetworkDescriptionArray:(id)a3 endpoint:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  char v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[NWMonitor networkDescriptionArray](self, "networkDescriptionArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToArray:", v10);

  if (v12)
  {
    -[NWMonitor parameters](self, "parameters");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = v14;
    if (v13 != v14 && v13 && v14)
    {
      if (!objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
        goto LABEL_14;
      v16 = objc_msgSend(v13, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_7:
        -[NWMonitor endpoint](self, "endpoint");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v17 = v8;
        v15 = v17;
        v18 = v13 == v17;
        if (v13 == v17 || !v13 || !v17)
          goto LABEL_15;
        if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
        {
          v18 = objc_msgSend(v13, "isEqual:", v15);
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {

      if (v13 == v15)
        goto LABEL_7;
    }
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    objc_msgSend(v5, "networkDescriptionArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[NWMonitor matchesNetworkDescriptionArray:endpoint:parameters:](self, "matchesNetworkDescriptionArray:endpoint:parameters:", v6, v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[NWMonitor networkDescriptionArray](self, "networkDescriptionArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NWMonitor endpoint](self, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NWMonitor parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v4)
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWMonitor mID](self, "mID"), CFSTR("monitorID"), v5);
  v8 = -[NWMonitor status](self, "status");
  if (v8 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown[%ld]"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)*((_QWORD *)&off_1E149B860 + v8);
  }
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("status"), v5, v4);

  -[NWMonitor endpoint](self, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("endpoint"), v5, v4);

  -[NWMonitor parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("parameters"), v5, v4);

  -[NWMonitor networkDescriptionArray](self, "networkDescriptionArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("descriptions"), v5, v4);

  -[NWMonitor bestAvailableNetworkDescription](self, "bestAvailableNetworkDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v13, CFSTR("current"), v5, v4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NWMonitor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWMonitor descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NWNetworkDescription)bestAvailableNetworkDescription
{
  return (NWNetworkDescription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBestAvailableNetworkDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)networkDescriptionArray
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworkDescriptionArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NWPathEvaluator)pathEvaluator
{
  return (NWPathEvaluator *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPathEvaluator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSUUID)lastProbeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastProbeUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSURL)lastProbeURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastProbeURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NWInterface)interface
{
  return (NWInterface *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)mID
{
  return self->_mID;
}

- (void)setMID:(unsigned int)a3
{
  self->_mID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_lastProbeURL, 0);
  objc_storeStrong((id *)&self->_lastProbeUUID, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_networkDescriptionArray, 0);
  objc_storeStrong((id *)&self->_bestAvailableNetworkDescription, 0);
}

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  uint64_t i;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  id *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  id v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  id v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  int v52;
  void *v53;
  NSObject *v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  int v64;
  NSObject *v65;
  int v66;
  void *v67;
  NSObject *v68;
  _QWORD block[5];
  id v70;
  uint64_t v71;
  BOOL v72;
  _QWORD v73[5];
  id v74;
  id v75;
  unint64_t v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  NSObject *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  unint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "lastProbeUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject isEqual:](v2, "isEqual:", v4);

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) == 0)
    {
      if (v7)
      {
        v38 = objc_msgSend(*(id *)(a1 + 40), "mID");
        -[NSObject UUIDString](v2, "UUIDString");
        v39 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "lastProbeUUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446978;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        v79 = 1024;
        v80 = v38;
        v81 = 2114;
        v82 = v39;
        v83 = 2114;
        v84 = v41;
        _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %u received stale probe %{public}@ (current one is %{public}@)", buf, 0x26u);

      }
      goto LABEL_43;
    }
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "mID");
      -[NSObject UUIDString](v2, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v79 = 1024;
      v80 = v8;
      v81 = 2114;
      v82 = v9;
      _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %u received valid probe %{public}@", buf, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(v3, "pathEvaluator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "privateDescription");
    v6 = objc_claimAutoreleasedReturnValue();

    if (gLogDatapath)
    {
      __nwlog_obj();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v66 = objc_msgSend(*(id *)(a1 + 40), "mID");
        *(_DWORD *)buf = 136446722;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        v79 = 1024;
        v80 = v66;
        v81 = 2114;
        v82 = v6;
        _os_log_impl(&dword_182FBE000, v65, OS_LOG_TYPE_DEBUG, "%{public}s %u received path change %{public}@", buf, 0x1Cu);
      }

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "networkDescriptionArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(*(id *)(a1 + 40), "pathEvaluator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "interface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject interface](v6, "interface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setInterface:", v16);

  v17 = *(_QWORD *)(a1 + 48);
  if (-[NSObject status](v6, "status") != 1)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 40), "interface");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18
    || (v19 = (void *)v18,
        objc_msgSend(*(id *)(a1 + 40), "interface"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isDeepEqual:", v15),
        v20,
        v19,
        (v21 & 1) == 0))
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 40), "privateDescription");
    v22 = objc_claimAutoreleasedReturnValue();
    if (gLogDatapath)
    {
      __nwlog_obj();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        v64 = objc_msgSend(*(id *)(a1 + 40), "mID");
        *(_DWORD *)buf = 136446722;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        v79 = 1024;
        v80 = v64;
        v81 = 2114;
        v82 = v22;
        _os_log_impl(&dword_182FBE000, v63, OS_LOG_TYPE_DEBUG, "%{public}s %u resetting self to unsatisfied: %{public}@", buf, 0x1Cu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeUUID:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeURL:", 0);

    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend(*(id *)(a1 + 40), "networkDescriptionArray");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setState:", 0);
      }
    }

    v17 = 0;
    v2 = 0;
  }
  if (v17 >= v13)
  {
    v36 = 0;
    v37 = 2;
LABEL_37:
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeUUID:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeURL:", 0);
    objc_msgSend(*(id *)(a1 + 40), "bestAvailableNetworkDescription");
    v45 = (id)objc_claimAutoreleasedReturnValue();

    v46 = v36 != v45;
    if (v36 != v45 || v37 != objc_msgSend(*(id *)(a1 + 40), "status"))
    {
      if (NWCopyInternalQueue_init_once != -1)
        dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_62650);
      v47 = (id)NWCopyInternalQueue_nwQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_31;
      block[3] = &unk_1E149B800;
      v72 = v46;
      block[4] = *(_QWORD *)(a1 + 40);
      v36 = v36;
      v70 = v36;
      v71 = v37;
      dispatch_async(v47, block);

    }
    goto LABEL_42;
  }
  v67 = v15;
  v26 = (id *)&unk_1ECD84000;
  v68 = v6;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 40), "networkDescriptionArray");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "updateStateWithPath:", v6);
    v29 = objc_msgSend(v28, "state");
    if (v29 == 2)
      break;
    if (v29 == 1)
    {
      v36 = v28;
LABEL_36:

      v37 = 1;
      goto LABEL_37;
    }
LABEL_17:

    if (v13 == ++v17)
    {
      v36 = 0;
      v37 = 2;
      goto LABEL_37;
    }
  }
  if (v2)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(v28, "setState:", 1);
      v36 = v28;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v42 = v26[463];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v43 = objc_msgSend(*(id *)(a1 + 40), "mID");
        -[NSObject UUIDString](v2, "UUIDString");
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        v79 = 1024;
        v80 = v43;
        v81 = 2114;
        v82 = v44;
        _os_log_impl(&dword_182FBE000, v42, OS_LOG_TYPE_DEBUG, "%{public}s %u received successful probe %{public}@", buf, 0x1Cu);

      }
      v2 = 0;
      goto LABEL_36;
    }
    objc_msgSend(v28, "setState:", 3);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v30 = v26[463];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(*(id *)(a1 + 40), "mID");
      -[NSObject UUIDString](v2, "UUIDString");
      v32 = v26;
      v33 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v79 = 1024;
      v80 = v31;
      v81 = 2114;
      v82 = v33;
      _os_log_impl(&dword_182FBE000, v30, OS_LOG_TYPE_DEBUG, "%{public}s %u received unsuccessful probe %{public}@", buf, 0x1Cu);

      v26 = v32;
      v6 = v68;
    }

LABEL_27:
    v2 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v28, "probeURL");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v2 = v26[463];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(*(id *)(a1 + 40), "mID");
      *(_DWORD *)buf = 136446466;
      v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v79 = 1024;
      v80 = v35;
      _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_ERROR, "%{public}s %u ERROR: NWNDShouldProbe but nil probeURL", buf, 0x12u);
    }
    goto LABEL_27;
  }
  v48 = (void *)v34;
  objc_msgSend(*(id *)(a1 + 40), "lastProbeURL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "isEqual:", v49);

  if (v50)
  {
    if (gLogDatapath)
    {
      __nwlog_obj();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v52 = objc_msgSend(*(id *)(a1 + 40), "mID");
        *(_DWORD *)buf = 136446466;
        v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        v79 = 1024;
        v80 = v52;
        _os_log_impl(&dword_182FBE000, v51, OS_LOG_TYPE_DEBUG, "%{public}s %u already sent probe out", buf, 0x12u);
      }
      v6 = v68;
      goto LABEL_52;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeUUID:", v53);
    objc_msgSend(*(id *)(a1 + 40), "setLastProbeURL:", v48);
    __nwlog_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      v55 = objc_msgSend(*(id *)(a1 + 40), "mID");
      objc_msgSend(v53, "UUIDString");
      v56 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447234;
      v78 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v79 = 1024;
      v80 = v55;
      v81 = 2114;
      v82 = v56;
      v83 = 2114;
      v84 = v48;
      v85 = 2048;
      v86 = v17;
      _os_log_impl(&dword_182FBE000, v54, OS_LOG_TYPE_DEBUG, "%{public}s %u sending out probe %{public}@ to %{public}@ for description %lu", buf, 0x30u);

    }
    v57 = (void *)MEMORY[0x1E0C92C98];
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "mainOperationQueue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "sessionWithConfiguration:delegate:delegateQueue:", v58, v59, v60);
    v51 = objc_claimAutoreleasedReturnValue();

    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_28;
    v73[3] = &unk_1E149B7D8;
    v73[4] = *(_QWORD *)(a1 + 40);
    v74 = v53;
    v75 = v48;
    v76 = v17;
    v61 = v53;
    -[NSObject dataTaskWithURL:completionHandler:](v51, "dataTaskWithURL:completionHandler:", v75, v73);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "resume");
    -[NSObject finishTasksAndInvalidate](v51, "finishTasksAndInvalidate");

LABEL_52:
    v15 = v67;
  }

  v2 = 0;
  v36 = 0;
LABEL_42:

LABEL_43:
}

void __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "domain");
    v11 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 != -1202)
        goto LABEL_7;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136446210;
        v20 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
        _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s probe URL failed due to untrusted server certificate", (uint8_t *)&v19, 0xCu);
      }
    }

  }
LABEL_7:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v13 = (id)gLogObj;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "mID");
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v19 = 136447746;
    v20 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
    v21 = 1024;
    v22 = v14;
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v16;
    v27 = 2048;
    v28 = v17;
    v29 = 2048;
    v30 = v7;
    v31 = 2114;
    v32 = v8;
    _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}s %u received response for probe %{public}@ to %{public}@ for description%lu: data = %p, response = %{public}@", (uint8_t *)&v19, 0x44u);

  }
  if (v7)
  {
    objc_opt_class();
    v18 = (objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)(objc_msgSend(v8, "statusCode") - 200) < 0x64;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "evaluateStartingAtIndex:probeUUID:probeWasSuccessful:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v18);

}

uint64_t __66__NWMonitor_evaluateStartingAtIndex_probeUUID_probeWasSuccessful___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t result;
  NSObject *v9;
  int v10;
  unint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "bestAvailableNetworkDescription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "privateDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "privateDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "mID");
      *(_DWORD *)buf = 136446978;
      v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v18 = 1024;
      v19 = v6;
      v20 = 2114;
      v21 = v3;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s %u updating best description from %{public}@ to %{public}@", buf, 0x26u);
    }

    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("bestAvailableNetworkDescription"));
    objc_msgSend(*(id *)(a1 + 32), "setBestAvailableNetworkDescription:", *(_QWORD *)(a1 + 40));

  }
  v7 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v7 != result)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "mID");
      v11 = objc_msgSend(*(id *)(a1 + 32), "status");
      if (v11 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown[%ld]"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = (void *)*((_QWORD *)&off_1E149B860 + v11);
      }
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 48);
      if (v14 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown[%ld]"), *(_QWORD *)(a1 + 48));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (void *)*((_QWORD *)&off_1E149B860 + v14);
      }
      *(_DWORD *)buf = 136446978;
      v17 = "-[NWMonitor evaluateStartingAtIndex:probeUUID:probeWasSuccessful:]_block_invoke";
      v18 = 1024;
      v19 = v10;
      v20 = 2114;
      v21 = v13;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}s %u updating state from %{public}@ to %{public}@", buf, 0x26u);

    }
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("status"));
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", *(_QWORD *)(a1 + 48));
    result = objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("status"));
  }
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("bestAvailableNetworkDescription"));
  return result;
}

@end
