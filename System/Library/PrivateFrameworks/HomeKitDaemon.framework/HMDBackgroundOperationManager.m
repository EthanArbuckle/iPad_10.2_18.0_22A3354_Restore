@implementation HMDBackgroundOperationManager

- (void)scheduleHH2KeyRollIfNecessary
{
  -[HMDBackgroundOperationManager _scheduleHH2KeyRollIfNecessary:](self, "_scheduleHH2KeyRollIfNecessary:", 0);
}

- (void)scheduleHH2KeyRollForAccessory:(id)a3
{
  id v4;
  HMDBackgroundOperationManager *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMDBackgroundOperationManager _scheduleHH2KeyRollIfNecessary:](self, "_scheduleHH2KeyRollIfNecessary:", v4);

  }
  else
  {
    v5 = (HMDBackgroundOperationManager *)_HMFPreconditionFailure();
    -[HMDBackgroundOperationManager scheduleHH2KeyRollForAirPlayAccessory:](v5, v6, v7);
  }
}

- (void)scheduleHH2KeyRollForAirPlayAccessory:(id)a3
{
  id v4;
  HMDBackgroundOperationManager *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMDBackgroundOperationManager _scheduleHH2AirPlayKeyRollIfNecessary:](self, "_scheduleHH2AirPlayKeyRollIfNecessary:", v4);

  }
  else
  {
    v5 = (HMDBackgroundOperationManager *)_HMFPreconditionFailure();
    -[HMDBackgroundOperationManager _scheduleKeyRollForAccessory:](v5, v6, v7);
  }
}

- (BOOL)_scheduleKeyRollForAccessory:(id)a3
{
  void *v3;

  objc_msgSend(a3, "bridge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 == 0;
}

- (void)_scheduleHH2AirPlayKeyRollIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDBackgroundOperationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDBackgroundOperationManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDBackgroundOperationManager shouldWeScheduleKeyRollOperationsOnThisDevice](self, "shouldWeScheduleKeyRollOperationsOnThisDevice"))
  {
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || objc_msgSend(v5, "isOwnerUser") && (objc_msgSend(v6, "isAdminUser") & 1) != 0)
    {
      -[HMDBackgroundOperationManager registerForNotifications](self, "registerForNotifications");
      -[HMDBackgroundOperationManager makeSureToLoadPairingIdentities](self, "makeSureToLoadPairingIdentities");
      -[HMDBackgroundOperationManager queue](self, "queue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __91__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2AirPlayKeyRollIfNecessary___block_invoke;
      v18[3] = &unk_24E79C268;
      v18[4] = self;
      v19 = v4;
      objc_msgSend(v7, "addOperationWithBlock:", v18);

    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations for accessory: %@ as this user is not the admin owner of the home: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_scheduleHH2KeyRollIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDBackgroundOperationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackgroundOperationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[HMDBackgroundOperationManager shouldWeScheduleKeyRollOperationsOnThisDevice](self, "shouldWeScheduleKeyRollOperationsOnThisDevice"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this device", buf, 0xCu);
LABEL_11:

    }
LABEL_12:

    objc_autoreleasePoolPop(v8);
    goto LABEL_17;
  }
  if (!-[HMDBackgroundOperationManager _scheduleKeyRollForAccessory:](self, "_scheduleKeyRollForAccessory:", v4))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations on this accessory: %@", buf, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isOwnerUser") && (objc_msgSend(v6, "isAdminUser") & 1) != 0)
  {
    -[HMDBackgroundOperationManager registerForNotifications](self, "registerForNotifications");
    -[HMDBackgroundOperationManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __84__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2KeyRollIfNecessary___block_invoke;
    v19[3] = &unk_24E79C268;
    v19[4] = self;
    v20 = v4;
    objc_msgSend(v7, "addOperationWithBlock:", v19);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations for accessory: %@ as this user is not the admin owner of the home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
  }

LABEL_17:
}

- (void)scheduleHH2KeyRollIfNecessaryDueToNotification:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[HMDBackgroundOperationManager queue](self, "queue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __100__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__scheduleHH2KeyRollIfNecessaryDueToNotification___block_invoke;
  v5[3] = &unk_24E79C240;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)startSchedulingKeyRollOperations:(BOOL)a3 forAccessory:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDBackgroundOperationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  __int128 v17;
  _BYTE buf[18];
  __int16 v19;
  __int128 *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
      }
      v17 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      v19 = 2096;
      v20 = &v17;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Going to audit the accessory's key chain entries: %{uuid_t}.16P", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDBackgroundOperationManager auditKeyChainEntryForAccessory:isRunningOnResident:](v8, "auditKeyChainEntryForAccessory:isRunningOnResident:", v6, v4);
  }
  else
  {
    -[HMDBackgroundOperationManager homeManager](self, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __99__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__startSchedulingKeyRollOperations_forAccessory___block_invoke;
    v15[3] = &unk_24E785480;
    v15[4] = self;
    v16 = v4;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

  }
}

- (void)makeSureToLoadPairingIdentities
{
  void *v3;
  void *v4;
  void *v5;
  HMDBackgroundOperationManager *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackgroundOperationManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDBackgroundOperationManager hh1Key](self, "hh1Key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDBackgroundOperationManager getHH1ControllerKey](self, "getHH1ControllerKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v9;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@HH1 pairing identity : %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      -[HMDBackgroundOperationManager setHh1Key:](v6, "setHh1Key:", v4);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get HH1 controller key. Cannot schedule key roll operations.", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }

  }
  -[HMDBackgroundOperationManager hh2Key](self, "hh2Key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[HMDBackgroundOperationManager getHH2ControllerKey](self, "getHH2ControllerKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@HH2 pairing identity : %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDBackgroundOperationManager setHh2Key:](v14, "setHh2Key:", v12);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to get HH2 controller key. Cannot schedule key roll operations", (uint8_t *)&v19, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
}

- (void)scheduleHH2KeyRollOperationForHome:(id)a3 isRunningOnResident:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDBackgroundOperationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDBackgroundOperationManager *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isOwnerUser") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v16 = "%{public}@Not scheduling key roll operations for [%@] as this user is not the owner of the home";
LABEL_11:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v17, 0x16u);

    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    goto LABEL_13;
  }
  if (v4 && (objc_msgSend(v6, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v16 = "%{public}@Not scheduling key roll operations for [%@] as this device is not the primary resident of that home";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting the accessory key audit: [isResident: %@][Home: %@]", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDBackgroundOperationManager auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:isRunningOnResident:](v8, "auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:isRunningOnResident:", v6, v4);
LABEL_13:

}

- (void)auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome:(id)a3 isRunningOnResident:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v6 = a3;
  -[HMDBackgroundOperationManager makeSureToLoadPairingIdentities](self, "makeSureToLoadPairingIdentities");
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __140__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome_isRunningOnResident___block_invoke;
  v8[3] = &unk_24E7854A8;
  v8[4] = self;
  v9 = a4;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

}

- (void)auditKeyChainEntryForAccessory:(id)a3 isRunningOnResident:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackgroundOperationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  HMDBackgroundOperationManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  _BYTE buf[32];
  __int128 v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCurrentDeviceConfirmedPrimaryResident");

    if ((v9 & 1) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v7, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v7, "uuid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
        }
        v34 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2096;
        *(_QWORD *)&buf[20] = &v34;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Not scheduling the audit for the accessory [%{uuid_t}.16P] as current device is not the primary resident", buf, 0x1Cu);
        goto LABEL_17;
      }
LABEL_18:

      objc_autoreleasePoolPop(v24);
      goto LABEL_19;
    }
  }
  if (!-[HMDBackgroundOperationManager _scheduleKeyRollForAccessory:](self, "_scheduleKeyRollForAccessory:", v7))
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Not scheduling the audit for accessory [%@]", buf, 0x16u);

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getAssociatedControllerKeyForAccessory:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v18;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Associated controller key : %@ for accessory : %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  if (!v12
    || (objc_msgSend(MEMORY[0x24BE1BC08], "systemStore"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "identifier"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v19, "isHH2KeyType:", v20),
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v22 = (void *)MEMORY[0x227676638]();
    -[HMDBackgroundOperationManager queue](v14, "queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __104__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntryForAccessory_isRunningOnResident___block_invoke;
    v31[3] = &unk_24E79C268;
    v31[4] = v14;
    v32 = v7;
    objc_msgSend(v23, "addOperationWithBlock:", v31);

    objc_autoreleasePoolPop(v22);
  }

LABEL_19:
}

- (void)auditOwnerPairingForAirPlayAccessory:(id)a3 isRunningOnResident:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDBackgroundOperationManager *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if ((objc_msgSend(v7, "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v6;
        v13 = "%{public}@Not scheduling the audit for the accessory [%@] as current device is not the primary resident";
LABEL_8:
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v13, buf, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (objc_msgSend(v7, "hasAnyResident"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      v13 = "%{public}@Not scheduling the audit for the accessory [%@] as current device is not a resident and the home has residents.";
      goto LABEL_8;
    }
LABEL_9:

LABEL_12:
    objc_autoreleasePoolPop(v9);
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isOwnerUser"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    -[HMDBackgroundOperationManager queue](self, "queue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __110__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditOwnerPairingForAirPlayAccessory_isRunningOnResident___block_invoke;
    v15[3] = &unk_24E79C268;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v14, "addOperationWithBlock:", v15);

    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)scheduleHH2KeyRollForAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDBackgroundOperationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAddAccessoryPairingOperation *v20;
  HMDRemoveAccessoryPairingOperation *v21;
  HMDForcePairVerifyAccessoryOperation *v22;
  HMDForcePairVerifyAccessoryOperation *v23;
  void *v24;
  HMDBackgroundOperationManager *v25;
  void *v26;
  void *v27;
  HMDBackgroundOperationManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  HMDBackgroundOperationManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDBackgroundOperationManager *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  HMDBackgroundOperationManager *v44;
  NSObject *v45;
  void *v46;
  HMDBackgroundOperationManager *v47;
  void *v48;
  const char *v49;
  HMDBackgroundOperationManager *v50;
  void *v51;
  uint64_t v53;
  NSObject *log;
  os_log_t loga;
  _QWORD v56[3];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_44:
    _HMFPreconditionFailure();
  }
  v11 = v10;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_44;
  if (v9 && v11)
  {
    if (-[HMDBackgroundOperationManager _scheduleKeyRollForAccessory:](self, "_scheduleKeyRollForAccessory:", v8))
    {
      v56[0] = objc_opt_class();
      v56[1] = objc_opt_class();
      v56[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v17;
        v59 = 2112;
        v60 = v8;
        v61 = 2112;
        v62 = v11;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to schedule key roll for Accessory : %@, with new pairing : %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v8, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v15, "removeOperationsForAccessoryIdentifier:operationKind:", v18, v13);

      objc_msgSend(v8, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMDAddAccessoryPairingOperation initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:]([HMDAddAccessoryPairingOperation alloc], "initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:", v8, v11, objc_msgSend(v19, "isOwnerUser"), 1, 1);
      if (!v20)
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = v15;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not create addAccessoryPairingWithHH2Identity operation", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(v8, "uuid");
        v21 = (HMDRemoveAccessoryPairingOperation *)objc_claimAutoreleasedReturnValue();
        -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v40, "removeOperationsForAccessoryIdentifier:operationKind:", v21, v13);
        v33 = 0;
        goto LABEL_41;
      }
      v21 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:isOwnerIdentity:identityToRemove:]([HMDRemoveAccessoryPairingOperation alloc], "initWithAccessory:isOwnerIdentity:identityToRemove:", v8, objc_msgSend(v19, "isOwnerUser"), v9);
      if (!v21)
      {
        v43 = MEMORY[0x227676638]();
        v44 = v15;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          loga = v43;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v46;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not create removeOldPairing operation, not adding addAccessoryPairingWithHH2Identity", buf, 0xCu);

          v43 = loga;
        }

        objc_autoreleasePoolPop(v43);
        objc_msgSend(v8, "uuid");
        v23 = (HMDForcePairVerifyAccessoryOperation *)objc_claimAutoreleasedReturnValue();
        -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v44, "removeOperationsForAccessoryIdentifier:operationKind:", v23, v13);
        goto LABEL_39;
      }
      if (objc_msgSend(v8, "hasIPLink"))
      {
        v22 = [HMDForcePairVerifyAccessoryOperation alloc];
        v23 = -[HMDAccessoryBackgroundOperation initWithAccessory:userData:](v22, "initWithAccessory:userData:", v8, MEMORY[0x24BDBD1B8]);
        if (!v23)
        {
          v24 = (void *)MEMORY[0x227676638]();
          v25 = v15;
          HMFGetOSLogHandle();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = v26;
            _os_log_impl(&dword_2218F0000, log, OS_LOG_TYPE_ERROR, "%{public}@Could not create forcePV operation, not adding addAccessoryPairingWithHH2Identity and removeOldPairing", buf, 0xCu);

          }
          v23 = 0;
          goto LABEL_38;
        }
      }
      else
      {
        v23 = 0;
      }
      -[HMDBackgroundOperationManager addOperation:](v15, "addOperation:", v20);
      if (-[HMDBackgroundOperationManager addOperationDependency:dependsOn:](v15, "addOperationDependency:dependsOn:", v21, v20))
      {
        if (!v23
          || -[HMDBackgroundOperationManager addOperationDependency:dependsOn:](v15, "addOperationDependency:dependsOn:", v23, v21))
        {
          v33 = 1;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        v53 = MEMORY[0x227676638]();
        v50 = v15;
        HMFGetOSLogHandle();
        log = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v48;
        v49 = "%{public}@Could not establish dependency between forcePV & removeOldPairing operation";
      }
      else
      {
        v53 = MEMORY[0x227676638]();
        v47 = v15;
        HMFGetOSLogHandle();
        log = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
LABEL_37:
          v24 = (void *)v53;
LABEL_38:

          objc_autoreleasePoolPop(v24);
          objc_msgSend(v8, "uuid");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v15, "removeOperationsForAccessoryIdentifier:operationKind:", v51, v13);

LABEL_39:
          v33 = 0;
          goto LABEL_40;
        }
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v48;
        v49 = "%{public}@Could not establish dependency between removeOldPairing & addAccessoryPairingWithHH2Identity";
      }
      _os_log_impl(&dword_2218F0000, log, OS_LOG_TYPE_ERROR, v49, buf, 0xCu);

      goto LABEL_37;
    }
    v34 = (void *)MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v37;
      v59 = 2112;
      v60 = v38;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Not scheduling HH2 key roll operations for accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    v33 = 1;
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperationManager hh1Key](v28, "hh1Key");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperationManager hh2Key](v28, "hh2Key");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v58 = v30;
      v59 = 2112;
      v60 = v8;
      v61 = 2112;
      v62 = v31;
      v63 = 2112;
      v64 = v32;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for accessory [%@] as we don't have needed keys to work with: [hh1: %@] [hh2: %@]", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    v33 = 0;
  }
LABEL_42:

  return v33;
}

- (BOOL)scheduleHH2KeyRollForAirPlayAccessory:(id)a3 previousIdentity:(id)a4 newIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDBackgroundOperationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HMDAddAccessoryPairingOperation *v21;
  HMDRemoveAccessoryPairingOperation *v22;
  void *v23;
  BOOL v24;
  void *v25;
  HMDBackgroundOperationManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDBackgroundOperationManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDBackgroundOperationManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDBackgroundOperationManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD v46[2];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_27:
    _HMFPreconditionFailure();
  }
  v11 = v10;
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_27;
  if (v9 && v11)
  {
    v46[0] = objc_opt_class();
    v46[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x227676638](v13);
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v17;
      v49 = 2112;
      v50 = v8;
      v51 = 2112;
      v52 = v11;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to schedule key roll for Accessory : %@, with new pairing : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v8, "uuid", v46[0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v15, "removeOperationsForAccessoryIdentifier:operationKind:", v18, v13);

    objc_msgSend(v8, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isOwnerUser");

    v21 = -[HMDAddAccessoryPairingOperation initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:]([HMDAddAccessoryPairingOperation alloc], "initWithAccessory:newPairingIdentity:asOwner:asAdmin:shouldUpdateKeyChainEntry:", v8, v11, v20, 1, 0);
    if (v21)
    {
      v22 = -[HMDRemoveAccessoryPairingOperation initWithAccessory:isOwnerIdentity:identityToRemove:]([HMDRemoveAccessoryPairingOperation alloc], "initWithAccessory:isOwnerIdentity:identityToRemove:", v8, 0, v9);
      if (v22)
      {
        v23 = v22;
        -[HMDBackgroundOperationManager addOperation:](v15, "addOperation:", v21);
        if (-[HMDBackgroundOperationManager addOperationDependency:dependsOn:](v15, "addOperationDependency:dependsOn:", v23, v21))
        {
          -[HMDBackgroundOperationManager evaluateOperations](v15, "evaluateOperations");
          v24 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v40 = (void *)MEMORY[0x227676638]();
        v41 = v15;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v43;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not establish dependency between removeOldPairing & addAccessoryPairingWithHH2Identity", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v8, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v41, "removeOperationsForAccessoryIdentifier:operationKind:", v44, v13);

      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = v15;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not create removeOldPairing operation, not adding addAccessoryPairingWithHH2Identity", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        objc_msgSend(v8, "uuid");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v36, "removeOperationsForAccessoryIdentifier:operationKind:", v39, v13);

        v23 = 0;
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = v15;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not create addAccessoryPairingWithHH2Identity operation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(v8, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperationManager removeOperationsForAccessoryIdentifier:operationKind:](v32, "removeOperationsForAccessoryIdentifier:operationKind:", v23, v13);
    }
    v24 = 0;
    goto LABEL_24;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperationManager hh1Key](v26, "hh1Key");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperationManager hh2Key](v26, "hh2Key");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v48 = v28;
    v49 = 2112;
    v50 = v8;
    v51 = 2112;
    v52 = v29;
    v53 = 2112;
    v54 = v30;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for accessory [%@] as we don't have needed keys to work with: [hh1: %@] [hh2: %@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v25);
  v24 = 0;
LABEL_25:

  return v24;
}

- (id)getHH1ControllerKey
{
  void *v2;
  char v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v13 = 0;
  v3 = objc_msgSend(v2, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v15, 0, &v14, 0, &v13);
  v4 = v15;
  v5 = v14;
  v6 = v13;

  if ((v3 & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F230]), "initWithPairingKeyData:", v4);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBB0]), "initWithIdentifier:publicKey:privateKey:permissions:", v5, v7, 0, 1);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (id)getHH2ControllerKey
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPreferredHH2ControllerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldWeScheduleKeyRollOperationsOnThisDevice
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isiOSDevice") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isAppleTV") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isHomePod");

    }
  }

  return v4;
}

- (void)registerForNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__registerForNotifications__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  if (registerForNotifications_onceToken != -1)
    dispatch_once(&registerForNotifications_onceToken, block);
}

void __77__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__registerForNotifications__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_scheduleHH2KeyRollIfNecessaryDueToNotification_, CFSTR("HMDFMFStatusUpdateNotification"), 0);

}

void __110__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditOwnerPairingForAirPlayAccessory_isRunningOnResident___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "hh1Key");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hh2Key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleHH2KeyRollForAirPlayAccessory:previousIdentity:newIdentity:", v3, v5, v4);

}

void __104__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntryForAccessory_isRunningOnResident___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "hh1Key");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hh2Key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleHH2KeyRollForAccessory:previousIdentity:newIdentity:", v3, v5, v4);

}

void __140__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__auditKeyChainEntriesAndScheduleKeyRollOperationsIfNecessaryForHome_isRunningOnResident___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v5 | v8)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "auditKeyChainEntryForAccessory:isRunningOnResident:", v5, *(unsigned __int8 *)(a1 + 40));
    }
    else if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "auditOwnerPairingForAirPlayAccessory:isRunningOnResident:", v8, *(unsigned __int8 *)(a1 + 40));
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operation for non HAP and non AirPlay accessory : %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __99__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__startSchedulingKeyRollOperations_forAccessory___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleHH2KeyRollOperationForHome:isRunningOnResident:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __100__HMDBackgroundOperationManager_ScheduleHH2KeyRoll__scheduleHH2KeyRollIfNecessaryDueToNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleHH2KeyRollIfNecessary");
}

void __84__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2KeyRollIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceStateDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isiOSDevice");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceStateDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDesignatedFMFDevice");

    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "startSchedulingKeyRollOperations:forAccessory:", 0, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Not scheduling key roll operations as this device is not designated FMF device", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
  }
}

void __91__HMDBackgroundOperationManager_ScheduleHH2KeyRoll___scheduleHH2AirPlayKeyRollIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceStateDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isiOSDevice") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentDeviceStateDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDesignatedFMFDevice");

  if (!v4)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceStateDataSource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isiOSDevice");

    return;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to audit the AirPlay accessory's pairing identities : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "auditOwnerPairingForAirPlayAccessory:isRunningOnResident:", *(_QWORD *)(a1 + 40), 0);
}

- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3
{
  id v4;
  HMDBackgroundOperationManagerCurrentDeviceStateDataSource *v5;
  void *v6;
  HMDBackgroundOperationManager *v7;

  v4 = a3;
  v5 = objc_alloc_init(HMDBackgroundOperationManagerCurrentDeviceStateDataSource);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackgroundOperationManager initWithHomeManager:currentDeviceStateDataSource:notificationCenter:](self, "initWithHomeManager:currentDeviceStateDataSource:notificationCenter:", v4, v5, v6);

  return v7;
}

- (HMDBackgroundOperationManager)initWithHomeManager:(id)a3 currentDeviceStateDataSource:(id)a4 notificationCenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDBackgroundOperationManager *v11;
  HMDBackgroundOperationManager *v12;
  uint64_t v13;
  NSMutableArray *dataSourceList;
  NSOperationQueue *v15;
  NSOperationQueue *queue;
  void *v17;
  uint64_t v18;
  NSMutableArray *operationList;
  HMDBackgroundOperationGraph *v20;
  HMDBackgroundOperationGraph *opGraph;
  void *v22;
  uint64_t v23;
  HMFTimer *dataSourceCoalescingTimer;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HMDBackgroundOperationManager;
  v11 = -[HMDBackgroundOperationManager init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    dataSourceList = v12->_dataSourceList;
    v12->_dataSourceList = (NSMutableArray *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queue = v12->_queue;
    v12->_queue = v15;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12->_queue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", HMFDispatchQueueName());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v12->_queue, "setName:", v17);

    -[NSOperationQueue setQualityOfService:](v12->_queue, "setQualityOfService:", 9);
    objc_storeStrong((id *)&v12->_currentDeviceStateDataSource, a4);
    objc_storeStrong((id *)&v12->_notificationCenter, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    operationList = v12->_operationList;
    v12->_operationList = (NSMutableArray *)v18;

    v20 = -[HMDBackgroundOperationGraph initWithOperations:]([HMDBackgroundOperationGraph alloc], "initWithOperations:", v12->_operationList);
    opGraph = v12->_opGraph;
    v12->_opGraph = v20;

    -[HMDBackgroundOperationManager currentDeviceStateDataSource](v12, "currentDeviceStateDataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timerWithTimeInterval:options:label:", 8, CFSTR("dataSourceCoalescingTimer"), 1.0);
    v23 = objc_claimAutoreleasedReturnValue();
    dataSourceCoalescingTimer = v12->_dataSourceCoalescingTimer;
    v12->_dataSourceCoalescingTimer = (HMFTimer *)v23;

    -[HMFTimer setDelegate:](v12->_dataSourceCoalescingTimer, "setDelegate:", v12);
    -[HMDBackgroundOperationManager addDefaultDataSources](v12, "addDefaultDataSources");
    -[HMDBackgroundOperationManager checkAndRemoveExpiredOperations](v12, "checkAndRemoveExpiredOperations");
    -[HMDBackgroundOperationManager scheduleTimerToCheckAndRemoveExpiredOperation](v12, "scheduleTimerToCheckAndRemoveExpiredOperation");
  }

  return v12;
}

- (NSMutableArray)operationList
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_operationList, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (HMFTimer)dataSourceCoalescingTimer
{
  os_unfair_lock_s *p_lock;
  HMFTimer *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_dataSourceCoalescingTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFTimer)expirationTimer
{
  os_unfair_lock_s *p_lock;
  HMFTimer *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_expirationTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMFTimer)deferralTimer
{
  os_unfair_lock_s *p_lock;
  HMFTimer *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deferralTimer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addOperation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDBackgroundOperationManager *v7;
  NSObject *v8;
  void *v9;
  HMDBackgroundOperationGraph *opGraph;
  void *v11;
  void *v12;
  HMDBackgroundOperationManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDBackgroundOperationManager checkAndRemoveExpiredOperations](self, "checkAndRemoveExpiredOperations");
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableArray containsObject:](self->_operationList, "containsObject:", v4) & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[NSMutableArray addObject:](self->_operationList, "addObject:", v4);
      opGraph = self->_opGraph;
      objc_msgSend(v4, "operationUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperationGraph addVertex:](opGraph, "addVertex:", v11);

      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Enqueued operation: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      os_unfair_lock_unlock(p_lock);
      -[HMDBackgroundOperationManager scheduleTimerToCheckAndRemoveExpiredOperation](v13, "scheduleTimerToCheckAndRemoveExpiredOperation");
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not add the operation as it was nil.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (BOOL)addOperationDependency:(id)a3 dependsOn:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDBackgroundOperationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  os_unfair_lock_s *p_lock;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDBackgroundOperationManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDBackgroundOperationManager *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@The passed parameter is nil. Cannot add dependency.", (uint8_t *)&v39, 0xCu);

    }
    goto LABEL_9;
  }
  if (HMFEqualObjects())
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot add operation as dependency to itself", (uint8_t *)&v39, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v9);
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  -[HMDBackgroundOperationManager addOperation:](self, "addOperation:", v6);
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundOperationManager opGraph](self, "opGraph");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v19 = v17;
  objc_msgSend(v6, "operationUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operationUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v19, "canAddEdgeFrom:to:", v20, v21);
  if (v22)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543874;
      v40 = v26;
      v41 = 2112;
      v42 = (uint64_t)v18;
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cycle detected while adding %@ to as dependency for %@", (uint8_t *)&v39, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    os_unfair_lock_unlock(p_lock);
    goto LABEL_10;
  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v18, "operationUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDependency:", v27);

  -[HMDBackgroundOperationManager addOperation:](self, "addOperation:", v18);
  -[HMDBackgroundOperationManager opGraph](self, "opGraph");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operationUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addEdgeFrom:to:", v29, v30);

  v31 = (void *)MEMORY[0x227676638]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_class();
    objc_msgSend(v6, "operationUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_class();
    objc_msgSend(v18, "operationUUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138544386;
    v40 = v34;
    v41 = 2112;
    v42 = v35;
    v43 = 2112;
    v44 = v36;
    v45 = 2112;
    v46 = v37;
    v47 = 2112;
    v48 = v38;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@%@/%@ depends on %@/%@", (uint8_t *)&v39, 0x34u);

  }
  objc_autoreleasePoolPop(v31);
  v14 = 1;
LABEL_11:

  return v14;
}

- (void)removeOperation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMDBackgroundOperationManager *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      v11 = "%{public}@Could not remove the operation as it was nil.";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 12;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v15, v14);

    }
LABEL_9:

    objc_autoreleasePoolPop(v7);
    goto LABEL_10;
  }
  -[HMDBackgroundOperationManager checkAndRemoveExpiredOperations](self, "checkAndRemoveExpiredOperations");
  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v4;
      v11 = "%{public}@Could not remove the operation as it was not found : %@";
      v12 = v9;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[HMDBackgroundOperationManager completeProcessingForOperation:](self, "completeProcessingForOperation:", v4);
LABEL_10:

}

- (void)addDataSource:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDBackgroundOperationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDBackgroundOperationManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableArray containsObject:](self->_dataSourceList, "containsObject:", v4))
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v9;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not add the operation as it already exist : %@", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      -[NSMutableArray addObject:](self->_dataSourceList, "addObject:", v4);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not add the data source as it was nil.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)addDefaultDataSources
{
  NSMutableArray *dataSourceList;
  HMDBackgroundOperationAccessoryManagerDataSource *v4;
  HMDBackgroundOperationAccessoryManagerDataSource *v5;
  id v6;

  dataSourceList = self->_dataSourceList;
  v4 = [HMDBackgroundOperationAccessoryManagerDataSource alloc];
  -[HMDBackgroundOperationManager notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDBackgroundOperationAccessoryManagerDataSource initWithOperationManager:notificationCenter:](v4, "initWithOperationManager:notificationCenter:", self, v6);
  -[NSMutableArray addObject:](dataSourceList, "addObject:", v5);

}

- (void)dataSourceHasUpdate:(id)a3
{
  id v3;

  -[HMDBackgroundOperationManager dataSourceCoalescingTimer](self, "dataSourceCoalescingTimer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

}

- (void)_dataSourceHasUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDBackgroundOperationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hmf_isEmpty");

  v7 = (void *)MEMORY[0x227676638]();
  if (v6)
  {
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@No background operations to run. Not evaluating data source : [%@]", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperationManager dataSourceList](self, "dataSourceList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__HMDBackgroundOperationManager__dataSourceHasUpdate___block_invoke;
    v14[3] = &unk_24E7864A8;
    v15 = v11;
    v13 = v11;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

    -[HMDBackgroundOperationManager _runOperationsAfterEvaluatingPredicate:](self, "_runOperationsAfterEvaluatingPredicate:", v13);
  }
  objc_autoreleasePoolPop(v7);

}

- (void)_runOperationsAfterEvaluatingPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDBackgroundOperationManager *v10;

  v4 = a3;
  -[HMDBackgroundOperationManager __getReadyToExecuteOperations](self, "__getReadyToExecuteOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_126060);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke_2;
  v8[3] = &unk_24E786510;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

}

- (void)_runOperation:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isReadyToRun"))
  {
    objc_msgSend((id)objc_opt_class(), "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "evaluateWithObject:", v7);

    if (v9)
    {
      objc_initWeak(&location, v6);
      v10 = (void *)MEMORY[0x24BDD1478];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__HMDBackgroundOperationManager__runOperation_withParameters___block_invoke;
      v13[3] = &unk_24E7972B0;
      objc_copyWeak(&v14, &location);
      v13[4] = self;
      objc_msgSend(v10, "blockOperationWithBlock:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setScheduled:", 1);
      objc_msgSend(v11, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));
      -[HMDBackgroundOperationManager queue](self, "queue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addOperation:", v11);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

- (void)checkAndRemoveExpiredOperations
{
  os_unfair_lock_s *p_lock;
  NSMutableArray **p_operationList;
  void *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_operationList = &self->_operationList;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](*p_operationList, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *p_operationList;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__HMDBackgroundOperationManager_checkAndRemoveExpiredOperations__block_invoke;
  v9[3] = &unk_24E786538;
  v7 = v5;
  v10 = v7;
  -[NSMutableArray hmf_enumerateWithAutoreleasePoolUsingBlock:](v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
  v8 = -[NSMutableArray count](*p_operationList, "count");
  if (v8 != objc_msgSend(v7, "count"))
    objc_storeStrong((id *)p_operationList, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)scheduleTimerToCheckAndRemoveExpiredOperation
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  HMFTimer *v13;
  HMFTimer *expirationTimer;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__126039;
    v27 = __Block_byref_object_dispose__126040;
    v28 = 0;
    -[HMDBackgroundOperationManager operationList](self, "operationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __78__HMDBackgroundOperationManager_scheduleTimerToCheckAndRemoveExpiredOperation__block_invoke;
    v20 = &unk_24E786560;
    v8 = v6;
    v21 = v8;
    v22 = &v23;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v17);

    v9 = (void *)v24[5];
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v8, v17, v18, v19, v20);
      v11 = v10;
      if (v10 > 0.0)
      {
        os_unfair_lock_lock_with_options();
        -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timerWithTimeInterval:options:label:", 1, CFSTR("expirationTimer"), v11);
        v13 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
        expirationTimer = self->_expirationTimer;
        self->_expirationTimer = v13;

        os_unfair_lock_unlock(&self->_lock);
        -[HMDBackgroundOperationManager expirationTimer](self, "expirationTimer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDelegate:", self);

        -[HMDBackgroundOperationManager expirationTimer](self, "expirationTimer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resume");

      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (void)scheduleTimerToRetryDeferredOperations
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  HMFTimer *v13;
  HMFTimer *deferralTimer;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__126039;
    v27 = __Block_byref_object_dispose__126040;
    v28 = 0;
    -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDBackgroundOperationManager operationList](self, "operationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __71__HMDBackgroundOperationManager_scheduleTimerToRetryDeferredOperations__block_invoke;
    v20 = &unk_24E786560;
    v8 = v6;
    v21 = v8;
    v22 = &v23;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v17);

    v9 = (void *)v24[5];
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v8, v17, v18, v19, v20);
      v11 = v10;
      if (v10 > 0.0)
      {
        os_unfair_lock_lock_with_options();
        -[HMDBackgroundOperationManager currentDeviceStateDataSource](self, "currentDeviceStateDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timerWithTimeInterval:options:label:", 1, CFSTR("deferralTimer"), v11);
        v13 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
        deferralTimer = self->_deferralTimer;
        self->_deferralTimer = v13;

        os_unfair_lock_unlock(&self->_lock);
        -[HMDBackgroundOperationManager deferralTimer](self, "deferralTimer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDelegate:", self);

        -[HMDBackgroundOperationManager deferralTimer](self, "deferralTimer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resume");

      }
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSOperationQueue *queue;
  _QWORD v9[5];

  v4 = a3;
  -[HMDBackgroundOperationManager expirationTimer](self, "expirationTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDBackgroundOperationManager checkAndRemoveExpiredOperations](self, "checkAndRemoveExpiredOperations");
    -[HMDBackgroundOperationManager scheduleTimerToCheckAndRemoveExpiredOperation](self, "scheduleTimerToCheckAndRemoveExpiredOperation");
  }
  else
  {
    -[HMDBackgroundOperationManager deferralTimer](self, "deferralTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[HMDBackgroundOperationManager dataSourceHasUpdate:](self, "dataSourceHasUpdate:", 0);
      -[HMDBackgroundOperationManager scheduleTimerToRetryDeferredOperations](self, "scheduleTimerToRetryDeferredOperations");
    }
    else
    {
      -[HMDBackgroundOperationManager dataSourceCoalescingTimer](self, "dataSourceCoalescingTimer");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        queue = self->_queue;
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __46__HMDBackgroundOperationManager_timerDidFire___block_invoke;
        v9[3] = &unk_24E79C240;
        v9[4] = self;
        -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v9);
      }
    }
  }

}

- (void)completeProcessingForOperation:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMDBackgroundOperationManager *v8;
  NSObject *v9;
  void *v10;
  HMDBackgroundOperationGraph *opGraph;
  void *v12;
  NSMutableArray *operationList;
  uint64_t v14;
  id v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x227676638](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@complete processing for : %@. Will remove it from the graph", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  opGraph = v8->_opGraph;
  objc_msgSend(v4, "operationUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperationGraph removeVertex:](opGraph, "removeVertex:", v12);

  -[NSMutableArray removeObject:](v8->_operationList, "removeObject:", v4);
  operationList = v8->_operationList;
  v14 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke;
  v22[3] = &unk_24E795928;
  v15 = v4;
  v23 = v15;
  if (-[NSMutableArray na_any:](operationList, "na_any:", v22))
  {
    v16 = v8->_operationList;
    v17 = v14;
    v18 = 3221225472;
    v19 = __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke_2;
    v20 = &unk_24E786538;
    v21 = v15;
    -[NSMutableArray hmf_enumerateWithAutoreleasePoolUsingBlock:](v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v17);

    os_unfair_lock_unlock(p_lock);
    -[HMDBackgroundOperationManager scheduleTimerToCheckAndRemoveExpiredOperation](v8, "scheduleTimerToCheckAndRemoveExpiredOperation", v17, v18, v19, v20);
    -[HMDBackgroundOperationManager evaluateOperations](v8, "evaluateOperations");
  }
  else
  {

    os_unfair_lock_unlock(p_lock);
    -[HMDBackgroundOperationManager scheduleTimerToCheckAndRemoveExpiredOperation](v8, "scheduleTimerToCheckAndRemoveExpiredOperation");
  }

}

- (void)evaluateOperations
{
  -[HMDBackgroundOperationManager dataSourceHasUpdate:](self, "dataSourceHasUpdate:", 0);
}

- (void)removeAllOperationsBeforeStartingHH2Migration
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDBackgroundOperationManager *v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *operationList;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_operationList, "count"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing all operations before starting HH2 migration", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    operationList = self->_operationList;
    self->_operationList = v8;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllOperationForAccessoryIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDBackgroundOperationManager *v9;

  v4 = a3;
  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMDBackgroundOperationManager_removeAllOperationForAccessoryIdentifier___block_invoke;
  v7[3] = &unk_24E786510;
  v8 = v4;
  v9 = self;
  v5 = v4;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

}

- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDBackgroundOperationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  HMDBackgroundOperationManager *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "hmf_isEmpty"))
  {
    -[HMDBackgroundOperationManager operationList](self, "operationList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke;
    v14[3] = &unk_24E7865B0;
    v15 = v8;
    v16 = v6;
    v17 = self;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@List of operation classes are needed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)removeOperationsForAccessoryIdentifier:(id)a3 operationKind:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  HMDBackgroundOperationManager *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  HMDBackgroundOperationManager *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && (v11 = objc_msgSend(v9, "hmf_isEmpty"), v10) && !v11)
  {
    -[HMDBackgroundOperationManager operationList](self, "operationList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke;
    v17[3] = &unk_24E7865D8;
    v18 = v9;
    v19 = v8;
    v20 = self;
    v21 = v10;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@List of operation classes are needed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)__getReadyToExecuteOperations
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSMutableArray *operationList;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) != 0)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundOperationGraph getIndependentVertices](self->_opGraph, "getIndependentVertices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  operationList = self->_operationList;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__HMDBackgroundOperationManager___getReadyToExecuteOperations__block_invoke;
  v13[3] = &unk_24E786510;
  v11 = v9;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  -[NSMutableArray hmf_enumerateWithAutoreleasePoolUsingBlock:](operationList, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

  os_unfair_lock_unlock(p_lock);
  objc_autoreleasePoolPop(v7);
  return v12;
}

- (void)__removeAllDataSourcesForUnitTesting
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_dataSourceList, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)__removeAllOperationsForUnitTesting
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_operationList, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)__resetAndRebuildOperationGraphForUnitTesting
{
  os_unfair_lock_s *p_lock;
  HMDBackgroundOperationGraph *v4;
  HMDBackgroundOperationGraph *opGraph;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMDBackgroundOperationGraph initWithOperations:]([HMDBackgroundOperationGraph alloc], "initWithOperations:", self->_operationList);
  opGraph = self->_opGraph;
  self->_opGraph = v4;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)scheduleOperationsWithDependenciesOnEachOtherFromArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  HMDBackgroundOperationManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[HMDBackgroundOperationManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke;
  v8[3] = &unk_24E79C0A8;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "addOperationWithBlock:", v8);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBackgroundOperationManager operationList](self, "operationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__HMDBackgroundOperationManager_dumpState__block_invoke;
  v9[3] = &unk_24E786538;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  return v7;
}

- (HMDBackgroundOperationManagerCurrentDeviceStateDataSource)currentDeviceStateDataSource
{
  return self->_currentDeviceStateDataSource;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (void)setOperationList:(id)a3
{
  objc_storeStrong((id *)&self->_operationList, a3);
}

- (NSMutableArray)dataSourceList
{
  return self->_dataSourceList;
}

- (void)setDataSourceList:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceList, a3);
}

- (HMDBackgroundOperationGraph)opGraph
{
  return self->_opGraph;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HAPPairingIdentity)hh1Key
{
  return self->_hh1Key;
}

- (void)setHh1Key:(id)a3
{
  objc_storeStrong((id *)&self->_hh1Key, a3);
}

- (HAPPairingIdentity)hh2Key
{
  return self->_hh2Key;
}

- (void)setHh2Key:(id)a3
{
  objc_storeStrong((id *)&self->_hh2Key, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hh2Key, 0);
  objc_storeStrong((id *)&self->_hh1Key, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_opGraph, 0);
  objc_storeStrong((id *)&self->_dataSourceList, 0);
  objc_storeStrong((id *)&self->_operationList, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_currentDeviceStateDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_deferralTimer, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
}

void __42__HMDBackgroundOperationManager_dumpState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dumpState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[7];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__126039;
  v7[4] = __Block_byref_object_dispose__126040;
  v8 = 0;
  v2 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_2;
  v6[3] = &unk_24E786620;
  v3 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v6[5] = v7;
  v6[6] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "evaluateOperations");
  }
  else
  {
    v5[0] = v2;
    v5[1] = 3221225472;
    v5[2] = __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_34;
    v5[3] = &unk_24E786538;
    v4 = *(void **)(a1 + 32);
    v5[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
  }
  _Block_object_dispose(v7, 8);

}

void __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v8, "addOperation:", v7);
    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "addOperationDependency:dependsOn:", v7) & 1) != 0)
  {
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to add operation %@ which depends on %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  *a4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_8:

}

uint64_t __88__HMDBackgroundOperationManager_scheduleOperationsWithDependenciesOnEachOtherFromArray___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeOperation:", a2);
}

void __62__HMDBackgroundOperationManager___getReadyToExecuteOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "operationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke_2;
  v19[3] = &unk_24E786588;
  v5 = v3;
  v20 = v5;
  if (objc_msgSend(v4, "na_any:", v19))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "accessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v10)
      {
        v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        if ((_DWORD)v11)
          v11 = objc_msgSend(*(id *)(a1 + 48), "removeOperation:", v8);
        v12 = (void *)MEMORY[0x227676638](v11);
        v13 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_opt_class();
          v17 = *(_QWORD *)(a1 + 40);
          HMFBooleanToString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v22 = v15;
          v23 = 2112;
          v24 = v16;
          v25 = 2112;
          v26 = v17;
          v27 = 2112;
          v28 = v18;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[%@] operation for accessory : %@ was removed? %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v12);
      }
    }

  }
}

uint64_t __96__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind_withBlock___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

void __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke_2;
  v17[3] = &unk_24E786588;
  v5 = v3;
  v18 = v5;
  if (objc_msgSend(v4, "na_any:", v17))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "accessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v10)
      {
        v11 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 48), "removeOperation:", v8));
        v12 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_class();
          v16 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v20 = v14;
          v21 = 2112;
          v22 = v15;
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing [%@] operation for accessory : %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
      }
    }

  }
}

uint64_t __86__HMDBackgroundOperationManager_removeOperationsForAccessoryIdentifier_operationKind___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

void __74__HMDBackgroundOperationManager_removeAllOperationForAccessoryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "accessoryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "removeOperation:", v5));
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_class();
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 138543874;
        v15 = v11;
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing [%@] operation for accessory : %@", (uint8_t *)&v14, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
    }
  }

}

uint64_t __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "operationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasDependency:", v4);

  return v5;
}

void __64__HMDBackgroundOperationManager_completeProcessingForOperation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "operationUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDependency:", v4);

}

uint64_t __46__HMDBackgroundOperationManager_timerDidFire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataSourceHasUpdate:", 0);
}

void __71__HMDBackgroundOperationManager_scheduleTimerToRetryDeferredOperations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "deferralDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v15, "deferralDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5);

    if (v6 == -1)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v15, "deferralDate");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7)
      {
        objc_msgSend(v7, "earlierDate:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
      else
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v8;
        v9 = v14;
      }

    }
  }

}

void __78__HMDBackgroundOperationManager_scheduleTimerToCheckAndRemoveExpiredOperation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v15, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  v6 = v15;
  if (v5 == -1)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v15, "expirationDate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      objc_msgSend(v7, "earlierDate:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v8;
      v9 = v14;
    }

    v6 = v15;
  }

}

void __64__HMDBackgroundOperationManager_checkAndRemoveExpiredOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isExpired") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __62__HMDBackgroundOperationManager__runOperation_withParameters___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      objc_msgSend(WeakRetained, "operationUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "userData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to run : %@/%@/%@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(WeakRetained, "runOperation:", v11);

    v13 = *(void **)(a1 + 32);
    if (v12)
      objc_msgSend(v13, "completeProcessingForOperation:", WeakRetained);
    else
      objc_msgSend(v13, "scheduleTimerToRetryDeferredOperations");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Operation which was supposed to run got deallocated.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }

}

void __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "userData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("userData"));

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v3, "operationUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "failureCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Scheduling the operation [%@:%@:%@:%@]", (uint8_t *)&v14, 0x34u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 40), "_runOperation:withParameters:", v3, *(_QWORD *)(a1 + 32));

}

uint64_t __72__HMDBackgroundOperationManager__runOperationsAfterEvaluatingPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(a2, "failureCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "failureCount");

  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

void __54__HMDBackgroundOperationManager__dataSourceHasUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "values");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38_126098 != -1)
    dispatch_once(&logCategory__hmf_once_t38_126098, &__block_literal_global_31_126099);
  return (id)logCategory__hmf_once_v39_126100;
}

+ (id)getAllPairedAccessoriesOfAllHomes:(id)a3
{
  return (id)objc_msgSend(a3, "pairedAccessories");
}

+ (id)getAllReachableAccessories:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a1, "getAllPairedAccessoriesOfAllHomes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__HMDBackgroundOperationManager_getAllReachableAccessories___block_invoke;
  v8[3] = &unk_24E787690;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

+ (id)findHomeWhereThisDeviceIsConfirmedPrimaryResident:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_37_126097);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)findAccessoryUsing:(id)a3 homeManager:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  objc_msgSend(a1, "getAllPairedAccessoriesOfAllHomes:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__HMDBackgroundOperationManager_findAccessoryUsing_homeManager___block_invoke;
  v11[3] = &unk_24E790530;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)findAccessoryUsing:(id)a3 fromHome:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HMDBackgroundOperationManager_findAccessoryUsing_fromHome___block_invoke;
  v10[3] = &unk_24E790530;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)findHomeUsingIdentifier:(id)a3 homeManager:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HMDBackgroundOperationManager_findHomeUsingIdentifier_homeManager___block_invoke;
  v10[3] = &unk_24E796248;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)findUserWithUUID:(id)a3 fromHomeManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__126039;
  v18 = __Block_byref_object_dispose__126040;
  v19 = 0;
  objc_msgSend(v6, "homes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__HMDBackgroundOperationManager_findUserWithUUID_fromHomeManager___block_invoke;
  v11[3] = &unk_24E786668;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __66__HMDBackgroundOperationManager_findUserWithUUID_fromHomeManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "userWithUUID:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

uint64_t __69__HMDBackgroundOperationManager_findHomeUsingIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __61__HMDBackgroundOperationManager_findAccessoryUsing_fromHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __64__HMDBackgroundOperationManager_findAccessoryUsing_homeManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __83__HMDBackgroundOperationManager_findHomeWhereThisDeviceIsConfirmedPrimaryResident___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDeviceConfirmedPrimaryResident");
}

void __60__HMDBackgroundOperationManager_getAllReachableAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isReachable"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __44__HMDBackgroundOperationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39_126100;
  logCategory__hmf_once_v39_126100 = v0;

}

@end
