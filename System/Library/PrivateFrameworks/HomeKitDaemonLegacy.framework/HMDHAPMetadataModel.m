@implementation HMDHAPMetadataModel

- (id)metadataDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0D16760];
  -[HMDHAPMetadataModel metadataVersion](self, "metadataVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E0D16730];
  -[HMDHAPMetadataModel schemaVersion](self, "schemaVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = *MEMORY[0x1E0D16710];
  -[HMDHAPMetadataModel rawPlist](self, "rawPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = *MEMORY[0x1E0D166F0];
  -[HMDHAPMetadataModel legacyIDSData](self, "legacyIDSData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = *MEMORY[0x1E0D166E8];
  -[HMDHAPMetadataModel legacyCloudData](self, "legacyCloudData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_18888 != -1)
    dispatch_once(&properties_onceToken_18888, &__block_literal_global_454);
  return (id)properties__properties_18889;
}

+ (id)metadataModelObjectUUID
{
  if (metadataModelObjectUUID_onceToken != -1)
    dispatch_once(&metadataModelObjectUUID_onceToken, &__block_literal_global_467);
  return (id)metadataModelObjectUUID_metadataModelObjectUUID;
}

+ (id)modelWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  HMDHAPMetadataModel *v5;
  uint64_t v6;
  void *v7;
  HMDHAPMetadataModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = *MEMORY[0x1E0D16760];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D16760]);
  v5 = (HMDHAPMetadataModel *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0D16730];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D16730]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [HMDHAPMetadataModel alloc];
      +[HMDHAPMetadataModel metadataModelObjectUUID](HMDHAPMetadataModel, "metadataModelObjectUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
      v5 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v8, "initWithObjectChangeType:uuid:parentUUID:", 1, v9, v10);

      objc_msgSend(v3, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMetadataModel setMetadataVersion:](v5, "setMetadataVersion:", v11);

      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMetadataModel setSchemaVersion:](v5, "setSchemaVersion:", v12);

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D16710]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMetadataModel setRawPlist:](v5, "setRawPlist:", v13);

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D166F0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMetadataModel setLegacyIDSData:](v5, "setLegacyIDSData:", v14);

      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D166E8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHAPMetadataModel setLegacyCloudData:](v5, "setLegacyCloudData:", v15);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)allowedTypes
{
  if (allowedTypes_onceToken != -1)
    dispatch_once(&allowedTypes_onceToken, &__block_literal_global_474);
  return (id)allowedTypes__allowedTypes;
}

void __35__HMDHAPMetadataModel_allowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedTypes__allowedTypes;
  allowedTypes__allowedTypes = v2;

}

void __46__HMDHAPMetadataModel_metadataModelObjectUUID__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:withSalts:", v2, &unk_1E8B31CF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)metadataModelObjectUUID_metadataModelObjectUUID;
  metadataModelObjectUUID_metadataModelObjectUUID = v0;

}

void __33__HMDHAPMetadataModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("metadataVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("schemaVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("rawPlist");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("legacyIDSData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("legacyCloudData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)properties__properties_18889;
  properties__properties_18889 = v5;

}

@end
