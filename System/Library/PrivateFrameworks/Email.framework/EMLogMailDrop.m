@implementation EMLogMailDrop

void __EMLogMailDrop_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MailDrop");
  v1 = (void *)EMLogMailDrop_os_log;
  EMLogMailDrop_os_log = (uint64_t)v0;

}

@end
