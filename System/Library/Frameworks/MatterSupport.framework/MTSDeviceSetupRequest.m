@implementation MTSDeviceSetupRequest

- (MTSDeviceSetupRequest)initWithWrappedRequest:(id)a3
{
  id v5;
  MTSDeviceSetupRequest *v6;
  MTSDeviceSetupRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSDeviceSetupRequest;
  v6 = -[MTSDeviceSetupRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedRequest, a3);

  return v7;
}

- (MTSDeviceSetupRequest)initWithSerializedRequest:(id)a3
{
  void *v4;
  MTSDeviceSetupRequest *v5;

  +[MTDeviceSetupRequestFactory makeRequestFrom:](MTDeviceSetupRequestFactory, "makeRequestFrom:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[MTSDeviceSetupRequest initWithWrappedRequest:](self, "initWithWrappedRequest:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MTSDeviceSetupRequest)initWithEcosystemName:(id)a3 homeNames:(id)a4 blockedDevicePairings:(id)a5
{
  void *v6;
  MTSDeviceSetupRequest *v7;

  +[MTDeviceSetupRequestFactory makeRequestWithEcosystemName:homes:blockedDevicePairings:](MTDeviceSetupRequestFactory, "makeRequestWithEcosystemName:homes:blockedDevicePairings:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTSDeviceSetupRequest initWithWrappedRequest:](self, "initWithWrappedRequest:", v6);

  return v7;
}

- (MTSDeviceSetupRequest)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  MTSDeviceSetupRequest *v5;
  __CFString *v6;
  MTSDeviceSetupRequest *v7;
  id v8;
  MTSDeviceSetupRequest *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  MTSDeviceSetupRequest *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MTSDeviceSetupRequest init](self, "init");
  objc_msgSend(v4, "hmf_dataForKey:", CFSTR("MTSDSR"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v18);
    v7 = (MTSDeviceSetupRequest *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v14 = (void *)MEMORY[0x23493F978]();
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        v21 = 2112;
        v22 = v6;
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2344FE000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device setup request from dictionary representation; failed to deserialize data %@: %@",
          buf,
          0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }

    v13 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x23493F978]();
    v7 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("MTSDSR");
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2344FE000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device setup request from dictionary representation; missing %@ key in dictionary: %@",
        buf,
        0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v13 = 0;
  }

  return v13;
}

- (MTSDeviceSetupTopology)topology
{
  void *v2;
  void *v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topology");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTSDeviceSetupTopology *)v3;
}

- (NSString)ecosystemName
{
  void *v2;
  void *v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ecosystemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)shouldScanNetworks
{
  void *v2;
  char v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldScanNetworks");

  return v3;
}

- (MTRSetupPayload)setupPayload
{
  void *v2;
  void *v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTRSetupPayload *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  MTSDeviceSetupRequest *v7;
  NSObject *v8;
  void *v9;
  id v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  MTSDeviceSetupRequest *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    v12 = CFSTR("MTSDSR");
    v13 = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x23493F978]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2344FE000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize device setup request %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v5;
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldShowDeviceWithUUID:vendorID:productID:serialNumber:rootPublicKey:nodeID:", v13, v12, v11, v10, 0, 0);

  return v15;
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldShowDeviceWithUUID:vendorID:productID:serialNumber:rootPublicKey:nodeID:", v19, v18, v17, v16, v15, v14);

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wrappedRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MTSDeviceSetupRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MTSDeviceSetupRequest *v6;
  MTSDeviceSetupRequest *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSR.wrappedRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MTSDeviceSetupRequest initWithSerializedRequest:](self, "initWithSerializedRequest:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x23493F978]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(0, "length");
      _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not deserialize from wrappedRequestData: %ld", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MTSDeviceSetupRequest wrappedRequest](self, "wrappedRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedAsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDSR.wrappedRequest"));

}

- (MTDeviceSetupRequestSwiftWrapper)wrappedRequest
{
  return (MTDeviceSetupRequestSwiftWrapper *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedRequest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
