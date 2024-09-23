@implementation nw_interpose_flow

- (nw_interpose_flow)initWithInterface:(id)a3 registration:(id)a4 eventHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  nw_interpose_flow *v12;
  nw_interpose_flow *v13;
  OS_nw_path_flow *flow;
  void *v15;
  id eventHandler;
  nw_interpose_flow *v17;
  void *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  char *backtrace_string;
  os_log_type_t v24;
  _BOOL4 v25;
  os_log_type_t v26;
  char v27;
  os_log_type_t type;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)nw_interpose_flow;
  v12 = -[nw_interpose_flow init](&v29, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->_registration, a4);
    flow = v13->_flow;
    v13->_flow = 0;

    v15 = _Block_copy(v11);
    eventHandler = v13->_eventHandler;
    v13->_eventHandler = v15;

    v17 = v13;
    goto LABEL_3;
  }
  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
  v20 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v27 = 0;
  if (__nwlog_fault(v20, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_182FBE000, v21, v22, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      v25 = os_log_type_enabled(v21, type);
      if (backtrace_string)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136446466;
          v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
          v32 = 2082;
          v33 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v21, v24, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_182FBE000, v21, v24, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[nw_interpose_flow initWithInterface:registration:eventHandler:]";
        _os_log_impl(&dword_182FBE000, v21, v26, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v20)
    free(v20);
LABEL_3:

  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  nw_interpose_flow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[nw_interpose_flow dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: dealloc", buf, 0x16u);
  }

  -[nw_interpose_flow close](self, "close");
  v4.receiver = self;
  v4.super_class = (Class)nw_interpose_flow;
  -[nw_interpose_flow dealloc](&v4, sel_dealloc);
}

- (void)close
{
  NSObject *v3;
  OS_nw_path_flow_registration *registration;
  OS_nw_path_flow_registration *v5;
  int v6;
  const char *v7;
  __int16 v8;
  nw_interpose_flow *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136446466;
    v7 = "-[nw_interpose_flow close]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: close", (uint8_t *)&v6, 0x16u);
  }

  registration = self->_registration;
  if (registration)
  {
    nw_path_flow_registration_close(registration);
    v5 = self->_registration;
    self->_registration = 0;

  }
  -[nw_interpose_flow closeFlow](self, "closeFlow");
}

- (void)notifyFlowEvent:(int)a3
{
  OS_nw_path_flow *flow;
  NSObject *v5;
  unsigned __int8 *v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  nw_interpose_flow *v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12[0] = 0uLL;
  v7 = 0;
  flow = self->_flow;
  if (flow && self->_eventHandler && self->_interface)
  {
    v6 = flow;
    if (uuid_is_null(v6 + 128))
    {

    }
    else
    {
      v12[1] = *((_OWORD *)v6 + 8);

      if (nw_path_flow_get_id(self->_flow, v12))
      {
        if (nw_path_flow_get_nexus_key(self->_flow, &v7) && v7)
        {
          (*((void (**)(void))self->_eventHandler + 2))();
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v5 = (id)gLogObj;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v9 = "-[nw_interpose_flow notifyFlowEvent:]";
            v10 = 2112;
            v11 = self;
            _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_ERROR, "%{public}s %@: no flow key or key length", buf, 0x16u);
          }

        }
      }
    }
  }
}

- (void)closeFlow
{
  NSObject *v3;
  OS_nw_path_flow *flow;
  int v5;
  const char *v6;
  __int16 v7;
  nw_interpose_flow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136446466;
    v6 = "-[nw_interpose_flow closeFlow]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: closeFlow", (uint8_t *)&v5, 0x16u);
  }

  -[nw_interpose_flow notifyFlowEvent:](self, "notifyFlowEvent:", 1);
  flow = self->_flow;
  self->_flow = 0;

}

- (void)clearFlowEventHandler
{
  NSObject *v3;
  id eventHandler;
  int v5;
  const char *v6;
  __int16 v7;
  nw_interpose_flow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136446466;
    v6 = "-[nw_interpose_flow clearFlowEventHandler]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s %@: clearFlowEventHandler", (uint8_t *)&v5, 0x16u);
  }

  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

}

- (void)resetFlow:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  nw_interpose_flow *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v6 = (id)gLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136446466;
    v8 = "-[nw_interpose_flow resetFlow:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}s %@: resetFlow", (uint8_t *)&v7, 0x16u);
  }

  if (self->_flow && !-[nw_interpose_flow matchNexusInstance:](self, "matchNexusInstance:", v5))
    -[nw_interpose_flow closeFlow](self, "closeFlow");
  objc_storeStrong((id *)&self->_flow, a3);
  -[nw_interpose_flow notifyFlowEvent:](self, "notifyFlowEvent:", 0);

}

- (BOOL)matchNexusAgent:(unsigned __int8)a3[16]
{
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  nw_interpose_flow *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned __int8 *__attribute__((__org_arrdim(0,16))) v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136446978;
    v8 = "-[nw_interpose_flow matchNexusAgent:]";
    v9 = 2112;
    v10 = self;
    v11 = 1042;
    v12 = 16;
    v13 = 2098;
    v14 = a3;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s %@: matchNexusAgent: matching Nexus agent %{public, uuid_t}.16P", (uint8_t *)&v7, 0x26u);
  }

  return nw_path_flow_registration_uses_nexus(self->_registration, a3);
}

- (BOOL)matchNexusAgentWithFlow:(id)a3
{
  id v4;
  BOOL v5;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = 0uLL;
  if (nw_path_flow_get_nexus_agent_uuid(v4, &v7))
    v5 = -[nw_interpose_flow matchNexusAgent:](self, "matchNexusAgent:", &v7);
  else
    v5 = 0;

  return v5;
}

- (BOOL)matchNexusInstance:(id)a3
{
  id v4;
  BOOL v5;
  OS_nw_path_flow *flow;
  unsigned __int8 *v7;
  NSObject *v9;
  unsigned __int8 *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  nw_interpose_flow *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned __int8 *v19;
  unsigned __int8 v20[16];
  __int128 v21;
  unsigned __int8 uu2[16];
  unsigned __int8 uu1[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  v21 = 0uLL;
  if (v4)
  {
    flow = self->_flow;
    if (flow)
    {
      v7 = flow;
      if (uuid_is_null(v7 + 128)
        || (*(_OWORD *)uu1 = *((_OWORD *)v7 + 8),
            v7,
            v7 = (unsigned __int8 *)v4,
            uuid_is_null(v7 + 128)))
      {

LABEL_6:
        v5 = 0;
        goto LABEL_7;
      }
      *(_OWORD *)uu2 = *((_OWORD *)v7 + 8);

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = 136446978;
        v13 = "-[nw_interpose_flow matchNexusInstance:]";
        v14 = 2112;
        v15 = self;
        v16 = 1042;
        v17 = 16;
        v18 = 2098;
        v19 = uu2;
        _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}s %@: matchNexusInstance: matching Nexus instance %{public, uuid_t}.16P", (uint8_t *)&v12, 0x26u);
      }

      if (uuid_compare(uu1, uu2) || !nw_path_flow_get_id(self->_flow, &v21))
        goto LABEL_6;
      v10 = v7;
      if (uuid_is_null(v10 + 144))
      {

        goto LABEL_6;
      }
      *(_OWORD *)v20 = *((_OWORD *)v10 + 9);

      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = 136446978;
        v13 = "-[nw_interpose_flow matchNexusInstance:]";
        v14 = 2112;
        v15 = self;
        v16 = 1042;
        v17 = 16;
        v18 = 2098;
        v19 = v20;
        _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}s %@: matchNexusInstance: matching flow id %{public, uuid_t}.16P", (uint8_t *)&v12, 0x26u);
      }

      v5 = uuid_compare((const unsigned __int8 *)&v21, v20) == 0;
    }
  }
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
