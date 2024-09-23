@implementation NSString(_HKObjectComparisonFilter)

- (uint64_t)hk_hasDevicePropertyKeyPathPrefix
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("device."));
}

- (uint64_t)hk_hasMetadataKeyPathPrefix
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("metadata."));
}

@end
