@implementation LA

void __LA_LOG_block_invoke()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log;
  LA_LOG_log = v0;

}

void __LA_LOG_block_invoke_0()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_0;
  LA_LOG_log_0 = v0;

}

void __LA_LOG_block_invoke_1()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_1;
  LA_LOG_log_1 = v0;

}

void __LA_LOG_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_2;
  LA_LOG_log_2 = v0;

}

void __LA_LOG_block_invoke_3()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_3;
  LA_LOG_log_3 = v0;

}

void __LA_LOG_laabio_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "laabio");
  v1 = (void *)LA_LOG_laabio_log;
  LA_LOG_laabio_log = (uint64_t)v0;

}

void __LA_LOG_block_invoke_4()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_4;
  LA_LOG_log_4 = v0;

}

void __LA_LOG_INTERACTIVE_block_invoke()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_INTERACTIVE_log;
  LA_LOG_INTERACTIVE_log = v0;

}

void __LA_LOG_block_invoke_5()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_5;
  LA_LOG_log_5 = v0;

}

void __LA_LOG_block_invoke_6()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_6;
  LA_LOG_log_6 = v0;

}

void __LA_LOG_block_invoke_7()
{
  uint64_t v0;
  void *v1;

  LALogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LA_LOG_log_7;
  LA_LOG_log_7 = v0;

}

void __LA_LOG_coreauthd_client_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "coreauthd_client");
  v1 = (void *)LA_LOG_coreauthd_client_log;
  LA_LOG_coreauthd_client_log = (uint64_t)v0;

}

@end
