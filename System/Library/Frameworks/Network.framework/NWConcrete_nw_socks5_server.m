@implementation NWConcrete_nw_socks5_server

- (NSString)description
{
  const char *v2;
  __CFString *v3;
  void *v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  const char *v8;
  char *backtrace_string;
  _BOOL4 v10;
  char v12;
  os_log_type_t type;
  _BYTE cStr[12];
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    __nwlog_obj();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)cStr = 136446210;
    *(_QWORD *)&cStr[4] = "nw_socks5_server_copy_description";
    v5 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v12 = 0;
    if (!__nwlog_fault(v5, &type, &v12))
      goto LABEL_22;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(_QWORD *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server";
LABEL_20:
        _os_log_impl(&dword_182FBE000, v6, v7, v8, cStr, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = type;
        v10 = os_log_type_enabled(v6, type);
        if (backtrace_string)
        {
          if (v10)
          {
            *(_DWORD *)cStr = 136446466;
            *(_QWORD *)&cStr[4] = "nw_socks5_server_copy_description";
            v15 = 2082;
            v16 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v6, v7, "%{public}s called with null server, dumping backtrace:%{public}s", cStr, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v10)
          goto LABEL_21;
        *(_DWORD *)cStr = 136446210;
        *(_QWORD *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server, no backtrace";
        goto LABEL_20;
      }
      __nwlog_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = type;
      if (os_log_type_enabled(v6, type))
      {
        *(_DWORD *)cStr = 136446210;
        *(_QWORD *)&cStr[4] = "nw_socks5_server_copy_description";
        v8 = "%{public}s called with null server, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:

LABEL_22:
    if (v5)
      free(v5);
    goto LABEL_24;
  }
  *(_QWORD *)cStr = 0;
  if ((*((_BYTE *)self + 136) & 1) != 0)
    v2 = "SHOES";
  else
    v2 = "SOCKS";
  asprintf((char **)cStr, "[SP%llu %s]", self->ss_id, v2);
  if (!*(_QWORD *)cStr)
  {
LABEL_24:
    v3 = 0;
    return (NSString *)v3;
  }
  v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const char **)cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v3;
}

- (void)dealloc
{
  NSObject *v3;
  IOPMAssertionID ss_assertion;
  NSObject *v5;
  unsigned int v6;
  unint64_t ss_assertion_toggle_mach_time;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  char *backtrace_string;
  os_log_type_t v17;
  _BOOL4 v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  int v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NWConcrete_nw_socks5_server *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    v28 = 2114;
    v29 = self;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_INFO, "%{public}s %{public}@", buf, 0x16u);
  }

  ss_assertion = self->ss_assertion;
  if (ss_assertion)
  {
    IOPMAssertionRelease(ss_assertion);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->ss_assertion;
      ss_assertion_toggle_mach_time = self->ss_assertion_toggle_mach_time;
      v8 = mach_continuous_time();
      if (v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      v10 = nw_delta_nanos(ss_assertion_toggle_mach_time, v9);
      v27 = "-[NWConcrete_nw_socks5_server dealloc]";
      v28 = 2112;
      *(_DWORD *)buf = 136446978;
      v29 = self;
      v30 = 1024;
      v31 = v6;
      v32 = 2048;
      v33 = v10 / 0x3B9ACA00;
      _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %@ released power assertion: %u after %llus", buf, 0x26u);
    }

    self->ss_assertion = 0;
  }
  if (self->ss_internally_retained_object)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWConcrete_nw_socks5_server dealloc]";
    v22 = 12;
    v21 = buf;
    v12 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (__nwlog_fault(v12, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        v14 = type;
        if (!os_log_type_enabled(v13, type))
          goto LABEL_27;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating";
LABEL_25:
        v19 = v13;
        v20 = v14;
        goto LABEL_26;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v13 = (id)gLogObj;
        v14 = type;
        if (!os_log_type_enabled(v13, type))
          goto LABEL_27;
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, "
              "backtrace limit exceeded";
        goto LABEL_25;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      v17 = type;
      v18 = os_log_type_enabled(v13, type);
      if (!backtrace_string)
      {
        if (!v18)
        {
LABEL_27:

          if (!v12)
            goto LABEL_22;
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v15 = "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, no backtrace";
        v19 = v13;
        v20 = v17;
LABEL_26:
        _os_log_impl(&dword_182FBE000, v19, v20, v15, buf, 0xCu);
        goto LABEL_27;
      }
      if (v18)
      {
        *(_DWORD *)buf = 136446466;
        v27 = "-[NWConcrete_nw_socks5_server dealloc]";
        v28 = 2082;
        v29 = (NWConcrete_nw_socks5_server *)backtrace_string;
        _os_log_impl(&dword_182FBE000, v13, v17, "%{public}s over-release of nw_socks5_server. Object should not be internally retained while deallocating, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (v12)
LABEL_21:
      free(v12);
  }
LABEL_22:
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_socks5_server;
  -[NWConcrete_nw_socks5_server dealloc](&v23, sel_dealloc, v21, v22);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ss_assertion_timer, 0);
  objc_storeStrong(&self->outer_connection_handler, 0);
  objc_storeStrong((id *)&self->ss_socks5_udp_associate_connections, 0);
  objc_storeStrong((id *)&self->ss_socks5_connections, 0);
  objc_storeStrong((id *)&self->ss_listener, 0);
  objc_storeStrong(&self->ss_error, 0);
  objc_storeStrong(&self->ss_state_handler, 0);
  objc_storeStrong((id *)&self->ss_client_queue, 0);
  objc_storeStrong((id *)&self->ss_parameters, 0);
  objc_storeStrong((id *)&self->ss_queue, 0);
  objc_storeStrong((id *)&self->ss_internally_retained_object, 0);
}

- (id)initWithParameters:(void *)a3 clientQueue:
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  nw_parameters_t v13;
  NSObject *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  _QWORD *v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  _QWORD *v22;
  int v23;
  NSObject *v24;
  Class isa;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  NSObject *v29;
  _QWORD *v30;
  BOOL v31;
  NSObject *v32;
  nw_listener_t v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  id v37;
  id v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  id v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  char *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  char *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  id v52;
  os_log_type_t v53;
  id v54;
  os_log_type_t v55;
  os_log_type_t v56;
  os_log_type_t v57;
  _BOOL4 v58;
  os_log_type_t v59;
  _BOOL4 v60;
  os_log_type_t v61;
  os_log_type_t v62;
  os_log_type_t v63;
  void *v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  char *backtrace_string;
  os_log_type_t v70;
  _BOOL4 v71;
  os_log_type_t v72;
  char v73;
  os_log_type_t type;
  objc_super v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  char *v79;
  char label[40];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
LABEL_116:
    v37 = 0;
    goto LABEL_97;
  }
  v75.receiver = a1;
  v75.super_class = (Class)NWConcrete_nw_socks5_server;
  v7 = objc_msgSendSuper2(&v75, sel_init);
  v8 = v7;
  if (!v7)
  {
    __nwlog_obj();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)label = 136446210;
    *(_QWORD *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
    v66 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    type = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v66, buf, &type))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = buf[0];
        if (os_log_type_enabled(v67, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(_QWORD *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v67, v68, "%{public}s [super init] failed", (uint8_t *)label, 0xCu);
        }
      }
      else if (type)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v67 = objc_claimAutoreleasedReturnValue();
        v70 = buf[0];
        v71 = os_log_type_enabled(v67, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v71)
          {
            *(_DWORD *)label = 136446466;
            *(_QWORD *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            *(_WORD *)&label[12] = 2082;
            *(_QWORD *)&label[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v67, v70, "%{public}s [super init] failed, dumping backtrace:%{public}s", (uint8_t *)label, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_114;
        }
        if (v71)
        {
          *(_DWORD *)label = 136446210;
          *(_QWORD *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v67, v70, "%{public}s [super init] failed, no backtrace", (uint8_t *)label, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v67 = objc_claimAutoreleasedReturnValue();
        v72 = buf[0];
        if (os_log_type_enabled(v67, (os_log_type_t)buf[0]))
        {
          *(_DWORD *)label = 136446210;
          *(_QWORD *)&label[4] = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v67, v72, "%{public}s [super init] failed, backtrace limit exceeded", (uint8_t *)label, 0xCu);
        }
      }

    }
LABEL_114:
    if (v66)
      free(v66);
    goto LABEL_116;
  }
  do
    v9 = __ldaxr(&s_last_server_id);
  while (__stlxr(v9 + 1, &s_last_server_id));
  v7[1] = v9;
  *((_DWORD *)v7 + 6) = 0;
  strcpy(label, "com.apple.networking.nw_socks5_server");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(label, v10);
  v12 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v11;

  if (*((_QWORD *)v8 + 4))
  {
    v13 = nw_parameters_create();
    v14 = v13;
    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v42 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
      v43 = (char *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v73 = 0;
      if (!__nwlog_fault(v43, &type, &v73))
        goto LABEL_92;
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v44 = (id)gLogObj;
        v45 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v44, v45, "%{public}s nw_parameters_create failed", buf, 0xCu);
        }
        goto LABEL_91;
      }
      if (!v73)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v44 = (id)gLogObj;
        v61 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v44, v61, "%{public}s nw_parameters_create failed, backtrace limit exceeded", buf, 0xCu);
        }
        goto LABEL_91;
      }
      v49 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v44 = (id)gLogObj;
      v50 = type;
      v51 = os_log_type_enabled(v44, type);
      if (!v49)
      {
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          _os_log_impl(&dword_182FBE000, v44, v50, "%{public}s nw_parameters_create failed, no backtrace", buf, 0xCu);
        }
        goto LABEL_91;
      }
      if (v51)
      {
        *(_DWORD *)buf = 136446466;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        v78 = 2082;
        v79 = v49;
        _os_log_impl(&dword_182FBE000, v44, v50, "%{public}s nw_parameters_create failed, dumping backtrace:%{public}s", buf, 0x16u);
      }
      goto LABEL_66;
    }
    nw_parameters_set_data_mode(v13, 2u);
    nw_parameters_set_tfo(v14, 1);
    nw_parameters_set_fast_open_force_enable(v14, 1);
    if (v5)
    {
      v15 = v5;
      v16 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v15, 0, 0);

      v17 = (void *)*((_QWORD *)v8 + 5);
      *((_QWORD *)v8 + 5) = v16;

      if (!*((_QWORD *)v8 + 5))
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v54 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        v43 = (char *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v73 = 0;
        if (!__nwlog_fault(v43, &type, &v73))
          goto LABEL_92;
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v44 = (id)gLogObj;
          v55 = type;
          if (os_log_type_enabled(v44, type))
          {
            *(_DWORD *)buf = 136446210;
            v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_182FBE000, v44, v55, "%{public}s nw_parameters_copy failed", buf, 0xCu);
          }
          goto LABEL_91;
        }
        if (!v73)
        {
          __nwlog_obj();
          v44 = objc_claimAutoreleasedReturnValue();
          v63 = type;
          if (os_log_type_enabled(v44, type))
          {
            *(_DWORD *)buf = 136446210;
            v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_182FBE000, v44, v63, "%{public}s nw_parameters_copy failed, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_91;
        }
        v49 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v44 = (id)gLogObj;
        v59 = type;
        v60 = os_log_type_enabled(v44, type);
        if (!v49)
        {
          if (v60)
          {
            *(_DWORD *)buf = 136446210;
            v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
            _os_log_impl(&dword_182FBE000, v44, v59, "%{public}s nw_parameters_copy failed, no backtrace", buf, 0xCu);
          }
          goto LABEL_91;
        }
        if (v60)
        {
          *(_DWORD *)buf = 136446466;
          v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          v78 = 2082;
          v79 = v49;
          _os_log_impl(&dword_182FBE000, v44, v59, "%{public}s nw_parameters_copy failed, dumping backtrace:%{public}s", buf, 0x16u);
        }
        goto LABEL_66;
      }
      v18 = v15;
      v19 = *(id *)(v18[13] + 160);

      if (v19)
        nw_parameters_set_local_endpoint(v14, v19);
      v20 = v18;
      v21 = *(id *)(v18[13] + 168);

      if (v21)
        nw_parameters_require_interface(v14, v21);
      v22 = v20;
      v23 = *(_DWORD *)(v18[13] + 80);

      if (v23)
      {
        v24 = v14;
        isa = v24[13].isa;
        v26 = 96;
        if ((*((_WORD *)isa + 50) & 0x100) == 0)
          v26 = 80;
        *(_DWORD *)((char *)isa + v26) = v23;

      }
      v27 = v22;
      v28 = (v27[12] & 0x8000000) == 0;

      if (!v28)
      {
        v29 = v14;
        v29[12].isa = (Class)((unint64_t)v29[12].isa | 0x8000000);

      }
      v30 = v27;
      v31 = (*(_WORD *)(v18[13] + 108) & 8) == 0;

      if (!v31)
      {
        v32 = v14;
        *((_WORD *)v32[13].isa + 54) |= 8u;

      }
    }
    v33 = nw_listener_create(v14);
    v34 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v33;

    if (*((_QWORD *)v8 + 9))
    {
      objc_storeStrong((id *)v8 + 6, a3);
      v35 = nw_array_create();
      v36 = (void *)*((_QWORD *)v8 + 10);
      *((_QWORD *)v8 + 10) = v35;

      v37 = v8;
LABEL_95:

      goto LABEL_96;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v52 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
    v43 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v73 = 0;
    if (!__nwlog_fault(v43, &type, &v73))
    {
LABEL_92:
      if (!v43)
      {
LABEL_94:
        v37 = 0;
        goto LABEL_95;
      }
LABEL_93:
      free(v43);
      goto LABEL_94;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v44 = (id)gLogObj;
      v53 = type;
      if (os_log_type_enabled(v44, type))
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v44, v53, "%{public}s nw_listener_create failed", buf, 0xCu);
      }
LABEL_91:

      goto LABEL_92;
    }
    if (!v73)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v44 = (id)gLogObj;
      v62 = type;
      if (os_log_type_enabled(v44, type))
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v44, v62, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_91;
    }
    v49 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v44 = (id)gLogObj;
    v57 = type;
    v58 = os_log_type_enabled(v44, type);
    if (!v49)
    {
      if (v58)
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v44, v57, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_91;
    }
    if (v58)
    {
      *(_DWORD *)buf = 136446466;
      v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
      v78 = 2082;
      v79 = v49;
      _os_log_impl(&dword_182FBE000, v44, v57, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_66:

    free(v49);
    if (!v43)
      goto LABEL_94;
    goto LABEL_93;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v38 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
  v39 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v73 = 0;
  if (__nwlog_fault(v39, &type, &v73))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v40 = (id)gLogObj;
      v41 = type;
      if (os_log_type_enabled(v40, type))
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v40, v41, "%{public}s dispatch_queue_create failed", buf, 0xCu);
      }
    }
    else if (v73)
    {
      v46 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v40 = (id)gLogObj;
      v47 = type;
      v48 = os_log_type_enabled(v40, type);
      if (v46)
      {
        if (v48)
        {
          *(_DWORD *)buf = 136446466;
          v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
          v78 = 2082;
          v79 = v46;
          _os_log_impl(&dword_182FBE000, v40, v47, "%{public}s dispatch_queue_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v46);
        if (!v39)
          goto LABEL_73;
        goto LABEL_72;
      }
      if (v48)
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v40, v47, "%{public}s dispatch_queue_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v40 = (id)gLogObj;
      v56 = type;
      if (os_log_type_enabled(v40, type))
      {
        *(_DWORD *)buf = 136446210;
        v77 = "-[NWConcrete_nw_socks5_server initWithParameters:clientQueue:]";
        _os_log_impl(&dword_182FBE000, v40, v56, "%{public}s dispatch_queue_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v39)
LABEL_72:
    free(v39);
LABEL_73:
  v37 = 0;
LABEL_96:

LABEL_97:
  return v37;
}

@end
