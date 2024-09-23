@implementation CNALoggingContextPerformance

void __CNALoggingContextPerformance_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "performance");
  v1 = (void *)CNALoggingContextPerformance_cn_once_object_0;
  CNALoggingContextPerformance_cn_once_object_0 = (uint64_t)v0;

}

@end
