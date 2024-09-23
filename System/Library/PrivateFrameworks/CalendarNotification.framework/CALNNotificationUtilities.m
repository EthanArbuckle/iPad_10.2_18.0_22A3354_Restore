@implementation CALNNotificationUtilities

+ (BOOL)shouldBehaveAsRestart
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pathForSentinelFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4) ^ 1;

  return v5;
}

+ (void)createSentinelFileIfNeeded
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Could not create sentinel file", v1, 2u);
}

+ (id)_pathForSentinelFile
{
  return CFSTR("/tmp/CalNotificationsAvailable");
}

@end
