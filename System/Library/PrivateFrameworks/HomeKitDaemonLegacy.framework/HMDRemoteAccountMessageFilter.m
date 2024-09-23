@implementation HMDRemoteAccountMessageFilter

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDRemoteAccountMessageFilter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  HMDRemoteAccountMessageFilter *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  HMDRemoteAccountMessageFilter *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  HMDRemoteAccountMessageFilter *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  int v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  HMDRemoteAccountMessageFilter *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  HMDRemoteAccountMessageFilter *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  HMDRemoteAccountMessageFilter *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v10;
  if (!self || !objc_msgSend(v10, "isRemote"))
  {

    goto LABEL_16;
  }
  v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (objc_msgSend(v14, "restriction") == 4
    || (-[HMDRemoteAccountMessageFilter target](self, "target"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "destination"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqual:", v16),
        v16,
        v15,
        !v17))
  {
LABEL_14:

LABEL_16:
    v29 = 1;
    goto LABEL_17;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v92 = v21;
    v93 = 2112;
    v94 = v12;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Message is targeting target: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDRemoteAccountMessageFilter allowedMessages](v19, "allowedMessages");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "containsObject:", v23);

  if (v24)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v19;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v28;
      v93 = 2112;
      v94 = v12;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Message is allowed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    goto LABEL_14;
  }

  v31 = v12;
  objc_msgSend(v31, "destination");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;
  v34 = v33;

  objc_msgSend(v34, "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "account");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v88 = v34;
    v37 = v36;
    v38 = objc_msgSend(v36, "isCurrentAccount");
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = v19;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v38)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v43;
        v93 = 2112;
        v94 = v31;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated message sent from current account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      v44 = 1;
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v50;
        v93 = 2112;
        v94 = v31;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Authenticated message not sent from current account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      v44 = 0;
    }
    v34 = v88;
    v36 = v37;
  }
  else
  {
    if (!objc_msgSend(v31, "isSecureRemote"))
      goto LABEL_55;
    objc_msgSend(v31, "remoteSenderContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "mergeID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = v46;
    v89 = v34;
    if (v46)
    {
      -[HMDRemoteAccountMessageFilter appleAccountManager](v19, "appleAccountManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "account");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "senderCorrelationIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        if (objc_msgSend(v46, "isEqualToString:", v49))
        {

          v44 = 1;
          v36 = 0;
          goto LABEL_56;
        }
      }
      else
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v85 = v19;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v83 = v51;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v92 = v53;
          v93 = 2112;
          v94 = v48;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@MergeID is not set for the current account: %@", buf, 0x16u);

          v51 = v83;
        }

        objc_autoreleasePoolPop(v51);
      }

      v36 = 0;
    }
    -[HMDRemoteAccountMessageFilter systemKeychainStore](v19, "systemKeychainStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0;
    objc_msgSend(v54, "getLocalPairingIdentity:", &v90);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v90;

    if (!v55)
    {
      v56 = v31;
      v57 = v36;
      v58 = (void *)MEMORY[0x1D17BA0A0]();
      v59 = v19;
      HMFGetOSLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v61;
        v93 = 2112;
        v94 = v86;
        _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve local pairing identity with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v58);
      v36 = v57;
      v31 = v56;
      v55 = 0;
    }
    objc_msgSend(v31, "remoteSenderContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "pairingIdentityIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63)
      goto LABEL_67;
    objc_msgSend(v55, "identifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqualToString:", v64);

    if ((v65 & 1) != 0)
    {
      v66 = 1;
    }
    else
    {
LABEL_67:
      objc_msgSend(v31, "remoteUserPairingIdentity");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67 && (objc_msgSend(v67, "isEqual:", v55) & 1) != 0)
      {
        v66 = 1;
      }
      else
      {
        v82 = v36;
        v84 = v55;
        v69 = v31;
        v70 = (void *)MEMORY[0x1D17BA0A0]();
        v71 = v19;
        HMFGetOSLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v81 = v70;
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v92 = v73;
          v93 = 2112;
          v94 = v69;
          _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine if the message was sent from the current account: %@", buf, 0x16u);

          v70 = v81;
        }

        objc_autoreleasePoolPop(v70);
        v66 = 0;
        v31 = v69;
        v36 = v82;
        v55 = v84;
      }

    }
    v34 = v89;
    if (v66)
      v44 = 1;
    else
LABEL_55:
      v44 = 0;
  }
LABEL_56:

  v74 = (void *)MEMORY[0x1D17BA0A0]();
  v75 = v19;
  HMFGetOSLogHandle();
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if ((v44 & 1) != 0)
  {
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDescription");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v92 = v78;
      v93 = 2112;
      v94 = v79;
      _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender of message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v74);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v92 = v80;
    v93 = 2112;
    v94 = v31;
    _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate sender of message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v74);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 17);
    v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_17:

  return v29;
}

- (HMDRemoteAccountMessageFilter)initWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3
{
  return -[HMDRemoteAccountMessageFilter initWithTarget:allowedMessages:](self, "initWithTarget:allowedMessages:", a3, 0);
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDRemoteAccountMessageFilter *v10;

  v6 = a4;
  v7 = a3;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRemoteAccountMessageFilter initWithTarget:allowedMessages:appleAccountManager:systemKeychainStore:](self, "initWithTarget:allowedMessages:appleAccountManager:systemKeychainStore:", v7, v6, v8, v9);

  return v10;
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4 appleAccountManager:(id)a5 systemKeychainStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDRemoteAccountMessageFilter *v15;
  HMDRemoteAccountMessageFilter *v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteAccountMessageFilter;
  v15 = -[HMDMessageFilter initWithName:](&v19, sel_initWithName_, CFSTR("RemoteAccount"));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_target, a3);
    if (v12)
      v17 = (void *)objc_msgSend(v12, "copy");
    else
      v17 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v16->_allowedMessages, v17);
    if (v12)

    objc_storeStrong((id *)&v16->_appleAccountManager, a5);
    objc_storeStrong((id *)&v16->_systemKeychainStore, a6);
  }

  return v16;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDRemoteAccountMessageFilter target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMFMessageDestination)target
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)allowedMessages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void)setAppleAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountManager, a3);
}

- (HAPKeyStore)systemKeychainStore
{
  return self->_systemKeychainStore;
}

- (void)setSystemKeychainStore:(id)a3
{
  objc_storeStrong((id *)&self->_systemKeychainStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemKeychainStore, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_allowedMessages, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t130 != -1)
    dispatch_once(&logCategory__hmf_once_t130, &__block_literal_global_404);
  return (id)logCategory__hmf_once_v131;
}

void __44__HMDRemoteAccountMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v131;
  logCategory__hmf_once_v131 = v0;

}

@end
