@implementation HMMTRUserAuthorizationForPairing

- (HMMTRUserAuthorizationForPairing)initWithUiDialogPresenter:(id)a3
{
  id v5;
  HMMTRUserAuthorizationForPairing *v6;
  HMMTRUserAuthorizationForPairing *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRUserAuthorizationForPairing;
  v6 = -[HMMTRUserAuthorizationForPairing init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uiDialogPresenter, a3);

  return v7;
}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", &unk_250F3F6F0);

  if ((v9 & 1) != 0)
  {
    -[HMMTRUserAuthorizationForPairing uiDialogPresenter](self, "uiDialogPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__HMMTRUserAuthorizationForPairing_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
    v12[3] = &unk_250F23A30;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v10, "requestUserPermissionForBridgeAccessory:completionHandler:", v11, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (void)setUiDialogPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_uiDialogPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
}

void __94__HMMTRUserAuthorizationForPairing_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = (uint64_t)v10;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for bridge accessory. Fail pairing.", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 12, &unk_250F40728);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = "NO";
      if (a2)
        v15 = "YES";
      v16 = 138543618;
      v17 = v13;
      v18 = 2080;
      v19 = v15;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for bridge accessory. Should cancel : %s", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 12, &unk_250F40700);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_5466 != -1)
    dispatch_once(&logCategory__hmf_once_t2_5466, &__block_literal_global_5467);
  return (id)logCategory__hmf_once_v3_5468;
}

void __47__HMMTRUserAuthorizationForPairing_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_5468;
  logCategory__hmf_once_v3_5468 = v0;

}

@end
