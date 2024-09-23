@implementation HMDLegacyCloudDatabase

- (HMDLegacyCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4
{
  HMDLegacyCloudDatabase *v4;
  HMDLegacyCloudDatabase *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyCloudDatabase;
  v4 = -[HMBCloudDatabase initWithLocalDatabase:configuration:](&v7, sel_initWithLocalDatabase_configuration_, a3, a4);
  v5 = v4;
  if (v4)
    -[HMBCloudDatabase setCloudZoneFactory:](v4, "setCloudZoneFactory:", &__block_literal_global_98821);
  return v5;
}

- (id)mirrorLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:](HMDLegacyCloudDatabase, "recordZoneIDForLegacyName:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  mirrorLegacyZone(self, 0, v12, v11, v10, (uint64_t)a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)createLegacyZone:(id)a3 controllerIdentity:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:](HMDLegacyCloudDatabase, "recordZoneIDForLegacyName:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  mirrorLegacyZone(self, 1, v12, v11, v10, (uint64_t)a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __62__HMDLegacyCloudDatabase_initWithLocalDatabase_configuration___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  HMDMutableLegacyCloudZoneConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  __objc2_class **v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;

  v5 = a4;
  v6 = a2;
  v7 = objc_alloc_init(HMDMutableLegacyCloudZoneConfiguration);
  objc_msgSend(v5, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("HomeDataBlobZone"));

  if ((v11 & 1) != 0)
  {
    v12 = off_24E762668;
  }
  else
  {
    objc_msgSend(v5, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zoneName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("1411CE6C-B4DE-4622-A49D-F66FE296D6B5"));

    if (v16)
      v17 = CFSTR("14730983-0D6D-4F74-8076-4F5953FD83EB");
    else
      v17 = CFSTR("4B0A9686-599F-487E-B2B0-B63BF838D813");
    -[HMDLegacyCloudZoneConfiguration setRootRecordName:](v7, "setRootRecordName:", v17);
    v12 = off_24E762688;
  }
  v18 = (void *)objc_msgSend(objc_alloc(*v12), "initWithCloudDatabase:configuration:state:", v6, v7, v5);

  return v18;
}

+ (id)recordZoneIDForLegacyName:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDB91F8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", v4, *MEMORY[0x24BDB8E88]);

  return v6;
}

@end
