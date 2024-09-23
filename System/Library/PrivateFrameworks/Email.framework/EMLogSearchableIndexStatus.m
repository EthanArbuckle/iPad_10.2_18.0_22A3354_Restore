@implementation EMLogSearchableIndexStatus

void __EMLogSearchableIndexStatus_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "SearchableIndexStatus");
  v1 = (void *)EMLogSearchableIndexStatus_os_log;
  EMLogSearchableIndexStatus_os_log = (uint64_t)v0;

}

@end
