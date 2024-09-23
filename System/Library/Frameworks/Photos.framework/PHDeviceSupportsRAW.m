@implementation PHDeviceSupportsRAW

void __PHDeviceSupportsRAW_block_invoke()
{
  id v0;

  v0 = MTLCreateSystemDefaultDevice();
  PHDeviceSupportsRAW_deviceSupportsRAW = objc_msgSend(v0, "supportsFeatureSet:", 3);

}

@end
