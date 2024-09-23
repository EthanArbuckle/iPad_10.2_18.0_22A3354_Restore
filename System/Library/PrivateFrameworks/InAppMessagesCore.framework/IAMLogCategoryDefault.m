@implementation IAMLogCategoryDefault

void __IAMLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.inappmessages", "Default");
  v1 = (void *)IAMLogCategoryDefault__log;
  IAMLogCategoryDefault__log = (uint64_t)v0;

}

void __IAMLogCategoryDefault_Oversize_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.inappmessages", "Default_Oversize");
  v1 = (void *)IAMLogCategoryDefault_Oversize__log;
  IAMLogCategoryDefault_Oversize__log = (uint64_t)v0;

}

@end
