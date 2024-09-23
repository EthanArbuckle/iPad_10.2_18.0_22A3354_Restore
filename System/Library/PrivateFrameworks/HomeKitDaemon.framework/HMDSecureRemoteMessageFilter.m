@implementation HMDSecureRemoteMessageFilter

- (id)logIdentifier
{
  return CFSTR("Secure Remote Message Filter");
}

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  HMDSecureRemoteMessageFilter *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  void *v21;
  HMDSecureRemoteMessageFilter *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isRemote") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v15;
    v27 = 2112;
    v28 = v8;
    v16 = "%{public}@Accepting local message: %@";
LABEL_10:
    v17 = v14;
    v18 = OS_LOG_TYPE_DEBUG;
    goto LABEL_11;
  }
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[HMDSecureRemoteMessageFilter isAllowedMessage:](HMDSecureRemoteMessageFilter, "isAllowedMessage:", v10);

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v15;
      v27 = 2112;
      v28 = v8;
      v16 = "%{public}@Accepting allowed message: %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v17, v18, v16, (uint8_t *)&v25, 0x16u);

    }
LABEL_12:

    objc_autoreleasePoolPop(v12);
    v19 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isSecureRemote"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v15;
    v27 = 2112;
    v28 = v8;
    v16 = "%{public}@Accepting secure remote message: %@";
    goto LABEL_10;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v24;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Rejecting insecure remote message: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_13:

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_118649 != -1)
    dispatch_once(&logCategory__hmf_once_t20_118649, &__block_literal_global_140);
  return (id)logCategory__hmf_once_v21_118650;
}

+ (BOOL)isAllowedMessage:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isAllowedMessage__pred;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isAllowedMessage__pred, &__block_literal_global_146);
  v5 = objc_msgSend((id)isAllowedMessage___allowedMessages, "containsObject:", v4);

  return v5;
}

void __49__HMDSecureRemoteMessageFilter_isAllowedMessage___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("kAccessHomeInviteRequestKey");
  v4[1] = CFSTR("kUpdateHomeInvitationStateInternalRequestKey");
  v4[2] = CFSTR("kDismissBulletinInternalRequestKey");
  v4[3] = CFSTR("kDismissDialogInternalRequestKey");
  v4[4] = CFSTR("kKeyTransferAgentKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isAllowedMessage___allowedMessages;
  isAllowedMessage___allowedMessages = v2;

}

void __43__HMDSecureRemoteMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_118650;
  logCategory__hmf_once_v21_118650 = v0;

}

@end
