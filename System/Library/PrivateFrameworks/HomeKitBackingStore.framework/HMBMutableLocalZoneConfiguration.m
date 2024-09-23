@implementation HMBMutableLocalZoneConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HMBLocalZoneConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[HMBLocalZoneConfiguration init](+[HMBLocalZoneConfiguration allocWithZone:](HMBLocalZoneConfiguration, "allocWithZone:", a3), "init");
  -[HMBLocalZoneConfiguration setReadOnly:](v4, "setReadOnly:", -[HMBLocalZoneConfiguration readOnly](self, "readOnly"));
  -[HMBLocalZoneConfiguration setCreateIfNeeded:](v4, "setCreateIfNeeded:", -[HMBLocalZoneConfiguration createIfNeeded](self, "createIfNeeded"));
  -[HMBLocalZoneConfiguration modelContainer](self, "modelContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneConfiguration setModelContainer:](v4, "setModelContainer:", v5);

  -[HMBLocalZoneConfiguration delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneConfiguration setDelegate:](v4, "setDelegate:", v6);

  return v4;
}

@end
