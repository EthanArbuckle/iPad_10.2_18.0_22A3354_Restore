@implementation Log

void __Log_block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-cfu-notifier");
  v1 = (void *)Log_log;
  Log_log = (uint64_t)v0;

}

void __Log_block_invoke_0()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-daemon");
  v1 = (void *)Log_log_0;
  Log_log_0 = (uint64_t)v0;

}

void __Log_block_invoke_1()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "dedfbk");
  v1 = (void *)Log_log_1;
  Log_log_1 = (uint64_t)v0;

}

void __Log_block_invoke_2()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ids-inbound");
  v1 = (void *)Log_log_2;
  Log_log_2 = (uint64_t)v0;

}

void __Log_block_invoke_3()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "debug-request");
  v1 = (void *)Log_log_3;
  Log_log_3 = (uint64_t)v0;

}

void __Log_block_invoke_4()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "state");
  v1 = (void *)Log_log_4;
  Log_log_4 = (uint64_t)v0;

}

void __Log_block_invoke_5()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "sharing-connection");
  v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;

}

void __Log_block_invoke_6()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-usernotfier");
  v1 = (void *)Log_log_5;
  Log_log_5 = (uint64_t)v0;

}

@end
