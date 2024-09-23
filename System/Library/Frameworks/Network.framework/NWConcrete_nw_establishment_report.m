@implementation NWConcrete_nw_establishment_report

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resolution_reports, 0);
  objc_storeStrong((id *)&self->protocol_reports, 0);
  objc_storeStrong((id *)&self->proxied_next_hop_endpoints, 0);
  objc_storeStrong((id *)&self->proxy_endpoints, 0);
}

- (NWConcrete_nw_establishment_report)init
{
  NWConcrete_nw_establishment_report *v2;
  NWConcrete_nw_establishment_report *v3;
  NWConcrete_nw_establishment_report *v4;
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
  v16.super_class = (Class)NWConcrete_nw_establishment_report;
  v2 = -[NWConcrete_nw_establishment_report init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
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
          v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
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
        v18 = "-[NWConcrete_nw_establishment_report init]";
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
  v2.super_class = (Class)NWConcrete_nw_establishment_report;
  -[NWConcrete_nw_establishment_report dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  __CFString *Mutable;
  uint64_t duration_milliseconds;
  uint64_t attempt_started_after_milliseconds;
  uint64_t previous_attempt_count;
  uint64_t v7;
  const char *v8;
  const char *v9;
  unsigned int v10;
  const char *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[5];
  _QWORD enumerate_block[5];

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  duration_milliseconds = nw_establishment_report_get_duration_milliseconds(&self->super);
  attempt_started_after_milliseconds = nw_establishment_report_get_attempt_started_after_milliseconds(&self->super);
  previous_attempt_count = nw_establishment_report_get_previous_attempt_count(&self->super);
  CFStringAppendFormat(Mutable, 0, CFSTR("Establishment Report:\n\tDuration: %llums\n\tAttempt Started After: %llums\n\tPrevious Attempts: %u\n"), duration_milliseconds, attempt_started_after_milliseconds, previous_attempt_count);
  v7 = MEMORY[0x1E0C809B0];
  enumerate_block[0] = MEMORY[0x1E0C809B0];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke;
  enumerate_block[3] = &__block_descriptor_40_e51_B32__0__NSObject_OS_nw_protocol_definition__8Q16Q24l;
  enumerate_block[4] = Mutable;
  nw_establishment_report_enumerate_protocols(&self->super, enumerate_block);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_2;
  v18[3] = &__block_descriptor_40_e41_B16__0__NWConcrete_nw_resolution_report_8l;
  v18[4] = Mutable;
  nw_establishment_report_enumerate_resolution_reports(&self->super, v18);
  if (nw_establishment_report_get_proxy_configured(&self->super))
    v8 = "";
  else
    v8 = "not ";
  if (nw_establishment_report_get_used_proxy(&self->super))
    v9 = "";
  else
    v9 = "not ";
  CFStringAppendFormat(Mutable, 0, CFSTR("\tProxy %sconfigured, %sused, to "), v8, v9);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __49__NWConcrete_nw_establishment_report_description__block_invoke_3;
  v13[3] = &unk_1E149B348;
  v13[4] = &v14;
  v13[5] = Mutable;
  nw_establishment_report_enumerate_proxy_endpoints(self, v13);
  if (!*((_BYTE *)v15 + 24))
    CFStringAppendFormat(Mutable, 0, CFSTR("unknown"));
  v10 = self->privacy_stance - 1;
  if (v10 > 4)
    v11 = "Unknown";
  else
    v11 = off_1E149B4A0[v10];
  CFStringAppendFormat(Mutable, 0, CFSTR("\n\tPrivacy stance: %s"), v11);
  _Block_object_dispose(&v14, 8);
  return (NSString *)Mutable;
}

@end
