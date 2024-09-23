@implementation HMBModelCloudReference

- (HMBModelCloudReference)initWithModelID:(id)a3 action:(unint64_t)a4
{
  HMBModelCloudReference *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMBModelCloudReference;
  result = -[HMBModelReference initWithModelID:](&v6, sel_initWithModelID_, a3);
  if (result)
    result->_action = a4;
  return result;
}

- (unint64_t)action
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HMBModelCloudReference reference](self, "reference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_action;
  -[HMBModelCloudReference reference](self, "reference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "referenceAction");

  return v5;
}

- (void)associateWithContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  HMBModelCloudReference *v10;
  SEL v11;
  id v12;
  BOOL v13;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)HMBModelCloudReference;
    -[HMBModelReference associateWithContainer:](&v14, sel_associateWithContainer_, v4);
    objc_msgSend(v5, "mirror");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    -[HMBModelCloudReference cloudZone](self, "cloudZone");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = v8;

  }
  else
  {
    v10 = (HMBModelCloudReference *)_HMFPreconditionFailure();
    -[HMBModelCloudReference referencedModelFromCloudZone:allowExternalFetch:](v10, v11, v12, v13);
  }
}

- (id)referencedModelFromCloudZone:(id)a3 allowExternalFetch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  HMBModelCloudReference *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMBModelCloudReference *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMBModelCloudReference *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    -[HMBModelCloudReference cloudZone](self, "cloudZone");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelReference hmbModelID](v9, "hmbModelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v11;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Looking for referenced model %@ in localZone %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v38 = 0;
    -[HMBModelReference referencedModelFromLocalZone:error:](v9, "referencedModelFromLocalZone:error:", v7, &v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v38;
    v15 = v14;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_21;
    }
    if (v14)
    {
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModelReference hmbModelID](v18, "hmbModelID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v20;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching model %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v22 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "futureWithError:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  -[HMBModelCloudReference reference](self, "reference");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "recordID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1D17B6230]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v25 && v4)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelReference hmbModelID](v27, "hmbModelID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelCloudReference reference](v27, "reference");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v30;
      v41 = 2112;
      v42 = v31;
      v43 = 2112;
      v44 = v32;
      _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_INFO, "%{public}@No local model for %@, fetching via CKReference %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    -[HMBModelCloudReference reference](v27, "reference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchCompleteModelForRecordID:", v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelReference hmbModelID](v27, "hmbModelID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v34;
      v41 = 2112;
      v42 = v35;
      _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find referenced model %@, no local model and no CKReference to fetch", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    v36 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "futureWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return v16;
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
  unint64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBModelCloudReference reference](self, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v6, "reference"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      objc_msgSend(v6, "reference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModelCloudReference reference](self, "reference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);
    }
    else
    {
      -[HMBModelReference hmbModelID](self, "hmbModelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmbModelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v12 = -[HMBModelCloudReference action](self, "action");
        v11 = v12 == objc_msgSend(v6, "action");
      }
      else
      {
        v11 = 0;
      }
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
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMBModelCloudReference;
  v3 = -[HMBModelReference hash](&v5, sel_hash);
  return -[HMBModelCloudReference action](self, "action") ^ v3;
}

- (HMBModelCloudReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HMBModelCloudReference *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMB.r"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMB.a"));
  v10.receiver = self;
  v10.super_class = (Class)HMBModelCloudReference;
  v7 = -[HMBModelReference initWithCoder:](&v10, sel_initWithCoder_, v4);

  if (v7)
  {
    -[HMBModelCloudReference setAction:](v7, "setAction:", v6);
    if (v5)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v5, v6);
      -[HMBModelCloudReference setReference:](v7, "setReference:", v8);

    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMBModelCloudReference;
  v4 = a3;
  -[HMBModelReference encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMBModelCloudReference action](self, "action", v7.receiver, v7.super_class), CFSTR("HMB.a"));
  -[HMBModelCloudReference reference](self, "reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMB.r"));

}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMBModelCloudReference;
  -[HMBModelReference attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMBModelCloudReference reference](self, "reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  if (v5)
  {
    -[HMBModelCloudReference reference](self, "reference");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("Reference");
  }
  else
  {
    v9 = -[HMBModelCloudReference action](self, "action");
    if (*MEMORY[0x1E0C94A40] == v9)
    {
      v7 = CFSTR("validate");
    }
    else if (v9)
    {
      if (v9 == 1)
      {
        v7 = CFSTR("delete");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown %lu>"), v9);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("none");
    }
    v8 = CFSTR("Action");
  }
  v10 = (void *)objc_msgSend(v6, "initWithName:value:", v8, v7);
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CKReference *v14;
  CKReference *reference;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  HMBModelCloudReference *v23;
  NSObject *v24;
  void *v25;
  void *v27;
  HMBModelCloudReference *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  v7 = v6;
  objc_opt_class();
  v8 = objc_opt_isKindOfClass() & 1;
  if (v8)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (!v8)
LABEL_24:
    _HMFPreconditionFailure();
  objc_msgSend(v7, "createdRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelReference hmbModelID](self, "hmbModelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[HMBModelReference localZone](self, "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModelReference hmbModelID](self, "hmbModelID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v17, "externalIDForModelID:error:", v18, &v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v34;

    if (v19)
    {
      v33 = v20;
      objc_msgSend(MEMORY[0x1E0C95070], "recordIDFromExternalID:error:", v19, &v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v33;

      if (!v21)
      {

        goto LABEL_7;
      }
      v20 = v21;
      v22 = (void *)MEMORY[0x1D17B6230]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v25;
        v37 = 2112;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode CKRecordID from external ID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      if (!a4)
      {
LABEL_14:

        v16 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v27 = (void *)MEMORY[0x1D17B6230]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModelReference hmbModelID](v28, "hmbModelID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUIDString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v30;
        v37 = 2112;
        v38 = v32;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine CKRecordID for model ID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      v13 = 0;
      if (!a4)
        goto LABEL_14;
    }
    v20 = objc_retainAutorelease(v20);
    *a4 = v20;
    goto LABEL_14;
  }
LABEL_7:
  v14 = (CKReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v13, -[HMBModelCloudReference action](self, "action"));
  reference = self->_reference;
  self->_reference = v14;

  -[HMBModelCloudReference reference](self, "reference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v16;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (CKReference)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_reference, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)includeInModelEncoding
{
  return 1;
}

+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v13, "hmbPropertyNamed:", v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    v54 = a1;
    if (v20)
    {
      v49 = v18;
      v51 = v14;
      v52 = v12;
      v53 = v13;
      objc_msgSend(v20, "associateWithContainer:", v12);
      v50 = v17;
      objc_msgSend(v17, "recordID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "zoneID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "zoneName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reference");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "zoneID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "zoneName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v23, "isEqualToString:", v27);

      if ((v28 & 1) != 0)
      {
        v13 = v53;
        v14 = v51;
        objc_msgSend(v53, "hmbSetProperty:named:", v20, v51);

        v12 = v52;
        v17 = v50;
        goto LABEL_22;
      }
      v36 = (void *)MEMORY[0x1D17B6230]();
      v41 = v54;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      v13 = v53;
      v14 = v51;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "hmbDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v50;
        objc_msgSend(v50, "hmbDescription");
        v48 = v36;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "reference");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "hmbDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v56 = v42;
        v57 = 2112;
        v58 = v43;
        v59 = 2112;
        v60 = v51;
        v61 = 2112;
        v62 = v44;
        v63 = 2112;
        v64 = v46;
        _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Received CKRecord with a HMBModelCloudReference field (%@/%@) where zone name for reference stored in the CKRecord field does not match the zone name in the HMBModel field (%@!=%@)", buf, 0x34u);

        v13 = v53;
        v36 = v48;

        v12 = v52;
      }
      else
      {
        v12 = v52;
        v17 = v50;
      }
      v18 = v49;
    }
    else
    {
      v36 = (void *)MEMORY[0x1D17B6230]();
      v37 = a1;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hmbDescription");
        v47 = v36;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v39;
        v57 = 2112;
        v58 = v40;
        v59 = 2112;
        v60 = v14;
        v61 = 2112;
        v62 = v15;
        _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Received CKRecord with a HMBModelCloudReference field (%@/%@) where the corresponding CKRecord field is not set or not of the expected type (got %@)", buf, 0x2Au);

        v36 = v47;
      }
    }

    objc_autoreleasePoolPop(v36);
    goto LABEL_22;
  }
  if (v15)
  {
    v29 = v14;
    v30 = (void *)MEMORY[0x1D17B6230]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hmbDescription");
      v34 = v13;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v56 = v33;
      v57 = 2112;
      v58 = v15;
      v59 = 2112;
      v60 = v35;
      v61 = 2112;
      v62 = v29;
      _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found %@ in CKRecord field for wrapped model value %@/%@ which we expected to be a CKReference (ignoring).", buf, 0x2Au);

      v13 = v34;
      v17 = 0;

    }
    objc_autoreleasePoolPop(v30);
    v14 = v29;
  }
LABEL_22:

}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, a5);
}

@end
