@implementation NWPath

- (BOOL)isExpensive
{
  NSObject *v2;
  BOOL is_expensive;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  is_expensive = nw_path_is_expensive(v2);

  return is_expensive;
}

- (BOOL)isConstrained
{
  NSObject *v2;
  BOOL is_constrained;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  is_constrained = nw_path_is_constrained(v2);

  return is_constrained;
}

- (BOOL)usesInterfaceType:(int64_t)a3
{
  nw_interface_type_t v3;
  NSObject *v4;

  v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  v4 = objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = nw_path_uses_interface_type(v4, v3);

  return v3;
}

- (NWPathStatus)status
{
  NSObject *v2;
  NWPathStatus status;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  status = (unint64_t)nw_path_get_status(v2);

  return status;
}

- (OS_nw_path)internalPath
{
  return (OS_nw_path *)objc_getProperty(self, a2, 8, 1);
}

- (NWPath)initWithPath:(id)a3
{
  id v5;
  NWPath *v6;
  NWPath *v7;
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
    v23.super_class = (Class)NWPath;
    v6 = -[NWPath init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalPath, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
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
          v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
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
  v27 = "-[NWPath initWithPath:]";
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
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path";
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
            v27 = "-[NWPath initWithPath:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPath initWithPath:]";
        v13 = "%{public}s called with null path, backtrace limit exceeded";
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
  uint64_t v3;
  void *v4;
  id v5;
  NWInterface *v6;
  void *v7;
  unsigned int interface_index;

  -[NWPath internalPath](self, "internalPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = *(id *)(v3 + 96), v4, v5))
  {
    v6 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v5);
  }
  else
  {
    -[NWPath internalPath](self, "internalPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    interface_index = nw_path_get_interface_index(v7);

    if (interface_index)
    {
      v6 = -[NWInterface initWithInterfaceIndex:]([NWInterface alloc], "initWithInterfaceIndex:", interface_index);
      v5 = 0;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
  }

  return v6;
}

- (unsigned)filterControlUnit
{
  _DWORD *v2;
  unsigned int v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[68];
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPath, 0);
}

- (NWPath)init
{
  NWPath *v2;
  NWPath *v3;
  NWPath *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  char *backtrace_string;
  _BOOL4 v12;
  char v13;
  os_log_type_t type;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NWPath;
  v2 = -[NWPath init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v17 = "-[NWPath init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_182FBE000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = type;
        v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWPath init]";
            v18 = 2082;
            v19 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12)
          goto LABEL_18;
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NWPath init]";
        v10 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

  }
LABEL_19:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (NSString)statusAsString
{
  return (NSString *)+[NWPath createStringFromStatus:](NWPath, "createStringFromStatus:", -[NWPath status](self, "status"));
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int has_nat64_prefixes;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t);
  void *v36;
  id v37;
  int v38;
  BOOL v39;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NWPath statusAsString](self, "statusAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("status"), v5, 1);

  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath reason](self, "reason"), CFSTR("reasonCode"), v5);
  -[NWPath reasonDescription](self, "reasonDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("reason"), v5, 1);

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isViable](self, "isViable"), CFSTR("isViable"), v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isExpensive](self, "isExpensive"), CFSTR("isExpensive"), v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isConstrained](self, "isConstrained"), CFSTR("isConstrained"), v5);
  if (-[NWPath isUltraConstrained](self, "isUltraConstrained"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath isUltraConstrained](self, "isUltraConstrained"), CFSTR("isUltraConstrained"), v5);
  -[NWPath clientID](self, "clientID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v10, CFSTR("clientID"), v5, 1);

  if (!v4)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath mtu](self, "mtu"), CFSTR("mtu"), v5);
    return v7;
  }
  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 1))
  {
    v11 = CFSTR("wifi");
LABEL_13:
    objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v11, CFSTR("interfaceType"), v5, 1);
    goto LABEL_14;
  }
  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 2))
  {
    v11 = CFSTR("cellular");
    goto LABEL_13;
  }
  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 3))
  {
    v11 = CFSTR("wired ethernet");
    goto LABEL_13;
  }
  if (-[NWPath usesInterfaceType:](self, "usesInterfaceType:", 4))
  {
    v11 = CFSTR("loopback");
    goto LABEL_13;
  }
LABEL_14:
  if (-[NWPath fallbackInterfaceIndex](self, "fallbackInterfaceIndex"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath fallbackInterfaceIndex](self, "fallbackInterfaceIndex"), CFSTR("fallbackInterfaceIndex"), v5);
  if (-[NWPath fallbackIsWeak](self, "fallbackIsWeak"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("fallbackIsWeak"), v5);
  if (-[NWPath fallbackEligible](self, "fallbackEligible"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPath fallbackEligible](self, "fallbackEligible"), CFSTR("fallbackEligible"), v5);
  if (-[NWPath fallbackIsPreferred](self, "fallbackIsPreferred"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", 1, CFSTR("fallbackIsPreferred"), v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath mtu](self, "mtu"), CFSTR("mtu"), v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath maximumDatagramSize](self, "maximumDatagramSize"), CFSTR("maximumDatagramSize"), v5);
  objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPath secondsSinceInterfaceChange](self, "secondsSinceInterfaceChange"), CFSTR("secondsSinceInterfaceChange"), v5);
  -[NWPath flows](self, "flows");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v12, CFSTR("flows"), v5, 1);

  -[NWPath groupMembers](self, "groupMembers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v13, CFSTR("groupMembers"), v5, 1);

  -[NWPath internalPath](self, "internalPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __48__NWPath_descriptionWithIndent_showFullContent___block_invoke;
  v36 = &unk_1E14A3128;
  v15 = v7;
  v37 = v15;
  v38 = v5;
  v39 = v4;
  nw_path_enumerate_interface_options(v14, &v33);

  -[NWPath effectiveLocalEndpoint](self, "effectiveLocalEndpoint", v33, v34, v35, v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v16, CFSTR("effectiveLocalEndpoint"), v5, 1);

  -[NWPath effectiveRemoteEndpoint](self, "effectiveRemoteEndpoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v17, CFSTR("effectiveRemoteEndpoint"), v5, 1);

  -[NWPath interface](self, "interface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v18, CFSTR("interface"), v5, 1);

  -[NWPath scopedInterface](self, "scopedInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v19, CFSTR("scopedInterface"), v5, 1);

  -[NWPath dnsServers](self, "dnsServers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v20, CFSTR("dnsServers"), v5, 1);

  -[NWPath internalPath](self, "internalPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = nw_path_copy_resolver_configs(v21);
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v22, CFSTR("resolvers"), v5, 1);

  -[NWPath dnsSearchDomains](self, "dnsSearchDomains");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v23, CFSTR("dnsSearchDomains"), v5, 1);

  -[NWPath internalPath](self, "internalPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = nw_path_copy_override_resolver_configs(v24);
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v25, CFSTR("override-resolvers"), v5, 1);

  -[NWPath overrideDNSSearchDomains](self, "overrideDNSSearchDomains");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v26, CFSTR("override-dnsSearchDomains"), v5, 1);

  -[NWPath gateways](self, "gateways");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v27, CFSTR("gateways"), v5, 1);

  -[NWPath proxySettings](self, "proxySettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v28, CFSTR("proxySettings"), v5, 1);

  -[NWPath genericNetworkAgentsWithDomain:type:](self, "genericNetworkAgentsWithDomain:type:", 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendPrettyObject:withName:indent:showFullContent:", v29, CFSTR("agents"), v5, 1);

  if (-[NWPath isFlowDivert](self, "isFlowDivert"))
  {
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath flowDivertControlUnit](self, "flowDivertControlUnit"), CFSTR("flowDivertControlUnit"), v5);
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath flowDivertAggregateUnit](self, "flowDivertAggregateUnit"), CFSTR("flowDivertAggregateUnit"), v5);
  }
  if (-[NWPath isFiltered](self, "isFiltered"))
    objc_msgSend(v15, "appendPrettyInt:withName:indent:", -[NWPath filterControlUnit](self, "filterControlUnit"), CFSTR("filterControlunit"), v5);
  if (-[NWPath isListener](self, "isListener"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isListener"), v5);
  if (-[NWPath isDirect](self, "isDirect"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isDirect"), v5);
  if (-[NWPath isLocal](self, "isLocal"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isLocal"), v5);
  if (-[NWPath isRoaming](self, "isRoaming"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isRoaming"), v5);
  if (-[NWPath shouldProbeConnectivity](self, "shouldProbeConnectivity"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("shouldProbeConnectivity"), v5);
  if (-[NWPath isLinkQualityAbort](self, "isLinkQualityAbort"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isLinkQualityAbort"), v5);
  if (-[NWPath isListenerInterfaceSpecific](self, "isListenerInterfaceSpecific"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("isListenerInterfaceSpecific"), v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsIPv4](self, "supportsIPv4"), CFSTR("supportsIPv4"), v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsIPv6](self, "supportsIPv6"), CFSTR("supportsIPv6"), v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath supportsDNS](self, "supportsDNS"), CFSTR("supportsDNS"), v5);
  -[NWPath internalPath](self, "internalPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  has_nat64_prefixes = nw_path_has_nat64_prefixes(v30);

  if (has_nat64_prefixes)
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", 1, CFSTR("hasNAT64Prefixes"), v5);
  objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasProxySettings](self, "hasProxySettings"), CFSTR("hasProxySettings"), v5);
  if (-[NWPath isPerAppVPN](self, "isPerAppVPN"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath isPerAppVPN](self, "isPerAppVPN"), CFSTR("perAppVPN"), v5);
  if (-[NWPath hasKernelExtensionFilter](self, "hasKernelExtensionFilter"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasKernelExtensionFilter](self, "hasKernelExtensionFilter"), CFSTR("hasKernelExtensionFilter"), v5);
  if (-[NWPath hasCustomPFRules](self, "hasCustomPFRules"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasCustomPFRules](self, "hasCustomPFRules"), CFSTR("hasCustomPFRules"), v5);
  if (-[NWPath hasApplicationLevelFirewall](self, "hasApplicationLevelFirewall"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasApplicationLevelFirewall](self, "hasApplicationLevelFirewall"), CFSTR("hasApplicationLevelFirewall"), v5);
  if (-[NWPath hasParentalControls](self, "hasParentalControls"))
    objc_msgSend(v15, "appendPrettyBOOL:withName:indent:", -[NWPath hasParentalControls](self, "hasParentalControls"), CFSTR("hasParentalControls"), v5);

  return v7;
}

- (id)description
{
  return -[NWPath descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (NSString)privateDescription
{
  return (NSString *)-[NWPath descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (BOOL)isEqualToPath:(NWPath *)path
{
  NWPath *v4;
  void *v5;
  void *v6;

  v4 = path;
  -[NWPath internalPath](self, "internalPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPath internalPath](v4, "internalPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = nw_path_is_equal_inner(v5, v6, 0);
  return (char)v4;
}

- (NSUUID)clientID
{
  void *v3;
  int is_null;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  -[NWPath internalPath](self, "internalPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (nw_path_get_client_id(v3, uu))
  {
    is_null = uuid_is_null(uu);

    if (is_null)
      return (NSUUID *)0;
    else
      return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  }
  else
  {

    return (NSUUID *)0;
  }
}

- (BOOL)isUltraConstrained
{
  void *v2;
  char is_ultra_constrained;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_ultra_constrained = nw_path_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (BOOL)isListener
{
  void *v2;
  char is_listener;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_listener = nw_path_is_listener(v2);

  return is_listener;
}

- (BOOL)isViable
{
  void *v2;
  BOOL is_viable;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_viable = nw_path_is_viable(v2);

  return is_viable;
}

- (BOOL)isPerAppVPN
{
  void *v2;
  BOOL is_per_app_vpn;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_per_app_vpn = nw_path_is_per_app_vpn(v2);

  return is_per_app_vpn;
}

- (BOOL)hasKernelExtensionFilter
{
  void *v2;
  char has_kernel_extension_filter;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_kernel_extension_filter = nw_path_has_kernel_extension_filter(v2);

  return has_kernel_extension_filter;
}

- (BOOL)hasCustomPFRules
{
  void *v2;
  char has_custom_pf_rules;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_custom_pf_rules = nw_path_has_custom_pf_rules(v2);

  return has_custom_pf_rules;
}

- (BOOL)hasApplicationLevelFirewall
{
  void *v2;
  char has_application_level_firewall;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_application_level_firewall = nw_path_has_application_level_firewall(v2);

  return has_application_level_firewall;
}

- (BOOL)hasParentalControls
{
  void *v2;
  char has_parental_controls;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_parental_controls = nw_path_has_parental_controls(v2);

  return has_parental_controls;
}

- (BOOL)shouldProbeConnectivity
{
  void *v2;
  char should_probe_connectivity;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  should_probe_connectivity = nw_path_should_probe_connectivity(v2);

  return should_probe_connectivity;
}

- (BOOL)isLinkQualityAbort
{
  void *v2;
  char v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_link_quality_abort(v2);

  return v3;
}

- (BOOL)isListenerInterfaceSpecific
{
  void *v2;
  char is_interface_specific;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_interface_specific = nw_path_listener_is_interface_specific(v2);

  return is_interface_specific;
}

- (BOOL)usesNetworkAgentType:(Class)a3
{
  Class v3;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (a3)
  {
    if (-[NWPath status](self, "status"))
    {
      -[NWPath internalPath](self, "internalPath");
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && (v7 = (void *)v5[28]) != 0)
      {
        v8 = v7;

        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __31__NWPath_usesNetworkAgentType___block_invoke;
        v10[3] = &unk_1E14A3150;
        v10[4] = &v11;
        v10[5] = v3;
        xpc_dictionary_apply(v8, v10);
      }
      else
      {

        v8 = 0;
      }
      LOBYTE(v3) = *((_BYTE *)v12 + 24) != 0;

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  _Block_object_dispose(&v11, 8);
  return (char)v3;
}

- (BOOL)usesNetworkAgent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int *data;
  unsigned int *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  char v18;
  size_t length;
  char out[40];
  unsigned __int8 uu[8];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)uu = 0;
  v23 = 0;
  if (v4 && -[NWPath status](self, "status"))
  {
    objc_msgSend(v4, "agentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getUUIDBytes:", uu);

    -[NWPath internalPath](self, "internalPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && (v8 = *(void **)(v6 + 224)) != 0)
    {
      v9 = v8;

      memset(out, 0, 37);
      uuid_unparse(uu, out);
      xpc_dictionary_get_value(v9, out);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      length = 0;
      if (v10
        && (data = (unsigned int *)xpc_dictionary_get_data(v10, "data", &length)) != 0
        && length >= 0xD8
        && (v13 = data, length == data[53] + 216))
      {
        objc_msgSend((id)objc_opt_class(), "agentDomain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = nw_nsstring((uint64_t)(v13 + 4));
        if (objc_msgSend(v14, "isEqualToString:", v15))
        {
          objc_msgSend((id)objc_opt_class(), "agentType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = nw_nsstring((uint64_t)(v13 + 12));
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

      v7 = v9;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)copyDataFromNetworkAgentWithDomain:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD applier[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__47195;
  v22 = __Block_byref_object_dispose__47196;
  v23 = 0;
  -[NWPath internalPath](self, "internalPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8 && (v10 = *(void **)(v8 + 224)) != 0)
  {
    v11 = v10;

    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke;
    applier[3] = &unk_1E14A52B0;
    v15 = v6;
    v16 = v7;
    v17 = &v18;
    xpc_dictionary_apply(v11, applier);

    v9 = v15;
  }
  else
  {
    v11 = 0;
  }

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)networkAgentsOfType:(Class)a3
{
  Class v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  Class v13;

  v3 = a3;
  if (a3)
  {
    if (-[NWPath status](self, "status") == NWPathStatusInvalid)
      return 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPath internalPath](self, "internalPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && (v8 = *(void **)(v6 + 224)) != 0)
    {
      v9 = v8;

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __30__NWPath_networkAgentsOfType___block_invoke;
      v11[3] = &unk_1E14A3178;
      v13 = v3;
      v12 = v5;
      xpc_dictionary_apply(v9, v11);
      v7 = v12;
    }
    else
    {
      v9 = 0;
    }

    if (objc_msgSend(v5, "count"))
      v3 = v5;
    else
      v3 = 0;

  }
  return v3;
}

- (id)genericNetworkAgentsWithDomain:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD applier[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (-[NWPath status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWPath internalPath](self, "internalPath");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9 && (v11 = *(void **)(v9 + 224)) != 0)
    {
      v12 = v11;

      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke;
      applier[3] = &unk_1E14A31A0;
      v16 = v6;
      v17 = v7;
      v18 = v8;
      xpc_dictionary_apply(v12, applier);

      v10 = v16;
    }
    else
    {
      v12 = 0;
    }

    if (objc_msgSend(v8, "count"))
      v13 = v8;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)inactiveNetworkAgentUUIDsOnlyVoluntary:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  if (-[NWPath status](self, "status") == NWPathStatusInvalid)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPath internalPath](self, "internalPath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6 && (v8 = *(void **)(v6 + 224)) != 0)
  {
    v9 = v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke;
    v12[3] = &unk_1E14A31C8;
    v14 = a3;
    v13 = v5;
    xpc_dictionary_apply(v9, v12);
    v7 = v13;
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v5, "count"))
    v11 = v5;
  else
    v11 = 0;

  return v11;
}

- (NWInterface)scopedInterface
{
  _DWORD *v2;
  void *v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  NWInterface *v7;

  -[NWPath internalPath](self, "internalPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || ((v4 = v2[66], v4 != 6) ? (v5 = v4 == 12) : (v5 = 1), !v5))
  {

    goto LABEL_10;
  }
  v6 = v2[67];

  if (!(_DWORD)v6)
  {
LABEL_10:
    v7 = 0;
    return v7;
  }
  v7 = -[NWInterface initWithInterfaceIndex:]([NWInterface alloc], "initWithInterfaceIndex:", v6);
  return v7;
}

- (id)delegateInterface
{
  void *v2;
  id v3;
  NWInterface *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_delegate_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);
  else
    v4 = 0;

  return v4;
}

- (NWInterface)fallbackInterface
{
  void *v2;
  unsigned int fallback_interface_index;
  NWInterface *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  if (fallback_interface_index)
    v4 = -[NWInterface initWithInterfaceIndex:]([NWInterface alloc], "initWithInterfaceIndex:", fallback_interface_index);
  else
    v4 = 0;
  return v4;
}

- (NSArray)flows
{
  void *v2;
  unsigned __int8 *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unsigned __int8 *)nw_path_copy_flows(v2);

  if (!v3 || *((_QWORD *)v3 + 3) == *((_QWORD *)v3 + 2))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __15__NWPath_flows__block_invoke;
    v7[3] = &unk_1E14AC200;
    v5 = v4;
    v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);

  }
  return (NSArray *)v5;
}

- (id)copyDNSServerEndpoints:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = (unsigned __int8 *)nw_path_copy_override_resolver_configs(v4);
  else
    v6 = (unsigned __int8 *)nw_path_copy_resolver_configs(v4);
  v7 = v6;

  if (!v7 || *((_QWORD *)v7 + 3) == *((_QWORD *)v7 + 2))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke;
    v11[3] = &unk_1E14AC200;
    v9 = v8;
    v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);

  }
  return v9;
}

- (id)copyDNSServersStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "addressStringNoPort", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)dnsServers
{
  return (NSArray *)-[NWPath copyDNSServerEndpoints:](self, "copyDNSServerEndpoints:", 0);
}

- (NSArray)dnsServersAsStrings
{
  void *v3;
  id v4;

  -[NWPath dnsServers](self, "dnsServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWPath copyDNSServersStrings:](self, "copyDNSServersStrings:", v3);

  return (NSArray *)v4;
}

- (NSArray)overrideDNSServers
{
  return (NSArray *)-[NWPath copyDNSServerEndpoints:](self, "copyDNSServerEndpoints:", 1);
}

- (NSArray)overrideDNSServersAsStrings
{
  void *v3;
  id v4;

  -[NWPath overrideDNSServers](self, "overrideDNSServers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NWPath copyDNSServersStrings:](self, "copyDNSServersStrings:", v3);

  return (NSArray *)v4;
}

- (id)copyDNSSearchDomains:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  -[NWPath internalPath](self, "internalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = (unsigned __int8 *)nw_path_copy_override_resolver_configs(v4);
  else
    v6 = (unsigned __int8 *)nw_path_copy_resolver_configs(v4);
  v7 = v6;

  if (!v7 || *((_QWORD *)v7 + 3) == *((_QWORD *)v7 + 2))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __31__NWPath_copyDNSSearchDomains___block_invoke;
    v11[3] = &unk_1E14AC200;
    v9 = v8;
    v12 = v9;
    nw_array_apply(v7, (uint64_t)v11);

  }
  return v9;
}

- (NSArray)dnsSearchDomains
{
  return (NSArray *)-[NWPath copyDNSSearchDomains:](self, "copyDNSSearchDomains:", 0);
}

- (NSArray)overrideDNSSearchDomains
{
  return (NSArray *)-[NWPath copyDNSSearchDomains:](self, "copyDNSSearchDomains:", 1);
}

- (NSArray)gateways
{
  void *v2;
  unsigned __int8 *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unsigned __int8 *)nw_path_copy_gateways(v2);

  if (!v3 || *((_QWORD *)v3 + 3) == *((_QWORD *)v3 + 2))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __18__NWPath_gateways__block_invoke;
    v7[3] = &unk_1E14AC200;
    v5 = v4;
    v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);

  }
  return (NSArray *)v5;
}

- (NSArray)groupMembers
{
  void *v2;
  unsigned __int8 *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unsigned __int8 *)nw_path_copy_group_members(v2);

  if (!v3 || *((_QWORD *)v3 + 3) == *((_QWORD *)v3 + 2))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __22__NWPath_groupMembers__block_invoke;
    v7[3] = &unk_1E14AC200;
    v5 = v4;
    v8 = v5;
    nw_array_apply(v3, (uint64_t)v7);

  }
  return (NSArray *)v5;
}

- (int64_t)mtu
{
  void *v2;
  int64_t mtu;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  mtu = (int)nw_path_get_mtu(v2);

  return mtu;
}

- (int64_t)maximumDatagramSize
{
  void *v2;
  int64_t maximum_datagram_size;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  maximum_datagram_size = nw_path_get_maximum_datagram_size(v2);

  return maximum_datagram_size;
}

- (unint64_t)secondsSinceInterfaceChange
{
  void *v2;
  unint64_t interface_time_delta;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  interface_time_delta = nw_path_get_interface_time_delta(v2);

  return interface_time_delta;
}

- (int64_t)reason
{
  void *v2;
  int64_t reason;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  reason = nw_path_get_reason(v2);

  return reason;
}

- (NSString)reasonDescription
{
  void *v2;
  uint64_t reason_description;
  __CFString *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  reason_description = nw_path_get_reason_description(v2);

  if (reason_description)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", reason_description);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E14AEB08;
  }
  return (NSString *)v4;
}

- (BOOL)isFlowDivert
{
  _DWORD *v2;
  void *v3;
  BOOL v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (v2[88])
      v4 = 1;
    else
      v4 = v2[66] == 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)flowDivertControlUnit
{
  _DWORD *v2;
  void *v3;
  unsigned int v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && v2[66] == 4)
    v4 = v2[67];
  else
    v4 = 0;

  return v4;
}

- (unsigned)flowDivertAggregateUnit
{
  _DWORD *v2;
  unsigned int v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[88];
  else
    v3 = 0;

  return v3;
}

- (id)copyFlowDivertToken
{
  void *v2;
  void *v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)nw_path_copy_flow_divert_token(v2);

  return v3;
}

- (BOOL)unsatisfiedVoluntaryAgentMatchesAddress:(id)a3 triggerImmediately:(BOOL *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;

  v5 = a3;
  -[NWPath internalPath](self, "internalPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "address");

  v8 = nw_path_voluntary_agent_matches_address(v6, v7);
  return v8;
}

- (BOOL)hasUnsatisfiedFallbackAgent
{
  NWConcrete_nw_path *v2;
  BOOL vpn_config_uuid;
  int v5;
  unsigned __int8 v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NWPath internalPath](self, "internalPath");
  v2 = (NWConcrete_nw_path *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  memset(v6, 0, sizeof(v6));
  vpn_config_uuid = nw_path_get_vpn_config_uuid(v2, (unsigned __int8 (*)[16])v6, &v5, 1, 1);

  return vpn_config_uuid;
}

- (int)dnsServiceID
{
  void *v2;
  int dns_service_id;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dns_service_id = nw_path_get_dns_service_id(v2, 1);

  return dns_service_id;
}

- (BOOL)isFiltered
{
  _DWORD *v2;
  BOOL v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[68] != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isLocal
{
  void *v2;
  char is_local;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_local = nw_path_is_local(v2);

  return is_local;
}

- (BOOL)isDirect
{
  void *v2;
  char is_direct;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_direct = nw_path_is_direct(v2);

  return is_direct;
}

- (unsigned)policyID
{
  _DWORD *v2;
  unsigned int v3;

  -[NWPath internalPath](self, "internalPath");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[85];
  else
    v3 = 0;

  return v3;
}

- (BOOL)isRoaming
{
  void *v2;
  BOOL is_roaming;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_roaming = nw_path_is_roaming(v2);

  return is_roaming;
}

- (NWParameters)parameters
{
  NWParameters *v3;
  void *v4;
  id v5;
  NWParameters *v6;

  v3 = [NWParameters alloc];
  -[NWPath internalPath](self, "internalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = nw_path_copy_parameters(v4);
  v6 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v5);

  return v6;
}

- (NWEndpoint)endpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_endpoint(v2);

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

- (NWEndpoint)effectiveLocalEndpoint
{
  NSObject *v2;
  nw_endpoint_t v3;
  void *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_effective_local_endpoint(v2);

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

- (NWEndpoint)effectiveRemoteEndpoint
{
  NSObject *v2;
  nw_endpoint_t v3;
  void *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_effective_remote_endpoint(v2);

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

- (NWInterface)connectedInterface
{
  void *v2;
  unsigned __int8 *v3;
  NWInterface *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_connected_interface(v2);

  if (v3)
    v4 = -[NWInterface initWithInterface:]([NWInterface alloc], "initWithInterface:", v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasBrowseDescriptor
{
  void *v2;
  BOOL has_browse_descriptor;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_browse_descriptor = nw_path_has_browse_descriptor(v2);

  return has_browse_descriptor;
}

- (NWBrowseDescriptor)browseDescriptor
{
  void *v2;
  id v3;
  void *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_browse_descriptor(v2);

  if (v3)
  {
    +[NWBrowseDescriptor descriptorWithInternalDescriptor:](NWBrowseDescriptor, "descriptorWithInternalDescriptor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NWBrowseDescriptor *)v4;
}

- (BOOL)hasAdvertiseDescriptor
{
  void *v2;
  BOOL has_advertise_descriptor;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_advertise_descriptor = nw_path_has_advertise_descriptor(v2);

  return has_advertise_descriptor;
}

- (NWAdvertiseDescriptor)advertiseDescriptor
{
  void *v2;
  id v3;
  NWAdvertiseDescriptor *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_advertise_descriptor(v2);

  if (v3)
    v4 = -[NWAdvertiseDescriptor initWithDescriptor:]([NWAdvertiseDescriptor alloc], "initWithDescriptor:", v3);
  else
    v4 = 0;

  return v4;
}

- (NWParameters)derivedParameters
{
  NWParameters *v3;
  void *v4;
  _BOOL8 v5;
  NWParameters *v6;

  v3 = [NWParameters alloc];
  -[NWPath internalPath](self, "internalPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = nw_path_copy_derived_parameters(v4);
  v6 = -[NWParameters initWithParameters:](v3, "initWithParameters:", v5);

  return v6;
}

- (unsigned)fallbackInterfaceIndex
{
  void *v2;
  unsigned int fallback_interface_index;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_interface_index = nw_path_get_fallback_interface_index((uint64_t)v2);

  return fallback_interface_index;
}

- (BOOL)fallbackIsWeak
{
  void *v2;
  char is_weak;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_weak = nw_path_fallback_is_weak(v2);

  return is_weak;
}

- (BOOL)fallbackEligible
{
  void *v2;
  BOOL should_fallback;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  should_fallback = nw_path_should_fallback(v2, 0);

  return should_fallback;
}

- (BOOL)fallbackIsPreferred
{
  void *v2;
  char is_preferred;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_preferred = nw_path_fallback_is_preferred(v2);

  return is_preferred;
}

- (NSArray)proxySettings
{
  void *v2;
  id v3;
  void *v4;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_path_copy_legacy_proxy_settings(v2);

  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E0C812C8])
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (BOOL)hasProxySettings
{
  void *v2;
  BOOL has_proxy_settings;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  has_proxy_settings = nw_path_has_proxy_settings(v2);

  return has_proxy_settings;
}

- (BOOL)supportsIPv4
{
  NSObject *v2;
  BOOL has_ipv4;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  has_ipv4 = nw_path_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)supportsIPv6
{
  NSObject *v2;
  BOOL has_ipv6;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  has_ipv6 = nw_path_has_ipv6(v2);

  return has_ipv6;
}

- (BOOL)supportsDNS
{
  NSObject *v2;
  BOOL has_dns;

  -[NWPath internalPath](self, "internalPath");
  v2 = objc_claimAutoreleasedReturnValue();
  has_dns = nw_path_has_dns(v2);

  return has_dns;
}

- (BOOL)isEligibleForCrazyIvan46
{
  void *v2;
  char is_eligible_for_CrazyIvan46;

  -[NWPath internalPath](self, "internalPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  is_eligible_for_CrazyIvan46 = nw_path_is_eligible_for_CrazyIvan46(v2);

  return is_eligible_for_CrazyIvan46;
}

- (id)createProtocolBufferObject
{
  NWPBPath *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;

  v3 = objc_alloc_init(NWPBPath);
  -[NWPath endpoint](self, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_endpoint, v5);

  -[NWPath parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_parameters, v7);

  v8 = -[NWPath status](self, "status");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 1u;
    v3->_status = v8;
  }
  -[NWPath clientID](self, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_clientUUID, v10);

  -[NWPath interface](self, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_directInterface, v12);

  -[NWPath delegateInterface](self, "delegateInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "createProtocolBufferObject");
  if (v3)
    objc_storeStrong((id *)&v3->_delegateInterface, v14);

  v15 = -[NWPath isDirect](self, "isDirect");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 2u;
    v3->_direct = v15;
    v16 = -[NWPath isLocal](self, "isLocal");
    *(_BYTE *)&v3->_has |= 0x10u;
    v3->_local = v16;
    v17 = -[NWPath supportsIPv4](self, "supportsIPv4");
    *(_BYTE *)&v3->_has |= 4u;
    v3->_ipv4 = v17;
    v18 = -[NWPath supportsIPv6](self, "supportsIPv6");
    *(_BYTE *)&v3->_has |= 8u;
    v3->_ipv6 = v18;
  }
  else
  {
    -[NWPath isLocal](self, "isLocal");
    -[NWPath supportsIPv4](self, "supportsIPv4");
    -[NWPath supportsIPv6](self, "supportsIPv6");
  }
  return v3;
}

uint64_t __22__NWPath_groupMembers__block_invoke(uint64_t a1)
{
  void *v2;

  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

uint64_t __18__NWPath_gateways__block_invoke(uint64_t a1)
{
  void *v2;

  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__NWPath_copyDNSSearchDomains___block_invoke_2;
  v5[3] = &unk_1E14A9B18;
  v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_search_domains(a3, v5);

  return 1;
}

uint64_t __31__NWPath_copyDNSSearchDomains___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), a2);
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__NWPath_copyDNSServerEndpoints___block_invoke_2;
  v5[3] = &unk_1E14A9B18;
  v6 = *(id *)(a1 + 32);
  nw_resolver_config_enumerate_name_servers(a3, v5);

  return 1;
}

uint64_t __33__NWPath_copyDNSServerEndpoints___block_invoke_2(uint64_t a1, char *hostname)
{
  nw_endpoint_t host;
  void *v4;

  host = nw_endpoint_create_host(hostname, "0");
  +[NWEndpoint endpointWithInternalEndpoint:](NWEndpoint, "endpointWithInternalEndpoint:", host);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return 1;
}

uint64_t __15__NWPath_flows__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NWPathFlow *v5;

  v4 = a3;
  v5 = -[NWPathFlow initWithPathFlow:]([NWPathFlow alloc], "initWithPathFlow:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

uint64_t __49__NWPath_inactiveNetworkAgentUUIDsOnlyVoluntary___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  _DWORD *data;
  int v5;
  void *v6;
  void *v7;
  size_t length;

  length = 0;
  if (xdict)
  {
    data = xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8 && length == data[53] + 216)
      {
        v5 = data[52];
        if ((v5 & 2) == 0 && ((v5 & 0x10) != 0 || !*(_BYTE *)(a1 + 40)))
        {
          v6 = *(void **)(a1 + 32);
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", data);
          objc_msgSend(v6, "addObject:", v7);

        }
      }
    }
  }
  return 1;
}

uint64_t __46__NWPath_genericNetworkAgentsWithDomain_type___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  NWGenericNetworkAgent *v3;
  unsigned int *data;
  unsigned int *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  int v10;
  size_t length;

  length = 0;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        v6 = data;
        if (length == data[53] + 216)
        {
          v7 = *(void **)(a1 + 32);
          if (v7)
          {
            v3 = (NWGenericNetworkAgent *)nw_nsstring((uint64_t)(data + 4));
            if ((objc_msgSend(v7, "isEqualToString:", v3) & 1) == 0)
            {
LABEL_16:

              return 1;
            }
            v8 = *(void **)(a1 + 40);
            if (!v8)
            {

              goto LABEL_14;
            }
          }
          else
          {
            v8 = *(void **)(a1 + 40);
            if (!v8)
              goto LABEL_14;
          }
          v9 = nw_nsstring((uint64_t)(v6 + 12));
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

          if (v7)
          {

            if ((v10 & 1) == 0)
              return 1;
            goto LABEL_14;
          }
          if (v10)
          {
LABEL_14:
            v3 = -[NWGenericNetworkAgent initWithKernelAgent:]([NWGenericNetworkAgent alloc], "initWithKernelAgent:", v6);
            if (v3)
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
            goto LABEL_16;
          }
        }
      }
    }
  }
  return 1;
}

uint64_t __30__NWPath_networkAgentsOfType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  unsigned int *data;
  unsigned int *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  size_t length;

  length = 0;
  if (xdict)
  {
    data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
    if (data)
    {
      if (length >= 0xD8)
      {
        v5 = data;
        if (length == data[53] + 216)
        {
          objc_msgSend(*(id *)(a1 + 40), "agentDomain");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = nw_nsstring((uint64_t)(v5 + 4));
          if (!objc_msgSend(v6, "isEqualToString:", v7))
            goto LABEL_24;
          objc_msgSend(*(id *)(a1 + 40), "agentType");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = nw_nsstring((uint64_t)(v5 + 12));
          v10 = objc_msgSend(v8, "isEqualToString:", v9);

          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5 + 54, v5[53]);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "agentFromData:", v6);
            v7 = objc_claimAutoreleasedReturnValue();
            if (v7)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5 + 20);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v7, "setAgentDescription:", v11);

              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v5);
              objc_msgSend((id)v7, "setAgentUUID:", v12);

              v13 = v5[52];
              if ((v13 & 2) != 0)
              {
                objc_msgSend((id)v7, "setActive:", 1);
                v13 = v5[52];
                if ((v13 & 4) == 0)
                {
LABEL_10:
                  if ((v13 & 8) == 0)
                    goto LABEL_11;
                  goto LABEL_16;
                }
              }
              else if ((v13 & 4) == 0)
              {
                goto LABEL_10;
              }
              objc_msgSend((id)v7, "setKernelActivated:", 1);
              v13 = v5[52];
              if ((v13 & 8) == 0)
              {
LABEL_11:
                if ((v13 & 0x10) == 0)
                  goto LABEL_12;
                goto LABEL_17;
              }
LABEL_16:
              objc_msgSend((id)v7, "setUserActivated:", 1);
              v13 = v5[52];
              if ((v13 & 0x10) == 0)
              {
LABEL_12:
                if ((v13 & 0x20) == 0)
                {
LABEL_20:
                  if ((v5[52] & 0x40) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend((id)v7, "setNetworkProvider:", 1);
                  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
                  goto LABEL_24;
                }
LABEL_18:
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend((id)v7, "setSpecificUseOnly:", 1);
                goto LABEL_20;
              }
LABEL_17:
              objc_msgSend((id)v7, "setVoluntary:", 1);
              if ((v5[52] & 0x20) == 0)
                goto LABEL_20;
              goto LABEL_18;
            }
LABEL_24:

          }
        }
      }
    }
  }
  return 1;
}

uint64_t __50__NWPath_copyDataFromNetworkAgentWithDomain_type___block_invoke(_QWORD *a1, int a2, xpc_object_t xdict)
{
  unsigned int *data;
  unsigned int *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t length;

  length = 0;
  if (!xdict)
    return 1;
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data)
    return 1;
  if (length < 0xD8)
    return 1;
  v5 = data;
  if (length != data[53] + 216)
    return 1;
  v6 = (void *)a1[4];
  v7 = (void *)nw_nsstring((uint64_t)(data + 4));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  if (v8)
  {
    v9 = (void *)a1[5];
    v10 = nw_nsstring((uint64_t)(v5 + 12));
    LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v10);

    if ((_DWORD)v9)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5 + 54, v5[53]);
      v12 = *(_QWORD *)(a1[6] + 8);
      v7 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
      goto LABEL_8;
    }
    return 1;
  }
LABEL_8:
  v13 = v8 ^ 1u;

  return v13;
}

BOOL __31__NWPath_usesNetworkAgentType___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  unsigned int *data;
  unsigned int *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  int v10;
  size_t length;

  length = 0;
  if (!xdict)
    return 1;
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "data", &length);
  if (!data)
    return 1;
  if (length < 0xD8)
    return 1;
  v5 = data;
  if (length != data[53] + 216)
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "agentDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = nw_nsstring((uint64_t)(v5 + 4));
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "agentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = nw_nsstring((uint64_t)(v5 + 12));
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {

  }
  return !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __48__NWPath_descriptionWithIndent_showFullContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3A28];
  v6 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithUUIDBytes:", a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ : %@"), v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "appendPrettyObject:withName:indent:showFullContent:", v7, CFSTR("interfaceOption"), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

+ (id)allClientIDs
{
  xpc_object_t v2;
  void *v3;
  size_t count;
  size_t v5;
  size_t i;
  void *v7;

  v2 = nw_path_copy_all_client_ids();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v2);
    if (count)
    {
      v5 = count;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_array_get_uuid(v2, i));
        if (v7)
          objc_msgSend(v3, "addObject:", v7);

      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)pathForClientID:(id)a3
{
  id v3;
  id v4;
  _BOOL8 v5;
  NWPath *v6;
  uuid_t uu;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v3 = a3;
  uuid_clear(uu);
  objc_msgSend(v3, "getUUIDBytes:", uu);

  if (nw_context_copy_implicit_context::onceToken[0] != -1)
    dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  v4 = (id)nw_context_copy_implicit_context::implicit_context;
  v5 = nw_path_copy_path_for_client_with_context((uint64_t)uu);

  if (v5)
    v6 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)pathForClientID:(id)a3 parametersTLV:(id)a4 pathResultTLV:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NWConcrete_nw_path *v11;
  NWPath *v12;
  uuid_t uu;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v7 = a5;
  v8 = a4;
  v9 = a3;
  uuid_clear(uu);
  objc_msgSend(v9, "getUUIDBytes:", uu);

  if (nw_context_copy_implicit_context::onceToken[0] != -1)
    dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  v10 = (id)nw_context_copy_implicit_context::implicit_context;
  v11 = nw_path_copy_path_for_tlv(uu, v10, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  if (v11)
    v12 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v11);
  else
    v12 = 0;

  return v12;
}

+ (id)createStringFromStatus:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return off_1E14A31E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NWPath)pathWithProtocolBufferData:(id)a3
{
  id v3;
  NWPBPath *v4;
  NWPBPath *v5;
  NSString *clientUUID;
  NSString *v7;
  NWPBInterface *directInterface;
  NWPBInterface *v9;
  void *v10;
  void *v11;
  id v12;
  char *v13;
  NSObject *v14;
  unsigned __int8 v15;
  const char *v16;
  NWPBInterface *delegateInterface;
  NWPBInterface *v18;
  void *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  unsigned __int8 *v26;
  void *v27;
  id v28;
  xpc_object_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  unsigned __int8 *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  unsigned __int8 *v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  void *v102;
  id v103;
  unsigned __int8 *v104;
  _BYTE *v105;
  uint64_t v106;
  int v107;
  void *v108;
  id v109;
  const char *v110;
  NSObject *v111;
  void *v112;
  NWPath *result;
  NSObject *v114;
  void *v115;
  void *v116;
  NWPBEndpoint *endpoint;
  NWPBEndpoint *v118;
  void *v119;
  void *v120;
  NWPBParameters *parameters;
  NWPBParameters *v122;
  void *v123;
  void *v124;
  int direct;
  int local;
  int ipv4;
  int ipv6;
  void *v129;
  void *v130;
  id *v131;
  NWPath *v132;
  char *backtrace_string;
  os_log_type_t v134;
  _BOOL4 v135;
  NSObject *v136;
  os_log_type_t v137;
  uint8_t *v138;
  uint64_t v139;
  void *v140;
  NSObject *v141;
  NSObject *v142;
  NWPBPath *v143;
  int status;
  id v145;
  void *v146;
  void *v147;
  NSMutableArray *obj;
  id obja;
  xpc_object_t xdict;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  size_t length;
  void *lengtha;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  char v161;
  unsigned __int8 v162[128];
  uuid_t uu;
  uint8_t buf[4];
  const char *v165;
  __int16 v166;
  uint64_t v167;
  __int16 v168;
  uint64_t v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[NWPBPath initWithData:]([NWPBPath alloc], "initWithData:", v3);
  v5 = v4;
  if (!v4)
  {
    v11 = v3;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v165 = "+[NWPath pathWithProtocolBufferData:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    uu[0] = 16;
    v161 = 0;
    if (__nwlog_fault(v13, uu, &v161))
    {
      if (uu[0] == 17)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0]))
          goto LABEL_168;
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        v16 = "%{public}s [NWPBPath initWithData:] failed";
LABEL_166:
        v136 = v14;
        v137 = v15;
        goto LABEL_167;
      }
      if (!v161)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v14 = (id)gLogObj;
        v15 = uu[0];
        if (!os_log_type_enabled(v14, (os_log_type_t)uu[0]))
          goto LABEL_168;
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        v16 = "%{public}s [NWPBPath initWithData:] failed, backtrace limit exceeded";
        goto LABEL_166;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      v134 = uu[0];
      v135 = os_log_type_enabled(v14, (os_log_type_t)uu[0]);
      if (!backtrace_string)
      {
        if (!v135)
        {
LABEL_168:

          if (!v13)
            goto LABEL_162;
          goto LABEL_161;
        }
        *(_DWORD *)buf = 136446210;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        v16 = "%{public}s [NWPBPath initWithData:] failed, no backtrace";
        v136 = v14;
        v137 = v134;
LABEL_167:
        _os_log_impl(&dword_182FBE000, v136, v137, v16, buf, 0xCu);
        goto LABEL_168;
      }
      if (v135)
      {
        *(_DWORD *)buf = 136446466;
        v165 = "+[NWPath pathWithProtocolBufferData:]";
        v166 = 2082;
        v167 = (uint64_t)backtrace_string;
        _os_log_impl(&dword_182FBE000, v14, v134, "%{public}s [NWPBPath initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v13)
    {
LABEL_162:
      v132 = 0;
LABEL_163:

      return v132;
    }
LABEL_161:
    free(v13);
    goto LABEL_162;
  }
  memset(uu, 0, sizeof(uu));
  clientUUID = v4->_clientUUID;
  if (clientUUID)
  {
    v7 = clientUUID;
    uuid_parse(-[NSString UTF8String](v7, "UTF8String"), uu);

  }
  v145 = v3;
  directInterface = v5->_directInterface;
  if (directInterface)
  {
    v9 = directInterface;
    -[NWPBInterface data](v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NWInterface interfaceWithProtocolBufferData:](NWInterface, "interfaceWithProtocolBufferData:", v10);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v147 = 0;
  }
  delegateInterface = v5->_delegateInterface;
  if (delegateInterface)
  {
    v18 = delegateInterface;
    -[NWPBInterface data](v18, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NWInterface interfaceWithProtocolBufferData:](NWInterface, "interfaceWithProtocolBufferData:", v19);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v146 = 0;
  }
  if (!-[NSMutableArray count](v5->_agents, "count"))
  {
    xdict = 0;
    goto LABEL_145;
  }
  xdict = xpc_dictionary_create(0, 0, 0);
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v143 = v5;
  obj = v5->_agents;
  v153 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v157, v162, 16);
  if (!v153)
  {
LABEL_143:

    v5 = v143;
LABEL_145:
    endpoint = v5->_endpoint;
    if (endpoint)
    {
      v118 = endpoint;
      -[NWPBEndpoint data](v118, "data");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      +[NWEndpoint endpointWithProtocolBufferData:](NWEndpoint, "endpointWithProtocolBufferData:", v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v120 = 0;
    }
    parameters = v5->_parameters;
    if (parameters)
    {
      v122 = parameters;
      -[NWPBParameters data](v122, "data");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      +[NWParameters parametersWithProtocolBufferData:](NWParameters, "parametersWithProtocolBufferData:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v124 = 0;
    }
    objc_msgSend(v120, "internalEndpoint", v138, v139);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "internalParameters");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v154 = v124;
    lengtha = v120;
    if ((*(_BYTE *)&v5->_has & 1) != 0)
      status = v5->_status;
    else
      status = 0;
    direct = v5->_direct;
    local = v5->_local;
    ipv4 = v5->_ipv4;
    ipv6 = v5->_ipv6;
    objc_msgSend(v147, "internalInterface");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "internalInterface");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = nw_path_create_static(v152, obja, status, uu, direct, local, ipv4, ipv6, v129, v130, xdict);

    v132 = -[NWPath initWithPath:]([NWPath alloc], "initWithPath:", v131);
    v11 = v145;
    goto LABEL_163;
  }
  v151 = *(_QWORD *)v158;
  v20 = &OBJC_IVAR___NWURLLoaderData__URL;
LABEL_18:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v158 != v151)
      objc_enumerationMutation(obj);
    v22 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * v21);
    if (v22 && (v23 = *(void **)(v22 + 16)) != 0)
    {
      v24 = v23;
      v25 = objc_msgSend(v24, "length");

    }
    else
    {
      v25 = 0;
    }
    v26 = (unsigned __int8 *)malloc_type_calloc(1uLL, v25 + 8, 0xEAFB8F1AuLL);
    if (v26)
    {
      length = v25 + 8;
      if (v22)
        goto LABEL_28;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v111 = (id)gLogObj;
      os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446722;
      v165 = "strict_calloc";
      v166 = 2048;
      v167 = 1;
      v168 = 2048;
      v169 = v25 + 8;
      LODWORD(v139) = 32;
      v138 = buf;
      v112 = (void *)_os_log_send_and_compose_impl();

      result = (NWPath *)__nwlog_abort((uint64_t)v112);
      if ((_DWORD)result)
        goto LABEL_172;
      free(v112);
      length = v25 + 8;
      if (v22)
      {
LABEL_28:
        v27 = *(void **)(v22 + 32);
        goto LABEL_29;
      }
    }
    v27 = 0;
LABEL_29:
    v28 = v27;
    uuid_parse((const char *)objc_msgSend(v28, "UTF8String"), v26);
    v29 = xpc_dictionary_create(0, 0, 0);
    if (v22)
    {
      v30 = *(id *)(v22 + v20[151]);
      v31 = v30;
      if (v30)
        v32 = (void *)*((_QWORD *)v30 + 1);
      else
        v32 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 0;
    }
    v33 = v32;

    if (objc_msgSend(v33, "UTF8String"))
    {
      v34 = (unsigned __int8 *)objc_msgSend(v33, "UTF8String");
      if (!v34)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v114 = (id)gLogObj;
        os_log_type_enabled(v114, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v165 = "_strict_strlcpy";
        LODWORD(v139) = 12;
        v138 = buf;
        v115 = (void *)_os_log_send_and_compose_impl();

        result = (NWPath *)__nwlog_abort((uint64_t)v115);
        if ((_DWORD)result)
          goto LABEL_172;
        free(v115);
        v20 = &OBJC_IVAR___NWURLLoaderData__URL;
      }
      v35 = *v34;
      v26[16] = v35;
      if (v35)
      {
        v36 = v34[1];
        v26[17] = v36;
        if (v36)
        {
          v37 = v34[2];
          v26[18] = v37;
          if (v37)
          {
            v38 = v34[3];
            v26[19] = v38;
            if (v38)
            {
              v39 = v34[4];
              v26[20] = v39;
              if (v39)
              {
                v40 = v34[5];
                v26[21] = v40;
                if (v40)
                {
                  v41 = v34[6];
                  v26[22] = v41;
                  if (v41)
                  {
                    v42 = v34[7];
                    v26[23] = v42;
                    if (v42)
                    {
                      v43 = v34[8];
                      v26[24] = v43;
                      if (v43)
                      {
                        v44 = v34[9];
                        v26[25] = v44;
                        if (v44)
                        {
                          v45 = v34[10];
                          v26[26] = v45;
                          if (v45)
                          {
                            v46 = v34[11];
                            v26[27] = v46;
                            if (v46)
                            {
                              v47 = v34[12];
                              v26[28] = v47;
                              if (v47)
                              {
                                v48 = v34[13];
                                v26[29] = v48;
                                if (v48)
                                {
                                  v49 = v34[14];
                                  v26[30] = v49;
                                  if (v49)
                                  {
                                    v50 = v34[15];
                                    v26[31] = v50;
                                    if (v50)
                                    {
                                      v51 = v34[16];
                                      v26[32] = v51;
                                      if (v51)
                                      {
                                        v52 = v34[17];
                                        v26[33] = v52;
                                        if (v52)
                                        {
                                          v53 = v34[18];
                                          v26[34] = v53;
                                          if (v53)
                                          {
                                            v54 = v34[19];
                                            v26[35] = v54;
                                            if (v54)
                                            {
                                              v55 = v34[20];
                                              v26[36] = v55;
                                              if (v55)
                                              {
                                                v56 = v34[21];
                                                v26[37] = v56;
                                                if (v56)
                                                {
                                                  v57 = v34[22];
                                                  v26[38] = v57;
                                                  if (v57)
                                                  {
                                                    v58 = v34[23];
                                                    v26[39] = v58;
                                                    if (v58)
                                                    {
                                                      v59 = v34[24];
                                                      v26[40] = v59;
                                                      if (v59)
                                                      {
                                                        v60 = v34[25];
                                                        v26[41] = v60;
                                                        if (v60)
                                                        {
                                                          v61 = v34[26];
                                                          v26[42] = v61;
                                                          if (v61)
                                                          {
                                                            v62 = v34[27];
                                                            v26[43] = v62;
                                                            if (v62)
                                                            {
                                                              v63 = v34[28];
                                                              v26[44] = v63;
                                                              if (v63)
                                                              {
                                                                v64 = v34[29];
                                                                v26[45] = v64;
                                                                if (v64)
                                                                {
                                                                  v65 = v34[30];
                                                                  v26[46] = v65;
                                                                  if (v65)
                                                                    v26[47] = 0;
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (v22)
    {
      v66 = *(id *)(v22 + v20[151]);
      v67 = v66;
      if (v66)
        v68 = (void *)*((_QWORD *)v66 + 2);
      else
        v68 = 0;
    }
    else
    {
      v67 = 0;
      v68 = 0;
    }
    v69 = v68;

    if (objc_msgSend(v69, "UTF8String"))
    {
      v70 = (unsigned __int8 *)objc_msgSend(v69, "UTF8String");
      if (!v70)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v141 = (id)gLogObj;
        os_log_type_enabled(v141, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v165 = "_strict_strlcpy";
        LODWORD(v139) = 12;
        v138 = buf;
        v116 = (void *)_os_log_send_and_compose_impl();

        result = (NWPath *)__nwlog_abort((uint64_t)v116);
        if ((_DWORD)result)
          goto LABEL_172;
        free(v116);
      }
      v71 = *v70;
      v26[48] = v71;
      if (v71)
      {
        v72 = v70[1];
        v26[49] = v72;
        if (v72)
        {
          v73 = v70[2];
          v26[50] = v73;
          if (v73)
          {
            v74 = v70[3];
            v26[51] = v74;
            if (v74)
            {
              v75 = v70[4];
              v26[52] = v75;
              if (v75)
              {
                v76 = v70[5];
                v26[53] = v76;
                if (v76)
                {
                  v77 = v70[6];
                  v26[54] = v77;
                  if (v77)
                  {
                    v78 = v70[7];
                    v26[55] = v78;
                    if (v78)
                    {
                      v79 = v70[8];
                      v26[56] = v79;
                      if (v79)
                      {
                        v80 = v70[9];
                        v26[57] = v80;
                        if (v80)
                        {
                          v81 = v70[10];
                          v26[58] = v81;
                          if (v81)
                          {
                            v82 = v70[11];
                            v26[59] = v82;
                            if (v82)
                            {
                              v83 = v70[12];
                              v26[60] = v83;
                              if (v83)
                              {
                                v84 = v70[13];
                                v26[61] = v84;
                                if (v84)
                                {
                                  v85 = v70[14];
                                  v26[62] = v85;
                                  if (v85)
                                  {
                                    v86 = v70[15];
                                    v26[63] = v86;
                                    if (v86)
                                    {
                                      v87 = v70[16];
                                      v26[64] = v87;
                                      if (v87)
                                      {
                                        v88 = v70[17];
                                        v26[65] = v88;
                                        if (v88)
                                        {
                                          v89 = v70[18];
                                          v26[66] = v89;
                                          if (v89)
                                          {
                                            v90 = v70[19];
                                            v26[67] = v90;
                                            if (v90)
                                            {
                                              v91 = v70[20];
                                              v26[68] = v91;
                                              if (v91)
                                              {
                                                v92 = v70[21];
                                                v26[69] = v92;
                                                if (v92)
                                                {
                                                  v93 = v70[22];
                                                  v26[70] = v93;
                                                  if (v93)
                                                  {
                                                    v94 = v70[23];
                                                    v26[71] = v94;
                                                    if (v94)
                                                    {
                                                      v95 = v70[24];
                                                      v26[72] = v95;
                                                      if (v95)
                                                      {
                                                        v96 = v70[25];
                                                        v26[73] = v96;
                                                        if (v96)
                                                        {
                                                          v97 = v70[26];
                                                          v26[74] = v97;
                                                          if (v97)
                                                          {
                                                            v98 = v70[27];
                                                            v26[75] = v98;
                                                            if (v98)
                                                            {
                                                              v99 = v70[28];
                                                              v26[76] = v99;
                                                              if (v99)
                                                              {
                                                                v100 = v70[29];
                                                                v26[77] = v100;
                                                                if (v100)
                                                                {
                                                                  v101 = v70[30];
                                                                  v26[78] = v101;
                                                                  if (v101)
                                                                    v26[79] = 0;
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v102 = v22 ? *(void **)(v22 + 24) : 0;
    v103 = v102;
    if (objc_msgSend(v103, "UTF8String"))
      break;
LABEL_111:
    if (v22)
    {
      if (*(_BYTE *)(v22 + 40))
        *((_DWORD *)v26 + 52) |= 2u;
      if (*(_BYTE *)(v22 + 43))
        *((_DWORD *)v26 + 52) |= 8u;
      if (*(_BYTE *)(v22 + 44))
        *((_DWORD *)v26 + 52) |= 0x10u;
      if (*(_BYTE *)(v22 + 41))
        *((_DWORD *)v26 + 52) |= 0x40u;
      if (*(_BYTE *)(v22 + 42))
        *((_DWORD *)v26 + 52) |= 0x80u;
      *((_DWORD *)v26 + 53) = v25;
      if (!v25)
        goto LABEL_125;
      v108 = *(void **)(v22 + 16);
    }
    else
    {
      *((_DWORD *)v26 + 53) = v25;
      if (!v25)
        goto LABEL_125;
      v108 = 0;
    }
    v109 = v108;
    objc_msgSend(v109, "getBytes:length:", v26 + 216, v25);

LABEL_125:
    xpc_dictionary_set_data(v29, "data", v26, length);
    free(v26);
    v110 = (const char *)objc_msgSend(v28, "UTF8String");
    if (v110)
      xpc_dictionary_set_value(xdict, v110, v29);

    ++v21;
    v20 = &OBJC_IVAR___NWURLLoaderData__URL;
    if (v21 == v153)
    {
      v153 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v157, v162, 16);
      if (!v153)
        goto LABEL_143;
      goto LABEL_18;
    }
  }
  v104 = (unsigned __int8 *)objc_msgSend(v103, "UTF8String");
  if (v104)
    goto LABEL_107;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v142 = (id)gLogObj;
  os_log_type_enabled(v142, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v165 = "_strict_strlcpy";
  LODWORD(v139) = 12;
  v138 = buf;
  v140 = (void *)_os_log_send_and_compose_impl();

  result = (NWPath *)__nwlog_abort((uint64_t)v140);
  if (!(_DWORD)result)
  {
    free(v140);
LABEL_107:
    v105 = v26 + 80;
    v106 = 128;
    while (1)
    {
      v107 = *v104;
      *v105 = v107;
      if (!v107)
        goto LABEL_111;
      ++v105;
      ++v104;
      if ((unint64_t)--v106 <= 1)
      {
        *v105 = 0;
        goto LABEL_111;
      }
    }
  }
LABEL_172:
  __break(1u);
  return result;
}

@end
