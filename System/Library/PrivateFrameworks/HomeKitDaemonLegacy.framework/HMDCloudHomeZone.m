@implementation HMDCloudHomeZone

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudZone shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Root Group = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  return -[HMDCloudHomeZoneChange initWithZone:temporaryCache:]([HMDCloudHomeZoneChange alloc], "initWithZone:temporaryCache:", self, a3);
}

- (void)setServerChangeToken:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCloudHomeZone;
  -[HMDCloudZone setServerChangeToken:](&v4, sel_setServerChangeToken_, a3);
  -[HMDCloudZone updateCurrentServerChangeToken](self, "updateCurrentServerChangeToken");
}

- (BOOL)isSharedHome
{
  return self->_sharedHome;
}

+ (id)zoneRootRecordName
{
  return CFSTR("4B0A9686-599F-487E-B2B0-B63BF838D813");
}

+ (id)zoneSharedRootRecordName
{
  return CFSTR("1D8E88C5-7EEA-49D7-8E63-A060A96A224B");
}

+ (id)zoneSubscriptionName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("_Subscription"));
}

+ (void)createHomeZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend((id)objc_opt_class(), "zoneRootRecordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "zoneSubscriptionName:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__HMDCloudHomeZone_createHomeZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E89A9198;
  v21 = v11;
  v19 = v11;
  objc_msgSend(v18, "createZoneWithName:rootRecordName:subscriptionName:owner:cacheZone:cloudCache:completion:", v15, v16, v17, v14, v13, v12, v20);

}

uint64_t __81__HMDCloudHomeZone_createHomeZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
