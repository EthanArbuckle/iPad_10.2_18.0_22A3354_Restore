@implementation MTSDevicePairingFabric

- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 index:(id)a4 displayName:(id)a5 ecosystem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MTSDevicePairingFabric *v15;
  uint64_t v16;
  NSNumber *identifier;
  uint64_t v18;
  NSNumber *index;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  MTSDevicePairingEcosystem *ecosystem;
  uint64_t v24;
  NSUUID *uuid;
  MTSDevicePairingFabric *v27;
  SEL v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v27 = (MTSDevicePairingFabric *)_HMFPreconditionFailure();
    return -[MTSDevicePairingFabric initWithIdentifier:displayName:ecosystem:](v27, v28, v29, v30, v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)MTSDevicePairingFabric;
  v15 = -[MTSDevicePairingFabric init](&v32, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v10, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSNumber *)v16;

    v18 = objc_msgSend(v11, "copy");
    index = v15->_index;
    v15->_index = (NSNumber *)v18;

    v20 = objc_msgSend(v12, "copy");
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    ecosystem = v15->_ecosystem;
    v15->_ecosystem = (MTSDevicePairingEcosystem *)v22;

    +[MTSDevicePairingFabric UUIDFromIdentifier:ecosystem:](MTSDevicePairingFabric, "UUIDFromIdentifier:ecosystem:", v10, v14);
    v24 = objc_claimAutoreleasedReturnValue();
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v24;

  }
  return v15;
}

- (MTSDevicePairingFabric)initWithIdentifier:(id)a3 displayName:(id)a4 ecosystem:(id)a5
{
  return -[MTSDevicePairingFabric initWithIdentifier:index:displayName:ecosystem:](self, "initWithIdentifier:index:displayName:ecosystem:", a3, &unk_2505A0090, a4, a5);
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
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSDevicePairingFabric identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[MTSDevicePairingFabric index](self, "index");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "index");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToNumber:", v10))
      {
        -[MTSDevicePairingFabric displayName](self, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          -[MTSDevicePairingFabric ecosystem](self, "ecosystem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ecosystem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v16, "isEqual:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSDevicePairingFabric identifier](self, "identifier");
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
  id v8;

  v4 = a3;
  -[MTSDevicePairingFabric identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDPF.ck.identifier"));

  -[MTSDevicePairingFabric index](self, "index");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MTSDPF.ck.index"));

  -[MTSDevicePairingFabric displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MTSDPF.ck.displayName"));

  -[MTSDevicePairingFabric ecosystem](self, "ecosystem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MTSDPF.ck.ecosystem"));

}

- (MTSDevicePairingFabric)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v13;
  NSObject *v14;
  void *v15;
  MTSDevicePairingFabric *v16;
  MTSDevicePairingFabric *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPF.ck.identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPF.ck.index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPF.ck.displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDPF.ck.ecosystem"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = (void *)MEMORY[0x23493F978]();
    v16 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544386;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_2344FE000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded identifier: %@ index: %@ displayName: %@ ecosystem: %@", (uint8_t *)&v19, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = 0;
  }
  else
  {
    v16 = -[MTSDevicePairingFabric initWithIdentifier:index:displayName:ecosystem:](self, "initWithIdentifier:index:displayName:ecosystem:", v5, v6, v7, v8);
    v17 = v16;
  }

  return v17;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingFabric identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Identifier"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingFabric index](self, "index");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Index"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingFabric displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Display Name"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[MTSDevicePairingFabric ecosystem](self, "ecosystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Ecosystem"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v16;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (MTSDevicePairingEcosystem)ecosystem
{
  return (MTSDevicePairingEcosystem *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecosystem, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)UUIDFromIdentifier:(id)a3 ecosystem:(id)a4
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
