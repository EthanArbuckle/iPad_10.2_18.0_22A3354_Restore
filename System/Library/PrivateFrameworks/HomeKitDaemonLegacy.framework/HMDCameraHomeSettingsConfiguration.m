@implementation HMDCameraHomeSettingsConfiguration

- (HMDCameraHomeSettingsConfiguration)initWithHome:(id)a3
{
  id v4;
  HMDCameraHomeSettingsConfiguration *v5;
  HMDCameraHomeSettingsConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  HMDCameraAccessorySettingsConfiguration *v18;
  uint64_t v19;
  NSArray *cameraSettings;
  void *v21;
  HMDCameraHomeSettingsConfiguration *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  HMDCameraUserSettingsConfiguration *v32;
  uint64_t v33;
  NSArray *userSettings;
  void *v35;
  HMDCameraHomeSettingsConfiguration *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  HMDCameraHomeSettingsConfiguration *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  objc_super v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)HMDCameraHomeSettingsConfiguration;
  v5 = -[HMDCameraHomeSettingsConfiguration init](&v63, sel_init);
  v6 = v5;
  if (v5)
  {
    v49 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v50 = v4;
    objc_msgSend(v4, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v60 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          objc_msgSend(v15, "cameraProfiles");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v17)
          {
            v18 = -[HMDCameraAccessorySettingsConfiguration initWithCameraAccessory:]([HMDCameraAccessorySettingsConfiguration alloc], "initWithCameraAccessory:", v15);
            objc_msgSend(v7, "addObject:", v18);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    cameraSettings = v49->_cameraSettings;
    v49->_cameraSettings = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v49;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraHomeSettingsConfiguration cameraSettings](v22, "cameraSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v24;
      v68 = 2112;
      v69 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Camera accessory settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v50, "users");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v56 != v30)
            objc_enumerationMutation(v27);
          v32 = -[HMDCameraUserSettingsConfiguration initWithUser:]([HMDCameraUserSettingsConfiguration alloc], "initWithUser:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v29);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v26);
    v33 = objc_claimAutoreleasedReturnValue();
    userSettings = v22->_userSettings;
    v22->_userSettings = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = v22;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraHomeSettingsConfiguration userSettings](v36, "userSettings");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v38;
      v68 = 2112;
      v69 = v39;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Camera user settings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v4 = v50;
    objc_msgSend(v50, "personManagerSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v36->_faceClassificationEnabled = objc_msgSend(v40, "isFaceClassificationEnabled");

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v50, "residentDeviceManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "availableResidentDevices");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
          if (objc_msgSend(v47, "isEnabled"))
            v36->_enabledResidentsDeviceCapabilities |= objc_msgSend(v47, "legacyResidentCapabilities");
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v44);
    }

    v36->_owner = objc_msgSend(v50, "isOwnerUser");
    v6 = v49;
  }

  return v6;
}

- (NSArray)cameraSettings
{
  return self->_cameraSettings;
}

- (NSArray)userSettings
{
  return self->_userSettings;
}

- (unint64_t)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (BOOL)isFaceClassificationEnabled
{
  return self->_faceClassificationEnabled;
}

- (BOOL)isOwner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_cameraSettings, 0);
}

@end
