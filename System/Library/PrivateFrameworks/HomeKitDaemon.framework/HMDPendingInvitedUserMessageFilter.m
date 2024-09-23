@implementation HMDPendingInvitedUserMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  int64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "policyOfClass:fromPolicies:", objc_opt_class(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  if ((objc_msgSend(v8, "isRemote") & 1) == 0)
  {
    if (!a5)
    {
LABEL_12:
      v13 = -1;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = CFSTR("Invited user message must be remote.");
    v16 = 10;
LABEL_11:
    objc_msgSend(v14, "hmErrorWithCode:description:reason:suggestion:underlyingError:", v16, 0, v15, 0, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v10, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "pendingInviteExistsForSenderOfMessage:", v8);

  if ((v12 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@There is no actionable pending home invite on this device for sender of message: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    if (!a5)
      goto LABEL_12;
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = CFSTR("No pending invite for message sender.");
    v16 = 2;
    goto LABEL_11;
  }
LABEL_4:
  v13 = 1;
LABEL_13:

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_145188 != -1)
    dispatch_once(&logCategory__hmf_once_t3_145188, &__block_literal_global_145189);
  return (id)logCategory__hmf_once_v4_145190;
}

void __49__HMDPendingInvitedUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_145190;
  logCategory__hmf_once_v4_145190 = v0;

}

@end
