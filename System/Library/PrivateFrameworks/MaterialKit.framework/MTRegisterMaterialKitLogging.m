@implementation MTRegisterMaterialKitLogging

void __MTRegisterMaterialKitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)MTLogSubsystem, "Materials");
  v1 = (void *)MTLogMaterials;
  MTLogMaterials = (uint64_t)v0;

  v2 = os_log_create((const char *)MTLogSubsystem, "Luma");
  v3 = (void *)MTLogLuma;
  MTLogLuma = (uint64_t)v2;

}

@end
