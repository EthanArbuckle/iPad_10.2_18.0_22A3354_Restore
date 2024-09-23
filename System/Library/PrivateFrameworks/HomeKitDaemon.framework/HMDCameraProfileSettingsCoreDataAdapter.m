@implementation HMDCameraProfileSettingsCoreDataAdapter

- (HMDCameraProfileSettingsCoreDataAdapter)initWithHAPAccessory:(id)a3 cameraProfileSettingsModelID:(id)a4 derivedPropertiesModelID:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCameraProfileSettingsCoreDataAdapter *v11;
  uint64_t v12;
  NSUUID *hapAccessoryUUID;
  void *v14;
  uint64_t v15;
  NSUUID *homeUUID;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraProfileSettingsCoreDataAdapter;
  v11 = -[HMDCameraProfileSettingsCoreDataAdapter init](&v18, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "uuid");
    v12 = objc_claimAutoreleasedReturnValue();
    hapAccessoryUUID = v11->_hapAccessoryUUID;
    v11->_hapAccessoryUUID = (NSUUID *)v12;

    objc_msgSend(v8, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = objc_claimAutoreleasedReturnValue();
    homeUUID = v11->_homeUUID;
    v11->_homeUUID = (NSUUID *)v15;

    objc_storeStrong((id *)&v11->_cameraProfileSettingsModelID, a4);
    objc_storeStrong((id *)&v11->_derivedPropertiesModelID, a5);
  }

  return v11;
}

- (id)fetchCameraProfileSettingsModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__206143;
  v22 = __Block_byref_object_dispose__206144;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__206143;
  v16 = __Block_byref_object_dispose__206144;
  v17 = 0;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsCoreDataAdapter homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextWithHomeUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__HMDCameraProfileSettingsCoreDataAdapter_fetchCameraProfileSettingsModelWithError___block_invoke;
  v11[3] = &unk_24E791B30;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (id)fetchDerivedPropertiesModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__206143;
  v22 = __Block_byref_object_dispose__206144;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__206143;
  v16 = __Block_byref_object_dispose__206144;
  v17 = 0;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsCoreDataAdapter homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextWithHomeUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__HMDCameraProfileSettingsCoreDataAdapter_fetchDerivedPropertiesModelWithError___block_invoke;
  v11[3] = &unk_24E791B30;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (void)updateCameraProfileSettingsModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsCoreDataAdapter homeUUID](self, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextWithHomeUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __87__HMDCameraProfileSettingsCoreDataAdapter_updateCameraProfileSettingsModel_completion___block_invoke;
  v14[3] = &unk_24E79B3F0;
  v14[4] = self;
  v15 = v6;
  v16 = v10;
  v17 = v7;
  v11 = v10;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)updateDerivedPropertiesModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraProfileSettingsCoreDataAdapter homeUUID](self, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextWithHomeUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__HMDCameraProfileSettingsCoreDataAdapter_updateDerivedPropertiesModel_completion___block_invoke;
  v14[3] = &unk_24E79B3F0;
  v14[4] = self;
  v15 = v6;
  v16 = v10;
  v17 = v7;
  v11 = v10;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v11, "performBlock:", v14);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraProfileSettingsCoreDataAdapter hapAccessoryUUID](self, "hapAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)hapAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)cameraProfileSettingsModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)derivedPropertiesModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedPropertiesModelID, 0);
  objc_storeStrong((id *)&self->_cameraProfileSettingsModelID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_hapAccessoryUUID, 0);
}

void __83__HMDCameraProfileSettingsCoreDataAdapter_updateDerivedPropertiesModel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("currentAccessModeField"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentAccessMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraCurrentAccessMode:", v6);

  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("currentAccessModeChangeDate"));
  v8 = *(void **)(a1 + 40);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "currentAccessModeChangeDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraCurrentAccessModeChangeDate:", v9);

    if (!objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("currentAccessModeChangeReasonField")))
    {
LABEL_12:
      v17 = *(void **)(a1 + 48);
      v34 = 0;
      v18 = objc_msgSend(v17, "save:", &v34);
      v15 = v34;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v23;
          v24 = "%{public}@Successfully updated Core Data with derived properties model";
          v25 = v22;
          v26 = OS_LOG_TYPE_INFO;
          v27 = 12;
LABEL_17:
          _os_log_impl(&dword_2218F0000, v25, v26, v24, buf, v27);

        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        v37 = 2112;
        v38 = v15;
        v24 = "%{public}@Failed to update Core Data with derived properties model, error: %@";
        v25 = v22;
        v26 = OS_LOG_TYPE_ERROR;
        v27 = 22;
        goto LABEL_17;
      }

      objc_autoreleasePoolPop(v19);
LABEL_19:
      v28 = *(_QWORD *)(a1 + 56);
      if (v28)
        (*(void (**)(uint64_t, id))(v28 + 16))(v28, v15);

      goto LABEL_22;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "currentAccessModeChangeReason"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraCurrentAccessModeChangeReason:", v16);

    goto LABEL_12;
  }
  if ((objc_msgSend(v8, "hmbPropertyWasSet:", CFSTR("currentAccessModeChangeReasonField")) & 1) != 0)
    goto LABEL_11;
  if ((v5 & 1) != 0)
    goto LABEL_12;
  v29 = (void *)MEMORY[0x227676638]();
  v30 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v32;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Not updating Core Data with derived properties model because nothing changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v29);
  v33 = *(_QWORD *)(a1 + 56);
  if (v33)
    (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
LABEL_22:

}

void __87__HMDCameraProfileSettingsCoreDataAdapter_updateCameraProfileSettingsModel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("accessModeAtHomeField"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "accessModeAtHome"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraAccessModeAtHome:", v6);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("accessModeNotAtHomeField")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "accessModeNotAtHome"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraAccessModeNotAtHome:", v7);

    v5 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("recordingEventTriggersField")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "recordingEventTriggers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraRecordingEventTriggers:", v8);

    v5 = 1;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("activityZonesIncludedForSignificantEventDetectionField")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "activityZonesIncludedForSignificantEventDetection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraActivityZonesIncludedForSignificantEventDetection:", v9);

    if (!objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("activityZonesField")))
    {
LABEL_16:
      v17 = *(void **)(a1 + 48);
      v34 = 0;
      v18 = objc_msgSend(v17, "save:", &v34);
      v15 = v34;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v23;
          v24 = "%{public}@Successfully updated Core Data with settings model";
          v25 = v22;
          v26 = OS_LOG_TYPE_INFO;
          v27 = 12;
LABEL_21:
          _os_log_impl(&dword_2218F0000, v25, v26, v24, buf, v27);

        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        v37 = 2112;
        v38 = v15;
        v24 = "%{public}@Failed to update Core Data with settings model, error: %@";
        v25 = v22;
        v26 = OS_LOG_TYPE_ERROR;
        v27 = 22;
        goto LABEL_21;
      }

      objc_autoreleasePoolPop(v19);
LABEL_23:
      v28 = *(_QWORD *)(a1 + 56);
      if (v28)
        (*(void (**)(uint64_t, id))(v28 + 16))(v28, v15);

      goto LABEL_26;
    }
LABEL_15:
    objc_msgSend(*(id *)(a1 + 40), "activityZones");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraActivityZones:", v16);

    goto LABEL_16;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "hmbPropertyWasSet:", CFSTR("activityZonesField")) & 1) != 0)
    goto LABEL_15;
  if ((v5 & 1) != 0)
    goto LABEL_16;
  v29 = (void *)MEMORY[0x227676638]();
  v30 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v32;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Not updating Core Data with settings model because nothing changed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v29);
  v33 = *(_QWORD *)(a1 + 56);
  if (v33)
    (*(void (**)(uint64_t, _QWORD))(v33 + 16))(v33, 0);
LABEL_26:

}

void __80__HMDCameraProfileSettingsCoreDataAdapter_fetchDerivedPropertiesModelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  HMDCameraProfileSettingsDerivedPropertiesModel *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "cameraCurrentAccessMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (objc_msgSend(v3, "cameraCurrentAccessModeChangeReason"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      v5 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
      objc_msgSend(*(id *)(a1 + 32), "derivedPropertiesModelID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(v3, "cameraCurrentAccessMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCurrentAccessMode:", objc_msgSend(v11, "unsignedIntegerValue"));

      objc_msgSend(v3, "cameraCurrentAccessModeChangeReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCurrentAccessModeChangeReason:", objc_msgSend(v12, "unsignedIntegerValue"));

      objc_msgSend(v3, "cameraCurrentAccessModeChangeDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCurrentAccessModeChangeDate:", v13);

      goto LABEL_9;
    }
    objc_msgSend(v3, "cameraCurrentAccessModeChangeDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      goto LABEL_5;
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Derived properties do not exist yet on accessory", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with model id: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
LABEL_9:

}

void __84__HMDCameraProfileSettingsCoreDataAdapter_fetchCameraProfileSettingsModelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDCameraProfileSettingsModel *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "cameraAccessModeAtHome");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

LABEL_8:
      v14 = [HMDCameraProfileSettingsModel alloc];
      objc_msgSend(*(id *)(a1 + 32), "cameraProfileSettingsModelID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMBModel initWithModelID:parentModelID:](v14, "initWithModelID:parentModelID:", v15, v16);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setVersion:", 1);
      objc_msgSend(v3, "cameraAccessModeAtHome");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAccessModeAtHome:", objc_msgSend(v20, "unsignedIntegerValue"));

      objc_msgSend(v3, "cameraAccessModeNotAtHome");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAccessModeNotAtHome:", objc_msgSend(v21, "unsignedIntegerValue"));

      objc_msgSend(v3, "cameraRecordingEventTriggers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setRecordingEventTriggers:", objc_msgSend(v22, "unsignedIntegerValue"));

      objc_msgSend(v3, "cameraActivityZonesIncludedForSignificantEventDetection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActivityZonesIncludedForSignificantEventDetection:", objc_msgSend(v23, "BOOLValue"));

      objc_msgSend(v3, "cameraActivityZones");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v24)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setActivityZones:", v25);
      if (!v24)

      goto LABEL_13;
    }
    objc_msgSend(v3, "cameraAccessModeNotAtHome");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_8;
    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings do not exist yet on accessory", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hapAccessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
LABEL_13:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_206157 != -1)
    dispatch_once(&logCategory__hmf_once_t14_206157, &__block_literal_global_206158);
  return (id)logCategory__hmf_once_v15_206159;
}

void __54__HMDCameraProfileSettingsCoreDataAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_206159;
  logCategory__hmf_once_v15_206159 = v0;

}

@end
