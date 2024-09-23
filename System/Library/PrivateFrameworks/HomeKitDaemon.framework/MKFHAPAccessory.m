@implementation MKFHAPAccessory

void __32___MKFHAPAccessory_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v8;
  homeRelation__hmf_once_v8 = v0;

}

void __66___MKFHAPAccessory_maybeFixUpCharacteristicWriteActionsInContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[_MKFCharacteristic fetchRequest](_MKFCharacteristic, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v3, "characteristicID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K.%K == %@)"), CFSTR("instanceID"), v7, *(_QWORD *)(a1 + 32), CFSTR("accessory"), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v8);

    v9 = *(void **)(a1 + 48);
    v28 = 0;
    objc_msgSend(v9, "executeFetchRequest:error:", v5, &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    if (v10)
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "service");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x227676638]();
        v16 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v18;
          v31 = 2112;
          v32 = v14;
          v33 = 2112;
          v34 = v3;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Assigning matching service %@ to action: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(v13, "service");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setService:", v19);

      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v27;
          v31 = 2112;
          v32 = v3;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@No matching characteristic for action: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v11;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
}

id __39___MKFHAPAccessory_hasRGCapableService__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
