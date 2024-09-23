@implementation HMDPhotosPersonManagerSettingsModel

- (HMDPhotosPersonManagerSettingsModel)initWithModelID:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  HMDPhotosPersonManagerSettingsModel *v8;
  void *v9;
  HMDPhotosPersonManagerSettingsModel *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = [HMDPhotosPersonManagerSettingsModel alloc];
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMBModel initWithModelID:parentModelID:](v8, "initWithModelID:parentModelID:", v7, v9);

  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v6, "isSharingFaceClassificationsEnabled");

  objc_msgSend(v11, "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotosPersonManagerSettingsModel setSharingFaceClassificationsEnabled:](v10, "setSharingFaceClassificationsEnabled:", v13);

  return v10;
}

- (id)createSettings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD7858]);
  -[HMDPhotosPersonManagerSettingsModel zoneUUID](self, "zoneUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImportingFromPhotoLibraryEnabled:", v4 != 0);

  -[HMDPhotosPersonManagerSettingsModel sharingFaceClassificationsEnabled](self, "sharingFaceClassificationsEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharingFaceClassificationsEnabled:", objc_msgSend(v5, "BOOLValue"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_149326 != -1)
    dispatch_once(&hmbProperties_onceToken_149326, &__block_literal_global_149327);
  return (id)hmbProperties_properties_149328;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_149320 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_149320, &__block_literal_global_7_149321);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_149322;
}

void __57__HMDPhotosPersonManagerSettingsModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BCF7ED70-4FE2-4186-8B8C-F4832AC1A54B"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_149322;
  sentinelParentUUID_sentinelParentUUID_149322 = v0;

}

void __52__HMDPhotosPersonManagerSettingsModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("sharingFaceClassificationsEnabled");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("zoneUUID");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties_properties_149328;
  hmbProperties_properties_149328 = v2;

}

@end
