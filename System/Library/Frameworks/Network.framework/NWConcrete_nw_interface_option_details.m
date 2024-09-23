@implementation NWConcrete_nw_interface_option_details

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->initial_data, 0);
  objc_storeStrong((id *)&self->remote_cid, 0);
  objc_storeStrong((id *)&self->local_cid, 0);
  objc_storeStrong((id *)&self->remote, 0);
  objc_storeStrong((id *)&self->evaluator, 0);
  objc_storeStrong((id *)&self->interface, 0);
}

- (NWConcrete_nw_interface_option_details)init
{
  NWConcrete_nw_interface_option_details *v2;
  NWConcrete_nw_interface_option_details *v3;
  NWConcrete_nw_interface_option_details *v4;
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
  v16.super_class = (Class)NWConcrete_nw_interface_option_details;
  v2 = -[NWConcrete_nw_interface_option_details init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
          v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
        v18 = "-[NWConcrete_nw_interface_option_details init]";
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
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_interface_option_details;
  -[NWConcrete_nw_interface_option_details dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  char out[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(out, 0, 37);
  uuid_unparse(self->nexus_agent, out);
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@ [%s, prio %d, fd %d, evaluator %@]"), self->interface, self->remote, out, self->priority, self->sockfd, self->evaluator);
}

- (id)redactedDescription
{
  NWConcrete_nw_interface *interface;
  void *v4;
  uint64_t priority;
  uint64_t sockfd;
  void *v7;
  void *v8;
  char out[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (nwlog_get_sensitive_redacted::onceToken != -1)
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    memset(out, 0, 37);
    uuid_unparse(self->nexus_agent, out);
    interface = self->interface;
    -[OS_nw_endpoint redactedDescription](self->remote, "redactedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    priority = self->priority;
    sockfd = self->sockfd;
    -[OS_nw_path_evaluator redactedDescription](self->evaluator, "redactedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@:%@ [%s, prio %d, fd %d, evaluator %@]"), interface, v4, out, priority, sockfd, v7);

  }
  else
  {
    -[NWConcrete_nw_interface_option_details description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NWConcrete_nw_interface_option_details *v4;
  NWConcrete_nw_interface_option_details *v5;
  BOOL v6;

  v4 = (NWConcrete_nw_interface_option_details *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = nw_interface_shallow_compare(self->interface, v5->interface)
        && nw_endpoint_is_equal(self->remote, v5->remote, 31)
        && !uuid_compare(self->nexus_agent, v5->nexus_agent)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->local_cid, v5->local_cid)
        && nw_dispatch_data_is_equal((dispatch_data_t)self->remote_cid, v5->remote_cid)
        && self->sockfd == v5->sockfd;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
