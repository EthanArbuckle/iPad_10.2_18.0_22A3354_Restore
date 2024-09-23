@implementation HMIPersonSourceUUIDPair

- (HMIPersonSourceUUIDPair)initWithPersonUUID:(id)a3 sourceUUID:(id)a4
{
  id v6;
  id v7;
  HMIPersonSourceUUIDPair *v8;
  uint64_t v9;
  NSUUID *personUUID;
  uint64_t v11;
  NSUUID *sourceUUID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIPersonSourceUUIDPair;
  v8 = -[HMIPersonSourceUUIDPair init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    personUUID = v8->_personUUID;
    v8->_personUUID = (NSUUID *)v9;

    v11 = objc_msgSend(v7, "copy");
    sourceUUID = v8->_sourceUUID;
    v8->_sourceUUID = (NSUUID *)v11;

  }
  return v8;
}

- (HMIPersonSourceUUIDPair)initWithUUIDPairString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMIPersonSourceUUIDPair *v11;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    v5 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

    v8 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    v11 = 0;
    if (v7 && v10)
    {
      self = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](self, "initWithPersonUUID:sourceUUID:", v7, v10);
      v11 = self;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)UUIDPairString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[HMIPersonSourceUUIDPair personUUID](self, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[HMIPersonSourceUUIDPair sourceUUID](self, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
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
  -[HMIPersonSourceUUIDPair personUUID](self, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("personUUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIPersonSourceUUIDPair sourceUUID](self, "sourceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("sourceUUID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)personSourceUUIDPairFromPersonLink:(id)a3
{
  id v3;
  HMIPersonSourceUUIDPair *v4;
  void *v5;
  void *v6;
  HMIPersonSourceUUIDPair *v7;

  v3 = a3;
  v4 = [HMIPersonSourceUUIDPair alloc];
  objc_msgSend(v3, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personManagerUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](v4, "initWithPersonUUID:sourceUUID:", v5, v6);
  return v7;
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
    -[HMIPersonSourceUUIDPair personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMIPersonSourceUUIDPair sourceUUID](self, "sourceUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceUUID");
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

  -[HMIPersonSourceUUIDPair personUUID](self, "personUUID");
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
  id v6;

  v4 = a3;
  -[HMIPersonSourceUUIDPair personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIPSUP.ck.p"));

  -[HMIPersonSourceUUIDPair sourceUUID](self, "sourceUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMIPSUP.ck.s"));

}

- (HMIPersonSourceUUIDPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMIPersonSourceUUIDPair *v8;
  HMIPersonSourceUUIDPair *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIPSUP.ck.p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIPSUP.ck.s"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = 0;
      v13 = "%{public}@Could not initialize from decoded personUUID: %@";
LABEL_8:
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x16u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v10);
    v9 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    v10 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = 0;
      v13 = "%{public}@Could not initialize from decoded sourceUUID: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = -[HMIPersonSourceUUIDPair initWithPersonUUID:sourceUUID:](self, "initWithPersonUUID:sourceUUID:", v5, v6);
  v9 = v8;
LABEL_10:

  return v9;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
