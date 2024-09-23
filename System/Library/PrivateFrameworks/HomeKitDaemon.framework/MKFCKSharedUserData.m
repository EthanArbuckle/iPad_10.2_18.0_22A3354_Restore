@implementation MKFCKSharedUserData

+ (id)rootKeyPath
{
  return CFSTR("root");
}

- (id)workingStoreHomeMember
{
  HMDHomeMember **p_workingStoreHomeMember;
  HMDHomeMember *workingStoreHomeMember;
  HMDHomeMember *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  MKFCKSharedUserData *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  MKFCKSharedUserData *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  MKFCKSharedUserData *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDHomeMember *v33;
  HMDHomeMember *v34;
  HMDHomeMember *v35;
  MKFCKSharedUserData *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  p_workingStoreHomeMember = &self->_workingStoreHomeMember;
  workingStoreHomeMember = self->_workingStoreHomeMember;
  if (workingStoreHomeMember)
  {
    v4 = (HMDHomeMember *)*MEMORY[0x24BDBD430];
  }
  else
  {
    -[MKFCKSharedUserData managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmd_coreData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      _HMFPreconditionFailure();
    -[MKFCKSharedUserData objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchSharesMatchingObjectIDs:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MKFCKSharedUserData homeModelID](self, "homeModelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MKFHome findHomeMemberUsingReverseShareID:homeModelID:context:](_MKFHome, "findHomeMemberUsingReverseShareID:homeModelID:context:", v14, v13, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = v15;
        }
        else
        {
          v27 = (void *)MEMORY[0x227676638]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v37 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "hmd_debugIdentifier");
            v39 = v27;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v30;
            v42 = 2112;
            v43 = v31;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch working store user for %@", buf, 0x16u);

            v27 = v39;
            v28 = v37;
          }

          objc_autoreleasePoolPop(v27);
        }

      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "hmd_debugIdentifier");
          v38 = v22;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v25;
          v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@No homeModelID for %@", buf, 0x16u);

          v22 = v38;
        }

        objc_autoreleasePoolPop(v22);
        v15 = 0;
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_debugIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@No CKShare found for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v15 = 0;
    }

    v4 = (HMDHomeMember *)*MEMORY[0x24BDBD430];
    if (v15)
      v32 = v15;
    else
      v32 = (void *)*MEMORY[0x24BDBD430];
    objc_storeStrong((id *)p_workingStoreHomeMember, v32);

    workingStoreHomeMember = *p_workingStoreHomeMember;
  }
  v33 = workingStoreHomeMember;
  v34 = v33;
  if (v4 == v33)
    v33 = 0;
  v35 = v33;

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingStoreHomeMember, 0);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedUserData"));
}

@end
