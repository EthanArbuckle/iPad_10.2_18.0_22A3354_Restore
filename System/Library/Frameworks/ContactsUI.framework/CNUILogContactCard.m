@implementation CNUILogContactCard

void __CNUILogContactCard_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "ContactCard");
  v1 = (void *)CNUILogContactCard_cn_once_object_2;
  CNUILogContactCard_cn_once_object_2 = (uint64_t)v0;

}

@end
