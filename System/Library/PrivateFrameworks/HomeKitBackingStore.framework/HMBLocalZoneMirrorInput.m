@implementation HMBLocalZoneMirrorInput

- (BOOL)stageAdditionForModel:(id)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMBLocalZoneMirrorInput *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  HMBLocalZoneMirrorInput *v30;
  NSObject *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17B6230]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmbDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hmbDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v16;
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = v17;
    v41 = 2112;
    v42 = v18;
    _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Staging addition for model: %@ externalID: %@ externalData: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  -[HMBLocalZoneInput localZone](v14, "localZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "modelContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "bestModelEncodingForStorageLocation:", 3);

  -[HMBLocalZoneInput localZone](v14, "localZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "modelContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v23, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v10, v21, 3, 0, &v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v34;

  if (v24)
  {
    -[HMBLocalZoneInput inputBlock](v14, "inputBlock");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateExternalID:externalData:modelEncoding:modelData:", v11, v12, v21, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v27 == 0;
    if (v27)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v27);
    }
    else
    {
      -[HMBLocalZoneInput setStagedChangesCount:](v14, "setStagedChangesCount:", -[HMBLocalZoneInput stagedChangesCount](v14, "stagedChangesCount") + 1);
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17B6230]();
    v30 = v14;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v32;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v25;
      _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    v28 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v25);
  }

  return v28;
}

- (BOOL)stageRemovalForModelWithExternalID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HMBLocalZoneMirrorInput *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmbDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Staging removal for model with external ID: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBLocalZoneInput inputBlock](v8, "inputBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateExternalID:externalData:modelEncoding:modelData:", v6, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }
  else
  {
    -[HMBLocalZoneInput setStagedChangesCount:](v8, "setStagedChangesCount:", -[HMBLocalZoneInput stagedChangesCount](v8, "stagedChangesCount") + 1);
  }

  return v13 == 0;
}

- (id)commitWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  objc_msgSend(v6, "setShouldEnqueueMirrorOutput:", 0);
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalZoneMirrorInput;
  -[HMBLocalZoneInput commitWithOptions:error:](&v9, sel_commitWithOptions_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
