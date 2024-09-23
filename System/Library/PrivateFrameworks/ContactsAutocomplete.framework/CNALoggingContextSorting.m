@implementation CNALoggingContextSorting

void __CNALoggingContextSorting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "sorting");
  v1 = (void *)CNALoggingContextSorting_cn_once_object_1;
  CNALoggingContextSorting_cn_once_object_1 = (uint64_t)v0;

}

@end
