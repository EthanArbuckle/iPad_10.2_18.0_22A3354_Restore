@implementation HMIPersonFaceCrop

- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7
{
  return -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", a3, a4, a5, a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7 source:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMIPersonFaceCrop *v22;
  uint64_t v23;
  NSUUID *personUUID;
  HMIPersonFaceCrop *v26;
  SEL v27;
  objc_super v28;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v18)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v19)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v21 = v20;
  if (!v20)
  {
LABEL_11:
    v26 = (HMIPersonFaceCrop *)_HMFPreconditionFailure();
    return (HMIPersonFaceCrop *)-[HMIPersonFaceCrop attributeDescriptions](v26, v27);
  }
  v28.receiver = self;
  v28.super_class = (Class)HMIPersonFaceCrop;
  v22 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](&v28, sel_initWithUUID_dataRepresentation_dateCreated_faceBoundingBox_, v17, v18, v19, x, y, width, height);
  if (v22)
  {
    v23 = objc_msgSend(v21, "copy");
    personUUID = v22->_personUUID;
    v22->_personUUID = (NSUUID *)v23;

    v22->_source = a8;
  }

  return v22;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMIPersonFaceCrop;
  -[HMIFaceCrop attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIPersonFaceCrop personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Person UUID"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  HMIPersonFaceCropSourceAsString(-[HMIPersonFaceCrop source](self, "source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Source"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)HMIPersonFaceCrop,
        -[HMIFaceCrop isEqual:](&v12, sel_isEqual_, v6)))
  {
    -[HMIPersonFaceCrop personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = -[HMIPersonFaceCrop source](self, "source");
      v10 = v9 == objc_msgSend(v6, "source");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIPersonFaceCrop;
  v4 = a3;
  -[HMIFaceCrop encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMIPersonFaceCrop personUUID](self, "personUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMIFC.ck.pu"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMIPersonFaceCrop source](self, "source"), CFSTR("HMIFC.ck.so"));
}

- (HMIPersonFaceCrop)initWithCoder:(id)a3
{
  id v4;
  HMIFaceCrop *v5;
  void *v6;
  uint64_t v7;
  HMIPersonFaceCrop *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMIFaceCrop initWithCoder:]([HMIFaceCrop alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.ck.pu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMIFC.ck.so")))
        v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMIFC.ck.so"));
      else
        v7 = 0;
      -[HMIFaceCrop UUID](v5, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceCrop dataRepresentation](v5, "dataRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceCrop dateCreated](v5, "dateCreated");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIFaceCrop faceBoundingBox](v5, "faceBoundingBox");
      self = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v12, v13, v14, v6, v7);

      v8 = self;
    }
    else
    {
      v9 = (void *)MEMORY[0x220735570]();
      self = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v11;
        v18 = 2112;
        v19 = 0;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
}

@end
