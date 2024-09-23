@implementation HMDMutableDatabaseZoneManagerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HMDDatabaseZoneManagerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[HMDDatabaseZoneManagerConfiguration init](+[HMDDatabaseZoneManagerConfiguration allocWithZone:](HMDDatabaseZoneManagerConfiguration, "allocWithZone:", a3), "init");
  -[HMDDatabaseZoneManagerConfiguration setZoneOwner:](v4, "setZoneOwner:", -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner"));
  -[HMDDatabaseZoneManagerConfiguration setShouldCreateZone:](v4, "setShouldCreateZone:", -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone"));
  -[HMDDatabaseZoneManagerConfiguration externalRecordTypesForSubscriptions](self, "externalRecordTypesForSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setExternalRecordTypesForSubscriptions:](v4, "setExternalRecordTypesForSubscriptions:", v5);

  -[HMDDatabaseZoneManagerConfiguration minimumHomeKitVersion](self, "minimumHomeKitVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setMinimumHomeKitVersion:](v4, "setMinimumHomeKitVersion:", v6);

  -[HMDDatabaseZoneManagerConfiguration requiredSupportedFeatures](self, "requiredSupportedFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setRequiredSupportedFeatures:](v4, "setRequiredSupportedFeatures:", v7);

  -[HMDDatabaseZoneManagerConfiguration cloudZoneConfiguration](self, "cloudZoneConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setCloudZoneConfiguration:](v4, "setCloudZoneConfiguration:", v8);

  return v4;
}

@end
