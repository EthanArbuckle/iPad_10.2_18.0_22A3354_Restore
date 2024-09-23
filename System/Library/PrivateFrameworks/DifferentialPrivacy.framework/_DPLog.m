@implementation _DPLog

+ (id)daemon
{
  if (daemon_onceToken != -1)
    dispatch_once(&daemon_onceToken, &__block_literal_global_18);
  return (id)daemon__daemon;
}

+ (id)framework
{
  if (framework_onceToken != -1)
    dispatch_once(&framework_onceToken, &__block_literal_global_2);
  return (id)framework__framework;
}

+ (id)tool
{
  if (tool_onceToken[0] != -1)
    dispatch_once(tool_onceToken, &__block_literal_global_4);
  return (id)tool__tool;
}

+ (id)service
{
  if (service_onceToken != -1)
    dispatch_once(&service_onceToken, &__block_literal_global_6);
  return (id)service__service;
}

@end
