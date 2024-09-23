@implementation HMFaceClassification

- (HMFaceClassification)initWithPersonManagerUUID:(id)a3 person:(id)a4 faceCrop:(id)a5
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  HMFaceClassification *v13;
  HMFaceClassification *v14;
  uint64_t v15;
  HMPerson *person;
  uint64_t v17;
  HMFaceCrop *faceCrop;
  HMFaceClassification *v20;
  SEL v21;
  id v22;
  objc_super v23;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v12 = (void *)v11;
  if (!(v10 | v11))
  {
LABEL_7:
    v20 = (HMFaceClassification *)_HMFPreconditionFailure();
    return (HMFaceClassification *)-[HMFaceClassification isEqual:](v20, v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMFaceClassification;
  v13 = -[HMFaceClassification init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personManagerUUID, a3);
    v15 = objc_msgSend((id)v10, "copy");
    person = v14->_person;
    v14->_person = (HMPerson *)v15;

    v17 = objc_msgSend(v12, "copy");
    faceCrop = v14->_faceCrop;
    v14->_faceCrop = (HMFaceCrop *)v17;

  }
  return v14;
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
    -[HMFaceClassification personManagerUUID](self, "personManagerUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personManagerUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (-[HMFaceClassification person](self, "person"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "person"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      -[HMFaceClassification faceCrop](self, "faceCrop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "faceCrop");
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
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMFaceClassification personManagerUUID](self, "personManagerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMFaceClassification person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMFaceClassification faceCrop](self, "faceCrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMFaceClassification personManagerUUID](self, "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMFC.ck.pmu"));

  -[HMFaceClassification person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMFC.ck.p"));

  -[HMFaceClassification faceCrop](self, "faceCrop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMFC.ck.fc"));

}

- (HMFaceClassification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMFaceClassification *v8;
  HMFaceClassification *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.pmu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.p"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.fc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = -[HMFaceClassification initWithPersonManagerUUID:person:faceCrop:](self, "initWithPersonManagerUUID:person:faceCrop:", v5, v6, v7);
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personManagerUUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
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
  id v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMFaceClassification personManagerUUID](self, "personManagerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Person Manager UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  -[HMFaceClassification person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMFaceClassification person](self, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Person"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  -[HMFaceClassification faceCrop](self, "faceCrop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMFaceClassification faceCrop](self, "faceCrop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Face Crop"), v13);
    objc_msgSend(v3, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v15;
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMPerson)person
{
  return (HMPerson *)objc_getProperty(self, a2, 16, 1);
}

- (HMFaceCrop)faceCrop
{
  return (HMFaceCrop *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_personManagerUUID, 0);
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
