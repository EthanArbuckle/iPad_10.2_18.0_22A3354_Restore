@implementation CNUILogContactStoreDataSource

void __CNUILogContactStoreDataSource_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "ContactStoreDataSource");
  v1 = (void *)CNUILogContactStoreDataSource_cn_once_object_6;
  CNUILogContactStoreDataSource_cn_once_object_6 = (uint64_t)v0;

}

@end
