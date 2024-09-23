@implementation HMBStreamingAsset

- (HMBStreamingAsset)init
{
  return -[HMBStreamingAsset initWithUploadStreamingAsset:downloadStreamingAsset:](self, "initWithUploadStreamingAsset:downloadStreamingAsset:", 0, 0);
}

- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3
{
  return -[HMBStreamingAsset initWithUploadStreamingAsset:downloadStreamingAsset:](self, "initWithUploadStreamingAsset:downloadStreamingAsset:", a3, 0);
}

- (HMBStreamingAsset)initWithUploadStreamingAsset:(id)a3 downloadStreamingAsset:(id)a4
{
  id v7;
  id v8;
  HMBStreamingAsset *v9;
  HMBStreamingAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBStreamingAsset;
  v9 = -[HMBStreamingAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uploadStreamingAsset, a3);
    objc_storeStrong((id *)&v10->_downloadStreamingAsset, a4);
  }

  return v10;
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

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBStreamingAsset uploadStreamingAsset](self, "uploadStreamingAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Upload Streaming Asset"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBStreamingAsset downloadStreamingAsset](self, "downloadStreamingAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Download Streaming Asset"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMBStreamingAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMBStreamingAsset *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMB.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMB.d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMBStreamingAsset initWithUploadStreamingAsset:downloadStreamingAsset:](self, "initWithUploadStreamingAsset:downloadStreamingAsset:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMBStreamingAsset uploadStreamingAsset](self, "uploadStreamingAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMB.u"));

  -[HMBStreamingAsset downloadStreamingAsset](self, "downloadStreamingAsset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMB.d"));

}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
}

- (id)hmbObjectByMergingFromObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMBStreamingAsset *v11;
  NSObject *v12;
  void *v13;
  id v14;
  HMBStreamingAsset *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "uploadStreamingAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[HMBStreamingAsset uploadStreamingAsset](self, "uploadStreamingAsset");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v9;

    objc_msgSend(v6, "downloadStreamingAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      -[HMBStreamingAsset downloadStreamingAsset](self, "downloadStreamingAsset");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    v15 = -[HMBStreamingAsset initWithUploadStreamingAsset:downloadStreamingAsset:]([HMBStreamingAsset alloc], "initWithUploadStreamingAsset:downloadStreamingAsset:", v16, v20);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v13;
      v24 = 2112;
      v25 = (id)objc_opt_class();
      v26 = 2112;
      v27 = v4;
      v14 = v25;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Asked to merge from unexpected object of class %@: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = v11;
  }

  return v15;
}

- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMBStreamingAsset *v12;
  SEL v13;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    -[HMBStreamingAsset uploadStreamingAsset](self, "uploadStreamingAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95148]), "initWithExpectedSizeBytes:", 1);
    v10 = v9;

    return v10;
  }
  else
  {
    v12 = (HMBStreamingAsset *)_HMFPreconditionFailure();
    return -[HMBStreamingAsset uploadStreamingAsset](v12, v13);
  }
}

- (CKStreamingAsset)uploadStreamingAsset
{
  return self->_uploadStreamingAsset;
}

- (void)setUploadStreamingAsset:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStreamingAsset, a3);
}

- (CKStreamingAsset)downloadStreamingAsset
{
  return self->_downloadStreamingAsset;
}

- (void)setDownloadStreamingAsset:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStreamingAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStreamingAsset, 0);
  objc_storeStrong((id *)&self->_uploadStreamingAsset, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  id v6;
  HMBStreamingAsset *v7;
  HMBStreamingAsset *v8;
  HMBStreamingAsset *v9;
  HMBStreamingAsset *v10;
  HMBStreamingAsset *v11;
  HMBStreamingAsset *v12;
  HMBStreamingAsset *v13;
  HMBStreamingAsset *v14;
  HMBStreamingAsset *v15;

  v6 = a3;
  if (hmbDecodeData_fromStorageLocation_error__onceToken != -1)
    dispatch_once(&hmbDecodeData_fromStorageLocation_error__onceToken, &__block_literal_global_1972);
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", hmbDecodeData_fromStorageLocation_error__allowedClasses, v6, a5);
  v7 = (HMBStreamingAsset *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    v12 = v7;
  }
  else
  {
    v13 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
      v12 = -[HMBStreamingAsset initWithUploadStreamingAsset:downloadStreamingAsset:]([HMBStreamingAsset alloc], "initWithUploadStreamingAsset:downloadStreamingAsset:", v15, v15);
    else
      v12 = 0;

  }
  return v12;
}

+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  HMBStreamingAsset *v19;
  HMBStreamingAsset *v20;
  HMBStreamingAsset *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v16 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      objc_msgSend(v14, "hmbPropertyNamed:", v15);
      v19 = (HMBStreamingAsset *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v19;
      if (!v20)
        v21 = objc_alloc_init(HMBStreamingAsset);
      if (a4 == 4 || a4 == 2)
      {
        -[HMBStreamingAsset setDownloadStreamingAsset:](v21, "setDownloadStreamingAsset:", v18);
      }
      else if (a4 == 1)
      {
        -[HMBStreamingAsset setUploadStreamingAsset:](v21, "setUploadStreamingAsset:", v18);
      }
      objc_msgSend(v14, "hmbSetProperty:named:", v21, v15);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17B6230]();
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hmbDescription");
        v27 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v25;
        v30 = 2112;
        v31 = v16;
        v32 = 2112;
        v33 = v26;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found %@ in CKRecord field for wrapped model value %@/%@ which we expected to be a CKStreamingAsset (ignoring).", buf, 0x2Au);

        v22 = v27;
      }

      objc_autoreleasePoolPop(v22);
    }

  }
  else
  {
    objc_msgSend(v14, "hmbSetProperty:named:", 0, v15);
  }

}

void __61__HMBStreamingAsset_hmbDecodeData_fromStorageLocation_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbDecodeData_fromStorageLocation_error__allowedClasses;
  hmbDecodeData_fromStorageLocation_error__allowedClasses = v2;

}

@end
