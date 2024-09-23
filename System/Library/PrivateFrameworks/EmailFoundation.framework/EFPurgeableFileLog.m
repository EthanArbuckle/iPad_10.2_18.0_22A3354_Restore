@implementation EFPurgeableFileLog

void __EFPurgeableFileLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EFPurgeableFile");
  v1 = (void *)EFPurgeableFileLog_log;
  EFPurgeableFileLog_log = (uint64_t)v0;

}

@end
