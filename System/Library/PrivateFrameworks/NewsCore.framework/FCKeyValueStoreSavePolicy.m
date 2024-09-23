@implementation FCKeyValueStoreSavePolicy

+ (id)throttlePolicyWithDelay:(double)a3
{
  return -[FCKeyValueStoreSavePolicyThrottle initWithDelay:]([FCKeyValueStoreSavePolicyThrottle alloc], "initWithDelay:", a3);
}

+ (id)defaultPolicy
{
  return (id)objc_msgSend(a1, "throttlePolicyWithDelay:", 5.0);
}

+ (id)appBackgroundPolicyWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4
{
  id v5;
  id v6;
  FCKeyValueStoreSavePolicyAppBackground *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FCKeyValueStoreSavePolicyAppBackground initWithActivityMonitor:backgroundTaskable:]([FCKeyValueStoreSavePolicyAppBackground alloc], "initWithActivityMonitor:backgroundTaskable:", v6, v5);

  return v7;
}

+ (id)unthrottledPolicy
{
  return (id)objc_msgSend(a1, "throttlePolicyWithDelay:", 0.0);
}

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCKeyValueStoreSavePolicy scheduleSaveOnQueue:handler:]";
    v14 = 2080;
    v15 = "FCKeyValueStoreSavePolicy.m";
    v16 = 1024;
    v17 = 47;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCKeyValueStoreSavePolicy scheduleSaveOnQueue:handler:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

@end
