@implementation HMIPerson

- (HMIPerson)initWithUUID:(id)a3 name:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMIPerson *v10;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMIPerson initWithUUID:name:personLinks:](self, "initWithUUID:name:personLinks:", v8, v7, v9);

  return v10;
}

- (HMIPerson)initWithUUID:(id)a3 name:(id)a4 personLinks:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMIPerson *v12;
  uint64_t v13;
  NSUUID *UUID;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSSet *personLinks;
  HMIPerson *v20;
  SEL v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v10;
    v22.receiver = self;
    v22.super_class = (Class)HMIPerson;
    v12 = -[HMIPerson init](&v22, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v8, "copy");
      UUID = v12->_UUID;
      v12->_UUID = (NSUUID *)v13;

      v15 = objc_msgSend(v9, "copy");
      name = v12->_name;
      v12->_name = (NSString *)v15;

      v17 = objc_msgSend(v11, "copy");
      personLinks = v12->_personLinks;
      v12->_personLinks = (NSSet *)v17;

    }
    return v12;
  }
  else
  {
    v20 = (HMIPerson *)_HMFPreconditionFailure();
    return (HMIPerson *)-[HMIPerson attributeDescriptions](v20, v21);
  }
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIPerson UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIPerson name](self, "name", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("name"), v7, 2, v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIPerson personLinks](self, "personLinks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("personLinks"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)personFromHomePerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMIPerson *v6;
  void *v7;
  void *v8;
  HMIPerson *v9;

  v3 = a3;
  objc_msgSend(v3, "personLinks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HMIPerson alloc];
  objc_msgSend(v3, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMIPerson initWithUUID:name:personLinks:](v6, "initWithUUID:name:personLinks:", v7, v8, v5);
  return v9;
}

id __34__HMIPerson_personFromHomePerson___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMIPersonSourceUUIDPair personSourceUUIDPairFromPersonLink:](HMIPersonSourceUUIDPair, "personSourceUUIDPairFromPersonLink:", a2);
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
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMIPerson UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (-[HMIPerson name](self, "name"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "name"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      -[HMIPerson personLinks](self, "personLinks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personLinks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

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

  -[HMIPerson UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMIPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIP.ck.u"));

  -[HMIPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIP.ck.n"));

  -[HMIPerson personLinks](self, "personLinks");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMIP.ck.pl"));

}

- (HMIPerson)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMIPerson *v11;
  HMIPerson *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIP.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIP.ck.n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMIP.ck.pl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = -[HMIPerson initWithUUID:name:personLinks:](self, "initWithUUID:name:personLinks:", v5, v6, v10);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x220735570]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)personLinks
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLinks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
