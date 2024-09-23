@implementation HMDCloudHomeManagerZone

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  return -[HMDCloudHomeManagerZoneChange initWithZone:temporaryCache:]([HMDCloudHomeManagerZoneChange alloc], "initWithZone:temporaryCache:", self, a3);
}

- (void)setServerChangeToken:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCloudHomeManagerZone;
  -[HMDCloudZone setServerChangeToken:](&v4, sel_setServerChangeToken_, a3);
  -[HMDCloudZone updateCurrentServerChangeToken](self, "updateCurrentServerChangeToken");
}

+ (id)zoneRootRecordName
{
  return CFSTR("14730983-0D6D-4F74-8076-4F5953FD83EB");
}

+ (id)zoneSubscriptionName:(id)a3
{
  return CFSTR("089DAA62-C6FD-4BB1-9EDE-17126F6076F7");
}

+ (void)createHomeManagerZoneWithName:(id)a3 owner:(id)a4 cacheZone:(id)a5 cloudCache:(id)a6 completion:(id)a7
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
  v20[2] = __95__HMDCloudHomeManagerZone_createHomeManagerZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke;
  v20[3] = &unk_1E89A9198;
  v21 = v11;
  v19 = v11;
  objc_msgSend(v18, "createZoneWithName:rootRecordName:subscriptionName:owner:cacheZone:cloudCache:completion:", v15, v16, v17, v14, v13, v12, v20);

}

uint64_t __95__HMDCloudHomeManagerZone_createHomeManagerZoneWithName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
