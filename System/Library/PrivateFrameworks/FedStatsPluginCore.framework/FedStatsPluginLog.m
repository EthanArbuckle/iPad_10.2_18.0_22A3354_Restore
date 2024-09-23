@implementation FedStatsPluginLog

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger__framework;
}

void __27__FedStatsPluginLog_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FedStats", "Framework");
  v1 = (void *)logger__framework;
  logger__framework = (uint64_t)v0;

}

@end
