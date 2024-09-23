@implementation HMMTRPairing

- (HMMTRPairing)initWithNodeID:(id)a3 fabricID:(id)a4 fabricLabel:(id)a5 rootPublicKey:(id)a6 vendorID:(id)a7 vendorName:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMMTRPairing *v21;
  HMMTRPairing *v22;
  HMMTRPairing *v24;
  SEL v25;
  id v26;
  id v27;
  id obj;
  id v29;
  id v30;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v30 = a5;
  v17 = a6;
  obj = a7;
  v18 = a7;
  v29 = a8;
  v19 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_13:
    v24 = (HMMTRPairing *)_HMFPreconditionFailure();
    return -[HMMTRPairing initWithFabricDescriptor:vendorName:](v24, v25, v26, v27);
  }
  v31.receiver = self;
  v31.super_class = (Class)HMMTRPairing;
  v21 = -[HMMTRPairing init](&v31, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_nodeID, a3);
    objc_storeStrong((id *)&v22->_fabricLabel, a5);
    objc_storeStrong((id *)&v22->_fabricID, a4);
    objc_storeStrong((id *)&v22->_rootPublicKey, a6);
    objc_storeStrong((id *)&v22->_vendorID, obj);
    objc_storeStrong((id *)&v22->_vendorName, v29);
  }

  return v22;
}

- (HMMTRPairing)initWithFabricDescriptor:(id)a3 vendorName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRPairing *v14;
  HMMTRPairing *v16;
  SEL v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    objc_msgSend(v6, "nodeId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fabricId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootPublicKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vendorId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMMTRPairing initWithNodeID:fabricID:fabricLabel:rootPublicKey:vendorID:vendorName:](self, "initWithNodeID:fabricID:fabricLabel:rootPublicKey:vendorID:vendorName:", v9, v10, v11, v12, v13, v8);

    return v14;
  }
  else
  {
    v16 = (HMMTRPairing *)_HMFPreconditionFailure();
    return (HMMTRPairing *)-[HMMTRPairing isEqual:](v16, v17, v18);
  }
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMMTRPairing nodeID](self, "nodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMMTRPairing fabricID](self, "fabricID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToNumber:", v10))
      {
        -[HMMTRPairing fabricLabel](self, "fabricLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fabricLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          -[HMMTRPairing rootPublicKey](self, "rootPublicKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "rootPublicKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v13;
          if (objc_msgSend(v13, "isEqualToData:", v23))
          {
            -[HMMTRPairing vendorID](self, "vendorID");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "vendorID");
            v15 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v14;
            v16 = (void *)v14;
            v17 = (void *)v15;
            if (objc_msgSend(v16, "isEqualToNumber:", v15))
            {
              -[HMMTRPairing vendorName](self, "vendorName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "vendorName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v21, "isEqualToString:", v20);

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRPairing nodeID](self, "nodeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  _QWORD v28[8];

  v28[7] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing nodeID](self, "nodeID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Node ID"), v27);
  v28[0] = v26;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing fabricID](self, "fabricID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Fabric ID"), v25);
  v28[1] = v24;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing fabricLabel](self, "fabricLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Fabric Label"), v23);
  v28[2] = v22;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing rootPublicKey](self, "rootPublicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Root Public Key"), v7);
  v28[3] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[HMMTRPairing rootPublicKey](self, "rootPublicKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Root Public Key (Hash)"), v12);
  v28[4] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing vendorID](self, "vendorID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Vendor ID"), v15);
  v28[5] = v16;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRPairing vendorName](self, "vendorName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Vendor Name"), v18);
  v28[6] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)fabricLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_fabricLabel, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

@end
