@implementation HMDLegacyCloudZoneConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyCloudZoneConfiguration;
  v4 = -[HMBCloudZoneConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HMDLegacyCloudZoneConfiguration rootRecordName](self, "rootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRootRecordName:", v5);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableLegacyCloudZoneConfiguration *v4;
  void *v5;

  v4 = -[HMDMutableLegacyCloudZoneConfiguration init](+[HMDMutableLegacyCloudZoneConfiguration allocWithZone:](HMDMutableLegacyCloudZoneConfiguration, "allocWithZone:", a3), "init");
  -[HMDLegacyCloudZoneConfiguration rootRecordName](self, "rootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLegacyCloudZoneConfiguration setRootRecordName:](v4, "setRootRecordName:", v5);

  return v4;
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootRecordName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootRecordName, 0);
}

@end
