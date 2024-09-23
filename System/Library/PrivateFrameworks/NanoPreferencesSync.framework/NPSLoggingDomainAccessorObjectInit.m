@implementation NPSLoggingDomainAccessorObjectInit

void __NPSLoggingDomainAccessorObjectInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NanoPreferencesSync", "DomainAccessor");
  v1 = (void *)nps_domain_accessor_log;
  nps_domain_accessor_log = (uint64_t)v0;

}

@end
