@implementation HMDFaceprintModel

- (HMDFaceprintModel)initWithFaceprint:(id)a3
{
  id v4;
  HMDFaceprintModel *v5;
  void *v6;
  void *v7;
  HMDFaceprintModel *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = [HMDFaceprintModel alloc];
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceCropUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v7);

  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceprintModel setData:](v8, "setData:", v9);

  objc_msgSend(v4, "modelUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceprintModel setModelUUID:](v8, "setModelUUID:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D32CA0]);
  objc_msgSend(v4, "faceCropUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithModelID:", v12);
  -[HMDFaceprintModel setFaceCrop:](v8, "setFaceCrop:", v13);

  return v8;
}

- (id)createFaceprint
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDFaceprintModel *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDFaceprintModel data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFaceprintModel modelUUID](self, "modelUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0CBA500]);
    -[HMBModel hmbModelID](self, "hmbModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel hmbParentModelID](self, "hmbParentModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithUUID:data:modelUUID:faceCropUUID:", v7, v3, v5, v8);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v11, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot create faceprint from model: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_134332 != -1)
    dispatch_once(&hmbProperties_onceToken_134332, &__block_literal_global_134333);
  return (id)hmbProperties_properties_134334;
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 1;
}

void __34__HMDFaceprintModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("modelUUID");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("faceCrop");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hmbProperties_properties_134334;
  hmbProperties_properties_134334 = v3;

}

@end
