@implementation HMFMessage(HMDUser)

- (id)userForHome:()HMDUser
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    if (objc_msgSend(a1, "isRemote") && objc_msgSend(a1, "remoteRestriction") != 4)
    {
      objc_msgSend(a1, "matchingRemoteIdentityUserForHome:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "currentUser");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)matchingRemoteIdentityUserForHome:()HMDUser
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home as home was nil for message %@", (uint8_t *)&v21, 0x16u);

LABEL_19:
    }
LABEL_20:

    objc_autoreleasePoolPop(v15);
    v7 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(a1, "isRemote") & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v18;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home because message is not remote: %@", (uint8_t *)&v21, 0x16u);
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  objc_msgSend(a1, "remoteSenderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v4, "userWithMergeID:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "remoteSenderContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairingIdentityIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || (objc_msgSend(v4, "userWithPairingIdentityIdentifier:", v9),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(a1, "remoteUserPairingIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (objc_msgSend(v4, "userWithPairingIdentity:", v10), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = a1;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v14;
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home for message %@", (uint8_t *)&v21, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        v7 = 0;
      }

    }
  }

LABEL_21:
  return v7;
}

@end
