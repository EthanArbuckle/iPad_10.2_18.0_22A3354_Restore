@implementation CalCrashReporter

+ (BOOL)isAvailable
{
  return 1;
}

+ (void)simulateCrashWithMessage:(id)a3
{
  id v3;
  void (*v4)(uint64_t, uint64_t, id);
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void (*)(uint64_t, uint64_t, id))EKWeakLinkSymbol("SimulateCrash", 0xCuLL);
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[CalCrashReporter simulateCrashWithMessage:].cold.2((uint64_t)v3, v6);

    v7 = getpid();
    v4(v7, 516869835, v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CalCrashReporter simulateCrashWithMessage:].cold.1((uint64_t)v3, v6);

  }
}

+ (void)simulateCrashWithMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "SimulateCrash";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Will not simulate crash report because the [%s] function couldn't be loaded.  Given crash report message: [%@]", (uint8_t *)&v2, 0x16u);
}

+ (void)simulateCrashWithMessage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "Simulating crash report with message: [%@]", (uint8_t *)&v2, 0xCu);
}

@end
