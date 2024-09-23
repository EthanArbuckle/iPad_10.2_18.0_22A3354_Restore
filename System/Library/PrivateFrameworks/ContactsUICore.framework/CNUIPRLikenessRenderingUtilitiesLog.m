@implementation CNUIPRLikenessRenderingUtilitiesLog

void __CNUIPRLikenessRenderingUtilitiesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIPRLikenessRenderingUtilitiesLog");
  v1 = (void *)CNUIPRLikenessRenderingUtilitiesLog_cn_once_object_1;
  CNUIPRLikenessRenderingUtilitiesLog_cn_once_object_1 = (uint64_t)v0;

}

@end
