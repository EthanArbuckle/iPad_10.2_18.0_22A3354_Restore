@implementation DemoProgramNumber

void __DemoProgramNumber_block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0))
  {
    DemoProgramNumber___demoModeEnabled = 1;
    DemoProgramNumber___fProgramNumber = CFPreferencesGetAppIntegerValue(CFSTR("FProgramNumber"), CFSTR("com.apple.demo-settings"), 0);
  }
  wk_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446978;
    v2 = "DemoProgramNumber_block_invoke";
    v3 = 1024;
    v4 = 234;
    v5 = 1024;
    v6 = DemoProgramNumber___demoModeEnabled;
    v7 = 1024;
    v8 = DemoProgramNumber___fProgramNumber;
    _os_log_impl(&dword_215918000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Demo mode enabled = %d, Demo program number = %d", (uint8_t *)&v1, 0x1Eu);
  }

}

@end
