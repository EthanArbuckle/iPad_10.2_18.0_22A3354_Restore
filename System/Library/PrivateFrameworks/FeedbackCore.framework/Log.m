@implementation Log

void __Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "auth");
  v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;

}

void __Log_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "installed-app");
  v1 = (void *)Log_handle_0;
  Log_handle_0 = (uint64_t)v0;

}

void __Log_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "sp2");
  v1 = (void *)Log_handle_1;
  Log_handle_1 = (uint64_t)v0;

}

void __Log_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "ded-poll");
  v1 = (void *)Log_handle_2;
  Log_handle_2 = (uint64_t)v0;

}

void __Log_block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "draft");
  v1 = (void *)Log_handle_3;
  Log_handle_3 = (uint64_t)v0;

}

void __Log_block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "uploads");
  v1 = (void *)Log_handle_4;
  Log_handle_4 = (uint64_t)v0;

}

void __Log_block_invoke_5()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "license");
  v1 = (void *)Log_log;
  Log_log = (uint64_t)v0;

}

void __Log_block_invoke_6()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "data");
  v1 = (void *)Log_handle_5;
  Log_handle_5 = (uint64_t)v0;

}

void __Log_block_invoke_7()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "ddc");
  v1 = (void *)Log_log_0;
  Log_log_0 = (uint64_t)v0;

}

void __Log_block_invoke_8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "bftvc");
  v1 = (void *)Log_handle_6;
  Log_handle_6 = (uint64_t)v0;

}

void __Log_block_invoke_9()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FeedbackCore", "log-view");
  v1 = (void *)Log_handle_7;
  Log_handle_7 = (uint64_t)v0;

}

@end
