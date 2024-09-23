@implementation HMDLostModeMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isLost");

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Rejecting message in Lost Mode", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 10, 0, CFSTR("Device is in Lost Mode."), 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = -1;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
