@implementation MKFUser

void __39___MKFUser_additionalModelsForSameUser__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "idsMergeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "idsMergeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v3, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543874;
        v40 = v10;
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v12;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@ matched additional user model with the same idsMergeIdentifier: %@", (uint8_t *)&v39, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v16;
      v41 = 2112;
      v42 = v3;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@User model missing idsMergeIdentifier: %@", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v3, "accountIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "accountIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *(void **)(a1 + 32);
          objc_msgSend(v3, "debugDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138543874;
          v40 = v23;
          v41 = 2112;
          v42 = v24;
          v43 = 2112;
          v44 = v25;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@ matched additional user model with the same accountIdentifier: %@", (uint8_t *)&v39, 0x20u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v29;
        v41 = 2112;
        v42 = v3;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@User model missing accountIdentifier: %@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v33;
        v41 = 2112;
        v42 = v3;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine if this user model is a duplicate: %@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v34 = (void *)MEMORY[0x227676638]();
      v35 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v37;
        v41 = 2112;
        v42 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@%@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
    }

  }
}

void __23___MKFUser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_60746;
  logCategory__hmf_once_v25_60746 = v0;

}

void __24___MKFUser_homeRelation__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("home.modelID == $HOMEMODELID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)homeRelation__hmf_once_v23;
  homeRelation__hmf_once_v23 = v0;

}

@end
