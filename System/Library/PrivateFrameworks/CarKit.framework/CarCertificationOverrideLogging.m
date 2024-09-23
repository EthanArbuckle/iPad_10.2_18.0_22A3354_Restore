@implementation CarCertificationOverrideLogging

void __CarCertificationOverrideLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "CertificationOverrides");
  v1 = (void *)CarCertificationOverrideLogging_facility;
  CarCertificationOverrideLogging_facility = (uint64_t)v0;

}

@end
