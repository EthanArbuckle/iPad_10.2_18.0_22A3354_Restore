@implementation LogCategory

void __LogCategory_Daemon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.messages", "_");
  v1 = (void *)qword_25529A5E8;
  qword_25529A5E8 = (uint64_t)v0;

}

@end
