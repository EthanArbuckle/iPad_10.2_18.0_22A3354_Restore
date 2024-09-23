@implementation NWConcrete_nw_path_parameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->local_address, 0);
  objc_storeStrong((id *)&self->internet_options, 0);
  objc_storeStrong((id *)&self->transport_options, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->attributed_bundle, 0);
}

- (NWConcrete_nw_path_parameters)init
{
  NWConcrete_nw_path_parameters *v2;
  NWConcrete_nw_path_parameters *v3;
  NWConcrete_nw_path_parameters *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_path_parameters;
  v2 = -[NWConcrete_nw_path_parameters init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_parameters init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path_parameters init]";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (void)dealloc
{
  void *v3;
  char *account_id;
  char *attribution_context;
  OS_nw_interface *required_interface;
  void *v7;
  OS_nw_interface *v8;
  void *v9;
  OS_nw_interface *v10;
  void *v11;
  OS_nw_interface *v12;
  void *v13;
  OS_nw_interface *v14;
  void *v15;
  OS_nw_interface *v16;
  void *v17;
  OS_nw_interface *v18;
  void *v19;
  OS_nw_interface *v20;
  void *v21;
  OS_nw_interface *v22;
  void *v23;
  OS_nw_interface *v24;
  void *v25;
  OS_nw_interface *v26;
  void *v27;
  OS_nw_interface *v28;
  void *v29;
  OS_nw_interface *v30;
  void *v31;
  OS_nw_interface *v32;
  void *v33;
  OS_nw_interface *v34;
  void *v35;
  OS_nw_interface *v36;
  void *v37;
  OS_nw_interface *v38;
  void *v39;
  OS_nw_interface *v40;
  void *v41;
  OS_nw_interface *v42;
  objc_super v43;

  v3 = *(void **)&self->joinable_path_value.fallback_mode;
  if (v3)
  {
    free(v3);
    *(_QWORD *)&self->joinable_path_value.fallback_mode = 0;
  }
  account_id = self->account_id;
  if (account_id)
  {
    free(account_id);
    self->account_id = 0;
  }
  attribution_context = self->attribution_context;
  if (attribution_context)
  {
    free(attribution_context);
    self->attribution_context = 0;
  }
  required_interface = self->required_interface;
  if (required_interface)
  {
    v7 = *(void **)required_interface;
    *(_QWORD *)required_interface = 0;

    v8 = self->required_interface;
    v9 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = 0;

    v10 = self->required_interface;
    v11 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = 0;

    v12 = self->required_interface;
    v13 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = 0;

    v14 = self->required_interface;
    v15 = (void *)*((_QWORD *)v14 + 4);
    *((_QWORD *)v14 + 4) = 0;

    v16 = self->required_interface;
    v17 = (void *)*((_QWORD *)v16 + 5);
    *((_QWORD *)v16 + 5) = 0;

    v18 = self->required_interface;
    v19 = (void *)*((_QWORD *)v18 + 6);
    *((_QWORD *)v18 + 6) = 0;

    v20 = self->required_interface;
    v21 = (void *)*((_QWORD *)v20 + 7);
    *((_QWORD *)v20 + 7) = 0;

    v22 = self->required_interface;
    v23 = (void *)*((_QWORD *)v22 + 8);
    *((_QWORD *)v22 + 8) = 0;

    v24 = self->required_interface;
    v25 = (void *)*((_QWORD *)v24 + 9);
    *((_QWORD *)v24 + 9) = 0;

    v26 = self->required_interface;
    v27 = (void *)*((_QWORD *)v26 + 10);
    *((_QWORD *)v26 + 10) = 0;

    v28 = self->required_interface;
    v29 = (void *)*((_QWORD *)v28 + 11);
    *((_QWORD *)v28 + 11) = 0;

    v30 = self->required_interface;
    v31 = (void *)*((_QWORD *)v30 + 12);
    *((_QWORD *)v30 + 12) = 0;

    v32 = self->required_interface;
    v33 = (void *)*((_QWORD *)v32 + 13);
    *((_QWORD *)v32 + 13) = 0;

    v34 = self->required_interface;
    v35 = (void *)*((_QWORD *)v34 + 14);
    *((_QWORD *)v34 + 14) = 0;

    v36 = self->required_interface;
    v37 = (void *)*((_QWORD *)v36 + 15);
    *((_QWORD *)v36 + 15) = 0;

    v38 = self->required_interface;
    v39 = (void *)*((_QWORD *)v38 + 16);
    *((_QWORD *)v38 + 16) = 0;

    v40 = self->required_interface;
    v41 = (void *)*((_QWORD *)v40 + 17);
    *((_QWORD *)v40 + 17) = 0;

    v42 = self->required_interface;
    if (v42)
    {
      free(v42);
      self->required_interface = 0;
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)NWConcrete_nw_path_parameters;
  -[NWConcrete_nw_path_parameters dealloc](&v43, sel_dealloc);
}

@end
