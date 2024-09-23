@implementation CAFRegistrationLogging

void __CAFRegistrationLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFRegistration");
  v1 = (void *)CAFRegistrationLogging_facility;
  CAFRegistrationLogging_facility = (uint64_t)v0;

}

@end
