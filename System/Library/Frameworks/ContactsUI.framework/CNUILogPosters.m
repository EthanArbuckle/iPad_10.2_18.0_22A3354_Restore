@implementation CNUILogPosters

void __CNUILogPosters_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "Posters");
  v1 = (void *)CNUILogPosters_cn_once_object_9;
  CNUILogPosters_cn_once_object_9 = (uint64_t)v0;

}

@end
