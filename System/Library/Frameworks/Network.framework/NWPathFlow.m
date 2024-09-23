@implementation NWPathFlow

- (NWPathFlow)initWithPathFlow:(id)a3
{
  id v5;
  NWPathFlow *v6;
  NWPathFlow *v7;
  void *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  char *v19;
  _BOOL4 v20;
  char *backtrace_string;
  _BOOL4 v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWPathFlow;
    v6 = -[NWPathFlow init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalPathFlow, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPathFlow initWithPathFlow:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24))
      goto LABEL_38;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWPathFlow initWithPathFlow:]";
          v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15)
      free(v15);
    v7 = 0;
    goto LABEL_4;
  }
  __nwlog_obj();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWPathFlow initWithPathFlow:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow";
LABEL_29:
        _os_log_impl(&dword_182FBE000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = type;
        v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWPathFlow initWithPathFlow:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null pathFlow, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

  }
LABEL_31:
  if (v10)
    free(v10);

  v7 = 0;
LABEL_4:

  return v7;
}

- (NWInterface)interface
{
  void *v2;
  id v3;
  NWInterface *v4;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_flow_copy_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);
  else
    v4 = 0;

  return v4;
}

- (NWEndpoint)localEndpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_flow_copy_local_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)remoteEndpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_flow_copy_remote_endpoint(v2);

  if (v3)
  {
    +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NSUUID)flowID
{
  void *v2;
  int id;
  void *v4;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0uLL;
  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  id = nw_path_flow_get_id(v2, &v6);

  v4 = 0;
  if (id)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v6);
  return (NSUUID *)v4;
}

- (NSUUID)nexusAgent
{
  void *v2;
  int nexus_agent_uuid;
  void *v4;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0uLL;
  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nexus_agent_uuid = nw_path_flow_get_nexus_agent_uuid(v2, &v6);

  v4 = 0;
  if (nexus_agent_uuid)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v6);
  return (NSUUID *)v4;
}

- (NSUUID)nexusInstance
{
  void *v2;
  int nexus_instance;
  void *v4;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0uLL;
  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, 0);

  v4 = 0;
  if (nexus_instance)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v6);
  return (NSUUID *)v4;
}

- (unsigned)nexusPort
{
  void *v2;
  int nexus_instance;
  unsigned int v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, &v5);

  if (nexus_instance)
    return v5;
  else
    return 0;
}

- (BOOL)isViable
{
  void *v2;
  char is_viable;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_viable = nw_path_flow_is_viable(v2);

  return is_viable;
}

- (BOOL)isAssigned
{
  void *v2;
  char is_assigned;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_assigned = nw_path_flow_is_assigned(v2);

  return is_assigned;
}

- (BOOL)isLocal
{
  void *v2;
  char is_local;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_local = nw_path_flow_is_local(v2);

  return is_local;
}

- (BOOL)isDirect
{
  void *v2;
  char is_direct;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_direct = nw_path_flow_is_direct(v2);

  return is_direct;
}

- (BOOL)isDefunct
{
  void *v2;
  char is_defunct;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_defunct = nw_path_flow_is_defunct(v2);

  return is_defunct;
}

- (BOOL)supportsIPv4
{
  void *v2;
  char has_ipv4;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_ipv4 = nw_path_flow_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)supportsIPv6
{
  void *v2;
  BOOL has_ipv6;

  -[NWPathFlow internalPathFlow](self, "internalPathFlow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_ipv6 = nw_path_flow_has_ipv6(v2);

  return has_ipv6;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWPathFlow flowID](self, "flowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("flowID"), v5, v4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isViable](self, "isViable"), CFSTR("isViable"), v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isAssigned](self, "isAssigned"), CFSTR("isAssigned"), v5);
  if (-[NWPathFlow isLocal](self, "isLocal"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isLocal](self, "isLocal"), CFSTR("isLocal"), v5);
  if (-[NWPathFlow isDirect](self, "isDirect"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isDirect](self, "isDirect"), CFSTR("isDirect"), v5);
  if (-[NWPathFlow isDefunct](self, "isDefunct"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isDefunct](self, "isDefunct"), CFSTR("isDefunct"), v5);
  if (-[NWPathFlow supportsIPv4](self, "supportsIPv4"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow supportsIPv4](self, "supportsIPv4"), CFSTR("supportsIPv4"), v5);
  if (-[NWPathFlow supportsIPv6](self, "supportsIPv6"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow supportsIPv6](self, "supportsIPv6"), CFSTR("supportsIPv6"), v5);
  -[NWPathFlow interface](self, "interface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("interface"), v5, v4);

  -[NWPathFlow localEndpoint](self, "localEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("localEndpoint"), v5, v4);

  -[NWPathFlow remoteEndpoint](self, "remoteEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("remoteEndpoint"), v5, v4);

  -[NWPathFlow nexusAgent](self, "nexusAgent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("nexusAgent"), v5, v4);
    -[NWPathFlow nexusInstance](self, "nexusInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v13, CFSTR("nexusInstance"), v5, v4);

    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPathFlow nexusPort](self, "nexusPort"), CFSTR("nexusPort"), v5);
  }

  return v7;
}

- (id)description
{
  return -[NWPathFlow descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (id)privateDescription
{
  return -[NWPathFlow descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (OS_nw_path_flow)internalPathFlow
{
  return (OS_nw_path_flow *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPathFlow, 0);
}

@end
