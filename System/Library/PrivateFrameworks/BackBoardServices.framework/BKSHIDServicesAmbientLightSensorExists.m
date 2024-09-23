@implementation BKSHIDServicesAmbientLightSensorExists

uint64_t __BKSHIDServicesAmbientLightSensorExists_block_invoke()
{
  int v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorExists(v0, &BKSHIDServicesAmbientLightSensorExists_alsExists);
}

@end
