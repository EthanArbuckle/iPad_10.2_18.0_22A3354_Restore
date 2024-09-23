@implementation _ANELog

+ (id)daemon
{
  if (daemon_onceToken != -1)
    dispatch_once(&daemon_onceToken, &__block_literal_global_1);
  return (id)daemon__daemon;
}

+ (id)framework
{
  if (framework_onceToken != -1)
    dispatch_once(&framework_onceToken, &__block_literal_global_2_0);
  return (id)framework__framework;
}

+ (id)common
{
  if (common_onceToken != -1)
    dispatch_once(&common_onceToken, &__block_literal_global_10);
  return (id)common__common;
}

+ (id)compiler
{
  if (compiler_onceToken != -1)
    dispatch_once(&compiler_onceToken, &__block_literal_global_4);
  return (id)compiler__compiler;
}

+ (id)maintenance
{
  if (maintenance_onceToken != -1)
    dispatch_once(&maintenance_onceToken, &__block_literal_global_6_0);
  return (id)maintenance__maintenance;
}

+ (id)tool
{
  if (tool_onceToken != -1)
    dispatch_once(&tool_onceToken, &__block_literal_global_8);
  return (id)tool__tool;
}

+ (id)tests
{
  if (tests_onceToken != -1)
    dispatch_once(&tests_onceToken, &__block_literal_global_12);
  return (id)tests__tests;
}

@end
