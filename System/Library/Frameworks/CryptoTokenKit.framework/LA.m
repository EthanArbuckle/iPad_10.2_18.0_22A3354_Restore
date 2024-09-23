@implementation LA

void __LA_LOG_EndpointProvider_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "EndpointProvider");
  v1 = (void *)LA_LOG_EndpointProvider_log;
  LA_LOG_EndpointProvider_log = (uint64_t)v0;

}

@end
