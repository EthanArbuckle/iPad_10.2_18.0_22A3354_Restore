@implementation CNUILogTesting

void __CNUILogTesting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "Testing");
  v1 = (void *)CNUILogTesting_cn_once_object_8;
  CNUILogTesting_cn_once_object_8 = (uint64_t)v0;

}

@end
