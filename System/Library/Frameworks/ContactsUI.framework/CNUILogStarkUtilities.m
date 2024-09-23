@implementation CNUILogStarkUtilities

void __CNUILogStarkUtilities_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "SiriStarkUtilities");
  v1 = (void *)CNUILogStarkUtilities_cn_once_object_12;
  CNUILogStarkUtilities_cn_once_object_12 = (uint64_t)v0;

}

@end
