@implementation NWConcrete_nw_candidate_manager

- (id)init:(id)a3
{
  id v5;
  NWConcrete_nw_candidate_manager *v6;
  _BOOL8 v7;
  OS_nw_array *candidates;
  void *v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  char *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  os_log_type_t v24;
  os_log_type_t v25;
  objc_super v26;
  char v27;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    __nwlog_obj();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_candidate_manager init:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (__nwlog_fault(v11, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s called with null _parameters", buf, 0xCu);
        }
      }
      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v19 = type;
        v20 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_candidate_manager init:]";
            v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v12, v19, "%{public}s called with null _parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_34;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v12, v19, "%{public}s called with null _parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        v24 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v12, v24, "%{public}s called with null _parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_34:
    if (v11)
      free(v11);

    goto LABEL_42;
  }
  v26.receiver = self;
  v26.super_class = (Class)NWConcrete_nw_candidate_manager;
  v6 = -[NWConcrete_nw_candidate_manager init](&v26, sel_init);
  if (!v6)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_candidate_manager init:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v27 = 0;
    if (__nwlog_fault(v15, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v27)
      {
        v21 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v22 = type;
        v23 = os_log_type_enabled(v16, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_candidate_manager init:]";
            v31 = 2082;
            v32 = v21;
            _os_log_impl(&dword_182FBE000, v16, v22, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v21);
          goto LABEL_40;
        }
        if (v23)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v16, v22, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v25 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_182FBE000, v16, v25, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_40:
    if (v15)
      free(v15);
LABEL_42:
    v6 = 0;
    goto LABEL_4;
  }
  v6->log_id = nw_candidate_manager_get_next_id();
  objc_storeStrong((id *)&v6->parameters, a3);
  v7 = nw_array_create();
  candidates = v6->candidates;
  v6->candidates = (OS_nw_array *)v7;

LABEL_4:
  return v6;
}

- (NSString)description
{
  OS_nw_parameters *parameters;
  OS_nw_parameters *v4;
  const char *v5;
  NSObject *service;
  const __CFAllocator *v7;
  unint64_t log_id;
  const char *bonjour_service_name;
  __CFString *v10;
  const char *bonjour_service_type;

  parameters = self->parameters;
  if (parameters)
  {
    v4 = parameters;
    if ((*((_QWORD *)v4 + 12) & 0x8000) != 0)
      v5 = "server ";
    else
      v5 = "client ";

  }
  else
  {
    v5 = "";
  }
  service = self->service;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  log_id = self->log_id;
  if (service)
  {
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(service);
    bonjour_service_type = nw_endpoint_get_bonjour_service_type((nw_endpoint_t)self->service);
    v10 = (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("[CM%zu %s%s.%s]"), log_id, v5, bonjour_service_name, bonjour_service_type);
  }
  else
  {
    v10 = (__CFString *)CFStringCreateWithFormat(v7, 0, CFSTR("[CM%zu %s]"), self->log_id, v5);
  }
  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ids_path_evaluator, 0);
  objc_storeStrong(&self->new_connection_handler, 0);
  objc_storeStrong(&self->state_handler, 0);
  objc_storeStrong((id *)&self->candidates, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong(&self->modify_ids_parameters, 0);
  objc_storeStrong(&self->remove_eligible_details, 0);
  objc_storeStrong(&self->add_eligible_details, 0);
  objc_storeStrong((id *)&self->original_remote_endpoint, 0);
  objc_storeStrong((id *)&self->hostname_resolvers, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->awdl_endpoint, 0);
  objc_storeStrong((id *)&self->awdl_service_resolver, 0);
  objc_storeStrong((id *)&self->service_resolver, 0);
  objc_storeStrong((id *)&self->service, 0);
  objc_storeStrong((id *)&self->ids_candidates, 0);
  objc_storeStrong((id *)&self->ids_resolve_registrations, 0);
  objc_storeStrong((id *)&self->ids_endpoint, 0);
}

@end
