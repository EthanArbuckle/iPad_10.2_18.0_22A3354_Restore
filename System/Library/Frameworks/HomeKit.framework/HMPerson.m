@implementation HMPerson

- (HMPerson)initWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMPerson *v6;
  uint64_t v7;
  NSUUID *UUID;
  uint64_t v9;
  NSSet *personLinks;
  HMPerson *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v15.receiver = self;
    v15.super_class = (Class)HMPerson;
    v6 = -[HMPerson init](&v15, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      UUID = v6->_UUID;
      v6->_UUID = (NSUUID *)v7;

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = objc_claimAutoreleasedReturnValue();
      personLinks = v6->_personLinks;
      v6->_personLinks = (NSSet *)v9;

    }
    return v6;
  }
  else
  {
    v12 = (HMPerson *)_HMFPreconditionFailure();
    return (HMPerson *)-[HMPerson isEqual:](v12, v13, v14);
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
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMPerson UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (-[HMPerson name](self, "name"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "name"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      -[HMPerson personLinks](self, "personLinks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personLinks");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToSet:", v13))
      {
        -[HMPerson externalPersonUUID](self, "externalPersonUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "externalPersonUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = HMFEqualObjects();

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMPerson UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutablePerson *v4;
  void *v5;
  HMMutablePerson *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = +[HMMutablePerson allocWithZone:](HMMutablePerson, "allocWithZone:", a3);
  -[HMPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMPerson initWithUUID:](v4, "initWithUUID:", v5);

  -[HMPerson name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setName:](v6, "setName:", v7);

  -[HMPerson personLinks](self, "personLinks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setPersonLinks:](v6, "setPersonLinks:", v8);

  -[HMPerson externalPersonUUID](self, "externalPersonUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPerson setExternalPersonUUID:](v6, "setExternalPersonUUID:", v9);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMP.ck.u"));

  -[HMPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMP.ck.n"));

  -[HMPerson personLinks](self, "personLinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMP.ck.pl"));

  -[HMPerson externalPersonUUID](self, "externalPersonUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMP.ck.epu"));

}

- (HMPerson)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMPerson *v12;
  HMPerson *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMP.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMP.ck.n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMP.ck.pl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMP.ck.epu"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = -[HMPerson initWithUUID:](self, "initWithUUID:", v5);
    -[HMPerson setName:](v12, "setName:", v6);
    -[HMPerson setPersonLinks:](v12, "setPersonLinks:", v10);
    -[HMPerson setExternalPersonUUID:](v12, "setExternalPersonUUID:", v11);
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = 0;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
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
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMPerson UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMPerson name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMPerson name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithName:value:options:formatter:", CFSTR("name"), v9, 0, v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMPerson personLinks](self, "personLinks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMPerson personLinks](self, "personLinks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("personLinks"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  -[HMPerson externalPersonUUID](self, "externalPersonUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMPerson externalPersonUUID](self, "externalPersonUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("External Person UUID"), v19);
    objc_msgSend(v3, "addObject:", v20);

  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v21;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSSet)personLinks
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersonLinks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSUUID)externalPersonUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternalPersonUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPersonUUID, 0);
  objc_storeStrong((id *)&self->_personLinks, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
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
