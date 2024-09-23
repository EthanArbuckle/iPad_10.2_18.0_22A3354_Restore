@implementation AFDeviceSupportsHybridUOD

void __AFDeviceSupportsHybridUOD_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = MGCopyAnswer();
  v1 = (void *)AFDeviceSupportsHybridUOD_productType;
  AFDeviceSupportsHybridUOD_productType = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("iPad7,1"), CFSTR("iPad7,2"), CFSTR("iPad7,3"), CFSTR("iPad7,4"), CFSTR("iPad7,11"), CFSTR("iPad7,12"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AFDeviceSupportsHybridUOD_supportedProductTypes;
  AFDeviceSupportsHybridUOD_supportedProductTypes = v2;

}

@end
