@implementation CNUILogContactPhotoPicker

void __CNUILogContactPhotoPicker_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "ContactPhotoPicker");
  v1 = (void *)CNUILogContactPhotoPicker_cn_once_object_5;
  CNUILogContactPhotoPicker_cn_once_object_5 = (uint64_t)v0;

}

@end
