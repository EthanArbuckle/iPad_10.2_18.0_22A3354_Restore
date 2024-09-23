@implementation CNUILogContactList

void __CNUILogContactList_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "ContactList");
  v1 = (void *)CNUILogContactList_cn_once_object_3;
  CNUILogContactList_cn_once_object_3 = (uint64_t)v0;

}

@end
