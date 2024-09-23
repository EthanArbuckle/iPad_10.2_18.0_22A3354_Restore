@implementation VSErrorLogObject

void __VSErrorLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.VideoSubscriberAccount"), "UTF8String"), (const char *)objc_msgSend(CFSTR("Errors"), "UTF8String"));
  v1 = (void *)VSErrorLogObject___vs_lazy_init_variable;
  VSErrorLogObject___vs_lazy_init_variable = (uint64_t)v0;

}

@end
