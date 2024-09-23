@implementation EMFGetDeviceRegionCode

void __EMFGetDeviceRegionCode_block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)EMFGetDeviceRegionCode_regionCode;
  EMFGetDeviceRegionCode_regionCode = v0;

  if (!EMFGetDeviceRegionCode_regionCode)
  {
    EMFGetDeviceRegionCode_regionCode = (uint64_t)&stru_1E670BD50;

  }
}

@end
