@implementation CNALoggingContextDebug

void __CNALoggingContextDebug_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "debug");
  v1 = (void *)CNALoggingContextDebug_cn_once_object_2;
  CNALoggingContextDebug_cn_once_object_2 = (uint64_t)v0;

}

@end
