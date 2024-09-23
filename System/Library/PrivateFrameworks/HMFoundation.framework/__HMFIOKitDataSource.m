@implementation __HMFIOKitDataSource

- (NSString)serialNumber
{
  return (NSString *)__getPlatformInformationForKey(CFSTR("IOPlatformSerialNumber"));
}

- (int64_t)productPlatform
{
  return 0;
}

- (int64_t)productClass
{
  void *v2;
  int64_t v3;

  __getPlatformInformationForKey(CFSTR("model"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFProductClassFromString(v2);

  return v3;
}

- (int64_t)productVariant
{
  return 0;
}

- (NSString)modelIdentifier
{
  return (NSString *)__getPlatformInformationForKey(CFSTR("model"));
}

@end
