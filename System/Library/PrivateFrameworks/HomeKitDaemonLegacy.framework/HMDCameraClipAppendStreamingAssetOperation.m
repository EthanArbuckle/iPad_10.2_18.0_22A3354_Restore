@implementation HMDCameraClipAppendStreamingAssetOperation

- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraClipOperationDataSource *v17;
  HMDCameraClipAppendStreamingAssetOperation *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(HMDCameraClipOperationDataSource);
  v18 = -[HMDCameraClipAppendStreamingAssetOperation initWithClipModelID:localZone:data:metadata:encryptionManager:dataSource:](self, "initWithClipModelID:localZone:data:metadata:encryptionManager:dataSource:", v16, v15, v14, v13, v12, v17);

  return v18;
}

- (HMDCameraClipAppendStreamingAssetOperation)initWithClipModelID:(id)a3 localZone:(id)a4 data:(id)a5 metadata:(id)a6 encryptionManager:(id)a7 dataSource:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMDCameraClipAppendStreamingAssetOperation *v21;
  HMDCameraClipAppendStreamingAssetOperation *v22;
  HMDCameraClipAppendStreamingAssetOperation *result;
  HMDCameraClipAppendStreamingAssetOperation *v24;
  SEL v25;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_15:
    v24 = (HMDCameraClipAppendStreamingAssetOperation *)_HMFPreconditionFailure();
    -[HMDCameraClipAppendStreamingAssetOperation main](v24, v25);
    return result;
  }
  v26.receiver = self;
  v26.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  v21 = -[HMDCameraClipOperation initWithClipModelID:localZone:dataSource:](&v26, sel_initWithClipModelID_localZone_dataSource_, v14, v15, v19);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_data, a5);
    objc_storeStrong((id *)&v22->_metadata, a6);
    objc_storeStrong((id *)&v22->_encryptionManager, a7);
  }

  return v22;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  -[HMDCameraClipOperation main](&v15, sel_main);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__119422;
  v13[4] = __Block_byref_object_dispose__119423;
  v14 = 0;
  -[HMDCameraClipOperation fetchClipModel](self, "fetchClipModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke;
  v12[3] = &unk_1E89B4968;
  v12[4] = self;
  v12[5] = v13;
  objc_msgSend(v3, "flatMap:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_22;
  v11[3] = &unk_1E89B4990;
  v11[4] = self;
  v11[5] = v13;
  objc_msgSend(v5, "flatMap:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_24;
  v10[3] = &unk_1E89C21E8;
  v10[4] = self;
  objc_msgSend(v6, "addSuccessBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_26;
  v9[3] = &unk_1E89C2350;
  v9[4] = self;
  v8 = (id)objc_msgSend(v7, "addFailureBlock:", v9);

  _Block_object_dispose(v13, 8);
}

- (void)finish
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  -[HMDCameraClipOperation finish](&v3, sel_finish);
  -[HMDCameraClipAppendStreamingAssetOperation setRetryTimer:](self, "setRetryTimer:", 0);
}

- (void)cancelWithError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  -[HMDCameraClipOperation cancelWithError:](&v4, sel_cancelWithError_, a3);
  -[HMDCameraClipAppendStreamingAssetOperation setRetryTimer:](self, "setRetryTimer:", 0);
}

- (id)_updateClipModel:(id)a3 usingStreamingAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraClipAppendStreamingAssetOperation *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D32CF8]), "initWithUploadStreamingAsset:", v7);
  objc_msgSend((id)objc_opt_class(), "streamingAssetPropertyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmbSetProperty:named:", v8, v9);

  -[HMDCameraClipAppendStreamingAssetOperation metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "hasDuration");

  if ((_DWORD)v9)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "duration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    -[HMDCameraClipAppendStreamingAssetOperation metadata](self, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "duration");
    objc_msgSend(v11, "numberWithDouble:", v14 + v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", v17);

  }
  objc_msgSend((id)objc_opt_class(), "metadataPropertyName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmbPropertyNamed:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v21 = (void *)v19;
  v22 = v21;

  -[HMDCameraClipAppendStreamingAssetOperation metadata](self, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayByAddingObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "metadataPropertyName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmbSetProperty:named:", v25, v26);

  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v30;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Submitting clip model update", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v27);
  -[HMDCameraClipOperation updateClipModel:](v28, "updateClipModel:", v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __83__HMDCameraClipAppendStreamingAssetOperation__updateClipModel_usingStreamingAsset___block_invoke;
  v34[3] = &unk_1E89BE5C0;
  v34[4] = v28;
  objc_msgSend(v31, "flatMap:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)_retryDelayForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "shouldRetry")
    && (objc_msgSend(v3, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]),
        v4,
        v5))
  {
    v6 = objc_msgSend(v3, "code");
    v7 = &unk_1E8B36BE8;
    if (v6 != 34 && v6 != 121)
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x1E0C94808]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDCameraClipAppendStreamingAssetOperation *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipAppendStreamingAssetOperation retryTimer](self, "retryTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 == v4)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Retry timer fired for append", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraClipAppendStreamingAssetOperation setRetryTimer:](v7, "setRetryTimer:", 0);
    -[HMDCameraClipAppendStreamingAssetOperation main](v7, "main");
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Operation timed out, cancelling", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipAppendStreamingAssetOperation cancelWithError:](v7, "cancelWithError:", v11);

  }
}

- (id)attributeDescriptions
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
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraClipAppendStreamingAssetOperation;
  -[HMDCameraClipOperation attributeDescriptions](&v14, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipAppendStreamingAssetOperation data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Data"), v6);
  v15[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraClipAppendStreamingAssetOperation metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Metadata"), v9);
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 376, 1);
}

- (HMDCameraClipSegmentMetadata)metadata
{
  return (HMDCameraClipSegmentMetadata *)objc_getProperty(self, a2, 384, 1);
}

- (HMCameraClipEncryptionManager)encryptionManager
{
  return (HMCameraClipEncryptionManager *)objc_getProperty(self, a2, 392, 1);
}

- (HMFTimer)retryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 400, 1);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

id __83__HMDCameraClipAppendStreamingAssetOperation__updateClipModel_usingStreamingAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mirrorOutputResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "mirrorOutputResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult available for clip update, failing operation", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend((id)objc_opt_class(), "streamingAssetPropertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbPropertyNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v35 = v4;
    objc_msgSend(v9, "uploadStreamingAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "encryptionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encryptedDataContextFromData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dataRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "bytesUploaded");
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setByteOffset:", v15);

    v17 = objc_msgSend(v14, "length");
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setByteLength:", v17);

    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v22;
      v38 = 2048;
      v39 = objc_msgSend(v14, "length");
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Appending %lu bytes of data to streaming asset", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v23 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95150]), "initWithStreamingAsset:", v10);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "completionHandlerAdapter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendData:toStreamingAssetAppendContext:completion:", v14, v24, v26);

    v4 = v35;
  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "streamingAssetPropertyName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v30;
      v38 = 2112;
      v39 = (uint64_t)v31;
      v40 = 2112;
      v41 = (id)objc_opt_class();
      v42 = 2112;
      v43 = v7;
      v32 = v41;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Property \"%@\" was of unexpected class %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    v33 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "futureWithError:", v10);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

id __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully appended to streaming asset", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateClipModel:usingStreamingAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully updated clip model with updated streaming asset", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

void __50__HMDCameraClipAppendStreamingAssetOperation_main__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v7;
    v29 = 2112;
    v30 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to append to streaming asset: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_retryDelayForError:", v3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "uploadOperationEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRetryCount:", objc_msgSend(v10, "retryCount") + 1);

    objc_msgSend(v9, "doubleValue");
    if (v11 < 0.5)
    {

      v9 = &unk_1E8B36BE8;
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v15;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Retrying failed append in %@ seconds", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v16, "timerWithTimeInterval:options:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRetryTimer:", v17);

    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "retryTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v18);

    objc_msgSend(*(id *)(a1 + 32), "underlyingQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "retryTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegateQueue:", v20);

    objc_msgSend(*(id *)(a1 + 32), "retryTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resume");

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to retry append operation, canceling", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);
  }

}

+ (NSString)streamingAssetPropertyName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (NSString)metadataPropertyName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (BOOL)shouldRetry
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_119458 != -1)
    dispatch_once(&logCategory__hmf_once_t12_119458, &__block_literal_global_119459);
  return (id)logCategory__hmf_once_v13_119460;
}

void __57__HMDCameraClipAppendStreamingAssetOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_119460;
  logCategory__hmf_once_v13_119460 = v0;

}

@end
