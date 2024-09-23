@implementation NWConcrete_nw_storage

- (NWConcrete_nw_storage)init
{
  NWConcrete_nw_storage *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_nw_dictionary *v6;
  OS_nw_dictionary *providers;
  OS_nw_dictionary *v8;
  OS_nw_dictionary *canvas_cache;
  _BOOL8 v10;
  OS_nw_array *flush_queue;
  nw_storage_chain **v12;
  NWConcrete_nw_storage *v13;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  char *backtrace_string;
  _BOOL4 v21;
  char v22;
  os_log_type_t type;
  objc_super v24;
  _BYTE buf[32];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)NWConcrete_nw_storage;
  v2 = -[NWConcrete_nw_storage init](&v24, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.network.storage", v3);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v4;

    v6 = (OS_nw_dictionary *)nw_dictionary_create();
    providers = v2->providers;
    v2->providers = v6;

    v8 = (OS_nw_dictionary *)nw_dictionary_create();
    canvas_cache = v2->canvas_cache;
    v2->canvas_cache = v8;

    v10 = nw_array_create();
    flush_queue = v2->flush_queue;
    v2->flush_queue = (OS_nw_array *)v10;

    v28 = xmmword_1E14A2C30;
    v29 = *(_OWORD *)&off_1E14A2C40;
    v30 = xmmword_1E14A2C50;
    *(_OWORD *)buf = xmmword_1E14A2BF0;
    *(_OWORD *)&buf[16] = *(_OWORD *)&off_1E14A2C00;
    v26 = xmmword_1E14A2C10;
    v27 = *(_OWORD *)&off_1E14A2C20;
    nw_storage_register_provider(v2, "h3_0rtt", (__int128 *)buf);
    v28 = xmmword_1E14A2CA0;
    v29 = *(_OWORD *)&off_1E14A2CB0;
    v30 = xmmword_1E14A2CC0;
    *(_OWORD *)buf = xmmword_1E14A2C60;
    *(_OWORD *)&buf[16] = *(_OWORD *)&off_1E14A2C70;
    v26 = xmmword_1E14A2C80;
    v27 = *(_OWORD *)&off_1E14A2C90;
    nw_storage_register_provider(v2, "dns_cache", (__int128 *)buf);
    if (init_once != -1)
      dispatch_once(&init_once, &__block_literal_global_61);
    os_unfair_lock_lock((os_unfair_lock_t)&storages_lock);
    v2->chain.entry.tqe_next = 0;
    v12 = (nw_storage_chain **)qword_1EDCE2620;
    v2->chain.entry.tqe_prev = (nw_storage_chain **)qword_1EDCE2620;
    *v12 = &v2->chain;
    qword_1EDCE2620 = (uint64_t)&v2->chain;
    os_unfair_lock_unlock((os_unfair_lock_t)&storages_lock);
    v13 = v2;
    goto LABEL_5;
  }
  __nwlog_obj();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  *(_QWORD *)&buf[4] = "-[NWConcrete_nw_storage init]";
  v16 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v22 = 0;
  if (__nwlog_fault(v16, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed";
LABEL_19:
        _os_log_impl(&dword_182FBE000, v17, v18, v19, buf, 0xCu);
      }
    }
    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = type;
        v21 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_storage init]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v17, v18, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (!v21)
          goto LABEL_20;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_19;
      }
      __nwlog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
    }
LABEL_20:

  }
LABEL_21:
  if (v16)
    free(v16);
LABEL_5:

  return v2;
}

- (void)dealloc
{
  nw_storage_chain *tqe_next;
  nw_storage_chain **tqe_prev;
  char *path;
  objc_super v6;

  os_unfair_lock_lock((os_unfair_lock_t)&storages_lock);
  tqe_next = self->chain.entry.tqe_next;
  tqe_prev = self->chain.entry.tqe_prev;
  if (tqe_next)
  {
    tqe_next->entry.tqe_prev = tqe_prev;
    tqe_prev = self->chain.entry.tqe_prev;
  }
  else
  {
    qword_1EDCE2620 = (uint64_t)self->chain.entry.tqe_prev;
  }
  *tqe_prev = tqe_next;
  os_unfair_lock_unlock((os_unfair_lock_t)&storages_lock);
  path = self->path;
  if (path)
  {
    free(path);
    self->path = 0;
  }
  sqlite3_finalize(self->load_stmt);
  sqlite3_finalize(self->save_stmt);
  sqlite3_finalize(self->delete_stmt);
  sqlite3_close(self->db);
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_storage;
  -[NWConcrete_nw_storage dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->flush_queue, 0);
  objc_storeStrong((id *)&self->canvas_cache, 0);
  objc_storeStrong((id *)&self->providers, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
