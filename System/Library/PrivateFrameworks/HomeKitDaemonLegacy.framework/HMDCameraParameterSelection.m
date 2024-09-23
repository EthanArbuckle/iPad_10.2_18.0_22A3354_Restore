@implementation HMDCameraParameterSelection

- (HMDCameraParameterSelection)initWithSessionID:(id)a3
{
  id v5;
  HMDCameraParameterSelection *v6;
  HMDCameraParameterSelection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraParameterSelection;
  v6 = -[HMDCameraParameterSelection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionID, a3);

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraParameterSelection sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (id)selectedParametersFromPreferredParameters:(id)a3 deviceSupportedParameters:(id)a4 cameraSupportedParameters:(id)a5 overriddenParameters:(id)a6 parameterDescription:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v15)
  {
    v40 = v16;
    v41 = v12;
    v22 = (id)objc_msgSend(v12, "mutableCopy");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = (void *)objc_msgSend(v22, "copy");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (!objc_msgSend(v13, "containsObject:", v28)
            || (objc_msgSend(v14, "containsObject:", v28) & 1) == 0)
          {
            objc_msgSend(v22, "removeObject:", v28);
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
      }
      while (v25);
    }

    v29 = objc_msgSend(v22, "count");
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = a1;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v29)
    {
      v17 = v40;
      v12 = v41;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v47 = v34;
        v48 = 2112;
        v49 = v40;
        v50 = 2112;
        v51 = v41;
        v52 = 2112;
        v53 = v13;
        v54 = 2112;
        v55 = v14;
        v56 = 2112;
        v57 = v22;
        v35 = "%{public}@Parameter: %@, preferredParameters: %@, deviceSupportedParameters: %@, cameraSupportedParameters"
              ": %@. preferredAndSupportedList: %@";
        v36 = v33;
        v37 = OS_LOG_TYPE_DEBUG;
        v38 = 62;
LABEL_20:
        _os_log_impl(&dword_1CD062000, v36, v37, v35, buf, v38);

      }
    }
    else
    {
      v17 = v40;
      v12 = v41;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v47 = v34;
        v48 = 2112;
        v49 = v40;
        v50 = 2112;
        v51 = v41;
        v52 = 2112;
        v53 = v13;
        v54 = 2112;
        v55 = v14;
        v35 = "%{public}@No compatible elements for %@: preferredParameters: %@, deviceSupportedParameters: %@, cameraSup"
              "portedParameters: %@";
        v36 = v33;
        v37 = OS_LOG_TYPE_ERROR;
        v38 = 52;
        goto LABEL_20;
      }
    }

    objc_autoreleasePoolPop(v30);
    goto LABEL_22;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = a1;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v47 = v21;
    v48 = 2112;
    v49 = v17;
    v50 = 2112;
    v51 = v15;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Local preference is set for %@, replying the same as filtered: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v22 = v15;
LABEL_22:

  return v22;
}

+ (id)selectedSRTPParametersFromCryptoSuites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __SecRandom *v14;
  size_t v15;
  id v16;
  size_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  HMDSRTPParameters *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_selectedCryptoSuiteFromCameraCryptoSuites:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "srtpCryptoSuite");
    v8 = 16;
    v9 = 14;
    if (v7)
    {
      v9 = 0;
      v8 = 0;
    }
    if (v7 == 1)
      v10 = 14;
    else
      v10 = v9;
    if (v7 == 1)
      v11 = 32;
    else
      v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    v15 = objc_msgSend(v12, "length");
    v16 = objc_retainAutorelease(v12);
    if (SecRandomCopyBytes(v14, v15, (void *)objc_msgSend(v16, "mutableBytes"))
      || (v17 = objc_msgSend(v13, "length"),
          v18 = objc_retainAutorelease(v13),
          SecRandomCopyBytes(v14, v17, (void *)objc_msgSend(v18, "mutableBytes"))))
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate random bytes", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = 0;
    }
    else
    {
      v23 = -[HMDSRTPParameters initWithCryptoSuite:masterKey:masterSalt:]([HMDSRTPParameters alloc], "initWithCryptoSuite:masterKey:masterSalt:", v6, v16, v18);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to select Crypto Suite", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

+ (id)_selectedCryptoSuiteFromCameraCryptoSuites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDSRTPCryptoSuite *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDSRTPCryptoSuite arrayWithSuites:](HMDSRTPCryptoSuite, "arrayWithSuites:", &unk_1E8B321C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceForKey:", CFSTR("enableUnencryptedSRTPStream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (isInternalBuild() && v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Making SRTP camera stream unencrypted", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v14 = -[HMDSRTPCryptoSuite initWithCryptoSuite:]([HMDSRTPCryptoSuite alloc], "initWithCryptoSuite:", 2);
    objc_msgSend(v6, "addObject:", v14);

  }
  v15 = (void *)objc_opt_class();
  if (supportedSRTPAuths)
  {
    +[HMDSRTPCryptoSuite arrayWithSuites:](HMDSRTPCryptoSuite, "arrayWithSuites:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v15, "selectedParametersFromPreferredParameters:deviceSupportedParameters:cameraSupportedParameters:overriddenParameters:parameterDescription:", v6, v6, v4, v16, CFSTR("Crypto-Suite"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_131602 != -1)
    dispatch_once(&logCategory__hmf_once_t6_131602, &__block_literal_global_131603);
  return (id)logCategory__hmf_once_v7_131604;
}

void __42__HMDCameraParameterSelection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_131604;
  logCategory__hmf_once_v7_131604 = v0;

}

@end
