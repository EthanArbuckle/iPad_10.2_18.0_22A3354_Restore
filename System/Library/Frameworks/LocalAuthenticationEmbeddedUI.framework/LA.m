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

@end
