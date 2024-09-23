@implementation CNSimulatedCrashReporter

+ (void)simulateCrashWithMessage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  objc_msgSend(a1, "simulateCrashWithCode:description:", 732802011, v6);
}

+ (void)simulateCrashWithCode:(int64_t)a3 description:(id)a4
{
  id v6;
  void (*v7)(uint64_t, uint64_t, void *);
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;

  v6 = a4;
  if (softLinkSimulateCrashAvailable_onceToken != -1)
    dispatch_once(&softLinkSimulateCrashAvailable_onceToken, &__block_literal_global_8);
  if (softLinkSimulateCrashAvailable_isAvailable)
  {
    v7 = (void (*)(uint64_t, uint64_t, void *))softLinkSimulateCrash;
    v8 = getpid();
    v7(v8, a3, v6);
  }
  else
  {
    objc_msgSend(a1, "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[CNSimulatedCrashReporter simulateCrashWithCode:description:].cold.2(v6, a3, v9);

    objc_msgSend(a1, "os_log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[CNSimulatedCrashReporter simulateCrashWithCode:description:].cold.1(v10);

  }
}

+ (id)os_log
{
  if (os_log_cn_once_token_3 != -1)
    dispatch_once(&os_log_cn_once_token_3, &__block_literal_global_10);
  return (id)os_log_cn_once_object_3;
}

void __34__CNSimulatedCrashReporter_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "crash-reporter");
  v1 = (void *)os_log_cn_once_object_3;
  os_log_cn_once_object_3 = (uint64_t)v0;

}

+ (void)simulateCrashWithCode:(NSObject *)a1 description:.cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_18F80C000, a1, OS_LOG_TYPE_FAULT, "[CRASH] Backtrace: %@", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

+ (void)simulateCrashWithCode:(NSObject *)a3 description:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 136315394;
  v6 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v7 = 2048;
  v8 = a2;
  _os_log_fault_impl(&dword_18F80C000, a3, OS_LOG_TYPE_FAULT, "[CRASH] %s (code 0x%llx)", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
