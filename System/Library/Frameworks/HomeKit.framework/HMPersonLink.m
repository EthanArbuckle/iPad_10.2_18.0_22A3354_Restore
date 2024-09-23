@implementation HMPersonLink

- (HMPersonLink)initWithPersonUUID:(id)a3 personManagerUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMPersonLink *v9;
  uint64_t v10;
  NSUUID *personUUID;
  uint64_t v12;
  NSUUID *personManagerUUID;
  HMPersonLink *v15;
  SEL v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMPersonLink *)_HMFPreconditionFailure();
    return (HMPersonLink *)-[HMPersonLink isEqual:](v15, v16, v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMPersonLink;
  v9 = -[HMPersonLink init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    personUUID = v9->_personUUID;
    v9->_personUUID = (NSUUID *)v10;

    v12 = objc_msgSend(v8, "copy");
    personManagerUUID = v9->_personManagerUUID;
    v9->_personManagerUUID = (NSUUID *)v12;

  }
  return v9;
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
    -[HMPersonLink personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMPersonLink personManagerUUID](self, "personManagerUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "personManagerUUID");
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
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMPersonLink personUUID](self, "personUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMPersonLink personManagerUUID](self, "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMPersonLink personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMPL.ck.pu"));

  -[HMPersonLink personManagerUUID](self, "personManagerUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMPL.ck.pmu"));

}

- (HMPersonLink)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMPersonLink *v12;
  HMPersonLink *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMPL.ck.pu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMPL.ck.pmu"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@ personManagerUUID: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMPersonLink initWithPersonUUID:personManagerUUID:](self, "initWithPersonUUID:personManagerUUID:", v5, v6);
    v13 = v12;
  }

  return v13;
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
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMPersonLink personUUID](self, "personUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Person UUID"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMPersonLink personManagerUUID](self, "personManagerUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Person Manager UUID"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personManagerUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
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
