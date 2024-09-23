@implementation CNUILogViewService

void __CNUILogViewService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "ContactViewService");
  v1 = (void *)CNUILogViewService_cn_once_object_7;
  CNUILogViewService_cn_once_object_7 = (uint64_t)v0;

}

@end
