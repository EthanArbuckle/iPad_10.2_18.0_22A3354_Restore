@implementation MTSDevicePairing

- (MTSDevicePairing)initWithNodeID:(id)a3 fabric:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MTSDevicePairing *v10;
  MTSDevicePairing *v11;
  uint64_t v12;
  MTSDevicePairingFabric *fabric;
  uint64_t v14;
  NSUUID *uuid;
  MTSDevicePairing *v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;
  void *v26;
  void *v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v17 = (MTSDevicePairing *)_HMFPreconditionFailure();
    return -[MTSDevicePairing initWithUUID:nodeID:serialNumber:vendorID:productID:deviceType:name:setupPayload:](v17, v18, v19, v20, v21, v22, v23, v24, v26, v27);
  }
  v25.receiver = self;
  v25.super_class = (Class)MTSDevicePairing;
  v10 = -[MTSDevicePairing init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nodeID, a3);
    v12 = objc_msgSend(v9, "copy");
    fabric = v11->_fabric;
    v11->_fabric = (MTSDevicePairingFabric *)v12;

    +[MTSDevicePairing UUIDFromNodeID:fabric:](MTSDevicePairing, "UUIDFromNodeID:fabric:", v7, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

  }
  return v11;
}

- (MTSDevicePairing)initWithUUID:(id)a3 nodeID:(id)a4 serialNumber:(id)a5 vendorID:(id)a6 productID:(id)a7 deviceType:(id)a8 name:(id)a9 setupPayload:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  MTSSystemCommissionerPairing *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = -[MTSSystemCommissionerPairing initWithUUID:nodeID:vendorID:productID:deviceType:serialNumber:name:setupPayload:]([MTSSystemCommissionerPairing alloc], "initWithUUID:nodeID:vendorID:productID:deviceType:serialNumber:name:setupPayload:", v24, v23, v21, v20, v19, v22, v18, v17);

  return (MTSDevicePairing *)v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSDevicePairing nodeID](self, "nodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MTSDevicePairing fabric](self, "fabric");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fabric");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSDevicePairing uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (MTSDevicePairing)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MTSDevicePairing *v12;
  MTSDevicePairing *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDP.nodeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDP.fabric"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x23493F978]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from nodeID: %@, fabric: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[MTSDevicePairing initWithNodeID:fabric:](self, "initWithNodeID:fabric:", v5, v6);
    v13 = v12;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MTSDevicePairing nodeID](self, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDP.nodeID"));

  -[MTSDevicePairing fabric](self, "fabric");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDP.fabric"));

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairing uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairing nodeID](self, "nodeID", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Node ID"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairing fabric](self, "fabric");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Fabric"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (MTSDevicePairingFabric)fabric
{
  return (MTSDevicePairingFabric *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)deviceType
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_fabric, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)UUIDFromNodeID:(id)a3 fabric:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v5 = a4;
  v11 = objc_msgSend(a3, "integerValue");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v11, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
