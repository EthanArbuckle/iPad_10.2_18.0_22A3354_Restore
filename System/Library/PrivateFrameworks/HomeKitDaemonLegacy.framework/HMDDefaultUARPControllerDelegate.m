@implementation HMDDefaultUARPControllerDelegate

- (HMDDefaultUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3
{
  id v4;
  HMDDefaultUARPControllerDelegate *v5;
  HMDDefaultUARPControllerDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDDefaultUARPControllerDelegate;
  v5 = -[HMDDefaultUARPControllerDelegate init](&v8, sel_init);
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
  HMDDefaultUARPControllerDelegate *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDDefaultUARPControllerDelegate *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDDefaultUARPControllerDelegate *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDDefaultUARPControllerDelegate *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  HMDDefaultUARPControllerDelegate *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  _BYTE buf[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = UARPFirmwareUpdateAvailabilityStatusToString();
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update Available for accessory:%@ status:%s", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](v9, "accessoryFirmwareUpdateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "supportsFirmwareUpdate") & 1) != 0)
  {
    objc_msgSend(v12, "sessionForUARPAccessory:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_5:
      objc_msgSend(v13, "assetAvailablityUpdateForAccessory:assetID:", v6, v7);
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v12, "findHMDHAPAccessoryWithUARPAccessory:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v18)
    {
      objc_msgSend(v18, "firmwareVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "softwareVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isAtLeastVersion:", v20);

      if (v21)
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = v9;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "softwareVersion");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firmwareVersion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v27;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Available version %@ is equal or older than current accessory version %@", buf, 0x20u);

LABEL_23:
        }
LABEL_24:

        objc_autoreleasePoolPop(v22);
        goto LABEL_25;
      }
      if (!objc_msgSend(v12, "hasReachedMaximumFirmwareUpdateRetriesForAccessory:assetID:", v13, v7))
      {
        objc_msgSend(v12, "addSessionForUARPAccessory:", v6);
        v35 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v35;
        goto LABEL_5;
      }
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v13, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v13, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v36 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(_QWORD *)&buf[20] = &v36;
      v29 = "%{public}@No more retries for HAPAccessory %{uuid_t}.16P";
      v30 = v24;
      v31 = 28;
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      v29 = "%{public}@Couldn't find HAPAccessory from UARPAccessory %@";
      v30 = v24;
      v31 = 22;
    }
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_23;
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v9;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not supported on this device; ignoring",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v14);
LABEL_26:

}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDDefaultUARPControllerDelegate *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionForUARPAccessory:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "firmwareStagingProgress:assetID:bytesSent:bytesTotal:", v10, v11, a5, a6);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@firmwareStagingProgress: No session exists for accessory %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDefaultUARPControllerDelegate *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionForUARPAccessory:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "firmwareStagingComplete:assetID:withStatus:", v8, v9, a5);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@firmwareUpdateComplete: No session exists for accessory", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__HMDDefaultUARPControllerDelegate_stagedFirmwareApplicationComplete_withStatus___block_invoke;
  v10[3] = &unk_1E89BD1B8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HMDDefaultUARPControllerDelegate *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
    *a5 = 0;
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionForUARPAccessory:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (objc_msgSend(v11, "sendMessageToAccessory:uarpMsg:error:", v8, v9, a5) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    if (a5 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, 0, CFSTR("UARP session not found"), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (a5)
        v19 = *a5;
      else
        v19 = 0;
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: failed for %@ with error %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMDDefaultUARPControllerDelegate *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v6 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HMDDefaultUARPControllerDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionForUARPAccessory:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "firmwareUpdateResult:vendorSpecificStatus:error:", v8, v6, v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@firmwareUpdateResult: No session exists", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  return (HMDAccessoryFirmwareUpdateManager *)objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
}

void __81__HMDDefaultUARPControllerDelegate_stagedFirmwareApplicationComplete_withStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@firmware UARP apply request completed with status %@ for accessory %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_29808 != -1)
    dispatch_once(&logCategory__hmf_once_t0_29808, &__block_literal_global_29809);
  return (id)logCategory__hmf_once_v1_29810;
}

void __47__HMDDefaultUARPControllerDelegate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_29810;
  logCategory__hmf_once_v1_29810 = v0;

}

@end
