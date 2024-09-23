@implementation CNALoggingContextProbes

void __CNALoggingContextProbes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "probes");
  v1 = (void *)CNALoggingContextProbes_cn_once_object_3;
  CNALoggingContextProbes_cn_once_object_3 = (uint64_t)v0;

}

@end
