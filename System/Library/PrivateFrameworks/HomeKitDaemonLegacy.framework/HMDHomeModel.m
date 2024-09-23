@implementation HMDHomeModel

+ (id)properties
{
  if (properties_onceToken_78307 != -1)
    dispatch_once(&properties_onceToken_78307, &__block_literal_global_78308);
  return (id)properties__properties_78309;
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
  _QWORD v41[39];
  _QWORD v42[41];

  v42[39] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v40;
  v41[1] = CFSTR("ownerName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v39;
  v41[2] = CFSTR("ownerUserID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v38;
  v41[3] = CFSTR("ownerUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v37;
  v41[4] = CFSTR("creationDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v36;
  v41[5] = CFSTR("firstHAPAccessoryAddedDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v35;
  v41[6] = CFSTR("defaultRoomUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v34;
  v41[7] = CFSTR("presenceAuthorizationStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v33;
  v41[8] = CFSTR("presenceComputeStatus");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v32;
  v41[9] = CFSTR("ownerPublicKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v31;
  v41[10] = CFSTR("homeLocationData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v30;
  v41[11] = CFSTR("primaryResidentUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v29;
  v41[12] = CFSTR("sharedHomeSourceVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v28;
  v41[13] = CFSTR("networkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[13] = v27;
  v41[14] = CFSTR("supportsNetworkProtection");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[14] = v26;
  v41[15] = CFSTR("activeNetworkRouterAccessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[15] = v25;
  v41[16] = CFSTR("primaryNetworkRouterManagingDeviceUUID");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[16] = v24;
  v41[17] = CFSTR("multiUserEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[17] = v23;
  v41[18] = CFSTR("hasAnyUserAcknowledgedCameraRecordingOnboarding");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[18] = v22;
  v41[19] = CFSTR("hasOnboardedForAccessCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[19] = v21;
  v41[20] = CFSTR("hasOnboardedForWalletKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[20] = v20;
  v41[21] = CFSTR("encodedNfcReaderKey");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[21] = v19;
  v41[22] = CFSTR("encodedNaturalLightingContext");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[22] = v18;
  v41[23] = CFSTR("chipFabricID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[23] = v17;
  v41[24] = CFSTR("chipFabricIndex");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[24] = v16;
  v41[25] = CFSTR("chipLastNodeID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[25] = v15;
  v41[26] = CFSTR("chipRootCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[26] = v14;
  v41[27] = CFSTR("chipOperationalCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[27] = v13;
  v41[28] = CFSTR("chipIntermediateCertificate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[28] = v12;
  v41[29] = CFSTR("chipKeyValueStore");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[29] = v11;
  v41[30] = CFSTR("matterControllerNodeID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v42[30] = v0;
  v41[31] = CFSTR("matterFabricID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v42[31] = v1;
  v41[32] = CFSTR("threadOperationalDataset");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42[32] = v2;
  v41[33] = CFSTR("soundCheckEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42[33] = v3;
  v41[34] = CFSTR("analysisOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[34] = v4;
  v41[35] = CFSTR("didOnboardAnalysis");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[35] = v5;
  v41[36] = CFSTR("siriPhraseOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[36] = v6;
  v41[37] = CFSTR("locationServicesEnabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[37] = v7;
  v41[38] = CFSTR("didOnboardLocationServices");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[38] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 39);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_78309;
  properties__properties_78309 = v9;

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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    -[HMDHomeModel setEncodedNaturalLightingContext:](self, "setEncodedNaturalLightingContext:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to set encoded natural lighting context on the home model %@:%@", buf, 0x20u);

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

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDHomeModel encodedNaturalLightingContext](self, "encodedNaturalLightingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (!v3)
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode natural lighting context set on home model %@:%@", buf, 0x20u);

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

@end
