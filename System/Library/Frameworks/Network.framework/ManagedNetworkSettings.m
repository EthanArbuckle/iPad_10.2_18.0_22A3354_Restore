@implementation ManagedNetworkSettings

- (ManagedNetworkSettings)init
{
  ManagedNetworkSettings *v2;
  ManagedNetworkSettings *v3;
  ManagedNetworkSettings *v4;
  id v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  NSObject *v14;
  os_log_type_t v15;
  char v16;
  os_log_type_t type;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)ManagedNetworkSettings;
  v2 = -[ManagedNetworkSettings init](&v18, sel_init);
  v3 = v2;
  if (!v2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v20 = "-[ManagedNetworkSettings init]";
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
          goto LABEL_19;
        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed";
LABEL_17:
        v14 = v7;
        v15 = v8;
        goto LABEL_18;
      }
      if (!v16)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_19;
        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed, backtrace limit exceeded";
        goto LABEL_17;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      v11 = type;
      v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_19:

          if (!v6)
            goto LABEL_14;
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136446210;
        v20 = "-[ManagedNetworkSettings init]";
        v9 = "%{public}s super init failed, no backtrace";
        v14 = v7;
        v15 = v11;
LABEL_18:
        _os_log_impl(&dword_182FBE000, v14, v15, v9, buf, 0xCu);
        goto LABEL_19;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[ManagedNetworkSettings init]";
        v21 = 2082;
        v22 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s super init failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v6)
      goto LABEL_14;
LABEL_13:
    free(v6);
    goto LABEL_14;
  }
  v4 = v2;
LABEL_14:

  return v3;
}

- (void)handleEvent:(id)a3
{
  id v4;
  void *v5;
  const char *string;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  NSObject *v16;
  os_log_type_t v17;
  NSObject *v18;
  char v19;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v22 = "-[ManagedNetworkSettings handleEvent:]";
    v9 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v19 = 0;
    if (__nwlog_fault((const char *)v9, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v11 = type;
        if (!os_log_type_enabled(v10, type))
          goto LABEL_26;
        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        v12 = "%{public}s called with null event";
LABEL_24:
        v16 = v10;
        v17 = v11;
        goto LABEL_25;
      }
      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v11 = type;
        if (!os_log_type_enabled(v10, type))
          goto LABEL_26;
        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        v12 = "%{public}s called with null event, backtrace limit exceeded";
        goto LABEL_24;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      v14 = type;
      v15 = os_log_type_enabled(v10, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_26:

          if (!v9)
            goto LABEL_34;
LABEL_27:
          free(v9);
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        v12 = "%{public}s called with null event, no backtrace";
        v16 = v10;
        v17 = v14;
LABEL_25:
        _os_log_impl(&dword_182FBE000, v16, v17, v12, buf, 0xCu);
        goto LABEL_26;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        v23 = 2082;
        v24 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v10, v14, "%{public}s called with null event, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v9)
      goto LABEL_34;
    goto LABEL_27;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81298]);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v7 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("NetworkdSettingsChanged")) & 1) != 0
      || -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("NetworkdManagedSettingsChanged")))
    {
      -[ManagedNetworkSettings reloadNetworkdSettings](self, "reloadNetworkdSettings");
    }
    else if ((-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("NetworkdSysctlSettingsChanged")) & 1) != 0
           || -[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("NetworkdManagedSysctlSettingsChanged")))
    {
      -[ManagedNetworkSettings reloadMNS](self, "reloadMNS");
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[ManagedNetworkSettings handleEvent:]";
        v23 = 2114;
        v24 = v7;
        _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}s MNS received an event with unknown name %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v22 = "-[ManagedNetworkSettings handleEvent:]";
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_ERROR, "%{public}s MNS received an event with no name", buf, 0xCu);
    }
  }

LABEL_34:
}

- (void)reloadNetworkdSettings
{
  const char *v2;
  int64_t int64;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v2 = (const char *)nw_setting_libnetcore_debug;
  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    if (sCachedSettings)
      int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, v2);
    else
      int64 = 0;
    pthread_mutex_unlock(&sSettingsMutex);
  }
  else
  {
    int64 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_file_path_settings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v5;

  v6 = (void *)objc_msgSend(v13, "copy");
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_file_path_settings_managed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
  {

    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_settings_managed_settings);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);
  }
  else
  {
    objc_msgSend(v13, "removeObjectForKey:", v10);
  }
  if (objc_msgSend(v13, "count"))
  {
    v12 = v13;
  }
  else
  {

    v12 = 0;
  }
  v14 = v12;
  saveAndPostNetworkdSettings(v12, v6, int64);

}

- (void)reloadMNS
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  unsigned int v34;
  id v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  NSObject *v39;
  os_log_type_t v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  const char *v45;
  uint32_t v46;
  char *backtrace_string;
  os_log_type_t v48;
  _BOOL4 v49;
  os_log_type_t v50;
  const char *v51;
  int v52;
  id v53;
  const char *v54;
  NSObject *v55;
  os_log_type_t v56;
  NSObject *v57;
  os_log_type_t v58;
  const char *v59;
  char *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  os_log_type_t v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  NSObject *v70;
  os_log_type_t v71;
  const char *v72;
  char *v73;
  _BOOL4 v74;
  os_log_type_t v75;
  os_log_type_t v76[4];
  os_log_type_t v77;
  unint64_t StatusReg;
  const char *v79;
  int v80;
  char *v81;
  id v82;
  char v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  int buf;
  const char *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  size_t type[16];
  int v106;
  const char *v107;
  __int16 v108;
  _QWORD v109[18];

  *(_QWORD *)((char *)&v109[15] + 2) = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Preferences/com.apple.networkd.sysctl.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/com.apple.networkd.sysctl.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v92, &v106, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v93 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v92, &v106, 16);
    }
    while (v6);
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, type, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v89 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
        objc_msgSend(v2, "objectForKeyedSubscript:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v4, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 != v21)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v22 = (id)gLogObj;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v4, "objectForKeyedSubscript:", v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v17);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              buf = 136446978;
              v98 = "copyNetworkdCombinedSysctlSettingsDict";
              v99 = 2114;
              v100 = v17;
              v101 = 2114;
              v102 = v23;
              v103 = 2114;
              v104 = v24;
              _os_log_impl(&dword_182FBE000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s MNS sysctl %{public}@ : ignoring managed value %{public}@ since it is in settings with value %{public}@", (uint8_t *)&buf, 0x2Au);

            }
          }
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, type, 16);
    }
    while (v13);
  }

  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v25 = v2;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v85;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v82 = v25;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v85 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
        if (!v30)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v35 = (id)gLogObj;
          v106 = 136446210;
          v107 = "isSysctlAllowlisted";
          v36 = (char *)_os_log_send_and_compose_impl();

          LOBYTE(type[0]) = 16;
          LOBYTE(v92) = 0;
          if (__nwlog_fault(v36, type, &v92))
          {
            if (LOBYTE(type[0]) != 17)
            {
              if ((_BYTE)v92)
              {
                backtrace_string = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v37 = (id)gLogObj;
                v48 = type[0];
                v49 = os_log_type_enabled(v37, type[0]);
                if (backtrace_string)
                {
                  if (v49)
                  {
                    v106 = 136446466;
                    v107 = "isSysctlAllowlisted";
                    v108 = 2082;
                    v109[0] = backtrace_string;
                    _os_log_impl(&dword_182FBE000, v37, v48, "%{public}s called with null name, dumping backtrace:%{public}s", (uint8_t *)&v106, 0x16u);
                  }

                  free(backtrace_string);
                  goto LABEL_54;
                }
                if (!v49)
                  goto LABEL_53;
                v106 = 136446210;
                v107 = "isSysctlAllowlisted";
                v39 = v37;
                v40 = v48;
                v41 = "%{public}s called with null name, no backtrace";
              }
              else
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v37 = (id)gLogObj;
                v50 = type[0];
                if (!os_log_type_enabled(v37, type[0]))
                  goto LABEL_53;
                v106 = 136446210;
                v107 = "isSysctlAllowlisted";
                v39 = v37;
                v40 = v50;
                v41 = "%{public}s called with null name, backtrace limit exceeded";
              }
LABEL_52:
              _os_log_impl(&dword_182FBE000, v39, v40, v41, (uint8_t *)&v106, 0xCu);
              goto LABEL_53;
            }
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v37 = (id)gLogObj;
            v38 = type[0];
            if (os_log_type_enabled(v37, type[0]))
            {
              v106 = 136446210;
              v107 = "isSysctlAllowlisted";
              v39 = v37;
              v40 = v38;
              v41 = "%{public}s called with null name";
              goto LABEL_52;
            }
LABEL_53:

LABEL_54:
            v25 = v82;
          }
          if (v36)
            free(v36);
          goto LABEL_57;
        }
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * k), "hasPrefix:", CFSTR("net.")) & 1) != 0)
        {
          objc_msgSend(v25, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v92) = 0;
          v32 = v31;
          if (!v32 || (objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
          {

            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v42 = (id)gLogObj;
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v106 = 136446722;
              v107 = "-[ManagedNetworkSettings reloadMNS]";
              v108 = 2114;
              v109[0] = v32;
              LOWORD(v109[1]) = 2114;
              *(_QWORD *)((char *)&v109[1] + 2) = v30;
              v43 = v42;
              v44 = OS_LOG_TYPE_ERROR;
              v45 = "%{public}s MNS observed invalid value %{public}@ for key %{public}@";
              v46 = 32;
              goto LABEL_24;
            }
LABEL_25:

            goto LABEL_26;
          }
          v33 = -[NSObject longLongValue](v32, "longLongValue");
          v34 = 0x7FFFFFFF;
          if (v33 <= 0x7FFFFFFF)
          {
            if (v33 >= (uint64_t)0xFFFFFFFF80000000)
              v34 = -[NSObject intValue](v32, "intValue");
            else
              v34 = 0x80000000;
          }
          LODWORD(v92) = v34;

          v51 = (const char *)objc_msgSend(v30, "UTF8String");
          LODWORD(v88) = 0;
          type[0] = 4;
          if (!sysctlbyname(v51, &v88, type, 0, 0) && type[0] == 4)
          {
            if ((_DWORD)v92 == (_DWORD)v88)
              goto LABEL_26;
LABEL_83:
            if (!sysctlbyname(v51, 0, 0, &v92, 4uLL))
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v42 = (id)gLogObj;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v106 = 136446978;
                v107 = "-[ManagedNetworkSettings reloadMNS]";
                v108 = 2114;
                v109[0] = v30;
                LOWORD(v109[1]) = 1024;
                *(_DWORD *)((char *)&v109[1] + 2) = v88;
                HIWORD(v109[1]) = 1024;
                LODWORD(v109[2]) = v92;
                v43 = v42;
                v44 = OS_LOG_TYPE_DEFAULT;
                v45 = "%{public}s MNS successfully set sysctl %{public}@ from %d to %d";
                v46 = 34;
LABEL_24:
                _os_log_impl(&dword_182FBE000, v43, v44, v45, (uint8_t *)&v106, v46);
              }
              goto LABEL_25;
            }
            v64 = **(_DWORD **)(StatusReg + 8);
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v65 = (id)gLogObj;
            v66 = v65;
            if (v64 == 45)
            {
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                v106 = 136446978;
                v107 = "-[ManagedNetworkSettings reloadMNS]";
                v108 = 1024;
                LODWORD(v109[0]) = v92;
                WORD2(v109[0]) = 2114;
                *(_QWORD *)((char *)v109 + 6) = v30;
                HIWORD(v109[1]) = 1024;
                LODWORD(v109[2]) = 45;
                _os_log_impl(&dword_182FBE000, v66, OS_LOG_TYPE_ERROR, "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d", (uint8_t *)&v106, 0x22u);
              }

              goto LABEL_26;
            }
            v106 = 136446978;
            v107 = "-[ManagedNetworkSettings reloadMNS]";
            v108 = 1024;
            LODWORD(v109[0]) = v92;
            WORD2(v109[0]) = 2114;
            *(_QWORD *)((char *)v109 + 6) = v30;
            HIWORD(v109[1]) = 1024;
            v80 = v64;
            LODWORD(v109[2]) = v64;
            v67 = (char *)_os_log_send_and_compose_impl();

            LOBYTE(buf) = 16;
            v83 = 0;
            if (__nwlog_fault(v67, &buf, &v83))
            {
              if (buf != 17)
              {
                if (v83)
                {
                  v73 = (char *)__nw_create_backtrace_string();
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  v68 = (id)gLogObj;
                  v77 = buf;
                  v74 = os_log_type_enabled(v68, (os_log_type_t)buf);
                  if (v73)
                  {
                    if (v74)
                    {
                      v106 = 136447234;
                      v107 = "-[ManagedNetworkSettings reloadMNS]";
                      v108 = 1024;
                      LODWORD(v109[0]) = v92;
                      WORD2(v109[0]) = 2114;
                      *(_QWORD *)((char *)v109 + 6) = v30;
                      HIWORD(v109[1]) = 1024;
                      LODWORD(v109[2]) = v80;
                      WORD2(v109[2]) = 2082;
                      *(_QWORD *)((char *)&v109[2] + 6) = v73;
                      _os_log_impl(&dword_182FBE000, v68, v77, "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)&v106, 0x2Cu);
                    }

                    free(v73);
                    goto LABEL_105;
                  }
                  if (!v74)
                    goto LABEL_104;
                  v106 = 136446978;
                  v107 = "-[ManagedNetworkSettings reloadMNS]";
                  v108 = 1024;
                  LODWORD(v109[0]) = v92;
                  WORD2(v109[0]) = 2114;
                  *(_QWORD *)((char *)v109 + 6) = v30;
                  HIWORD(v109[1]) = 1024;
                  LODWORD(v109[2]) = v80;
                  v70 = v68;
                  v71 = v77;
                  v72 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, no backtrace";
                }
                else
                {
                  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                  networkd_settings_init();
                  v68 = (id)gLogObj;
                  v75 = buf;
                  if (!os_log_type_enabled(v68, (os_log_type_t)buf))
                    goto LABEL_104;
                  v106 = 136446978;
                  v107 = "-[ManagedNetworkSettings reloadMNS]";
                  v108 = 1024;
                  LODWORD(v109[0]) = v92;
                  WORD2(v109[0]) = 2114;
                  *(_QWORD *)((char *)v109 + 6) = v30;
                  HIWORD(v109[1]) = 1024;
                  LODWORD(v109[2]) = v80;
                  v70 = v68;
                  v71 = v75;
                  v72 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d, backtrace limit exceeded";
                }
LABEL_103:
                _os_log_impl(&dword_182FBE000, v70, v71, v72, (uint8_t *)&v106, 0x22u);
                goto LABEL_104;
              }
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v68 = (id)gLogObj;
              v69 = buf;
              if (os_log_type_enabled(v68, (os_log_type_t)buf))
              {
                v106 = 136446978;
                v107 = "-[ManagedNetworkSettings reloadMNS]";
                v108 = 1024;
                LODWORD(v109[0]) = v92;
                WORD2(v109[0]) = 2114;
                *(_QWORD *)((char *)v109 + 6) = v30;
                HIWORD(v109[1]) = 1024;
                LODWORD(v109[2]) = v80;
                v70 = v68;
                v71 = v69;
                v72 = "%{public}s MNS error writing %d to sysctl %{public}@ %{darwin.errno}d";
                goto LABEL_103;
              }
LABEL_104:

LABEL_105:
              v25 = v82;
            }
            if (v67)
              free(v67);
            goto LABEL_26;
          }
          v79 = v51;
          v52 = **(_DWORD **)(StatusReg + 8);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v53 = (id)gLogObj;
          v106 = 136446722;
          v107 = "-[ManagedNetworkSettings reloadMNS]";
          v108 = 2114;
          v109[0] = v30;
          LOWORD(v109[1]) = 1024;
          *(_DWORD *)v76 = v52;
          *(_DWORD *)((char *)&v109[1] + 2) = v52;
          v54 = (const char *)_os_log_send_and_compose_impl();

          LOBYTE(buf) = 16;
          v83 = 0;
          v81 = (char *)v54;
          if (__nwlog_fault(v54, &buf, &v83))
          {
            if (buf != 17)
            {
              if (v83)
              {
                v60 = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v55 = (id)gLogObj;
                v61 = buf;
                v62 = os_log_type_enabled(v55, (os_log_type_t)buf);
                if (v60)
                {
                  if (v62)
                  {
                    v106 = 136446978;
                    v107 = "-[ManagedNetworkSettings reloadMNS]";
                    v108 = 2114;
                    v109[0] = v30;
                    LOWORD(v109[1]) = 1024;
                    *(_DWORD *)((char *)&v109[1] + 2) = *(_DWORD *)v76;
                    HIWORD(v109[1]) = 2082;
                    v109[2] = v60;
                    _os_log_impl(&dword_182FBE000, v55, v61, "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)&v106, 0x26u);
                  }

                  free(v60);
                  goto LABEL_79;
                }
                if (!v62)
                  goto LABEL_78;
                v106 = 136446722;
                v107 = "-[ManagedNetworkSettings reloadMNS]";
                v108 = 2114;
                v109[0] = v30;
                LOWORD(v109[1]) = 1024;
                *(_DWORD *)((char *)&v109[1] + 2) = *(_DWORD *)v76;
                v57 = v55;
                v58 = v61;
                v59 = "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, no backtrace";
              }
              else
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v55 = (id)gLogObj;
                v63 = buf;
                if (!os_log_type_enabled(v55, (os_log_type_t)buf))
                  goto LABEL_78;
                v106 = 136446722;
                v107 = "-[ManagedNetworkSettings reloadMNS]";
                v108 = 2114;
                v109[0] = v30;
                LOWORD(v109[1]) = 1024;
                *(_DWORD *)((char *)&v109[1] + 2) = *(_DWORD *)v76;
                v57 = v55;
                v58 = v63;
                v59 = "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d, backtrace limit exceeded";
              }
LABEL_77:
              _os_log_impl(&dword_182FBE000, v57, v58, v59, (uint8_t *)&v106, 0x1Cu);
              goto LABEL_78;
            }
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v55 = (id)gLogObj;
            v56 = buf;
            if (os_log_type_enabled(v55, (os_log_type_t)buf))
            {
              v106 = 136446722;
              v107 = "-[ManagedNetworkSettings reloadMNS]";
              v108 = 2114;
              v109[0] = v30;
              LOWORD(v109[1]) = 1024;
              *(_DWORD *)((char *)&v109[1] + 2) = *(_DWORD *)v76;
              v57 = v55;
              v58 = v56;
              v59 = "%{public}s MNS error reading sysctl %{public}@ %{darwin.errno}d";
              goto LABEL_77;
            }
LABEL_78:

LABEL_79:
            v25 = v82;
          }
          if (v81)
            free(v81);
          v51 = v79;
          goto LABEL_83;
        }
LABEL_57:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v32 = (id)gLogObj;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v106 = 136446466;
          v107 = "-[ManagedNetworkSettings reloadMNS]";
          v108 = 2114;
          v109[0] = v30;
          _os_log_impl(&dword_182FBE000, v32, OS_LOG_TYPE_ERROR, "%{public}s MNS sysctl name %{public}@ is not allowlisted", (uint8_t *)&v106, 0x16u);
        }
LABEL_26:

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v27);
  }

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)sharedMNS
{
  if (sharedMNS_onceToken != -1)
    dispatch_once(&sharedMNS_onceToken, &__block_literal_global_23471);
  return (id)sharedMNS_gManagedNetworkSettings;
}

void __35__ManagedNetworkSettings_sharedMNS__block_invoke()
{
  ManagedNetworkSettings *v0;
  void *v1;

  v0 = objc_alloc_init(ManagedNetworkSettings);
  v1 = (void *)sharedMNS_gManagedNetworkSettings;
  sharedMNS_gManagedNetworkSettings = (uint64_t)v0;

}

@end
