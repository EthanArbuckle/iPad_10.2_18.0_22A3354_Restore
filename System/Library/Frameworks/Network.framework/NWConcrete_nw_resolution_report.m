@implementation NWConcrete_nw_resolution_report

- (void)dealloc
{
  char *provider_name;
  char *extended_dns_error_extra_text;
  objc_super v5;

  provider_name = self->provider_name;
  if (provider_name)
  {
    free(provider_name);
    self->provider_name = 0;
  }
  extended_dns_error_extra_text = self->extended_dns_error_extra_text;
  if (extended_dns_error_extra_text)
  {
    free(extended_dns_error_extra_text);
    self->extended_dns_error_extra_text = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_resolution_report;
  -[NWConcrete_nw_resolution_report dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resolved_endpoints, 0);
  objc_storeStrong((id *)&self->preferred_endpoint, 0);
  objc_storeStrong((id *)&self->successful_endpoint, 0);
}

- (NWConcrete_nw_resolution_report)init
{
  NWConcrete_nw_resolution_report *v2;
  NWConcrete_nw_resolution_report *v3;
  NWConcrete_nw_resolution_report *v4;
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
  v16.super_class = (Class)NWConcrete_nw_resolution_report;
  v2 = -[NWConcrete_nw_resolution_report init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
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
          v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
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
        v18 = "-[NWConcrete_nw_resolution_report init]";
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

- (NSString)description
{
  __CFString *Mutable;
  __CFString *v4;
  uint64_t protocol;
  const char *v6;
  unsigned int v7;
  const char *v8;
  const char *v9;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v4 = Mutable;
  protocol = self->protocol;
  if (protocol > 4)
    v6 = "invalid";
  else
    v6 = off_1E149B3B8[protocol];
  v7 = self->source - 1;
  if (v7 > 2)
    v8 = "invalid";
  else
    v8 = off_1E149B3E0[v7];
  CFStringAppendFormat(Mutable, 0, CFSTR("Resolved %u endpoints in %llums using %s from %s"), self->endpoint_count, self->milliseconds, v6, v8);
  if (self->provider_name)
    CFStringAppendFormat(v4, 0, CFSTR(", provider %s"), self->provider_name);
  if (self->successful_endpoint)
    CFStringAppendFormat(v4, 0, CFSTR(", chose %@"), self->successful_endpoint);
  if (self->preferred_endpoint)
    CFStringAppendFormat(v4, 0, CFSTR(", preferred %@"), self->preferred_endpoint);
  if ((*((_BYTE *)self + 70) & 1) != 0)
    CFStringAppendFormat(v4, 0, CFSTR(", received SVCB"));
  if (self->extended_dns_error_code)
  {
    CFStringAppendFormat(v4, 0, CFSTR(", Extended DNS Error %u"), self->extended_dns_error_code);
    v9 = "Blocked";
    switch(self->extended_dns_error_code)
    {
      case 4u:
      case 0xFu:
        goto LABEL_19;
      case 0x10u:
        v9 = "Censored";
        goto LABEL_19;
      case 0x11u:
        v9 = "Filtered";
LABEL_19:
        CFStringAppendFormat(v4, 0, CFSTR(" (%s)"), v9);
        break;
      default:
        return (NSString *)v4;
    }
  }
  return (NSString *)v4;
}

@end
