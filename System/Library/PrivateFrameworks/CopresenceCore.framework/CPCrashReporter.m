@implementation CPCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  uint64_t v6;
  id v7;
  char v8;
  NSObject *v9;
  NSObject *v10;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  if (simulateCrashReportWithReason_pid_code___pred_SimulateCrashCrashReporterSupport[0] != -1)
    dispatch_once(simulateCrashReportWithReason_pid_code___pred_SimulateCrashCrashReporterSupport, &__block_literal_global_2);
  v8 = simulateCrashReportWithReason_pid_code___SimulateCrash(v6, a5, v7);
  CPDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CPCrashReporter simulateCrashReportWithReason:pid:code:].cold.1();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    +[CPCrashReporter simulateCrashReportWithReason:pid:code:].cold.2();
  }

}

uint64_t (*__58__CPCrashReporter_simulateCrashReportWithReason_pid_code___block_invoke())(_QWORD, _QWORD, _QWORD)
{
  uint64_t (*result)(_QWORD, _QWORD, _QWORD);

  result = (uint64_t (*)(_QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol();
  simulateCrashReportWithReason_pid_code___SimulateCrash = result;
  return result;
}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v11);

  objc_msgSend(a1, "simulateCrashReportWithReason:pid:code:", v10, v6, v5);
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  objc_msgSend(a1, "simulateCrashReportWithReason:pid:code:", v6, getpid(), 14593455);
}

+ (void)simulateCrashReportWithReason:pid:code:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1ACCCC000, v0, OS_LOG_TYPE_ERROR, "%s Simulated a crash report for reason: %@", (uint8_t *)v1, 0x16u);
}

+ (void)simulateCrashReportWithReason:pid:code:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1ACCCC000, v0, OS_LOG_TYPE_FAULT, "%s Wanted to file a simulated crash report for reason: %@", (uint8_t *)v1, 0x16u);
}

@end
