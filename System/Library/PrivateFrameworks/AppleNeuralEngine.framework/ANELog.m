@implementation ANELog

void __20___ANELog_framework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "client");
  v1 = (void *)framework__framework;
  framework__framework = (uint64_t)v0;

}

void __17___ANELog_common__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "common");
  v1 = (void *)common__common;
  common__common = (uint64_t)v0;

}

void __17___ANELog_daemon__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "aned");
  v1 = (void *)daemon__daemon;
  daemon__daemon = (uint64_t)v0;

}

void __19___ANELog_compiler__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "compiler");
  v1 = (void *)compiler__compiler;
  compiler__compiler = (uint64_t)v0;

}

void __22___ANELog_maintenance__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "maintenance");
  v1 = (void *)maintenance__maintenance;
  maintenance__maintenance = (uint64_t)v0;

}

void __15___ANELog_tool__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "anetool");
  v1 = (void *)tool__tool;
  tool__tool = (uint64_t)v0;

}

void __16___ANELog_tests__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ane", "tests");
  v1 = (void *)tests__tests;
  tests__tests = (uint64_t)v0;

}

@end
