@implementation HMDDeviceAssociationInfoProto

- (HMDDeviceAssociationInfoProto)initWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDDeviceAssociationInfoProto *v12;
  HMDDeviceAssociationInfoProto *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDeviceAssociationInfoProto;
  v12 = -[HMDDeviceAssociationInfoProto init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessoryUUID, a3);
    objc_storeStrong((id *)&v13->_idsIdentifier, a4);
    objc_storeStrong((id *)&v13->_idsDestination, a5);
  }

  return v13;
}

- (HMDDeviceAssociationInfoProto)initWithProtoPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDDeviceAssociationInfoProto *v17;
  HMDDeviceAssociationInfoProto *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "accessoryUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "idsIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "idsDestination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v4, "accessoryUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
        v13 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v4, "idsIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
        objc_msgSend(v4, "idsDestination");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[HMDDeviceAssociationInfoProto initWithAccessoryUUID:idsIdentifier:idsDestination:](self, "initWithAccessoryUUID:idsIdentifier:idsDestination:", v12, v15, v16);

        v18 = v17;
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  v19 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsDestination");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138544130;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Proto payload is missing some fields, accessoryUUID: %@ idsIdentifier: %@ idsDestination: %@", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v19);
  v18 = 0;
LABEL_9:

  return v18;
}

- (HMDDeviceAssociationInfoProto)initWithProtoData:(id)a3
{
  id v4;
  HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *v5;
  HMDDeviceAssociationInfoProto *v6;

  v4 = a3;
  v5 = -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo initWithData:]([HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo alloc], "initWithData:", v4);

  v6 = -[HMDDeviceAssociationInfoProto initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDDeviceAssociationInfoProto accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceAssociationInfoProto idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceAssociationInfoProto idsDestination](self, "idsDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("accessory uuid: %@ ids identifier: %@ ids destination: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceAssociationInfoProto *v4;
  HMDDeviceAssociationInfoProto *v5;
  HMDDeviceAssociationInfoProto *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMDDeviceAssociationInfoProto *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDDeviceAssociationInfoProto accessoryUUID](self, "accessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceAssociationInfoProto accessoryUUID](v6, "accessoryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        -[HMDDeviceAssociationInfoProto idsIdentifier](self, "idsIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDeviceAssociationInfoProto idsIdentifier](v6, "idsIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (HMFEqualObjects())
        {
          -[HMDDeviceAssociationInfoProto idsDestination](self, "idsDestination");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDeviceAssociationInfoProto idsDestination](v6, "idsDestination");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = HMFEqualObjects();

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDDeviceAssociationInfoProto accessoryUUID](self, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDDeviceAssociationInfoProto idsIdentifier](self, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDDeviceAssociationInfoProto idsDestination](self, "idsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)protoPayload
{
  HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo);
  -[HMDDeviceAssociationInfoProto accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setAccessoryUUID:](v3, "setAccessoryUUID:", v5);

  -[HMDDeviceAssociationInfoProto idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsIdentifier:](v3, "setIdsIdentifier:", v7);

  -[HMDDeviceAssociationInfoProto idsDestination](self, "idsDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo setIdsDestination:](v3, "setIdsDestination:", v8);

  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMDDeviceAssociationInfoProto protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)idsIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)idsDestination
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
