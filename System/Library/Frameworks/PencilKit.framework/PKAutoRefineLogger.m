@implementation PKAutoRefineLogger

- (PKAutoRefineLogger)init
{
  PKAutoRefineLogger *v2;
  uint64_t v3;
  NSMutableArray *entryLog;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAutoRefineLogger;
  v2 = -[PKAutoRefineLogger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    entryLog = v2->_entryLog;
    v2->_entryLog = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addLogEntry:(void *)a1
{
  id v3;
  SEL v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_msgSend(objc_getProperty(v3, v4, 8, 1), "addObject:", v5);
    objc_sync_exit(v3);

  }
}

- (void)clearAllEntries
{
  SEL v1;
  id self;

  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    objc_msgSend(objc_getProperty(self, v1, 8, 1), "removeAllObjects");
    objc_sync_exit(self);

  }
}

- (id)entries
{
  id v1;
  SEL v2;
  id v3;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v3 = objc_getProperty(v1, v2, 8, 1);
    objc_sync_exit(v1);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)sharedAutoRefineLogger
{
  objc_opt_self();
  if (_MergedGlobals_145 != -1)
    dispatch_once(&_MergedGlobals_145, &__block_literal_global_63);
  return (id)qword_1ECEE6398;
}

void __44__PKAutoRefineLogger_sharedAutoRefineLogger__block_invoke()
{
  PKAutoRefineLogger *v0;
  void *v1;

  if (os_variant_has_internal_diagnostics())
  {
    v0 = objc_alloc_init(PKAutoRefineLogger);
    v1 = (void *)qword_1ECEE6398;
    qword_1ECEE6398 = (uint64_t)v0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryLog, 0);
}

@end
