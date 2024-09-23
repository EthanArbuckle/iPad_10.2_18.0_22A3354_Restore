@implementation CNUILogAvatarView

void __CNUILogAvatarView_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "AvatarView");
  v1 = (void *)CNUILogAvatarView_cn_once_object_4;
  CNUILogAvatarView_cn_once_object_4 = (uint64_t)v0;

}

@end
