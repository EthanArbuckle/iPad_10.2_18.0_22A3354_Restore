@implementation NWConcrete_nw_protocol_data_array

- (NWConcrete_nw_protocol_data_array)init
{
  NWConcrete_nw_protocol_data_array *v2;
  NWConcrete_nw_protocol_data_array *v3;
  NWConcrete_nw_protocol_data_array *v4;
  NWConcrete_nw_protocol_data_array *v5;
  void *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  char *backtrace_string;
  os_log_type_t v12;
  _BOOL4 v13;
  os_log_type_t v14;
  char v15;
  os_log_type_t type;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NWConcrete_nw_protocol_data_array;
  v2 = -[NWConcrete_nw_protocol_data_array init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    v4->frame_array.tqh_first = 0;
    v4->frame_array.tqh_last = &v4->frame_array.tqh_first;
    v4->frame_count = 0;

    v5 = v4;
    goto LABEL_3;
  }
  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v19 = "-[NWConcrete_nw_protocol_data_array init]";
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v15 = 0;
  if (__nwlog_fault(v8, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v15)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      v13 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136446466;
          v19 = "-[NWConcrete_nw_protocol_data_array init]";
          v20 = 2082;
          v21 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[NWConcrete_nw_protocol_data_array init]";
        _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v8)
    free(v8);
LABEL_3:

  return v3;
}

- (void)dealloc
{
  nw_frame *tqh_first;
  nw_frame *v4;
  char v5;
  objc_super v6;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  NWConcrete_nw_protocol_data_array *v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __44__NWConcrete_nw_protocol_data_array_dealloc__block_invoke;
  v9 = &unk_1E14AB5A0;
  v10 = self;
  tqh_first = self->frame_array.tqh_first;
  do
  {
    if (!tqh_first)
      break;
    v4 = (nw_frame *)*((_QWORD *)tqh_first + 4);
    v5 = ((uint64_t (*)(_QWORD *))v8)(v7);
    tqh_first = v4;
  }
  while ((v5 & 1) != 0);
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_protocol_data_array;
  -[NWConcrete_nw_protocol_data_array dealloc](&v6, sel_dealloc);
}

@end
