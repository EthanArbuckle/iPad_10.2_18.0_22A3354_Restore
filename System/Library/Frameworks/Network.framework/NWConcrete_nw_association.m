@implementation NWConcrete_nw_association

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->previous_path, 0);
  objc_storeStrong((id *)&self->evaluator, 0);
  objc_storeStrong((id *)&self->path_parameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *deactivation_timer;
  nw_hash_table *handles;
  nw_hash_table *connected_flow_handles;
  nw_hash_table *cache_entries;
  id v9;
  id v10;
  _BYTE *v11;
  int v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  _BYTE *v16;
  _BYTE v17[24];
  nw_hash_table *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 76) & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    *(_DWORD *)v17 = 136446466;
    *(_QWORD *)&v17[4] = "-[NWConcrete_nw_association dealloc]";
    *(_WORD *)&v17[12] = 2114;
    *(_QWORD *)&v17[14] = self;
    v12 = 22;
    v11 = v17;
    v4 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v4))
    {
      __break(1u);
      return;
    }
    free(v4);
  }
  deactivation_timer = self->deactivation_timer;
  if (deactivation_timer)
  {
    nw_queue_cancel_source((uint64_t)deactivation_timer, (uint64_t)a2);
    self->deactivation_timer = 0;
  }
  handles = self->handles;
  if (handles)
  {
    _nw_hash_table_release((os_unfair_lock_s *)handles, (uint64_t)a2);
    self->handles = 0;
  }
  connected_flow_handles = self->connected_flow_handles;
  if (connected_flow_handles)
  {
    _nw_hash_table_release((os_unfair_lock_s *)connected_flow_handles, (uint64_t)a2);
    self->connected_flow_handles = 0;
  }
  cache_entries = self->cache_entries;
  if (cache_entries)
  {
    *(_QWORD *)v17 = 0;
    *(_QWORD *)&v17[8] = v17;
    *(_QWORD *)&v17[16] = 0x2020000000;
    v18 = cache_entries;
    self->cache_entries = 0;
    v9 = nw_path_parameters_copy_context(self->path_parameters);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__NWConcrete_nw_association_dealloc__block_invoke;
    v14[3] = &unk_1E14ACE40;
    v15 = v9;
    v16 = v17;
    v10 = v9;
    nw_queue_context_async_if_needed(v10, v14);

    _Block_object_dispose(v17, 8);
  }
  v13.receiver = self;
  v13.super_class = (Class)NWConcrete_nw_association;
  -[NWConcrete_nw_association dealloc](&v13, sel_dealloc, v11, v12);
}

- (id)redactedDescription
{
  const __CFAllocator *v2;
  const char *logging_description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  logging_description = nw_endpoint_get_logging_description(self->endpoint);
  return (id)(id)CFStringCreateWithFormat(v2, 0, CFSTR("<nw_association %s>"), logging_description);
}

- (NSString)description
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = nw_endpoint_get_description(self->endpoint);
  return (NSString *)(id)CFStringCreateWithFormat(v2, 0, CFSTR("<nw_association %s>"), description);
}

@end
