@implementation __HMFEmbeddedSystemInfo

- (__HMFEmbeddedSystemInfo)init
{
  __HMFEmbeddedSystemInfo *v2;
  __HMFMobileGestaltDataSource *v3;
  HMFSystemInfoProductColorDataSource *productColorDataSource;
  __HMFMobileGestaltDataSource *v5;
  __HMFSetupAssistantDataSource *v6;
  HMFSystemInfoMigrationDataSource *migrationDataSource;
  __HMFSetupAssistantDataSource *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)__HMFEmbeddedSystemInfo;
  v2 = -[__HMFEmbeddedSystemInfo init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(__HMFMobileGestaltDataSource);
    objc_storeStrong((id *)&v2->super._nameDataSource, v3);
    -[HMFSystemInfoNameDataSource setDelegate:](v2->super._nameDataSource, "setDelegate:", v2);
    objc_storeStrong((id *)&v2->super._marketingDataSource, v3);
    objc_storeStrong((id *)&v2->super._serialNumberDataSource, v3);
    objc_storeStrong((id *)&v2->super._productInfoDataSource, v3);
    objc_storeStrong((id *)&v2->super._softwareVersionDataSource, v3);
    objc_storeStrong((id *)&v2->super._WiFiDataSource, v3);
    objc_storeStrong((id *)&v2->super._bluetoothLEDataSource, v3);
    productColorDataSource = v2->super._productColorDataSource;
    v2->super._productColorDataSource = (HMFSystemInfoProductColorDataSource *)v3;
    v5 = v3;

    v6 = objc_alloc_init(__HMFSetupAssistantDataSource);
    migrationDataSource = v2->super._migrationDataSource;
    v2->super._migrationDataSource = (HMFSystemInfoMigrationDataSource *)v6;
    v8 = v6;

    -[HMFSystemInfoMigrationDataSource setDelegate:](v2->super._migrationDataSource, "setDelegate:", v2);
  }
  return v2;
}

@end
