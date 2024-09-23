@implementation HMDCameraSignificantEventFaceClassificationModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_137157 != -1)
    dispatch_once(&hmbProperties_onceToken_137157, &__block_literal_global_137158);
  return (id)hmbProperties__properties_137159;
}

+ (id)hmbExternalRecordType
{
  return CFSTR("CameraClip");
}

void __65__HMDCameraSignificantEventFaceClassificationModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4ED08], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setLoggingVisibility:", 1);
  v8[0] = CFSTR("personManagerUUID");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("personName");
  v4 = (void *)objc_msgSend(v1, "copy");
  v9[2] = v4;
  v8[3] = CFSTR("unassociatedFaceCropUUID");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)hmbProperties__properties_137159;
  hmbProperties__properties_137159 = v6;

}

- (id)createFaceClassification
{
  void *v3;
  HMDMutableCameraSignificantEventFaceClassification *v4;
  void *v5;
  HMDMutableCameraSignificantEventFaceClassification *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraSignificantEventFaceClassificationModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraSignificantEventFaceClassificationModel personManagerUUID](self, "personManagerUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HMDMutableCameraSignificantEventFaceClassification alloc];
    -[HMBModel hmbModelID](self, "hmbModelID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMDCameraSignificantEventFaceClassification initWithUUID:personManagerUUID:](v4, "initWithUUID:personManagerUUID:", v5, v3);

    -[HMDCameraSignificantEventFaceClassificationModel personUUID](self, "personUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setPersonUUID:](v6, "setPersonUUID:", v7);

    -[HMDCameraSignificantEventFaceClassificationModel personName](self, "personName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setPersonName:](v6, "setPersonName:", v8);

    -[HMDCameraSignificantEventFaceClassificationModel unassociatedFaceCropUUID](self, "unassociatedFaceCropUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSignificantEventFaceClassification setUnassociatedFaceCropUUID:](v6, "setUnassociatedFaceCropUUID:", v9);

    v10 = (void *)-[HMDMutableCameraSignificantEventFaceClassification copy](v6, "copy");
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel debugDescription](v12, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot create face classification from model: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

@end
