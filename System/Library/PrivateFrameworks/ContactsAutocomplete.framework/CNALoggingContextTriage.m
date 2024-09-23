@implementation CNALoggingContextTriage

void __CNALoggingContextTriage_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "triage");
  v1 = (void *)CNALoggingContextTriage_cn_once_object_4;
  CNALoggingContextTriage_cn_once_object_4 = (uint64_t)v0;

}

@end
