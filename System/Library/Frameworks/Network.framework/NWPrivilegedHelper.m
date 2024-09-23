@implementation NWPrivilegedHelper

- (void)registerHandlerFunction:(void *)a3 type:(int)a4 allowedEntitlementGroup:(id)a5
{
  uint64_t v5;
  id v8;
  NWPHHandler *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int v14;
  const char *v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  char *backtrace_string;
  os_log_type_t v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  const char *v43;
  id v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  const char *v49;
  id v50;
  unsigned int v51;
  const char *v52;
  NSObject *v53;
  os_log_type_t v54;
  id v55;
  unsigned int v56;
  const char *v57;
  const char *v58;
  void *v59;
  NSObject *v60;
  os_log_type_t v61;
  const char *v62;
  char *v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  _BOOL4 v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  NWPHHandler *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char v94;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  _BYTE v99[14];
  __int16 v100;
  char *v101;
  __int16 v102;
  char *v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v5 = *(_QWORD *)&a4;
  v106 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    v17 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v94 = 0;
    if (__nwlog_fault((const char *)v17, &type, &v94))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v19 = type;
        if (!os_log_type_enabled(v18, type))
          goto LABEL_52;
        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction";
LABEL_50:
        v53 = v18;
        v54 = v19;
        goto LABEL_51;
      }
      if (!v94)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v18 = (id)gLogObj;
        v19 = type;
        if (!os_log_type_enabled(v18, type))
          goto LABEL_52;
        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction, backtrace limit exceeded";
        goto LABEL_50;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      v22 = type;
      v23 = os_log_type_enabled(v18, type);
      if (!backtrace_string)
      {
        if (!v23)
        {
LABEL_52:

          if (!v17)
            goto LABEL_143;
LABEL_53:
          free(v17);
          goto LABEL_143;
        }
        *(_DWORD *)buf = 136446210;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v20 = "%{public}s called with null handlerFunction, no backtrace";
        v53 = v18;
        v54 = v22;
LABEL_51:
        _os_log_impl(&dword_182FBE000, v53, v54, v20, buf, 0xCu);
        goto LABEL_52;
      }
      if (v23)
      {
        *(_DWORD *)buf = 136446466;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v98 = 2082;
        *(_QWORD *)v99 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v18, v22, "%{public}s called with null handlerFunction, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v17)
      goto LABEL_143;
    goto LABEL_53;
  }
  v9 = -[NWPHHandler initWithHandlerFunction:allowedEntitlementGroup:]([NWPHHandler alloc], "initWithHandlerFunction:allowedEntitlementGroup:", a3, v8);
  if (!v9)
    goto LABEL_142;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper handlers](self, "handlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = (void *)v10;
  v85 = v9;
  if (v12)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    v14 = v5 - 2;
    if ((v5 - 2) > 0x14)
      v15 = "unknown";
    else
      v15 = off_1E149A140[v14];
    *(_DWORD *)buf = 136446722;
    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    v98 = 1024;
    *(_DWORD *)v99 = v5;
    *(_WORD *)&v99[4] = 2082;
    *(_QWORD *)&v99[6] = v15;
    v40 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v94 = 0;
    if (__nwlog_fault(v40, &type, &v94))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v41 = (id)gLogObj;
        v42 = type;
        if (os_log_type_enabled(v41, type))
        {
          if (v14 > 0x14)
            v43 = "unknown";
          else
            v43 = off_1E149A140[v14];
          *(_DWORD *)buf = 136446722;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(_QWORD *)&v99[6] = v43;
          v68 = "%{public}s Trying to reregister handler for type [%u] %{public}s";
          goto LABEL_136;
        }
        goto LABEL_137;
      }
      if (!v94)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v41 = (id)gLogObj;
        v42 = type;
        if (os_log_type_enabled(v41, type))
        {
          if (v14 > 0x14)
            v58 = "unknown";
          else
            v58 = off_1E149A140[v14];
          *(_DWORD *)buf = 136446722;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(_QWORD *)&v99[6] = v58;
          v68 = "%{public}s Trying to reregister handler for type [%u] %{public}s, backtrace limit exceeded";
          goto LABEL_136;
        }
        goto LABEL_137;
      }
      v44 = v8;
      v45 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v46 = (id)gLogObj;
      v47 = type;
      v48 = os_log_type_enabled(v46, type);
      if (v45)
      {
        if (v48)
        {
          if (v14 > 0x14)
            v49 = "unknown";
          else
            v49 = off_1E149A140[v14];
          *(_DWORD *)buf = 136446978;
          v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
          v98 = 1024;
          *(_DWORD *)v99 = v5;
          *(_WORD *)&v99[4] = 2082;
          *(_QWORD *)&v99[6] = v49;
          v100 = 2082;
          v101 = v45;
          v74 = "%{public}s Trying to reregister handler for type [%u] %{public}s, dumping backtrace:%{public}s";
          goto LABEL_94;
        }
        goto LABEL_95;
      }
      if (v48)
      {
        if (v14 > 0x14)
          v69 = "unknown";
        else
          v69 = off_1E149A140[v14];
        *(_DWORD *)buf = 136446722;
        v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
        v98 = 1024;
        *(_DWORD *)v99 = v5;
        *(_WORD *)&v99[4] = 2082;
        *(_QWORD *)&v99[6] = v69;
        v78 = "%{public}s Trying to reregister handler for type [%u] %{public}s, no backtrace";
LABEL_109:
        _os_log_impl(&dword_182FBE000, v46, v47, v78, buf, 0x1Cu);
        goto LABEL_110;
      }
      goto LABEL_110;
    }
    goto LABEL_138;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v24 = v8;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (!v25)
  {

    goto LABEL_55;
  }
  v26 = v25;
  v27 = 0;
  v28 = *(_QWORD *)v91;
  v82 = v8;
  v83 = v24;
  v80 = *(_QWORD *)v91;
  do
  {
    v29 = 0;
    v81 = v26;
    do
    {
      if (*(_QWORD *)v91 != v28)
        objc_enumerationMutation(v24);
      v30 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v29);
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
      if (!v32)
        goto LABEL_31;
      v33 = v32;
      v34 = *(_QWORD *)v87;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v87 != v34)
            objc_enumerationMutation(v31);
          v36 = *(char **)(*((_QWORD *)&v86 + 1) + 8 * i);
          if ((objc_msgSend(v36, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v50 = (id)gLogObj;
            v51 = v5 - 2;
            if ((v5 - 2) > 0x14)
              v52 = "unknown";
            else
              v52 = off_1E149A140[v51];
            *(_DWORD *)buf = 136446978;
            v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
            v98 = 1024;
            *(_DWORD *)v99 = v5;
            *(_WORD *)&v99[4] = 2082;
            *(_QWORD *)&v99[6] = v52;
            v100 = 2114;
            v101 = v36;
            v59 = (void *)_os_log_send_and_compose_impl();

            type = OS_LOG_TYPE_ERROR;
            v94 = 0;
            if (__nwlog_fault((const char *)v59, &type, &v94))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v60 = (id)gLogObj;
                v61 = type;
                if (os_log_type_enabled(v60, type))
                {
                  if (v51 > 0x14)
                    v62 = "unknown";
                  else
                    v62 = off_1E149A140[v51];
                  *(_DWORD *)buf = 136446978;
                  v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                  v98 = 1024;
                  *(_DWORD *)v99 = v5;
                  *(_WORD *)&v99[4] = 2082;
                  *(_QWORD *)&v99[6] = v62;
                  v100 = 2114;
                  v101 = v36;
                  v75 = "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@";
                  goto LABEL_123;
                }
                goto LABEL_124;
              }
              if (v94)
              {
                v63 = (char *)__nw_create_backtrace_string();
                pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                networkd_settings_init();
                v64 = (id)gLogObj;
                v65 = type;
                v66 = os_log_type_enabled(v64, type);
                if (v63)
                {
                  if (v66)
                  {
                    if (v51 > 0x14)
                      v67 = "unknown";
                    else
                      v67 = off_1E149A140[v51];
                    *(_DWORD *)buf = 136447234;
                    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    v98 = 1024;
                    *(_DWORD *)v99 = v5;
                    *(_WORD *)&v99[4] = 2082;
                    *(_QWORD *)&v99[6] = v67;
                    v100 = 2114;
                    v101 = v36;
                    v102 = 2082;
                    v103 = v63;
                    _os_log_impl(&dword_182FBE000, v64, v65, "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@, dumping backtrace:%{public}s", buf, 0x30u);
                  }

                  free(v63);
                  if (!v59)
                    goto LABEL_127;
                }
                else
                {
                  if (v66)
                  {
                    if (v51 > 0x14)
                      v76 = "unknown";
                    else
                      v76 = off_1E149A140[v51];
                    *(_DWORD *)buf = 136446978;
                    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                    v98 = 1024;
                    *(_DWORD *)v99 = v5;
                    *(_WORD *)&v99[4] = 2082;
                    *(_QWORD *)&v99[6] = v76;
                    v100 = 2114;
                    v101 = v36;
                    _os_log_impl(&dword_182FBE000, v64, v65, "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public}@, no backtrace", buf, 0x26u);
                  }

                  if (!v59)
                    goto LABEL_127;
                }
LABEL_126:
                free(v59);
LABEL_127:

                v8 = v82;
                goto LABEL_140;
              }
              __nwlog_obj();
              v60 = objc_claimAutoreleasedReturnValue();
              v61 = type;
              if (os_log_type_enabled(v60, type))
              {
                if (v51 > 0x14)
                  v73 = "unknown";
                else
                  v73 = off_1E149A140[v51];
                *(_DWORD *)buf = 136446978;
                v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
                v98 = 1024;
                *(_DWORD *)v99 = v5;
                *(_WORD *)&v99[4] = 2082;
                *(_QWORD *)&v99[6] = v73;
                v100 = 2114;
                v101 = v36;
                v75 = "%{public}s Refusing to register handler for type [%u] %{public}s with invalid entitlement %{public"
                      "}@, backtrace limit exceeded";
LABEL_123:
                _os_log_impl(&dword_182FBE000, v60, v61, v75, buf, 0x26u);
              }
LABEL_124:

            }
            if (v59)
              goto LABEL_126;
            goto LABEL_127;
          }
          -[NWPrivilegedHelper allKnownEntitlementSet](self, "allKnownEntitlementSet");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v36);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
        if (v33)
          continue;
        break;
      }
      v27 = 1;
      v8 = v82;
      v28 = v80;
      v26 = v81;
LABEL_31:

      ++v29;
      v24 = v83;
    }
    while (v29 != v26);
    v26 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  }
  while (v26);

  if ((v27 & 1) != 0)
  {
    -[NWPrivilegedHelper handlers](self, "handlers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v84;
    v9 = v85;
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v85, v84);

    goto LABEL_141;
  }
LABEL_55:
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v55 = (id)gLogObj;
  v56 = v5 - 2;
  if ((v5 - 2) > 0x14)
    v57 = "unknown";
  else
    v57 = off_1E149A140[v56];
  *(_DWORD *)buf = 136446722;
  v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
  v98 = 1024;
  *(_DWORD *)v99 = v5;
  *(_WORD *)&v99[4] = 2082;
  *(_QWORD *)&v99[6] = v57;
  v40 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v94 = 0;
  if (!__nwlog_fault(v40, &type, &v94))
  {
LABEL_138:
    if (!v40)
      goto LABEL_140;
    goto LABEL_139;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v41 = (id)gLogObj;
    v42 = type;
    if (os_log_type_enabled(v41, type))
    {
      if (v56 > 0x14)
        v70 = "unknown";
      else
        v70 = off_1E149A140[v56];
      *(_DWORD *)buf = 136446722;
      v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      v98 = 1024;
      *(_DWORD *)v99 = v5;
      *(_WORD *)&v99[4] = 2082;
      *(_QWORD *)&v99[6] = v70;
      v68 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement";
      goto LABEL_136;
    }
    goto LABEL_137;
  }
  if (!v94)
  {
    __nwlog_obj();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = type;
    if (os_log_type_enabled(v41, type))
    {
      if (v56 > 0x14)
        v77 = "unknown";
      else
        v77 = off_1E149A140[v56];
      *(_DWORD *)buf = 136446722;
      v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      v98 = 1024;
      *(_DWORD *)v99 = v5;
      *(_WORD *)&v99[4] = 2082;
      *(_QWORD *)&v99[6] = v77;
      v68 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, backtrace limit exceeded";
LABEL_136:
      _os_log_impl(&dword_182FBE000, v41, v42, v68, buf, 0x1Cu);
    }
LABEL_137:

    goto LABEL_138;
  }
  v44 = v8;
  v45 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = type;
  v71 = os_log_type_enabled(v46, type);
  if (!v45)
  {
    if (v71)
    {
      if (v56 > 0x14)
        v79 = "unknown";
      else
        v79 = off_1E149A140[v56];
      *(_DWORD *)buf = 136446722;
      v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
      v98 = 1024;
      *(_DWORD *)v99 = v5;
      *(_WORD *)&v99[4] = 2082;
      *(_QWORD *)&v99[6] = v79;
      v78 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, no backtrace";
      goto LABEL_109;
    }
LABEL_110:

    v8 = v44;
    if (!v40)
      goto LABEL_140;
    goto LABEL_139;
  }
  if (v71)
  {
    if (v56 > 0x14)
      v72 = "unknown";
    else
      v72 = off_1E149A140[v56];
    *(_DWORD *)buf = 136446978;
    v97 = "-[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:]";
    v98 = 1024;
    *(_DWORD *)v99 = v5;
    *(_WORD *)&v99[4] = 2082;
    *(_QWORD *)&v99[6] = v72;
    v100 = 2082;
    v101 = v45;
    v74 = "%{public}s Refusing to register handler for type [%u] %{public}s without any entitlement, dumping backtrace:%{public}s";
LABEL_94:
    _os_log_impl(&dword_182FBE000, v46, v47, v74, buf, 0x26u);
  }
LABEL_95:

  free(v45);
  v8 = v44;
  if (v40)
LABEL_139:
    free(v40);
LABEL_140:
  v39 = v84;
  v9 = v85;
LABEL_141:

LABEL_142:
LABEL_143:

}

- (void)registerHelperFunctions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  _QWORD v49[2];
  const __CFString *v50;
  const __CFString *v51;
  _QWORD v52[2];
  const __CFString *v53;
  const __CFString *v54;
  _QWORD v55[2];
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  const __CFString *v61;
  _QWORD v62[2];
  const __CFString *v63;
  const __CFString *v64;
  _QWORD v65[2];
  const __CFString *v66;
  const __CFString *v67;
  _QWORD v68[2];
  const __CFString *v69;
  const __CFString *v70;
  _QWORD v71[2];
  const __CFString *v72;
  const __CFString *v73;
  _QWORD v74[2];
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  const __CFString *v78;
  _QWORD v79[2];
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  const __CFString *v83;
  _QWORD v84[2];
  const __CFString *v85;
  const __CFString *v86;
  _QWORD v87[2];
  const __CFString *v88;
  const __CFString *v89;
  _QWORD v90[3];

  v90[2] = *MEMORY[0x1E0C80C00];
  v89 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v3;
  v88 = CFSTR("com.apple.networkd.disable_opportunistic");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleOpportunistic, 2, v5);

  v86 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v6;
  v85 = CFSTR("com.apple.networkd.persistent_interface");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleCreateNetworkAgentKernelSocket, 12, v8);

  v83 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v9;
  v82 = CFSTR("com.apple.networkd.advisory_socket");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleCreateNetworkAdvisoryKernelSocket, 13, v11);

  v80 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleSetNetworkAgentOnInterface, 8, v13);

  v78 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v14;
  v77 = CFSTR("com.apple.networkd.persistent_interface");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleSetPersistentNetworkAgentOnInterface, 14, v16);

  v75 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleReloadManagedNetworkSettings, 9, v18);

  v73 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v19;
  v72 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleCheckMobileAsset, 11, v21);

  v70 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v22;
  v69 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleSetNetworkdSetting, 10, v24);

  v67 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v25;
  v66 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleConstrained, 15, v27);

  v64 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v28;
  v63 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleUltraConstrained, 22, v30);

  v61 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v31;
  v60 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleExpensive, 16, v33);

  v58 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleSetupFakeEthernetPair, 17, v35);

  v56 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleTeardownFakeEthernetPair, 18, v37);

  v54 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v38;
  v53 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleThroughputEstimates, 19, v40);

  v51 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v41;
  v50 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleRadioType, 20, v43);

  v48 = CFSTR("com.apple.networkd_privileged");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v44;
  v47 = CFSTR("com.apple.networkd.modify_settings");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPrivilegedHelper registerHandlerFunction:type:allowedEntitlementGroup:](self, "registerHandlerFunction:type:allowedEntitlementGroup:", handleRunProbes, 21, v46);

}

- (BOOL)startXPCListener
{
  const char *v3;
  NSObject *v4;
  xpc_connection_t mach_service;
  void *v6;
  void *v7;
  Class Class;
  objc_class *v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  os_log_type_t v15;
  _xpc_connection_s *v16;
  _xpc_connection_s *v17;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  os_log_type_t v22;
  _BOOL4 v23;
  os_log_type_t v24;
  os_log_type_t v25;
  _QWORD handler[5];
  id v27;
  char v28;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)networkd_privileged_service;
  -[NWPrivilegedHelper queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service(v3, v4, 1uLL);
  -[NWPrivilegedHelper setListener:](self, "setListener:", mach_service);

  -[NWPrivilegedHelper listener](self, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v31 = "-[NWPrivilegedHelper startXPCListener]";
    v32 = 2082;
    v33 = networkd_privileged_service;
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v28 = 0;
    if (!__nwlog_fault(v11, &type, &v28))
      goto LABEL_37;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v15 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v15, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (!v28)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v25 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v25, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    v22 = type;
    v23 = os_log_type_enabled(v12, type);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v22, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v23)
    {
      *(_DWORD *)buf = 136446722;
      v31 = "-[NWPrivilegedHelper startXPCListener]";
      v32 = 2082;
      v33 = networkd_privileged_service;
      v34 = 2082;
      v35 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v12, v22, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) failed, dumping backtrace:%{public}s", buf, 0x20u);
    }
    goto LABEL_23;
  }
  -[NWPrivilegedHelper listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Class = object_getClass(v7);
  v9 = (objc_class *)MEMORY[0x1E0C812E0];

  if (Class == v9)
  {
    objc_initWeak((id *)buf, self);
    -[NWPrivilegedHelper listener](self, "listener");
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke;
    handler[3] = &unk_1E14A20A8;
    objc_copyWeak(&v27, (id *)buf);
    handler[4] = self;
    xpc_connection_set_event_handler(v16, handler);

    -[NWPrivilegedHelper listener](self, "listener");
    v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v17);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    return 1;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v31 = "-[NWPrivilegedHelper startXPCListener]";
  v32 = 2082;
  v33 = networkd_privileged_service;
  v11 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v28 = 0;
  if (__nwlog_fault(v11, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed", buf, 0x16u);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v28)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v12 = (id)gLogObj;
      v24 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v24, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    v20 = type;
    v21 = os_log_type_enabled(v12, type);
    if (!backtrace_string)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWPrivilegedHelper startXPCListener]";
        v32 = 2082;
        v33 = networkd_privileged_service;
        _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v21)
    {
      *(_DWORD *)buf = 136446722;
      v31 = "-[NWPrivilegedHelper startXPCListener]";
      v32 = 2082;
      v33 = networkd_privileged_service;
      v34 = 2082;
      v35 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v12, v20, "%{public}s FATAL: xpc_connection_create_mach_service(%{public}s, LISTENER) - wrong type failed, dumping backtrace:%{public}s", buf, 0x20u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v11)
      return 0;
    goto LABEL_38;
  }
LABEL_37:
  if (v11)
LABEL_38:
    free(v11);
  return 0;
}

- (void)startThrottlePolicyEventListener
{
  NSObject *v2;

  -[NWPrivilegedHelper queue](self, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v2, &__block_literal_global_42616);

}

- (NWPrivilegedHelper)initWithQueue:(id)a3
{
  id v4;
  NWPrivilegedHelper *v5;
  NWPrivilegedHelper *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NWPrivilegedHelper *v21;
  void *v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  char *backtrace_string;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  os_log_type_t type;
  objc_super v36;
  uint64_t v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((gIsHelper & 1) == 0)
  {
    gIsHelper = 1;
    nw_allow_use_of_dispatch_internal();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
  }
  v36.receiver = self;
  v36.super_class = (Class)NWPrivilegedHelper;
  v5 = -[NWPrivilegedHelper init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[NWPrivilegedHelper setQueue:](v5, "setQueue:", v4);
    }
    else
    {
      getMainQueue();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWPrivilegedHelper setQueue:](v6, "setQueue:", v7);

    }
    -[NWPrivilegedHelper queue](v6, "queue");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = +[ManagedNetworkSettings sharedMNS](ManagedNetworkSettings, "sharedMNS");
    objc_msgSend(v9, "setQueue:", v8);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setHandlers:](v6, "setHandlers:", v10);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setAllKnownEntitlementSet:](v6, "setAllKnownEntitlementSet:", v11);

    -[NWPrivilegedHelper registerHelperFunctions](v6, "registerHelperFunctions");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPrivilegedHelper setAllKnownEntitlementGroup:](v6, "setAllKnownEntitlementGroup:", v12);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[NWPrivilegedHelper allKnownEntitlementSet](v6, "allKnownEntitlementSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[NWPrivilegedHelper allKnownEntitlementGroup](v6, "allKnownEntitlementGroup");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v15);
    }

    -[NWPrivilegedHelper setAllKnownEntitlementSet:](v6, "setAllKnownEntitlementSet:", 0);
    v21 = 0;
    if (-[NWPrivilegedHelper startXPCListener](v6, "startXPCListener"))
    {
      -[NWPrivilegedHelper startThrottlePolicyEventListener](v6, "startThrottlePolicyEventListener");
      v21 = v6;
    }
    goto LABEL_16;
  }
  __nwlog_obj();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v40 = "-[NWPrivilegedHelper initWithQueue:]";
  v24 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v34 = 0;
  if (__nwlog_fault(v24, &type, &v34))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        v27 = "%{public}s [super init] failed";
LABEL_30:
        _os_log_impl(&dword_182FBE000, v25, v26, v27, buf, 0xCu);
      }
    }
    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = type;
        v29 = os_log_type_enabled(v25, type);
        if (backtrace_string)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            v40 = "-[NWPrivilegedHelper initWithQueue:]";
            v41 = 2082;
            v42 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v25, v26, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_32;
        }
        if (!v29)
          goto LABEL_31;
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        v27 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_30;
      }
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v25, type))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[NWPrivilegedHelper initWithQueue:]";
        v27 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_30;
      }
    }
LABEL_31:

  }
LABEL_32:
  if (v24)
    free(v24);
  v21 = 0;
LABEL_16:

  return v21;
}

- (void)handleRequest:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  NWPHContext *v8;
  uint64_t uint64;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  int v20;
  const char *v21;
  int64_t v22;
  const char *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[10];
  _BYTE v31[10];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[NWPHContext initWithRequest:onConnection:]([NWPHContext alloc], "initWithRequest:onConnection:", v6, v7);
  if (v8)
  {
    uint64 = xpc_dictionary_get_uint64(v6, (const char *)networkd_privileged_key_type);
    -[NWPrivilegedHelper handlers](self, "handlers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", uint64);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "allowedEntitlementGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = connectionMatchesEntitlementGroup(v7, v13);

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if ((uint64 - 2) > 0x14)
            v17 = "unknown";
          else
            v17 = off_1E149A140[(uint64 - 2)];
          v27 = 136446722;
          v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          v29 = 2082;
          *(_QWORD *)v30 = v17;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)v31 = -[NWPHContext pid](v8, "pid");
          _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Handling %{public}s from pid %d", (uint8_t *)&v27, 0x1Cu);
        }

        v22 = ((uint64_t (*)(NWPHContext *))objc_msgSend(v12, "handlerFunction"))(v8);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          if ((uint64 - 2) > 0x14)
            v23 = "unknown";
          else
            v23 = off_1E149A140[(uint64 - 2)];
          v24 = -[NWPHContext pid](v8, "pid");
          v27 = 136446978;
          v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
          v29 = 2048;
          *(_QWORD *)v30 = v22;
          *(_WORD *)&v30[8] = 2082;
          *(_QWORD *)v31 = v23;
          *(_WORD *)&v31[8] = 1024;
          v32 = v24;
          _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Returning %lld for %{public}s to pid %d", (uint8_t *)&v27, 0x26u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = -[NWPHContext pid](v8, "pid");
        if ((uint64 - 2) > 0x14)
          v21 = "unknown";
        else
          v21 = off_1E149A140[(uint64 - 2)];
        v27 = 136446978;
        v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        v29 = 1024;
        *(_DWORD *)v30 = v20;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)v31 = 2082;
        *(_QWORD *)&v31[2] = v21;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s Client pid %d missing entitlements for type [%u] %{public}s", (uint8_t *)&v27, 0x22u);
        v22 = -1002;
      }
      else
      {
        v22 = -1002;
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = -[NWPHContext pid](v8, "pid");
        if ((uint64 - 2) > 0x14)
          v19 = "unknown";
        else
          v19 = off_1E149A140[(uint64 - 2)];
        v27 = 136446978;
        v28 = "-[NWPrivilegedHelper handleRequest:onConnection:]";
        v29 = 1024;
        *(_DWORD *)v30 = v18;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = uint64;
        *(_WORD *)v31 = 2082;
        *(_QWORD *)&v31[2] = v19;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s Client pid %d sent invalid type [%u] %{public}s", (uint8_t *)&v27, 0x22u);
      }
      v22 = -1003;
    }

    -[NWPHContext reply](v8, "reply");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v25, (const char *)networkd_privileged_key_result, v22);

    -[NWPHContext reply](v8, "reply");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message((xpc_connection_t)v7, v26);

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

- (OS_xpc_object)listener
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)handlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableSet)allKnownEntitlementSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllKnownEntitlementSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)allKnownEntitlementGroup
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllKnownEntitlementGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKnownEntitlementGroup, 0);
  objc_storeStrong((id *)&self->_allKnownEntitlementSet, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__NWPrivilegedHelper_startThrottlePolicyEventListener__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  char *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  char v29;
  os_log_type_t type;
  size_t v31;
  int v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  _WORD v40[17];

  *(_QWORD *)&v40[13] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v32 = 0;
  v31 = 4;
  if (sysctlbyname("kern.ipc.io_policy.throttled", &v32, &v31, 0, 0))
  {
    v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    v5 = v4;
    if (v3 == 2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = 2;
        _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d", buf, 0x1Cu);
      }

      goto LABEL_17;
    }
    *(_DWORD *)buf = 136446722;
    v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    v35 = 2082;
    v36 = "kern.ipc.io_policy.throttled";
    v37 = 1024;
    v38 = v3;
    v6 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (__nwlog_fault(v6, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_40;
        *(_DWORD *)buf = 136446722;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v3;
        v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d";
LABEL_38:
        v25 = v7;
        v26 = v8;
        goto LABEL_39;
      }
      if (!v29)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v7 = (id)gLogObj;
        v8 = type;
        if (!os_log_type_enabled(v7, type))
          goto LABEL_40;
        *(_DWORD *)buf = 136446722;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v3;
        v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, backtrace limit exceeded";
        goto LABEL_38;
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
LABEL_40:

          if (!v6)
            goto LABEL_17;
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446722;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v3;
        v9 = "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, no backtrace";
        v25 = v7;
        v26 = v11;
LABEL_39:
        _os_log_impl(&dword_182FBE000, v25, v26, v9, buf, 0x1Cu);
        goto LABEL_40;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446978;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v3;
        v39 = 2082;
        *(_QWORD *)v40 = backtrace_string;
        _os_log_impl(&dword_182FBE000, v7, v11, "%{public}s sysctlbyname(%{public}s) read failed %{darwin.errno}d, dumping backtrace:%{public}s", buf, 0x26u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_17:
      v32 = -1;
      goto LABEL_18;
    }
LABEL_16:
    free(v6);
    goto LABEL_17;
  }
LABEL_18:
  v13 = xpc_dictionary_get_uint64(v2, "_State") & 1;
  if (v13 == v32)
    goto LABEL_51;
  if (sysctlbyname("kern.ipc.io_policy.throttled", 0, 0, &v32, 4uLL))
  {
    v14 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    v16 = v15;
    if (v14 == 2)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v13;
        v39 = 1024;
        *(_DWORD *)v40 = 2;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d", buf, 0x22u);
      }

      goto LABEL_51;
    }
    *(_DWORD *)buf = 136446978;
    v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    v35 = 2082;
    v36 = "kern.ipc.io_policy.throttled";
    v37 = 1024;
    v38 = v13;
    v39 = 1024;
    *(_DWORD *)v40 = v14;
    v18 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v29 = 0;
    if (!__nwlog_fault(v18, &type, &v29))
      goto LABEL_49;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446978;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v13;
        v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d";
LABEL_46:
        v27 = v19;
        v28 = v20;
LABEL_47:
        _os_log_impl(&dword_182FBE000, v27, v28, v21, buf, 0x22u);
      }
    }
    else if (v29)
    {
      v22 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v23 = type;
      v24 = os_log_type_enabled(v19, type);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447234;
          v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
          v35 = 2082;
          v36 = "kern.ipc.io_policy.throttled";
          v37 = 1024;
          v38 = v13;
          v39 = 1024;
          *(_DWORD *)v40 = v14;
          v40[2] = 2082;
          *(_QWORD *)&v40[3] = v22;
          _os_log_impl(&dword_182FBE000, v19, v23, "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, dumping backtrace:%{public}s", buf, 0x2Cu);
        }

        free(v22);
        goto LABEL_49;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446978;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v13;
        v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, no backtrace";
        v27 = v19;
        v28 = v23;
        goto LABEL_47;
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446978;
        v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
        v35 = 2082;
        v36 = "kern.ipc.io_policy.throttled";
        v37 = 1024;
        v38 = v13;
        v39 = 1024;
        *(_DWORD *)v40 = v14;
        v21 = "%{public}s sysctlbyname(%{public}s) to %d failed %{darwin.errno}d, backtrace limit exceeded";
        goto LABEL_46;
      }
    }

LABEL_49:
    if (v18)
      free(v18);
    goto LABEL_51;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v17 = (id)gLogObj;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v34 = "-[NWPrivilegedHelper startThrottlePolicyEventListener]_block_invoke";
    v35 = 2082;
    v36 = "kern.ipc.io_policy.throttled";
    v37 = 1024;
    v38 = v13;
    v39 = 1024;
    *(_DWORD *)v40 = v32;
    _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}s %{public}s=%d (old=%d)", buf, 0x22u);
  }

LABEL_51:
}

void __38__NWPrivilegedHelper_startXPCListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  Class Class;
  void *v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  char *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  _xpc_connection_s *v20;
  NSObject *v21;
  _xpc_connection_s *v22;
  NSObject *v23;
  pid_t pid;
  os_log_type_t v25;
  char *backtrace_string;
  os_log_type_t v27;
  _BOOL4 v28;
  os_log_type_t v29;
  _QWORD handler[5];
  id v31;
  char v32;
  os_log_type_t type[4];
  const char *v34;
  __int16 v35;
  pid_t v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (!WeakRetained)
      goto LABEL_50;
    Class = object_getClass(v3);
    if (Class == (Class)MEMORY[0x1E0C812E0])
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v38 = __Block_byref_object_copy__42647;
      v39 = __Block_byref_object_dispose__42648;
      v18 = v3;
      v40 = v18;
      objc_msgSend(WeakRetained, "allKnownEntitlementGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = connectionMatchesEntitlementGroup(v18, v19);

      if ((v18 & 1) != 0)
      {
        v20 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(*(id *)(a1 + 32), "queue");
        v21 = objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_queue(v20, v21);

        objc_initWeak((id *)type, WeakRetained);
        v22 = *(_xpc_connection_s **)(*(_QWORD *)&buf[8] + 40);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __38__NWPrivilegedHelper_startXPCListener__block_invoke_62;
        handler[3] = &unk_1E14A2080;
        handler[4] = buf;
        objc_copyWeak(&v31, (id *)type);
        xpc_connection_set_event_handler(v22, handler);
        xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)&buf[8] + 40));
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)type);
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)&buf[8] + 40));
          *(_DWORD *)type = 136446466;
          v34 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          v35 = 1024;
          v36 = pid;
          _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_ERROR, "%{public}s client pid %d does not have any known entitlement", (uint8_t *)type, 0x12u);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)&buf[8] + 40));
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_50;
    }
    if (Class != (Class)MEMORY[0x1E0C81310])
    {
LABEL_50:

      goto LABEL_51;
    }
    v6 = (void *)MEMORY[0x186DB5A08](v3);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v6;
    v8 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v32 = 0;
    if (__nwlog_fault(v8, type, &v32))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s FATAL: XPC listener received error %{public}s", buf, 0x16u);
        }
      }
      else if (v32)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v27 = type[0];
        v28 = os_log_type_enabled(v9, type[0]);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v6;
            *(_WORD *)&buf[22] = 2082;
            v38 = (uint64_t (*)(uint64_t, uint64_t))backtrace_string;
            _os_log_impl(&dword_182FBE000, v9, v27, "%{public}s FATAL: XPC listener received error %{public}s, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          if (!v8)
            goto LABEL_49;
          goto LABEL_48;
        }
        if (v28)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_182FBE000, v9, v27, "%{public}s FATAL: XPC listener received error %{public}s, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        __nwlog_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        v29 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_182FBE000, v9, v29, "%{public}s FATAL: XPC listener received error %{public}s, backtrace limit exceeded", buf, 0x16u);
        }
      }

    }
    if (!v8)
    {
LABEL_49:
      free(v6);
      goto LABEL_50;
    }
LABEL_48:
    free(v8);
    goto LABEL_49;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v11 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
  v12 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  v32 = 0;
  if (__nwlog_fault(v12, type, &v32))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v14 = type[0];
      if (os_log_type_enabled(v13, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s called with null msg", buf, 0xCu);
      }
    }
    else if (v32)
    {
      v15 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v16 = type[0];
      v17 = os_log_type_enabled(v13, type[0]);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = v15;
          _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s called with null msg, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v15);
        if (v12)
          goto LABEL_40;
        goto LABEL_51;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_182FBE000, v13, v16, "%{public}s called with null msg, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v25 = type[0];
      if (os_log_type_enabled(v13, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        _os_log_impl(&dword_182FBE000, v13, v25, "%{public}s called with null msg, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v12)
LABEL_40:
    free(v12);
LABEL_51:

}

void __38__NWPrivilegedHelper_startXPCListener__block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *WeakRetained;
  Class Class;
  char *v7;
  NSObject *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  char *backtrace_string;
  os_log_type_t v15;
  _BOOL4 v16;
  char *v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  char v25;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    WeakRetained = (id)gLogObj;
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
      _os_log_impl(&dword_182FBE000, WeakRetained, OS_LOG_TYPE_DEBUG, "%{public}s received request on removed connection, ignoring.", buf, 0xCu);
    }
    goto LABEL_45;
  }
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      Class = object_getClass(v4);
      if (Class != (Class)MEMORY[0x1E0C812F8])
      {
        if (Class != (Class)MEMORY[0x1E0C81310])
        {
          v7 = (char *)MEMORY[0x186DB5A08](v4);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v8 = (id)gLogObj;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            v29 = 2082;
            v30 = v7;
            _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_ERROR, "%{public}s received unknown type for request: %{public}s", buf, 0x16u);
          }

          free(v7);
          goto LABEL_45;
        }
        if (v4 == (void *)MEMORY[0x1E0C81258])
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v21 = (id)gLogObj;
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            goto LABEL_43;
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          v22 = "%{public}s received XPC_ERROR_CONNECTION_INTERRUPTED, removing connection";
        }
        else
        {
          if (v4 != (void *)MEMORY[0x1E0C81260])
          {
            if (v4 != (void *)MEMORY[0x1E0C81288])
            {
              v17 = (char *)MEMORY[0x186DB5A08](v4);
              __nwlog_obj();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136446466;
                v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
                v29 = 2082;
                v30 = v17;
                _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}s received unknown XPC error %{public}s, removing connection", buf, 0x16u);
              }

              free(v17);
              goto LABEL_44;
            }
            __nwlog_obj();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136446210;
              v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
              v22 = "%{public}s received XPC_ERROR_TERMINATION_IMMINENT, removing connection";
              goto LABEL_42;
            }
LABEL_43:

LABEL_44:
            v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v24 = *(void **)(v23 + 40);
            *(_QWORD *)(v23 + 40) = 0;

            goto LABEL_45;
          }
          __nwlog_obj();
          v21 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            goto LABEL_43;
          *(_DWORD *)buf = 136446210;
          v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
          v22 = "%{public}s received XPC_ERROR_CONNECTION_INVALID, removing connection";
        }
LABEL_42:
        _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0xCu);
        goto LABEL_43;
      }
      -[NSObject handleRequest:onConnection:](WeakRetained, "handleRequest:onConnection:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    }
LABEL_45:

    goto LABEL_46;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v25 = 0;
  if (__nwlog_fault(v10, &type, &v25))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        v13 = "%{public}s called with null request";
LABEL_29:
        v19 = v11;
        v20 = v12;
LABEL_30:
        _os_log_impl(&dword_182FBE000, v19, v20, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v15 = type;
        v16 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
            v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v11, v15, "%{public}s called with null request, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_32;
        }
        if (!v16)
          goto LABEL_31;
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        v13 = "%{public}s called with null request, no backtrace";
        v19 = v11;
        v20 = v15;
        goto LABEL_30;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWPrivilegedHelper startXPCListener]_block_invoke";
        v13 = "%{public}s called with null request, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_31:

  }
LABEL_32:
  if (v10)
    free(v10);
LABEL_46:

}

@end
