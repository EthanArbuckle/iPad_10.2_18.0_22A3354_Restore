@implementation VSDefaultLogObject

void __VSDefaultLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.VideoSubscriberAccount"), "UTF8String"), (const char *)objc_msgSend(CFSTR("Default"), "UTF8String"));
  v1 = (void *)VSDefaultLogObject___vs_lazy_init_variable;
  VSDefaultLogObject___vs_lazy_init_variable = (uint64_t)v0;

}

@end
