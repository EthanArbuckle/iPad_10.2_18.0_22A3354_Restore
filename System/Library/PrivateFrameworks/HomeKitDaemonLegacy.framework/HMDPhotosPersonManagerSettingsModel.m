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

  v11 = (void *)MEMORY[0x1E0CB37E8];
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

  v3 = objc_alloc_init(MEMORY[0x1E0CBA6E8]);
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
  if (hmbProperties_onceToken_106899 != -1)
    dispatch_once(&hmbProperties_onceToken_106899, &__block_literal_global_106900);
  return (id)hmbProperties_properties_106901;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_106893 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_106893, &__block_literal_global_7_106894);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_106895;
}

void __57__HMDPhotosPersonManagerSettingsModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("BCF7ED70-4FE2-4186-8B8C-F4832AC1A54B"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_106895;
  sentinelParentUUID_sentinelParentUUID_106895 = v0;

}

void __52__HMDPhotosPersonManagerSettingsModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("sharingFaceClassificationsEnabled");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("zoneUUID");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties_properties_106901;
  hmbProperties_properties_106901 = v2;

}

@end
