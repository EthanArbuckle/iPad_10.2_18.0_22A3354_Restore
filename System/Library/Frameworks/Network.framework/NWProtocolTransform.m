@implementation NWProtocolTransform

- (NWProtocolTransform)init
{
  NWProtocolTransform *v2;
  NWConcrete_nw_protocol_transform *v3;
  OS_nw_protocol_transform *internalTransform;
  NWProtocolTransform *v5;
  id v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  const char *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  char *v14;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  const char *backtrace_string;
  _BOOL4 v23;
  char v24;
  os_log_type_t type;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)NWProtocolTransform;
  v2 = -[NWProtocolTransform init](&v26, sel_init);
  if (!v2)
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWProtocolTransform init]";
    v7 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed";
LABEL_39:
        _os_log_impl(&dword_182FBE000, v19, v20, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        backtrace_string = __nw_create_backtrace_string();
        __nwlog_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = type;
        v23 = os_log_type_enabled(v19, type);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v28 = "-[NWProtocolTransform init]";
            v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          v14 = (char *)backtrace_string;
LABEL_13:
          free(v14);
          goto LABEL_14;
        }
        if (!v23)
          goto LABEL_40;
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_39;
      }
      __nwlog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = type;
      if (os_log_type_enabled(v19, type))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWProtocolTransform init]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_40:

LABEL_14:
    if (!v7)
    {
LABEL_16:
      v5 = 0;
      goto LABEL_17;
    }
LABEL_15:
    free(v7);
    goto LABEL_16;
  }
  v3 = objc_alloc_init(NWConcrete_nw_protocol_transform);
  internalTransform = v2->_internalTransform;
  v2->_internalTransform = (OS_nw_protocol_transform *)v3;

  if (!v2->_internalTransform)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v6 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWProtocolTransform init]";
    v7 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v7, &type, &v24))
      goto LABEL_14;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWProtocolTransform init]";
      v10 = "%{public}s nw_protocol_transform_create failed";
LABEL_20:
      v16 = v8;
      v17 = v9;
      goto LABEL_21;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_22;
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWProtocolTransform init]";
      v10 = "%{public}s nw_protocol_transform_create failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    v11 = __nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v8 = (id)gLogObj;
    v12 = type;
    v13 = os_log_type_enabled(v8, type);
    if (!v11)
    {
      if (!v13)
      {
LABEL_22:

        if (!v7)
          goto LABEL_16;
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWProtocolTransform init]";
      v10 = "%{public}s nw_protocol_transform_create failed, no backtrace";
      v16 = v8;
      v17 = v12;
LABEL_21:
      _os_log_impl(&dword_182FBE000, v16, v17, v10, buf, 0xCu);
      goto LABEL_22;
    }
    if (v13)
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[NWProtocolTransform init]";
      v29 = 2082;
      v30 = v11;
      _os_log_impl(&dword_182FBE000, v8, v12, "%{public}s nw_protocol_transform_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    v14 = (char *)v11;
    goto LABEL_13;
  }
  v5 = v2;
LABEL_17:

  return v5;
}

- (NWProtocolTransform)initWithCTransform:(id)a3
{
  id v5;
  NWProtocolTransform *v6;
  NWProtocolTransform *v7;
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
    v23.super_class = (Class)NWProtocolTransform;
    v6 = -[NWProtocolTransform init](&v23, sel_init);
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalTransform, a3);
      goto LABEL_4;
    }
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWProtocolTransform initWithCTransform:]";
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
        v27 = "-[NWProtocolTransform initWithCTransform:]";
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
          v27 = "-[NWProtocolTransform initWithCTransform:]";
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
        v27 = "-[NWProtocolTransform initWithCTransform:]";
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
        v27 = "-[NWProtocolTransform initWithCTransform:]";
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
  v27 = "-[NWProtocolTransform initWithCTransform:]";
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
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v13 = "%{public}s called with null cTransform";
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
            v27 = "-[NWProtocolTransform initWithCTransform:]";
            v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_182FBE000, v11, v12, "%{public}s called with null cTransform, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20)
          goto LABEL_30;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v13 = "%{public}s called with null cTransform, no backtrace";
        goto LABEL_29;
      }
      __nwlog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWProtocolTransform initWithCTransform:]";
        v13 = "%{public}s called with null cTransform, backtrace limit exceeded";
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

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v7;
  const __CFString *v8;
  void *v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") == 1)
  {
    v8 = CFSTR("Failover");
  }
  else if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") == 2)
  {
    v8 = CFSTR("RTT-Timer");
  }
  else
  {
    if (-[NWProtocolTransform fallbackMode](self, "fallbackMode") != 3)
      goto LABEL_8;
    v8 = CFSTR("Immediate");
  }
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v8, CFSTR("fallbackMode"), v5, v4);
LABEL_8:
  -[NWProtocolTransform replacementEndpoint](self, "replacementEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:indent:showFullContent:", v9, CFSTR("replacementEndpoint"), v5, v4);

  if (-[NWProtocolTransform prohibitDirect](self, "prohibitDirect"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWProtocolTransform prohibitDirect](self, "prohibitDirect"), CFSTR("prohibitDirect"), v5);
  if (-[NWProtocolTransform noProxy](self, "noProxy"))
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWProtocolTransform noProxy](self, "noProxy"), CFSTR("noProxy"), v5);
  if (-[NWProtocolTransform multipathService](self, "multipathService"))
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWProtocolTransform multipathService](self, "multipathService"), CFSTR("multipathService"), v5);
  return v7;
}

- (id)description
{
  return -[NWProtocolTransform descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 0);
}

- (id)privateDescription
{
  return -[NWProtocolTransform descriptionWithIndent:showFullContent:](self, "descriptionWithIndent:showFullContent:", 0, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[NWProtocolTransform internalTransform](self, "internalTransform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalTransform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = nw_protocol_transform_compare(v6, v7, 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t hash;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hash = nw_protocol_transform_get_hash(v2);

  return hash;
}

- (void)disableProtocol:(nw_protocol_identifier *)a3
{
  id v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_disable_protocol(v4, a3);

}

- (void)clearProtocolsAtLevel:(int)a3
{
  id v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_clear_protocols_at_level(v4, a3);

}

- (void)appendProtocol:(id)a3 atLevel:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_append_protocol(v7, a4, v6);

}

- (NWEndpoint)replacementEndpoint
{
  void *v2;
  id v3;
  void *v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = nw_protocol_transform_copy_endpoint(v2);

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

- (void)setReplacementEndpoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  nw_protocol_transform_replace_endpoint(v6, v5);
}

- (unint64_t)fallbackMode
{
  void *v2;
  unint64_t fallback_mode;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fallback_mode = nw_protocol_transform_get_fallback_mode(v2);

  return fallback_mode;
}

- (void)setFallbackMode:(unint64_t)a3
{
  int v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_fallback_mode(v4, v3);

}

- (BOOL)prohibitDirect
{
  void *v2;
  char prohibit_direct;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  prohibit_direct = nw_protocol_transform_get_prohibit_direct(v2);

  return prohibit_direct;
}

- (void)setProhibitDirect:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_prohibit_direct(v4, v3);

}

- (BOOL)noProxy
{
  void *v2;
  char no_proxy;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  no_proxy = nw_protocol_transform_get_no_proxy(v2);

  return no_proxy;
}

- (void)setNoProxy:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_no_proxy(v4, v3);

}

- (int)multipathService
{
  void *v2;
  int multipath_service;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  multipath_service = nw_protocol_transform_get_multipath_service(v2);

  return multipath_service;
}

- (void)setMultipathService:(int)a3
{
  id v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_multipath_service(v4, a3);

}

- (BOOL)tfo
{
  void *v2;
  char tfo;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tfo = nw_protocol_transform_get_tfo(v2);

  return tfo;
}

- (void)setTfo:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_tfo(v4, v3);

}

- (BOOL)tfoNoCookie
{
  void *v2;
  char tfo_no_cookie;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  tfo_no_cookie = nw_protocol_transform_get_tfo_no_cookie(v2);

  return tfo_no_cookie;
}

- (void)setTfoNoCookie:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_tfo_no_cookie(v4, v3);

}

- (BOOL)fastOpenForceEnable
{
  void *v2;
  char fast_open_force_enable;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  fast_open_force_enable = nw_protocol_transform_get_fast_open_force_enable(v2);

  return fast_open_force_enable;
}

- (void)setFastOpenForceEnable:(BOOL)a3
{
  id v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_fast_open_force_enable(v4, a3);

}

- (int)dataMode
{
  void *v2;
  int data_mode;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  data_mode = nw_protocol_transform_get_data_mode(v2);

  return data_mode;
}

- (void)setDataMode:(int)a3
{
  id v4;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_data_mode(v4, a3);

}

- (BOOL)disablePathFallback
{
  void *v2;
  BOOL no_path_fallback;

  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  no_path_fallback = nw_protocol_transform_get_no_path_fallback(v2);

  return no_path_fallback;
}

- (void)setDisablePathFallback:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[NWProtocolTransform internalTransform](self, "internalTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  nw_protocol_transform_set_no_path_fallback(v4, v3);

}

- (OS_nw_protocol_transform)internalTransform
{
  return (OS_nw_protocol_transform *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalTransform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTransform, 0);
}

@end
