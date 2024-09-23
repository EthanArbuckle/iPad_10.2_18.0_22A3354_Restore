@implementation CNUILogRemoteAlert

void __CNUILogRemoteAlert_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "RemoteAlert");
  v1 = (void *)CNUILogRemoteAlert_cn_once_object_10;
  CNUILogRemoteAlert_cn_once_object_10 = (uint64_t)v0;

}

@end
