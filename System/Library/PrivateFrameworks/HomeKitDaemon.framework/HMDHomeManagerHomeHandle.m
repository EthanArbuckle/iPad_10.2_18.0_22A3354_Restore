@implementation HMDHomeManagerHomeHandle

- (HMDHomeManagerHomeHandle)initWithBackingStoreUUID:(id)a3 homeUUID:(id)a4
{
  id v7;
  id v8;
  HMDHomeManagerHomeHandle *v9;
  HMDHomeManagerHomeHandle *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeManagerHomeHandle;
  v9 = -[HMDHomeManagerHomeHandle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreUUID, a3);
    objc_storeStrong((id *)&v10->_homeUUID, a4);
  }

  return v10;
}

- (HMDHomeManagerHomeHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeManagerHomeHandle *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHH.b"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMHH.h"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDHomeManagerHomeHandle initWithBackingStoreUUID:homeUUID:](self, "initWithBackingStoreUUID:homeUUID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMHH.b"));

  -[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMHH.h"));

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@,%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHomeHandle homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("homeUUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeManagerHomeHandle backingStoreUUID](self, "backingStoreUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("backingStoreUUID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)backingStoreUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_backingStoreUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
