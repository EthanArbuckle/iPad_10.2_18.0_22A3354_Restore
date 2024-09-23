@implementation CSCPUMonitorHelper

+ (int)setThreshold:(float)a3 overTimeWindow:(float)a4 forPID:(int)a5 withFatalEffect:(BOOL)a6
{
  uint64_t v7;
  NSObject *v9;
  int v10;
  int v11;
  NSObject *v12;

  v7 = *(_QWORD *)&a5;
  *__error() = 0;
  if (objc_msgSend(a1, "clearMonitorForPID:", v7))
  {
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CSCPUMonitorHelper setThreshold:overTimeWindow:forPID:withFatalEffect:].cold.2(v9);

  }
  if (a6)
    v10 = proc_set_cpumon_params_fatal();
  else
    v10 = proc_set_cpumon_params();
  v11 = v10;
  if (v10)
  {
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CSCPUMonitorHelper setThreshold:overTimeWindow:forPID:withFatalEffect:].cold.1(v12);

  }
  return v11;
}

+ (int)clearMonitorForPID:(int)a3
{
  return proc_disable_cpumon();
}

+ (void)setThreshold:(NSObject *)a1 overTimeWindow:forPID:withFatalEffect:.cold.1(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2383F5000, a1, OS_LOG_TYPE_ERROR, "Error enabling CPU monitoring: %d", (uint8_t *)v3, 8u);
}

+ (void)setThreshold:(os_log_t)log overTimeWindow:forPID:withFatalEffect:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2383F5000, log, OS_LOG_TYPE_DEBUG, "Failed to disable monitoring (okay if no limits were applied). Proceeding to set new limits.", v1, 2u);
}

@end
