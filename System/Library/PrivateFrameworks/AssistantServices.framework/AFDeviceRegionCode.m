@implementation AFDeviceRegionCode

void __AFDeviceRegionCode_block_invoke()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  void *v3;

  v0 = MGGetStringAnswer();
  if (v0)
  {
    v1 = (const void *)v0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)AFDeviceRegionCode_deviceRegionCode;
    AFDeviceRegionCode_deviceRegionCode = v2;

    CFRelease(v1);
  }
}

@end
