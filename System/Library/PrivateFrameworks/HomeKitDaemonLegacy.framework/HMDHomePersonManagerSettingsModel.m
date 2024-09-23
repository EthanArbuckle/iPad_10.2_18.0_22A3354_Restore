@implementation HMDHomePersonManagerSettingsModel

- (HMDHomePersonManagerSettingsModel)initWithHomeUUID:(id)a3
{
  id v4;
  void *v5;
  HMDHomePersonManagerSettingsModel *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "modelIDForHomeUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](self, "initWithObjectChangeType:uuid:parentUUID:", 1, v5, v4);

  return v6;
}

- (NSUUID)zoneUUID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HMDHomePersonManagerSettingsModel zoneUUIDString](self, "zoneUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMDHomePersonManagerSettingsModel zoneUUIDString](self, "zoneUUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setZoneUUID:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHomePersonManagerSettingsModel setZoneUUIDString:](self, "setZoneUUIDString:", v4);

}

- (id)createSettings
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CBA6D0]);
  -[HMDHomePersonManagerSettingsModel zoneUUID](self, "zoneUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFaceClassificationEnabled:", v4 != 0);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

+ (id)properties
{
  if (properties_onceToken_152334 != -1)
    dispatch_once(&properties_onceToken_152334, &__block_literal_global_152335);
  return (id)properties__properties_152336;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("A9E193D0-2AD8-4F4F-86C1-9BADE1CF3845"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "hm_convertToData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v3;
  HMDHomePersonManagerSettingsModel *v4;

  v3 = a3;
  v4 = -[HMDHomePersonManagerSettingsModel initWithHomeUUID:]([HMDHomePersonManagerSettingsModel alloc], "initWithHomeUUID:", v3);

  return v4;
}

void __47__HMDHomePersonManagerSettingsModel_properties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("zoneUUIDString");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)properties__properties_152336;
  properties__properties_152336 = v1;

}

@end
