@implementation MLCLog

+ (id)framework
{
  if (framework_onceToken != -1)
    dispatch_once(&framework_onceToken, &__block_literal_global_5);
  return (id)framework__framework;
}

void __19__MLCLog_framework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mlcompute", "framework");
  v1 = (void *)framework__framework;
  framework__framework = (uint64_t)v0;

}

+ (id)execution
{
  if (execution_onceToken != -1)
    dispatch_once(&execution_onceToken, &__block_literal_global_2);
  return (id)execution__execution;
}

void __19__MLCLog_execution__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mlcompute", "PointsOfInterest");
  v1 = (void *)execution__execution;
  execution__execution = (uint64_t)v0;

}

+ (id)test
{
  if (test_onceToken != -1)
    dispatch_once(&test_onceToken, &__block_literal_global_4_0);
  return (id)test__test;
}

void __14__MLCLog_test__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mlcompute", "test");
  v1 = (void *)test__test;
  test__test = (uint64_t)v0;

}

@end
