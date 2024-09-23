@implementation HMFMessage(HMDUser)

- (id)matchingRemoteIdentityUserForHome:()HMDUser
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home as home was nil for message %@", (uint8_t *)&v20, 0x16u);

LABEL_16:
    }
LABEL_17:

    objc_autoreleasePoolPop(v14);
    v7 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(a1, "isRemote") & 1) == 0)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home because message is not remote: %@", (uint8_t *)&v20, 0x16u);
      goto LABEL_16;
    }
    goto LABEL_17;
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
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v13;
        v22 = 2112;
        v23 = v11;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matching identity user for home for message %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v7 = 0;
    }

  }
LABEL_18:

  return v7;
}

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

- (uint64_t)shouldWeProcessRemoteMessageDespiteNoRemoteAccessAllowedForUser:()HMDUser
{
  return objc_msgSend(a3, "shouldWeOverrideRemoteAccessAllowedDespiteNoRemoteAccessAllowed");
}

@end
