@implementation EDAttachmentsLog

void __EDAttachmentsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "Attachments");
  v1 = (void *)EDAttachmentsLog_os_log;
  EDAttachmentsLog_os_log = (uint64_t)v0;

}

@end
