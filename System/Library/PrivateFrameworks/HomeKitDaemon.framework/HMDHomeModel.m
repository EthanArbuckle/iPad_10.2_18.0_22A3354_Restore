@implementation HMDHomeModel

+ (id)properties
{
  if (properties_onceToken_111970 != -1)
    dispatch_once(&properties_onceToken_111970, &__block_literal_global_111971);
  return (id)properties__properties_111972;
}

void __26__HMDHomeModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[49];
  _QWORD v52[51];

  v52[49] = *MEMORY[0x24BDAC8D0];
  v51[0] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v50;
  v51[1] = CFSTR("ownerName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v49;
  v51[2] = CFSTR("ownerUserID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v48;
  v51[3] = CFSTR("ownerUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v47;
  v51[4] = CFSTR("creationDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v46;
  v51[5] = CFSTR("firstHAPAccessoryAddedDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v45;
  v51[6] = CFSTR("defaultRoomUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v44;
  v51[7] = CFSTR("presenceAuthorizationStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v43;
  v51[8] = CFSTR("presenceComputeStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v42;
  v51[9] = CFSTR("ownerPublicKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v41;
  v51[10] = CFSTR("homeLocationData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v40;
  v51[11] = CFSTR("primaryResidentUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v39;
  v51[12] = CFSTR("sharedHomeSourceVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v38;
  v51[13] = CFSTR("networkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v37;
  v51[14] = CFSTR("supportsNetworkProtection");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v36;
  v51[15] = CFSTR("activeNetworkRouterAccessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v35;
  v51[16] = CFSTR("primaryNetworkRouterManagingDeviceUUID");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[16] = v34;
  v51[17] = CFSTR("multiUserEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52[17] = v33;
  v51[18] = CFSTR("matCredGRK");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[18] = v32;
  v51[19] = CFSTR("hasAnyUserAcknowledgedCameraRecordingOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[19] = v31;
  v51[20] = CFSTR("hasOnboardedForAccessCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[20] = v30;
  v51[21] = CFSTR("hasOnboardedForWalletKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[21] = v29;
  v51[22] = CFSTR("encodedNfcReaderKey");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[22] = v28;
  v51[23] = CFSTR("encodedNaturalLightingContext");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[23] = v27;
  v51[24] = CFSTR("chipFabricID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[24] = v26;
  v51[25] = CFSTR("chipFabricIndex");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[25] = v25;
  v51[26] = CFSTR("chipLastNodeID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[26] = v24;
  v51[27] = CFSTR("chipRootCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[27] = v23;
  v51[28] = CFSTR("chipOperationalCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[28] = v22;
  v51[29] = CFSTR("chipIntermediateCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52[29] = v21;
  v51[30] = CFSTR("chipKeyValueStore");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[30] = v20;
  v51[31] = CFSTR("matterControllerNodeID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[31] = v19;
  v51[32] = CFSTR("matterFabricID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[32] = v18;
  v51[33] = CFSTR("threadOperationalDataset");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52[33] = v17;
  v51[34] = CFSTR("soundCheckEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[34] = v16;
  v51[35] = CFSTR("analysisOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[35] = v15;
  v51[36] = CFSTR("didOnboardAnalysis");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[36] = v14;
  v51[37] = CFSTR("siriPhraseOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[37] = v13;
  v51[38] = CFSTR("locationServicesEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52[38] = v12;
  v51[39] = CFSTR("didOnboardLocationServices");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[39] = v11;
  v51[40] = CFSTR("residentSyncClientDidSync");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v52[40] = v0;
  v51[41] = CFSTR("owned");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v52[41] = v1;
  v51[42] = CFSTR("hh2EncodedNfcReaderKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v52[42] = v2;
  v51[43] = CFSTR("residentSelectionVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52[43] = v3;
  v51[44] = CFSTR("didOnboardEventLog");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[44] = v4;
  v51[45] = CFSTR("eventLogHomeSettingEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[45] = v5;
  v51[46] = CFSTR("eventLogDuration");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52[46] = v6;
  v51[47] = CFSTR("timeZone");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[47] = v7;
  v51[48] = CFSTR("numberOfCameras");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[48] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 49);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_111972;
  properties__properties_111972 = v9;

}

- (void)setNaturalLightingContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    -[HMDHomeModel setEncodedNaturalLightingContext:](self, "setEncodedNaturalLightingContext:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded natural lighting context on the home model %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMDNaturalLightingContext)naturalLightingContext
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeModel encodedNaturalLightingContext](self, "encodedNaturalLightingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (!v3)
    {
      v5 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v11 = v7;
        v12 = 2112;
        v13 = v2;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode natural lighting context set on home model %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
    }

  }
  else
  {
    v3 = 0;
  }

  return (HMDNaturalLightingContext *)v3;
}

- (void)setNfcReaderKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDHomeModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDHomeModel setHh2EncodedNfcReaderKey:](self, "setHh2EncodedNfcReaderKey:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded nfc reader key on model %@:%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMDHomeNFCReaderKey)nfcReaderKey
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeModel hh2EncodedNfcReaderKey](self, "hh2EncodedNfcReaderKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    v5 = v4;
    if (v3)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (!v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v13 = v9;
        v14 = 2112;
        v15 = v2;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode nfc reader key set on model %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    v3 = 0;
  }

  return (HMDHomeNFCReaderKey *)v3;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  void *v24;
  HMDHomeModel *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  HMDHomeLocationData *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDHomeLocationData *v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  objc_super v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("residentSyncClientDidSync")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ownerName")))
    {
      objc_msgSend(v8, "owner");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pairingIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v19 = (void *)v15;
      v20 = (void *)*MEMORY[0x24BDBD430];
      if (v15)
        v20 = (void *)v15;
      v12 = v20;
LABEL_19:

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ownerUserID")))
    {
      objc_msgSend(v8, "owner");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userID");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (void *)v16;
      v17 = (void *)*MEMORY[0x24BDBD430];
      if (v16)
        v17 = (void *)v16;
      v12 = v17;
      goto LABEL_20;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ownerUUID")))
    {
      objc_msgSend(v8, "owner");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = v18;
      objc_msgSend(v18, "modelID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("primaryResidentUUID")))
    {
      objc_msgSend(v8, "primaryResident");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("encodedNaturalLightingContext")))
    {
      objc_msgSend(v8, "naturalLightingContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v50 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v50);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v50;
        if (!v22)
        {
          v24 = (void *)MEMORY[0x227676638]();
          v25 = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v27;
            v53 = 2112;
            v54 = v23;
            v28 = "%{public}@Failed to encode natural lighting context while MFK -> HMD conversion: %@";
LABEL_33:
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

            goto LABEL_34;
          }
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("hh2EncodedNfcReaderKey")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("defaultRoomUUID")))
        {
          objc_msgSend(v8, "defaultRoom");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("ownerPublicKey")))
        {
          objc_msgSend(v8, "owner");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pairingIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "publicKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "data");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          v33 = (void *)*MEMORY[0x24BDBD430];
          if (v31)
            v33 = (void *)v31;
          v12 = v33;

          goto LABEL_19;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("homeLocationData")))
        {
          objc_msgSend(v8, "location");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            objc_msgSend(v8, "locationUpdateTimeStamp");
            v36 = objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v37 = (void *)v36;
              objc_msgSend(v8, "locationSource");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                v39 = [HMDHomeLocationData alloc];
                objc_msgSend(v8, "location");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "locationUpdateTimeStamp");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "locationSource");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = -[HMDHomeLocationData initWithLocation:locationUpdateTimestamp:locationSource:](v39, "initWithLocation:locationUpdateTimestamp:locationSource:", v40, v41, v42);

                encodeRootObject();
                v12 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_22;
              }
            }
            else
            {

            }
          }
          v11 = (id)*MEMORY[0x24BDBD430];
          goto LABEL_3;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipFabricID")))
        {
          objc_msgSend(v8, "matterKeyValueStore");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v44;
          v45 = CFSTR("HMDHMMKVS.fabricID");
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("chipFabricIndex")))
          {
            if (objc_msgSend(v9, "isEqualToString:", CFSTR("chipKeyValueStore")))
            {
              objc_msgSend(v8, "matterKeyValueStore");
              v46 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v9, "isEqualToString:", CFSTR("didOnboardEventLog")))
            {
              objc_msgSend(v8, "didOnboardEventLog");
              v46 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v9, "isEqualToString:", CFSTR("eventLogHomeSettingEnabled")))
            {
              objc_msgSend(v8, "eventLogEnabled");
              v46 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (!objc_msgSend(v9, "isEqualToString:", CFSTR("eventLogDuration")))
              {
                v48.receiver = self;
                v48.super_class = (Class)HMDHomeModel;
                -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v48, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
                v11 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_3;
              }
              objc_msgSend(v8, "eventLogDuration");
              v46 = objc_claimAutoreleasedReturnValue();
            }
            v13 = (void *)v46;
            v47 = (void *)*MEMORY[0x24BDBD430];
            if (v46)
              v47 = (void *)v46;
            v30 = v47;
            goto LABEL_39;
          }
          objc_msgSend(v8, "matterKeyValueStore");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v44;
          v45 = CFSTR("HMDHMMKVS.fabricIndex");
        }
        objc_msgSend(v44, "objectForKeyedSubscript:", v45);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(v8, "nfcReaderKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v49 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v49);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v49;
        if (!v22)
        {
          v24 = (void *)MEMORY[0x227676638]();
          v25 = self;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v27;
            v53 = 2112;
            v54 = v23;
            v28 = "%{public}@Failed to encode nfc reader key while MFK -> HMD conversion: %@";
            goto LABEL_33;
          }
LABEL_34:

          objc_autoreleasePoolPop(v24);
        }
LABEL_35:
        v29 = (void *)*MEMORY[0x24BDBD430];
        if (v22)
          v29 = v22;
        v12 = v29;

        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
    v12 = v30;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "residentSyncClientDidSync"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v12 = v11;
LABEL_22:

  return v12;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _MKFRoom *v14;
  id v15;
  void *v16;
  void *v17;
  HMDHomeModel *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  HMDHomeModel *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  HMDHomeModel *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  objc_super v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("owner")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("ownerUUID")))
    {
      v11 = objc_alloc(MEMORY[0x24BDD1880]);
      -[HMDHomeModel ownerUUID](self, "ownerUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v11, "initWithUUIDString:", v12);

      if (v13)
      {
        v59 = 0;
        +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v13, objc_opt_class(), &v59);
        v14 = (_MKFRoom *)objc_claimAutoreleasedReturnValue();
        v15 = v59;
        v16 = v15;
        if (v14 && !v15)
          goto LABEL_23;
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

          objc_autoreleasePoolPop(v17);
LABEL_23:

LABEL_28:
          goto LABEL_73;
        }
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v20;
        v62 = 2112;
        v63 = v13;
        v64 = 2112;
        v65 = v16;
        v21 = "%{public}@Unable to find NSManagedObject for home owner with UUID %@: %@";
LABEL_16:
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x20u);

        goto LABEL_17;
      }
      goto LABEL_27;
    }
LABEL_72:
    v14 = 0;
    goto LABEL_73;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("primaryResident")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("primaryResidentUUID")))
      goto LABEL_72;
    -[HMDHomeModel primaryResidentUUID](self, "primaryResidentUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x24BDD1880]);
      -[HMDHomeModel primaryResidentUUID](self, "primaryResidentUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v23, "initWithUUIDString:", v24);

      if (v13)
      {
        v58 = 0;
        +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v13, objc_opt_class(), &v58);
        v14 = (_MKFRoom *)objc_claimAutoreleasedReturnValue();
        v25 = v58;
        v16 = v25;
        if (v14 && !v25)
          goto LABEL_23;
        v17 = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v20;
        v62 = 2112;
        v63 = v13;
        v64 = 2112;
        v65 = v16;
        v21 = "%{public}@Unable to find NSManagedObject for resident device with UUID %@: %@";
        goto LABEL_16;
      }
LABEL_27:
      v14 = 0;
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_36:
    v14 = (_MKFRoom *)v32;
    goto LABEL_73;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("defaultRoom")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("defaultRoomUUID")))
    {
      v13 = v10;
      if (self)
      {
        -[HMDBackingStoreModelObject managedObject](self, "managedObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "defaultRoom");
        v14 = (_MKFRoom *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v26 = objc_alloc(MEMORY[0x24BDD1880]);
          -[HMDHomeModel defaultRoomUUID](self, "defaultRoomUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v26, "initWithUUIDString:", v27);

          v14 = -[_MKFRoom initWithContext:]([_MKFRoom alloc], "initWithContext:", v13);
          -[_MKFRoom setModelID:](v14, "setModelID:", v28);
          -[_MKFRoom setHome:](v14, "setHome:", v16);
          objc_msgSend(v16, "addRooms_Object:", v14);
          objc_msgSend(v16, "setDefaultRoom:", v14);

        }
        goto LABEL_23;
      }
      goto LABEL_27;
    }
    goto LABEL_72;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("naturalLightingContext")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("encodedNaturalLightingContext")))
      goto LABEL_72;
    -[HMDHomeModel naturalLightingContext](self, "naturalLightingContext");
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("nfcReaderKey")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("hh2EncodedNfcReaderKey")))
      goto LABEL_72;
    -[HMDHomeModel nfcReaderKey](self, "nfcReaderKey");
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("location")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("locationUpdateTimeStamp")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("locationSource")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("homeLocationData")))
      goto LABEL_72;
    v33 = (void *)MEMORY[0x227676638]();
    v14 = (_MKFRoom *)objc_alloc(MEMORY[0x24BDD1620]);
    -[HMDHomeModel homeLocationData](self, "homeLocationData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v35 = (void *)-[_MKFRoom initForReadingFromData:error:](v14, "initForReadingFromData:error:", v34, &v57);
    v36 = v57;

    if (v36)
    {
      v54 = v35;
      v37 = v33;
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v41;
        v62 = 2112;
        v63 = v36;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize unarchiver for HomeLocationData: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      v14 = 0;
      v42 = 1;
      v33 = v37;
      v35 = v54;
LABEL_57:

      objc_autoreleasePoolPop(v33);
      if (v42)
        goto LABEL_73;
      goto LABEL_58;
    }
    objc_msgSend(v35, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      v55 = v35;
      v45 = v33;
      v46 = (void *)MEMORY[0x227676638]();
      v47 = self;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v49;
        _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive HomeLocationData", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v46);
      v14 = 0;
      v42 = 1;
      v33 = v45;
      v36 = 0;
      v35 = v55;
      goto LABEL_56;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("location")))
    {
      objc_msgSend(v43, "location");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("locationUpdateTimeStamp")))
    {
      objc_msgSend(v43, "locationUpdateTimestamp");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("locationSource")))
      {
        v42 = 0;
        goto LABEL_56;
      }
      objc_msgSend(v43, "locationSource");
      v44 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (_MKFRoom *)v44;
    v42 = 1;
LABEL_56:

    goto LABEL_57;
  }
LABEL_58:
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("matterKeyValueStore")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipFabricID"))
      || -[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipFabricIndex"))
      || -[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("chipKeyValueStore")))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDHomeModel chipFabricID](self, "chipFabricID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v50, CFSTR("HMDHMMKVS.fabricID"));

      -[HMDHomeModel chipFabricIndex](self, "chipFabricIndex");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v51, CFSTR("HMDHMMKVS.fabricIndex"));

      -[HMDHomeModel chipKeyValueStore](self, "chipKeyValueStore");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v52);

      v14 = (_MKFRoom *)objc_msgSend(v13, "copy");
      goto LABEL_28;
    }
    goto LABEL_72;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("didOnboardMemory")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("didOnboardEventLog")))
      goto LABEL_72;
    -[HMDHomeModel didOnboardEventLog](self, "didOnboardEventLog");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoryEnabled")))
  {
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("eventLogHomeSettingEnabled")))
      goto LABEL_72;
    -[HMDHomeModel eventLogHomeSettingEnabled](self, "eventLogHomeSettingEnabled");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("memoryDuration")))
    {
      v56.receiver = self;
      v56.super_class = (Class)HMDHomeModel;
      -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v56, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("eventLogDuration")))
      goto LABEL_72;
    -[HMDHomeModel eventLogDuration](self, "eventLogDuration");
    v29 = objc_claimAutoreleasedReturnValue();
  }
LABEL_32:
  v30 = (void *)v29;
  v31 = (void *)*MEMORY[0x24BDBD430];
  if (v29)
    v31 = (void *)v29;
  v14 = v31;

LABEL_73:
  return v14;
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_getHomeFromUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v16 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v4, objc_opt_class(), &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14 = v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfHome with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

@end
