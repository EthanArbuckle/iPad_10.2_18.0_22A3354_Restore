@implementation HMBModelReference

- (HMBModelReference)initWithModelID:(id)a3
{
  id v5;
  HMBModelReference *v6;
  HMBModelReference *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBModelReference;
  v6 = -[HMBModelReference init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hmbModelID, a3);

  return v7;
}

- (void)associateWithContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBModelReference *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  -[HMBModelReference localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "localZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMBModelReference setLocalZone:](self, "setLocalZone:", v7);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17B6230]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v11;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Local zone for associated container is nil: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (id)isValidForContainer:(id)a3 updatedModelIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMBModelReference *v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  HMBModelReference *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "localZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModelReference hmbModelID](self, "hmbModelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v11, "fetchRecordRowWithModelID:returning:error:", v12, 0, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    v10 = 0;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1D17B6230]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v18;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot validate reference %@ because the referenced model can't be found: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)referencedModelFromLocalZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (v6 || (-[HMBModelReference localZone](self, "localZone"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[HMBModelReference hmbModelID](self, "hmbModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchModelWithModelID:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMBModelReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMBModelReference *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMB.m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMBModelReference initWithModelID:](self, "initWithModelID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMB.m"));

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Model ID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
}

- (NSUUID)hmbModelID
{
  return self->_hmbModelID;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_loadWeakRetained((id *)&self->_localZone);
}

- (void)setLocalZone:(id)a3
{
  objc_storeWeak((id *)&self->_localZone, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_hmbModelID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hmbEncodeQueryableParameter:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hmbModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hmbDecodeQueryableParameter:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDFromData:", a3);
}

+ (id)hmbDescriptionForEncodedQueryableVariable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "hmbUUIDFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "hmbDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<MALFORMED UUID: %@>"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, a5);
}

@end
