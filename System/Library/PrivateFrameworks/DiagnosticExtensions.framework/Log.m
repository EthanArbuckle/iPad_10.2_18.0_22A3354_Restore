@implementation Log

void __Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "extension-tracker");
  v1 = (void *)Log_log;
  Log_log = (uint64_t)v0;

}

void __Log_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "extension");
  v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;

}

void __Log_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "d-helper");
  v1 = (void *)Log_Log;
  Log_Log = (uint64_t)v0;

}

void __Log_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "de-helper");
  v1 = (void *)Log_handle_0;
  Log_handle_0 = (uint64_t)v0;

}

void __Log_block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.diagnosticextensions", "utils");
  v1 = (void *)Log_Log_0;
  Log_Log_0 = (uint64_t)v0;

}

@end
