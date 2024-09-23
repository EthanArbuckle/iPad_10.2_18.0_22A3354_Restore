@implementation SYLogs

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("SyncErrorAlert");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", v4);

    v7 = CFSTR("Pumbaa");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", v6);

  }
}

+ (id)logFolder
{
  if (logFolder_onceToken != -1)
    dispatch_once(&logFolder_onceToken, &__block_literal_global);
  return (id)logFolder___folder;
}

void __19__SYLogs_logFolder__block_invoke()
{
  int v0;
  const __CFString *v1;
  void *v2;

  v0 = MGGetBoolAnswer();
  v1 = CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CompanionSync");
  v2 = (void *)logFolder___folder;
  if (v0)
    v1 = CFSTR("/var/mobile/Library/Logs/CompanionSync");
  logFolder___folder = (uint64_t)v1;

}

+ (BOOL)shouldDisplaySyncErrorMessage
{
  return 1;
}

+ (BOOL)shouldLogBubblesToAggD
{
  return 1;
}

+ (BOOL)shouldDumpIDSOnSyncError
{
  return 0;
}

@end
