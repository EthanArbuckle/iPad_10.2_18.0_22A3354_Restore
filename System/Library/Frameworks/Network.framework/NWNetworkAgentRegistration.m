@implementation NWNetworkAgentRegistration

void __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "readSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    WeakRetained = v5;
    if (v3 == v4)
    {
      objc_msgSend(v5, "handleMessageFromAgent");
      WeakRetained = v5;
    }
  }

}

- (int)registrationSocket
{
  return self->_registrationSocket;
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (NWNetworkAgent)networkAgent
{
  return (NWNetworkAgent *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isRegistered
{
  return -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket") != -1;
}

- (void)handleMessageFromAgent
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  int v77;
  uint64_t v78;
  _BYTE *v79;
  _BYTE *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  char v85;
  unsigned __int8 v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  void *v93;
  char v94;
  __int128 buf;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v94 = 0;
  if (-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
  {
    v3 = (unsigned __int8 *)nw_network_agent_ctl_copy_received_agent_message(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), &v94);
    if (v3)
    {
      v4 = v3;
      v5 = *v3;
      if (v5 > 0x1A)
      {
LABEL_77:
        free(v4);
        return;
      }
      if (((1 << v5) & 0x400F400) != 0)
      {
        if (*((_DWORD *)v3 + 3) < 0x10u)
        {
          v6 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!uuid_is_null(v4 + 16))
          {
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4 + 16);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ClientUUID"));

          }
          objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FromUser"));
          v5 = *v4;
        }
        switch(v5)
        {
          case 0xAu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_opt_respondsToSelector();

            if ((v12 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "requestNexusWithOptions:", v6);

            }
            break;
          case 0xCu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_respondsToSelector();

            if ((v17 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "closeNexusWithOptions:", v6);

            }
            break;
          case 0xDu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "startAgentWithOptions:", v6);

            }
            break;
          case 0xEu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_opt_respondsToSelector();

            if ((v23 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "assertAgentWithOptions:", v6);

            }
            break;
          case 0xFu:
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_opt_respondsToSelector();

            if ((v26 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "unassertAgentWithOptions:", v6);

            }
            break;
          case 0x1Au:
            if (*((_DWORD *)v4 + 3) < 0x14u)
              v28 = 0;
            else
              v28 = *((unsigned int *)v4 + 8);
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_opt_respondsToSelector();

            if ((v75 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "reportError:withOptions:", v28, v6);

            }
            break;
          default:
            goto LABEL_76;
        }
        goto LABEL_76;
      }
      if (((1 << v5) & 0x320) == 0)
      {
        if (v5 != 25)
          goto LABEL_77;
        -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0)
          goto LABEL_77;
        -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "tokenLowWaterMarkReached");
        goto LABEL_76;
      }
      if (*((_DWORD *)v3 + 3) < 0x18u)
      {
        v6 = 0;
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_DWORD *)v4 + 5))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("PID"));

      }
      if (uuid_is_null(v4 + 24))
      {
        v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0)
          goto LABEL_19;
      }
      else
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4 + 24);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("ProcessUUID"));

        v10 = *((_DWORD *)v4 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_19:
          if ((v10 & 1) == 0)
          {
LABEL_42:
            v30 = *v4;
            switch(v30)
            {
              case 5:
                -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_opt_respondsToSelector();

                if ((v36 & 1) != 0)
                {
                  -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "startAgentWithOptions:", v6);
LABEL_49:
                  v37 = v34;

                  if ((v37 & 1) != 0)
                  {
LABEL_76:

                    goto LABEL_77;
                  }
                }
                break;
              case 9:
                -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_opt_respondsToSelector();

                if ((v73 & 1) == 0)
                  goto LABEL_76;
                -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "unassertAgentWithOptions:", v6);
                goto LABEL_75;
              case 8:
                -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_opt_respondsToSelector();

                if ((v32 & 1) != 0)
                {
                  -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "assertAgentWithOptions:", v6);
                  goto LABEL_49;
                }
                break;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v38, "copyAgentData");

            buf = 0uLL;
            -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "getUUIDBytes:", &buf);

            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_opt_respondsToSelector();

            if ((v42 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend(v43, "isSpecificUseOnly");

            }
            else
            {
              v92 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_opt_respondsToSelector();

            if ((v45 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend(v46, "isNetworkProvider");

            }
            else
            {
              v91 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_opt_respondsToSelector();

            if ((v48 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v49, "isNexusProvider");

            }
            else
            {
              v90 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_opt_respondsToSelector();

            if ((v51 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v52, "supportsListenRequests");

            }
            else
            {
              v89 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_opt_respondsToSelector();

            if ((v54 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v55, "supportsBrowseRequests");

            }
            else
            {
              v88 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_opt_respondsToSelector();

            if ((v57 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v58, "supportsResolveRequests");

            }
            else
            {
              v87 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_opt_respondsToSelector();

            if ((v60 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = objc_msgSend(v61, "requiresAssert");

            }
            else
            {
              v86 = 0;
            }
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_opt_respondsToSelector();

            v93 = v6;
            if ((v63 & 1) != 0)
            {
              -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(v64, "updateClientsImmediately");

            }
            else
            {
              v85 = 0;
            }
            -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "agentDescription");
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            v81 = -[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket");
            v80 = (_BYTE *)objc_msgSend(v84, "UTF8String");
            v79 = (_BYTE *)objc_msgSend(v83, "UTF8String");
            v78 = objc_msgSend(v82, "UTF8String");
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v66, "isActive");
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v67, "isKernelActivated");
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "isUserActivated");
            -[NWNetworkAgentRegistration networkAgent](self, "networkAgent");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            nw_network_agent_ctl_setsockopt(v81, 3, (unsigned __int8 *)&buf, v80, v79, v78, v77, v68, v70, objc_msgSend(v71, "isVoluntary"), v92, v91, v90, v89, v88, v87, 0, v86, v85,
              (const unsigned __int8 *)objc_msgSend(v39, "bytes"),
              objc_msgSend(v39, "length"));

            v6 = v93;
LABEL_75:

            goto LABEL_76;
          }
LABEL_41:
          objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FromUser"));
          goto LABEL_42;
        }
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FromKernel"));
      if ((*((_DWORD *)v4 + 4) & 1) == 0)
        goto LABEL_42;
      goto LABEL_41;
    }
    if (!v94)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = "-[NWNetworkAgentRegistration handleMessageFromAgent]";
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_ERROR, "%{public}s Network Agent Registration failed to read message", (uint8_t *)&buf, 0xCu);
      }

    }
  }
}

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3
{
  NWNetworkAgentRegistration *v4;
  NWNetworkAgentRegistration *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NWNetworkAgentRegistration *v9;
  void *v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  _BOOL4 v17;
  char v18;
  os_log_type_t type;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NWNetworkAgentRegistration;
  v4 = -[NWNetworkAgentRegistration init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_networkAgentClass = a3;
    v4->_registrationSocket = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("NWNetworkAgentRegistration queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = v5;
    goto LABEL_3;
  }
  __nwlog_obj();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v18 = 0;
  if (__nwlog_fault(v12, &type, &v18))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v13, v14, v15, buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = type;
        v17 = os_log_type_enabled(v13, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
            v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v17)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:]";
        v15 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v12)
    free(v12);
LABEL_3:

  return v5;
}

- (NWNetworkAgentRegistration)initWithNetworkAgentClass:(Class)a3 queue:(id)a4
{
  id v7;
  void *v8;
  NWNetworkAgentRegistration *v9;
  NWNetworkAgentRegistration *v10;
  void *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  void *v17;
  void *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  char *backtrace_string;
  _BOOL4 v24;
  char *v25;
  _BOOL4 v26;
  char *v27;
  _BOOL4 v28;
  objc_super v29;
  char v30;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    __nwlog_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v30 = 0;
    if (!__nwlog_fault(v13, &type, &v30))
      goto LABEL_46;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null agentClass";
LABEL_44:
        _os_log_impl(&dword_182FBE000, v14, v15, v16, buf, 0xCu);
      }
    }
    else if (v30)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      v24 = os_log_type_enabled(v14, type);
      if (backtrace_string)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136446466;
          v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
          v34 = 2082;
          v35 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s called with null agentClass, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_46:
        if (!v13)
        {
LABEL_48:

          v10 = 0;
          goto LABEL_5;
        }
LABEL_47:
        free(v13);
        goto LABEL_48;
      }
      if (v24)
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null agentClass, no backtrace";
        goto LABEL_44;
      }
    }
    else
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null agentClass, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
LABEL_45:

    goto LABEL_46;
  }
  if (!v7)
  {
    __nwlog_obj();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v30 = 0;
    if (!__nwlog_fault(v13, &type, &v30))
      goto LABEL_46;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null queue";
        goto LABEL_44;
      }
    }
    else
    {
      if (v30)
      {
        v25 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = type;
        v26 = os_log_type_enabled(v14, type);
        if (v25)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
            v34 = 2082;
            v35 = v25;
            _os_log_impl(&dword_182FBE000, v14, v15, "%{public}s called with null queue, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v25);
          if (!v13)
            goto LABEL_48;
          goto LABEL_47;
        }
        if (!v26)
          goto LABEL_45;
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null queue, no backtrace";
        goto LABEL_44;
      }
      __nwlog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v16 = "%{public}s called with null queue, backtrace limit exceeded";
        goto LABEL_44;
      }
    }
    goto LABEL_45;
  }
  v29.receiver = self;
  v29.super_class = (Class)NWNetworkAgentRegistration;
  v9 = -[NWNetworkAgentRegistration init](&v29, sel_init);
  if (v9)
  {
    v10 = v9;
    v9->_networkAgentClass = a3;
    v9->_registrationSocket = -1;
    objc_storeStrong((id *)&v9->_queue, a4);
    goto LABEL_5;
  }
  __nwlog_obj();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
  v19 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v30 = 0;
  if (__nwlog_fault(v19, &type, &v30))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v22 = "%{public}s [super init] failed";
LABEL_51:
        _os_log_impl(&dword_182FBE000, v20, v21, v22, buf, 0xCu);
      }
    }
    else
    {
      if (v30)
      {
        v27 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = type;
        v28 = os_log_type_enabled(v20, type);
        if (v27)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
            v34 = 2082;
            v35 = v27;
            _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_53;
        }
        if (!v28)
          goto LABEL_52;
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v22 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_51;
      }
      __nwlog_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v20, type))
      {
        *(_DWORD *)buf = 136446210;
        v33 = "-[NWNetworkAgentRegistration initWithNetworkAgentClass:queue:]";
        v22 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_51;
      }
    }
LABEL_52:

  }
LABEL_53:
  if (v19)
    free(v19);
  v10 = 0;
LABEL_5:

  return v10;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;

  -[NWNetworkAgentRegistration readSource](self, "readSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWNetworkAgentRegistration readSource](self, "readSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NWNetworkAgentRegistration setReadSource:](self, "setReadSource:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)NWNetworkAgentRegistration;
  -[NWNetworkAgentRegistration dealloc](&v5, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendPrettyObject:withName:indent:showFullContent:", v7, CFSTR("Domain"), v4, 1);

  -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("Type"), v4, 1);

  -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("UUID"), v4, 1);

  return v6;
}

- (id)description
{
  return -[NWNetworkAgentRegistration descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (int)dupRegistrationFileDescriptor
{
  if (-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket") < 0)
    return -1;
  else
    return dup(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"));
}

- (BOOL)createReadSourceWithRegistrationSocket:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  id v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  os_log_type_t v23;
  char *backtrace_string;
  os_log_type_t v25;
  _BOOL4 v26;
  os_log_type_t v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD handler[4];
  int v32;
  char v33;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x80000000) == 0)
  {
    v3 = *(_QWORD *)&a3;
    if (-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s Agent registration is already active", buf, 0xCu);
      }

      return 0;
    }
    -[NWNetworkAgentRegistration queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_source_create(MEMORY[0x1E0C80DB8], v3, 0, v11);

    v10 = v12 != 0;
    if (v12)
    {
      -[NWNetworkAgentRegistration setRegistrationSocket:](self, "setRegistrationSocket:", v3);
      v13 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke;
      handler[3] = &__block_descriptor_36_e5_v8__0l;
      v32 = v3;
      dispatch_source_set_cancel_handler(v12, handler);
      objc_initWeak((id *)buf, self);
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke_2;
      v28[3] = &unk_1E14AB250;
      objc_copyWeak(&v30, (id *)buf);
      v14 = v12;
      v29 = v14;
      dispatch_source_set_event_handler(v14, v28);
      dispatch_resume(v14);
      -[NWNetworkAgentRegistration setReadSource:](self, "setReadSource:", v14);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
LABEL_30:

      return v10;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v18 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v33 = 0;
    if (__nwlog_fault(v19, &type, &v33))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v21 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s dispatch_source_create failed", buf, 0xCu);
        }
      }
      else if (v33)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v25 = type;
        v26 = os_log_type_enabled(v20, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
            v37 = 2082;
            v38 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v20, v25, "%{public}s dispatch_source_create failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          if (!v19)
            goto LABEL_29;
          goto LABEL_28;
        }
        if (v26)
        {
          *(_DWORD *)buf = 136446210;
          v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_182FBE000, v20, v25, "%{public}s dispatch_source_create failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v27 = type;
        if (os_log_type_enabled(v20, type))
        {
          *(_DWORD *)buf = 136446210;
          v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          _os_log_impl(&dword_182FBE000, v20, v27, "%{public}s dispatch_source_create failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v19)
    {
LABEL_29:
      close(v3);
      goto LABEL_30;
    }
LABEL_28:
    free(v19);
    goto LABEL_29;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v33 = 0;
  if (__nwlog_fault(v7, &type, &v33))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s called with null registrationSocket", buf, 0xCu);
      }
    }
    else if (v33)
    {
      v15 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v16 = type;
      v17 = os_log_type_enabled(v8, type);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
          v37 = 2082;
          v38 = v15;
          _os_log_impl(&dword_182FBE000, v8, v16, "%{public}s called with null registrationSocket, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v15);
        if (!v7)
          return 0;
        goto LABEL_12;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_182FBE000, v8, v16, "%{public}s called with null registrationSocket, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v23 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v36 = "-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:]";
        _os_log_impl(&dword_182FBE000, v8, v23, "%{public}s called with null registrationSocket, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v7)
LABEL_12:
    free(v7);
  return 0;
}

- (BOOL)registerNetworkAgent:(id)a3 withFileDescriptor:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v15;
  unsigned __int8 v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  void *v25;
  __int128 buf;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = "-[NWNetworkAgentRegistration registerNetworkAgent:withFileDescriptor:]";
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_ERROR, "%{public}s Agent is not a valid class", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_8;
  }
  if (!-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:](self, "createReadSourceWithRegistrationSocket:", v4))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_35;
  }
  buf = 0uLL;
  objc_msgSend(v6, "agentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getUUIDBytes:", &buf);

  v25 = (void *)objc_msgSend(v6, "copyAgentData");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = objc_msgSend(v6, "isSpecificUseOnly");
  else
    v24 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v23 = objc_msgSend(v6, "isNetworkProvider");
  else
    v23 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = objc_msgSend(v6, "isNexusProvider");
  else
    v22 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = objc_msgSend(v6, "supportsListenRequests");
  else
    v21 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(v6, "supportsBrowseRequests");
  else
    v20 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v6, "supportsResolveRequests");
  else
    v18 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = objc_msgSend(v6, "requiresAssert");
  else
    v16 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v6, "updateClientsImmediately");
  else
    v15 = 0;
  -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "agentDescription");
  v19 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = nw_network_agent_ctl_setsockopt(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 1, (unsigned __int8 *)&buf, (_BYTE *)objc_msgSend(v10, "UTF8String"), (_BYTE *)objc_msgSend(v11, "UTF8String"), objc_msgSend(v17, "UTF8String"), objc_msgSend(v6, "isActive"), objc_msgSend(v6, "isKernelActivated"), objc_msgSend(v6, "isUserActivated"), objc_msgSend(v6, "isVoluntary"), v24, v23, v22, v21, v20, v18, 0, v16, v15,
          (const unsigned __int8 *)objc_msgSend(v25, "bytes"),
          objc_msgSend(v25, "length"));
  v9 = v12 >= 0;
  if (v12 < 0)
  {
    close(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"));
    -[NWNetworkAgentRegistration setRegistrationSocket:](self, "setRegistrationSocket:", 0xFFFFFFFFLL);
  }
  else
  {
    -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v6);
    objc_msgSend(v6, "agentUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWNetworkAgentRegistration setRegisteredUUID:](self, "setRegisteredUUID:", v13);

  }
LABEL_35:

  return v9;
}

- (BOOL)registerNetworkAgent:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[NWNetworkAgentRegistration registerNetworkAgent:withFileDescriptor:](self, "registerNetworkAgent:withFileDescriptor:", v4, +[NWNetworkAgentRegistration newRegistrationFileDescriptor](NWNetworkAgentRegistration, "newRegistrationFileDescriptor"));

  return (char)self;
}

- (BOOL)setRegisteredNetworkAgent:(id)a3 fileDescriptor:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v14 = "-[NWNetworkAgentRegistration setRegisteredNetworkAgent:fileDescriptor:]";
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_ERROR, "%{public}s Agent is not a valid class", buf, 0xCu);
    }

    goto LABEL_7;
  }
  -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v6);
  objc_msgSend(v6, "agentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNetworkAgentRegistration setRegisteredUUID:](self, "setRegisteredUUID:", v7);

  if (!-[NWNetworkAgentRegistration createReadSourceWithRegistrationSocket:](self, "createReadSourceWithRegistrationSocket:", v4))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[NWNetworkAgentRegistration queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke;
  block[3] = &unk_1E14ACFD0;
  block[4] = self;
  dispatch_async(v8, block);

  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)updateNetworkAgent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  unsigned __int8 v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  void *v24;
  unsigned __int8 uu[8];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
    goto LABEL_6;
  -[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "agentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    *(_QWORD *)uu = 0;
    v26 = 0;
    -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getUUIDBytes:", uu);

    v24 = (void *)objc_msgSend(v4, "copyAgentData");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = objc_msgSend(v4, "isSpecificUseOnly");
    else
      v23 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = objc_msgSend(v4, "isNetworkProvider");
    else
      v22 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = objc_msgSend(v4, "isNexusProvider");
    else
      v21 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = objc_msgSend(v4, "supportsListenRequests");
    else
      v20 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(v4, "supportsBrowseRequests");
    else
      v19 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = objc_msgSend(v4, "supportsResolveRequests");
    else
      v18 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = objc_msgSend(v4, "requiresAssert");
    else
      v16 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v4, "updateClientsImmediately");
    else
      v15 = 0;
    -[objc_class agentDomain](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class agentType](-[NWNetworkAgentRegistration networkAgentClass](self, "networkAgentClass"), "agentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "agentDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v14 = nw_network_agent_ctl_setsockopt(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 3, uu, (_BYTE *)objc_msgSend(v11, "UTF8String"), (_BYTE *)objc_msgSend(v12, "UTF8String"), objc_msgSend(v13, "UTF8String"), objc_msgSend(v4, "isActive"), objc_msgSend(v4, "isKernelActivated"), objc_msgSend(v4, "isUserActivated"), objc_msgSend(v4, "isVoluntary"), v23, v22, v21, v20, v19, v18, 0, v16, v15,
            (const unsigned __int8 *)objc_msgSend(v24, "bytes"),
            objc_msgSend(v24, "length"));
    v9 = v14 >= 0;
    if ((v14 & 0x80000000) == 0)
      -[NWNetworkAgentRegistration setNetworkAgent:](self, "setNetworkAgent:", v4);

  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (BOOL)unregisterNetworkAgent
{
  _BOOL4 v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  if (v3)
  {
    nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 2, 0, 0, 0, 0);
    -[NWNetworkAgentRegistration queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke;
    block[3] = &unk_1E14ACFD0;
    block[4] = self;
    dispatch_async(v4, block);

  }
  return v3;
}

- (BOOL)addToken:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  void *v12;
  char *backtrace_string;
  _BOOL4 v14;
  const char *v15;
  _BOOL4 v16;
  char v18;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    __nwlog_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v21 = "-[NWNetworkAgentRegistration addToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v18 = 0;
    if (!__nwlog_fault(v8, &type, &v18))
      goto LABEL_33;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null token";
LABEL_31:
        _os_log_impl(&dword_182FBE000, v9, v10, v11, buf, 0xCu);
      }
LABEL_32:

LABEL_33:
      if (v8)
        free(v8);
      goto LABEL_35;
    }
    if (!v18)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null token, backtrace limit exceeded";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = type;
    v14 = os_log_type_enabled(v9, type);
    if (!backtrace_string)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null token, no backtrace";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (v14)
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[NWNetworkAgentRegistration addToken:]";
      v22 = 2082;
      v23 = backtrace_string;
      v15 = "%{public}s called with null token, dumping backtrace:%{public}s";
LABEL_21:
      _os_log_impl(&dword_182FBE000, v9, v10, v15, buf, 0x16u);
    }
LABEL_22:

    free(backtrace_string);
    goto LABEL_33;
  }
  if ((unint64_t)objc_msgSend(v4, "length") > 0x1000)
  {
    __nwlog_obj();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v21 = "-[NWNetworkAgentRegistration addToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v18 = 0;
    if (!__nwlog_fault(v8, &type, &v18))
      goto LABEL_33;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE)";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (!v18)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), backtrace limit exceeded";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = type;
    v16 = os_log_type_enabled(v9, type);
    if (!backtrace_string)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v21 = "-[NWNetworkAgentRegistration addToken:]";
        v11 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), no backtrace";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[NWNetworkAgentRegistration addToken:]";
      v22 = 2082;
      v23 = backtrace_string;
      v15 = "%{public}s called with null (token.length <= NETAGENT_MAX_DATA_SIZE), dumping backtrace:%{public}s";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (!-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
  {
LABEL_35:
    v6 = 0;
    goto LABEL_36;
  }
  nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 21, (const unsigned __int8 *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), 0, 0);
  v6 = 1;
LABEL_36:

  return v6;
}

- (BOOL)flushTokens
{
  _BOOL4 v3;

  v3 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  if (v3)
    nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 22, 0, 0, 0, 0);
  return v3;
}

- (BOOL)resetError
{
  _BOOL4 v3;

  v3 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  if (v3)
    nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 27, 0, 0, 0, 0);
  return v3;
}

- (BOOL)setLowWaterMark:(unsigned int)a3
{
  _BOOL4 v5;
  unsigned __int8 v7[4];

  v5 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  if (v5)
  {
    *(_DWORD *)v7 = a3;
    nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 24, v7, 4u, 0, 0);
  }
  return v5;
}

- (BOOL)addNetworkAgentToInterfaceNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  unsigned __int8 uu[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NWNetworkAgentRegistration isRegistered](self, "isRegistered")
    && (-[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    *(_QWORD *)uu = 0;
    v10 = 0;
    -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getUUIDBytes:", uu);

    v7 = nw_network_agent_add_to_interface(objc_msgSend(v4, "UTF8String"), uu) == 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)removeNetworkAgentFromInterfaceNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  unsigned __int8 uu[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NWNetworkAgentRegistration isRegistered](self, "isRegistered")
    && (-[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    *(_QWORD *)uu = 0;
    v10 = 0;
    -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getUUIDBytes:", uu);

    v7 = nw_network_agent_remove_from_interface(objc_msgSend(v4, "UTF8String"), uu) == 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)assignNexusData:(id)a3 toClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  const char *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  char *backtrace_string;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  char *v29;
  char *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v34;
  char v35;
  os_log_type_t type;
  _BYTE buf[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
    goto LABEL_44;
  -[NWNetworkAgentRegistration registeredUUID](self, "registeredUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((unint64_t)objc_msgSend(v6, "length") >= 0xFFFFFFF0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      LODWORD(v34) = 22;
      v10 = (const char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v35 = 0;
      if (!__nwlog_fault(v10, &type, &v35))
        goto LABEL_26;
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          v13 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v13;
          v14 = "%{public}s Invalid data length (%lu)";
LABEL_23:
          v27 = v11;
          v28 = v12;
LABEL_24:
          _os_log_impl(&dword_182FBE000, v27, v28, v14, buf, 0x16u);
        }
      }
      else if (v35)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v18 = type;
        v19 = os_log_type_enabled(v11, type);
        if (backtrace_string)
        {
          if (v19)
          {
            v20 = objc_msgSend(v6, "length", buf, v34);
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2082;
            *(_QWORD *)&buf[24] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v11, v18, "%{public}s Invalid data length (%lu), dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
LABEL_26:
          if (v10)
          {
            v29 = (char *)v10;
LABEL_43:
            free(v29);
            goto LABEL_44;
          }
          goto LABEL_44;
        }
        if (v19)
        {
          v32 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v32;
          v14 = "%{public}s Invalid data length (%lu), no backtrace";
          v27 = v11;
          v28 = v18;
          goto LABEL_24;
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v11 = (id)gLogObj;
        v12 = type;
        if (os_log_type_enabled(v11, type))
        {
          v26 = objc_msgSend(v6, "length", buf, v34);
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v26;
          v14 = "%{public}s Invalid data length (%lu), backtrace limit exceeded";
          goto LABEL_23;
        }
      }

      goto LABEL_26;
    }
    LODWORD(v8) = objc_msgSend(v6, "length") + 16;
    v15 = (unsigned __int8 *)malloc_type_calloc(v8, 1uLL, 0x3A75FAB6uLL);
    if (v15)
    {
      v16 = v15;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v7, "getUUIDBytes:", buf);
      *(_OWORD *)v16 = *(_OWORD *)buf;
      if (objc_msgSend(v6, "length"))
        memcpy(v16 + 16, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
      LOBYTE(v8) = (int)nw_network_agent_ctl_setsockopt_inner(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), 11, v16, v8, 0, 0) >= 0;
      free(v16);
      goto LABEL_45;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v21 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (_DWORD)v8;
    v22 = (const char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v35 = 0;
    if (__nwlog_fault(v22, &type, &v35))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v23 = (id)gLogObj;
        v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v8;
          v25 = "%{public}s calloc(%u) failed";
LABEL_39:
          _os_log_impl(&dword_182FBE000, v23, v24, v25, buf, 0x12u);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      if (!v35)
      {
        __nwlog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v8;
          v25 = "%{public}s calloc(%u) failed, backtrace limit exceeded";
          goto LABEL_39;
        }
LABEL_40:

        goto LABEL_41;
      }
      v30 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      v31 = os_log_type_enabled(v23, type);
      if (!v30)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v8;
          v25 = "%{public}s calloc(%u) failed, no backtrace";
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      if (v31)
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignNexusData:toClient:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (_DWORD)v8;
        *(_WORD *)&buf[18] = 2082;
        *(_QWORD *)&buf[20] = v30;
        _os_log_impl(&dword_182FBE000, v23, v24, "%{public}s calloc(%u) failed, dumping backtrace:%{public}s", buf, 0x1Cu);
      }

      free(v30);
    }
LABEL_41:
    if (v22)
    {
      v29 = (char *)v22;
      goto LABEL_43;
    }
LABEL_44:
    LOBYTE(v8) = 0;
  }
LABEL_45:

  return (char)v8;
}

- (BOOL)assignDiscoveredEndpoints:(id)a3 toClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _BOOL8 endpoint_array_result;
  id v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE buf[12];
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignDiscoveredEndpoints:toClient:]";
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s Assigning discovered endpoints %@ to %@", buf, 0x20u);
  }

  v9 = nw_array_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "internalEndpoint", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v9, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  *(_QWORD *)buf = 0;
  endpoint_array_result = nw_path_create_endpoint_array_result(buf, (void *)v9, 202);
  if (endpoint_array_result)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D50]);
    v17 = (void *)objc_msgSend(v16, "initWithBytesNoCopy:length:freeWhenDone:", endpoint_array_result, *(_QWORD *)buf, 1);
    v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", v17, v7);

  }
  else
  {
    v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", 0, v7);
  }

  return v18;
}

- (BOOL)assignResolvedEndpoints:(id)a3 toClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _BOOL8 endpoint_array_result;
  id v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE buf[12];
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[NWNetworkAgentRegistration assignResolvedEndpoints:toClient:]";
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s Assigning resolved endpoints %@ to %@", buf, 0x20u);
  }

  v9 = nw_array_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "internalEndpoint", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        nw_array_append(v9, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  *(_QWORD *)buf = 0;
  endpoint_array_result = nw_path_create_endpoint_array_result(buf, (void *)v9, 203);
  if (endpoint_array_result)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99D50]);
    v17 = (void *)objc_msgSend(v16, "initWithBytesNoCopy:length:freeWhenDone:", endpoint_array_result, *(_QWORD *)buf, 1);
    v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", v17, v7);

  }
  else
  {
    v18 = -[NWNetworkAgentRegistration assignNexusData:toClient:](self, "assignNexusData:toClient:", 0, v7);
  }

  return v18;
}

- (unint64_t)useCount
{
  _BOOL4 v3;
  unint64_t result;
  unint64_t v5;

  v5 = 0;
  v3 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  result = 0;
  if (v3)
  {
    nw_network_agent_get_use_count(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), &v5);
    return v5;
  }
  return result;
}

- (void)setUseCount:(unint64_t)a3
{
  if (-[NWNetworkAgentRegistration isRegistered](self, "isRegistered"))
    nw_network_agent_set_use_count(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), a3);
}

- (unsigned)tokenCount
{
  _BOOL4 v3;
  unsigned int result;
  unsigned int v5;

  v5 = 0;
  v3 = -[NWNetworkAgentRegistration isRegistered](self, "isRegistered");
  result = 0;
  if (v3)
  {
    nw_network_agent_get_token_count(-[NWNetworkAgentRegistration registrationSocket](self, "registrationSocket"), &v5);
    return v5;
  }
  return result;
}

- (Class)networkAgentClass
{
  return self->_networkAgentClass;
}

- (void)setNetworkAgentClass:(Class)a3
{
  self->_networkAgentClass = a3;
}

- (void)setNetworkAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)registeredUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegisteredUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setRegistrationSocket:(int)a3
{
  self->_registrationSocket = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setReadSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registeredUUID, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
}

void __52__NWNetworkAgentRegistration_unregisterNetworkAgent__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "setRegistrationSocket:", 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "setNetworkAgent:", 0);
  objc_msgSend(*(id *)(a1 + 32), "readSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "readSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setReadSource:", 0);
  }
}

uint64_t __71__NWNetworkAgentRegistration_setRegisteredNetworkAgent_fileDescriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleMessageFromAgent");
}

uint64_t __69__NWNetworkAgentRegistration_createReadSourceWithRegistrationSocket___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

+ (BOOL)addActiveAssertionToNetworkAgent:(id)a3
{
  void *v3;
  void *v4;
  NWPathEvaluator *v5;
  void *v6;
  void *v7;
  NWConcrete_nw_path *v8;
  BOOL v9;
  unsigned __int8 v11[8];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v11 = 0;
  v12 = 0;
  objc_msgSend(a3, "agentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getUUIDBytes:", v11);

  v4 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    v5 = -[NWPathEvaluator initWithEndpoint:parameters:]([NWPathEvaluator alloc], "initWithEndpoint:parameters:", 0, 0);
    v6 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v5;

    v4 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator)
      return 0;
  }
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalPath");
  v8 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  v9 = nw_path_agent_action(v8, v11, 131);

  return v9;
}

+ (BOOL)removeActiveAssertionFromNetworkAgent:(id)a3
{
  void *v3;
  void *v4;
  NWConcrete_nw_path *v5;
  BOOL v6;
  unsigned __int8 v8[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v8 = 0;
  v9 = 0;
  objc_msgSend(a3, "agentUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getUUIDBytes:", v8);

  if (!sharedAssertionEvaluator)
    return 0;
  objc_msgSend((id)sharedAssertionEvaluator, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalPath");
  v5 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  v6 = nw_path_agent_action(v5, v8, 132);

  return v6;
}

+ (BOOL)useNetworkAgent:(id)a3 returnUseCount:(unint64_t *)a4
{
  void *v5;
  void *v6;
  NWPathEvaluator *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = 0;
  v13[1] = 0;
  objc_msgSend(a3, "agentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getUUIDBytes:", v13);

  v6 = (void *)sharedAssertionEvaluator;
  if (!sharedAssertionEvaluator)
  {
    v7 = -[NWPathEvaluator initWithEndpoint:parameters:]([NWPathEvaluator alloc], "initWithEndpoint:parameters:", 0, 0);
    v8 = (void *)sharedAssertionEvaluator;
    sharedAssertionEvaluator = (uint64_t)v7;

    v6 = (void *)sharedAssertionEvaluator;
    if (!sharedAssertionEvaluator)
      return 0;
  }
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = nw_path_increment_agent_use_count(v10, (const unsigned __int8 *)v13, a4);

  return v11;
}

@end
