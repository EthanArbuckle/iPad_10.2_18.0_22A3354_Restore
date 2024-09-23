@implementation HMPersonFaceCrop

- (HMPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMPersonFaceCrop *v20;
  uint64_t v21;
  NSUUID *personUUID;
  HMPersonFaceCrop *v24;
  SEL v25;
  id v26;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_11:
    v24 = (HMPersonFaceCrop *)_HMFPreconditionFailure();
    return (HMPersonFaceCrop *)-[HMPersonFaceCrop isEqual:](v24, v25, v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)HMPersonFaceCrop;
  v20 = -[HMFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](&v27, sel_initWithUUID_dataRepresentation_dateCreated_faceBoundingBox_, v15, v16, v17, x, y, width, height);
  if (v20)
  {
    v21 = objc_msgSend(v19, "copy");
    personUUID = v20->_personUUID;
    v20->_personUUID = (NSUUID *)v21;

  }
  return v20;
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
  int64_t v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v15.receiver = self,
        v15.super_class = (Class)HMPersonFaceCrop,
        -[HMFaceCrop isEqual:](&v15, sel_isEqual_, v6)))
  {
    -[HMPersonFaceCrop personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (-[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "unassociatedFaceCropUUID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      v12 = -[HMPersonFaceCrop source](self, "source");
      v13 = v12 == objc_msgSend(v6, "source");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutablePersonFaceCrop *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  HMMutablePersonFaceCrop *v17;
  void *v18;

  v4 = +[HMMutablePersonFaceCrop allocWithZone:](HMMutablePersonFaceCrop, "allocWithZone:", a3);
  -[HMFaceCrop UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop dataRepresentation](self, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFaceCrop faceBoundingBox](self, "faceBoundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[HMPersonFaceCrop personUUID](self, "personUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);

  -[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPersonFaceCrop setUnassociatedFaceCropUUID:](v17, "setUnassociatedFaceCropUUID:", v18);

  -[HMPersonFaceCrop setSource:](v17, "setSource:", -[HMPersonFaceCrop source](self, "source"));
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMPersonFaceCrop;
  v4 = a3;
  -[HMFaceCrop encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMPersonFaceCrop personUUID](self, "personUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMPFC.ck.pu"));

  -[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMPFC.ck.ufcu"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMPersonFaceCrop source](self, "source"), CFSTR("HMPFC.ck.s"));
}

- (HMPersonFaceCrop)initWithCoder:(id)a3
{
  id v4;
  HMFaceCrop *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMPersonFaceCrop *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMFaceCrop initWithCoder:]([HMFaceCrop alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMPFC.ck.pu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMPFC.ck.ufcu"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMPFC.ck.s"));
    if (v6)
    {
      v9 = v8;
      -[HMFaceCrop UUID](v5, "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFaceCrop dataRepresentation](v5, "dataRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFaceCrop dateCreated](v5, "dateCreated");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFaceCrop faceBoundingBox](v5, "faceBoundingBox");
      self = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v11, v12, v6);

      -[HMPersonFaceCrop setUnassociatedFaceCropUUID:](self, "setUnassociatedFaceCropUUID:", v7);
      -[HMPersonFaceCrop setSource:](self, "setSource:", v9);
      v13 = self;
    }
    else
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC](v8);
      self = self;
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
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HMPersonFaceCrop;
  -[HMFaceCrop attributeDescriptions](&v17, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMPersonFaceCrop personUUID](self, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Person UUID"), v6);
  objc_msgSend(v4, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  HMStringFromPersonFaceCropSource(-[HMPersonFaceCrop source](self, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Source"), v9);
  objc_msgSend(v4, "addObject:", v10);

  -[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMPersonFaceCrop unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Unassociated Face Crop UUID"), v13);
    objc_msgSend(v4, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)unassociatedFaceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnassociatedFaceCropUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unassociatedFaceCropUUID, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
