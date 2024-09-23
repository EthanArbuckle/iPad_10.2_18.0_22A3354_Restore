@implementation HMDMatterUARPControllerDelegate

- (HMDMatterUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3
{
  id v4;
  HMDMatterUARPControllerDelegate *v5;
  HMDMatterUARPControllerDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDMatterUARPControllerDelegate;
  v5 = -[HMDMatterUARPControllerDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_accessoryFirmwareUpdateManager, v4);

  return v6;
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMatterUARPControllerDelegate *v9;
  NSObject *v10;
  void *v11;
  uint64_t updated;
  void *v13;
  void *v14;
  void *v15;
  HMDMatterUARPControllerDelegate *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDMatterUARPControllerDelegate *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDMatterUARPControllerDelegate *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  HMDMatterUARPControllerDelegate *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  _BYTE buf[32];
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAvailabilityStatus");
    updated = UARPFirmwareUpdateAvailabilityStatusToString();
    objc_msgSend(v7, "releaseNotesAvailabilityStatus");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = updated;
    v39 = 2080;
    v40 = UARPFirmwareUpdateAvailabilityStatusToString();
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update Available for accessory:%@, status:%s, release notes status:%s", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMatterUARPControllerDelegate accessoryFirmwareUpdateManager](v9, "accessoryFirmwareUpdateManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "supportsFirmwareUpdate") & 1) != 0)
  {
    objc_msgSend(v13, "sessionForUARPAccessory:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
LABEL_5:
      objc_msgSend(v14, "assetAvailablityUpdateForAccessory:assetID:", v6, v7);
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v13, "findHMDHAPAccessoryWithUARPAccessory:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v19)
    {
      objc_msgSend(v19, "firmwareVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "softwareVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isAtLeastVersion:", v21);

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v9;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "softwareVersion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firmwareVersion");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v28;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Available version %@ is equal or older than current accessory version %@", buf, 0x20u);

LABEL_23:
        }
LABEL_24:

        objc_autoreleasePoolPop(v23);
        goto LABEL_25;
      }
      if (!objc_msgSend(v13, "hasReachedMaximumFirmwareUpdateRetriesForAccessory:assetID:", v14, v7))
      {
        objc_msgSend(v13, "addSessionForUARPAccessory:", v6);
        v36 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v36;
        goto LABEL_5;
      }
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v9;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v14, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v14, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v37 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v37;
      v30 = "%{public}@No more retries for HAPAccessory %{uuid_t}.16P";
      v31 = v25;
      v32 = 28;
    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v9;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      v30 = "%{public}@Couldn't find HAPAccessory from UARPAccessory %@";
      v31 = v25;
      v32 = 22;
    }
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_23;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not supported on this device; ignoring",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v15);
LABEL_26:

}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  HMDMatterUARPControllerDelegate *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: failed. This function should not be called for Matter accessories", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v9);

  return 0;
}

- (id)newUploader
{
  void *v4;
  HMDMatterUARPControllerDelegate *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    return objc_alloc_init(HMDMatterUARPUploader);
  }
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2080;
    v11 = "-[HMDMatterUARPControllerDelegate newUploader]";
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter Accessory Software Update not enabled.", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  return (HMDAccessoryFirmwareUpdateManager *)objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_107655 != -1)
    dispatch_once(&logCategory__hmf_once_t0_107655, &__block_literal_global_107656);
  return (id)logCategory__hmf_once_v1_107657;
}

void __46__HMDMatterUARPControllerDelegate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_107657;
  logCategory__hmf_once_v1_107657 = v0;

}

@end
