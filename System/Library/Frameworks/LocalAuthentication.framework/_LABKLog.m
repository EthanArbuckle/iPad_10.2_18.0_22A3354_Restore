@implementation _LABKLog

+ (OS_os_log)log
{
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, &__block_literal_global_13);
  return (OS_os_log *)(id)log_log_0;
}

+ (void)logClass:(Class)a3 selector:(SEL)a4 message:(id)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v21);

  objc_msgSend(a1, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1B971E000, v11, OS_LOG_TYPE_INFO, "%@:%@: %@", buf, 0x20u);

  }
}

@end
