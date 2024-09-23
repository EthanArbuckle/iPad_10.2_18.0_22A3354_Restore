@implementation MTSSystemCommissionerPairing

- (MTSSystemCommissionerPairing)initWithUUID:(id)a3 nodeID:(id)a4 vendorID:(id)a5 productID:(id)a6 deviceType:(id)a7 serialNumber:(id)a8 name:(id)a9 setupPayload:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MTSSystemCommissionerPairing *v25;
  uint64_t v26;
  NSUUID *uuid;
  uint64_t v28;
  NSNumber *nodeID;
  uint64_t v30;
  NSNumber *vendorID;
  uint64_t v32;
  NSNumber *productID;
  uint64_t v34;
  NSNumber *deviceType;
  uint64_t v36;
  NSString *serialNumber;
  uint64_t v38;
  NSString *name;
  MTSSystemCommissionerPairing *v41;
  SEL v42;
  id v43;
  objc_super v44;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v20)
  {
LABEL_13:
    v41 = (MTSSystemCommissionerPairing *)_HMFPreconditionFailure();
    return (MTSSystemCommissionerPairing *)-[MTSSystemCommissionerPairing isEqual:](v41, v42, v43);
  }
  v24 = v23;
  v44.receiver = self;
  v44.super_class = (Class)MTSSystemCommissionerPairing;
  v25 = -[MTSSystemCommissionerPairing init](&v44, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v16, "copy");
    uuid = v25->_uuid;
    v25->_uuid = (NSUUID *)v26;

    v28 = objc_msgSend(v17, "copy");
    nodeID = v25->_nodeID;
    v25->_nodeID = (NSNumber *)v28;

    v30 = objc_msgSend(v18, "copy");
    vendorID = v25->_vendorID;
    v25->_vendorID = (NSNumber *)v30;

    v32 = objc_msgSend(v19, "copy");
    productID = v25->_productID;
    v25->_productID = (NSNumber *)v32;

    v34 = objc_msgSend(v20, "copy");
    deviceType = v25->_deviceType;
    v25->_deviceType = (NSNumber *)v34;

    v36 = objc_msgSend(v21, "copy");
    serialNumber = v25->_serialNumber;
    v25->_serialNumber = (NSString *)v36;

    v38 = objc_msgSend(v22, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v38;

    objc_storeStrong((id *)&v25->_setupPayload, a10);
  }

  return v25;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSSystemCommissionerPairing uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v20 = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[MTSSystemCommissionerPairing nodeID](self, "nodeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v20 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[MTSSystemCommissionerPairing vendorID](self, "vendorID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendorID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqual:", v12))
    {
      v20 = 0;
LABEL_25:

      goto LABEL_26;
    }
    -[MTSSystemCommissionerPairing productID](self, "productID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqual:"))
    {
      v20 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v26 = v11;
    -[MTSSystemCommissionerPairing deviceType](self, "deviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    if (objc_msgSend(v14, "isEqual:"))
    {
      v25 = v13;
      -[MTSSystemCommissionerPairing serialNumber](self, "serialNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      if (v22)
      {
        -[MTSSystemCommissionerPairing name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = HMFEqualObjects();

        v11 = v26;
        if (v23)
        {
          -[MTSSystemCommissionerPairing setupPayload](self, "setupPayload");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setupPayload");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = HMFEqualObjects();

        }
        else
        {
          v20 = 0;
        }
        v13 = v25;
        goto LABEL_23;
      }
      v20 = 0;
      v13 = v25;
    }
    else
    {
      v20 = 0;
    }
    v11 = v26;
LABEL_23:

    goto LABEL_24;
  }
  v20 = 0;
LABEL_28:

  return v20;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSSystemCommissionerPairing name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MTSSystemCommissionerPairing uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSSCP.uuid"));

  -[MTSSystemCommissionerPairing nodeID](self, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSSCP.nodeID"));

  -[MTSSystemCommissionerPairing vendorID](self, "vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MTSSCP.vendorID"));

  -[MTSSystemCommissionerPairing productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MTSSCP.productID"));

  -[MTSSystemCommissionerPairing deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("MTSSCP.deviceType"));

  -[MTSSystemCommissionerPairing serialNumber](self, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("MTSSCP.serialNumber"));

  -[MTSSystemCommissionerPairing name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("MTSSCP.name"));

  -[MTSSystemCommissionerPairing setupPayload](self, "setupPayload");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("MTSSCP.setupPayload"));

}

- (MTSSystemCommissionerPairing)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTSSystemCommissionerPairing *v14;
  MTSSystemCommissionerPairing *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.nodeID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.vendorID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.productID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.deviceType"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.serialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSSCP.setupPayload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MTSSystemCommissionerPairing initWithUUID:nodeID:vendorID:productID:deviceType:serialNumber:name:setupPayload:](self, "initWithUUID:nodeID:vendorID:productID:deviceType:serialNumber:name:setupPayload:", v5, v6, v7, v8, v10, v11, v12, v13);

    v15 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x23493F978]();
    v14 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v21 = v18;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_2344FE000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uuid: %@, nodeID: %@, vendorID: %@, productID: %@, deviceType: %@", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[9];

  v29[8] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing uuid](self, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v28);
  v29[0] = v27;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing nodeID](self, "nodeID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Node ID"), v26);
  v29[1] = v25;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing vendorID](self, "vendorID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Vendor ID"), v24);
  v29[2] = v23;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing productID](self, "productID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Product ID"), v22);
  v29[3] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Device Type"), v9);
  v29[4] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing serialNumber](self, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Serial Number"), v12);
  v29[5] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Name"), v15);
  v29[6] = v16;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSSystemCommissionerPairing setupPayload](self, "setupPayload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Setup Payload"), v18);
  v29[7] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v20;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)deviceType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
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
