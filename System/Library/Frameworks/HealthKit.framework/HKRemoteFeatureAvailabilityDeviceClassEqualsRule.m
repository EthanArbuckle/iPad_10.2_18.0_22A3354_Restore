@implementation HKRemoteFeatureAvailabilityDeviceClassEqualsRule

+ (id)ruleIdentifier
{
  return CFSTR("DeviceClassEquals");
}

- (void)processUserInfo:(id)a3
{
  NSString *v4;
  NSString *deviceClass;

  objc_msgSend(a3, "hk_safeStringIfExistsForKeyPath:error:", CFSTR("DeviceClass"), 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceClass = self->_deviceClass;
  self->_deviceClass = v4;

}

- (BOOL)evaluate
{
  HKRemoteFeatureAvailabilityDeviceClassEqualsRule *v2;
  void *v3;
  void *v4;

  if (!self->_deviceClass)
    return 0;
  v2 = self;
  -[HKRemoteFeatureAvailabilityBaseRule dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDeviceClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", v2->_deviceClass);

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
