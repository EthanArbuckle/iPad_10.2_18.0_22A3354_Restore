@implementation BRCAccountOnlinePerformer

- (id)_key
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, self->_dsid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)addPerformer:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if (!g_performers)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v7 = (void *)g_performers;
    g_performers = v6;

  }
  objc_msgSend(v4, "_key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)g_performers, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend((id)g_performers, "setObject:forKey:", v4, v8);

  objc_sync_exit(v5);
  return v9 == 0;
}

+ (void)removePerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)g_performers;
  objc_msgSend(v7, "_key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (BRCAccountOnlinePerformer)initWithDSID:(id)a3
{
  id v5;
  BRCAccountOnlinePerformer *v6;
  BRCAccountOnlinePerformer *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCAccountOnlinePerformer;
  v6 = -[BRCAccountOnlinePerformer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dsid, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.bird.account-migrator", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (a3)
  {
    -[BRCThrottler reset](self->_throttler, "reset");
    -[BRCThrottler scheduleNextEvent](self->_throttler, "scheduleNextEvent");
  }
}

- (void)resumeAndAutoClose
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] performer already registered for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

uint64_t __47__BRCAccountOnlinePerformer_resumeAndAutoClose__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "perform");
}

- (void)perform
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_fault_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: implemented by subclass%@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_close
{
  void *v3;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeReachabilityObserver:", self);

  -[BRCThrottler cancel](self->_throttler, "cancel");
  objc_msgSend((id)objc_opt_class(), "removePerformer:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
