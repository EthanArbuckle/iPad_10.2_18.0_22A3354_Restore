@implementation HMDAuditHH2KeysForBackupOperation

+ (id)predicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
}

+ (BOOL)shouldWeScheduleHH2KeyBackupOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("HMDHH2BackUpKeyBackgroundOperationTimeStampKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543362;
    v24 = v18;
    v19 = "%{public}@Allowing the backup operation to run as there is no object stored inside user defaults";
    v20 = v13;
    v21 = 12;
LABEL_13:
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v23, v21);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9;

  v11 = (void *)MEMORY[0x227676638]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 >= 86400.0)
  {
    if (!v14)
    {
      v16 = 1;
      goto LABEL_15;
    }
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v18;
    v25 = 2112;
    v26 = v7;
    v19 = "%{public}@Allowing the backup operation to run as it was last run at %@";
    v16 = 1;
    v20 = v13;
    v21 = 22;
    goto LABEL_13;
  }
  if (v14)
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v15;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not allowing the backup operation to run as it was last run at %@", (uint8_t *)&v23, 0x16u);

  }
  v16 = 0;
LABEL_15:

  objc_autoreleasePoolPop(v11);
  return v16;
}

+ (void)recordCurrentBackupRunToUserDefault
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to record the successful backup run", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("HMDHH2BackUpKeyBackgroundOperationTimeStampKey"));

}

+ (void)resetHH2KeyBackupOperationFromUserDefault
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](a1, a2);
  v4 = a1;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Going to reset the last backup run from user defaults", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("HMDHH2BackUpKeyBackgroundOperationTimeStampKey"));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_171416 != -1)
    dispatch_once(&logCategory__hmf_once_t14_171416, &__block_literal_global_171417);
  return (id)logCategory__hmf_once_v15_171418;
}

void __48__HMDAuditHH2KeysForBackupOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_171418;
  logCategory__hmf_once_v15_171418 = v0;

}

- (int64_t)qualityOfService
{
  return 17;
}

- (BOOL)mainWithError:(id *)a3
{
  void *v4;
  HMDAuditHH2KeysForBackupOperation *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  HMDAuditHH2KeysForBackupOperation *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAuditHH2KeysForBackupOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDAuditHH2KeysForBackupOperation *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  HMDAuditHH2KeysForBackupOperation *v34;
  void *v35;
  _BYTE *v36;
  id v37;
  id v38;
  uint8_t v39[4];
  void *v40;
  _BYTE buf[24];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638](self, a2, a3);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Going to make sure that we did back up our HH2 keys.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend((id)objc_opt_class(), "recordCurrentBackupRunToUserDefault");
  objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v8, "allKeysForType:error:", &unk_24E96C0B0, &v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v38;
  v37 = v10;
  objc_msgSend(v8, "allKeysForType:error:", &unk_24E96C0C8, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v37;

  v13 = objc_msgSend(v9, "count") == 0;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = v5;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@There are no HH2 keys. Nothing to backup.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v42 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found %@ HH2 keys in the list: %@{public}", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      v42 = v11;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Found %@ keys in back up list: %@{public}", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v42) = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke;
    v32[3] = &unk_24E78C340;
    v33 = v11;
    v34 = v21;
    v35 = v8;
    v36 = buf;
    v25 = objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v26 = (void *)MEMORY[0x227676638](v25);
      v27 = v21;
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v39 = 138543362;
        v40 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Looks like we failed to back up at least one key. Will retry the back up operation again in next homed reboot.", v39, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }

    _Block_object_dispose(buf, 8);
  }

  return 1;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke_2;
  v19[3] = &unk_24E796B98;
  v5 = v3;
  v20 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@We already have the back up for the key: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Looks like we do not have back up for key : %@. Adding it into the list", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if ((objc_msgSend(*(id *)(a1 + 48), "savePairingIdentityToBackUpTable:", v5) & 1) == 0)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v18;
        v23 = 2112;
        v24 = v5;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to back up the key : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }

}

uint64_t __51__HMDAuditHH2KeysForBackupOperation_mainWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = HMFEqualObjects();
  return v6;
}

@end
