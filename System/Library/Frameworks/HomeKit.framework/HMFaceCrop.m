@implementation HMFaceCrop

- (HMFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMFaceCrop *v17;
  uint64_t v18;
  NSUUID *UUID;
  uint64_t v20;
  NSData *dataRepresentation;
  HMFaceCrop *v23;
  SEL v24;
  id v25;
  objc_super v26;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v23 = (HMFaceCrop *)_HMFPreconditionFailure();
    return (HMFaceCrop *)-[HMFaceCrop isEqual:](v23, v24, v25);
  }
  v26.receiver = self;
  v26.super_class = (Class)HMFaceCrop;
  v17 = -[HMFaceCrop init](&v26, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    UUID = v17->_UUID;
    v17->_UUID = (NSUUID *)v18;

    v20 = objc_msgSend(v14, "copy");
    dataRepresentation = v17->_dataRepresentation;
    v17->_dataRepresentation = (NSData *)v20;

    objc_storeStrong((id *)&v17->_dateCreated, a5);
    v17->_faceBoundingBox.origin.x = x;
    v17->_faceBoundingBox.origin.y = y;
    v17->_faceBoundingBox.size.width = width;
    v17->_faceBoundingBox.size.height = height;
  }

  return v17;
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
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  NSRect v27;
  NSRect v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMFaceCrop UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMFaceCrop dataRepresentation](self, "dataRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToData:", v10))
      {
        -[HMFaceCrop dateCreated](self, "dateCreated");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateCreated");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToDate:", v12))
        {
          -[HMFaceCrop faceBoundingBox](self, "faceBoundingBox");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;
          objc_msgSend(v6, "faceBoundingBox");
          v28.origin.x = v21;
          v28.origin.y = v22;
          v28.size.width = v23;
          v28.size.height = v24;
          v27.origin.x = v14;
          v27.origin.y = v16;
          v27.size.width = v18;
          v27.size.height = v20;
          v25 = NSEqualRects(v27, v28);
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFaceCrop UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMFaceCrop UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("HMFC.ck.u"));

  -[HMFaceCrop dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HMFC.ck.dr"));

  -[HMFaceCrop dateCreated](self, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("HMFC.ck.dc"));

  -[HMFaceCrop faceBoundingBox](self, "faceBoundingBox");
  objc_msgSend(v7, "encodeRect:forKey:", CFSTR("HMFC.ck.fbb"));

}

- (HMFaceCrop)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  HMFaceCrop *v14;
  HMFaceCrop *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.dr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFC.ck.dc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeRectForKey:", CFSTR("HMFC.ck.fbb"));
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC](v8);
    v14 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ dataRepresentation: %@ dateCreated: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    v14 = -[HMFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7);
    v15 = v14;
  }

  return v15;
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
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSRect v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMFaceCrop UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMFaceCrop dataRepresentation](self, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Data Representation Length"), v10);
  objc_msgSend(v3, "addObject:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMFaceCrop dateCreated](self, "dateCreated");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Date Created"), v13);
  objc_msgSend(v3, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMFaceCrop faceBoundingBox](self, "faceBoundingBox");
  NSStringFromRect(v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Face Bounding Box"), v16);
  objc_msgSend(v3, "addObject:", v17);

  v18 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v18;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (CGRect)faceBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
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
