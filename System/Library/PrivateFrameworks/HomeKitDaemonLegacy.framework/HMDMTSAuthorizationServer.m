@implementation HMDMTSAuthorizationServer

- (HMDMTSAuthorizationServer)initWithUIDialogPresenter:(id)a3 accountManager:(id)a4 systemPreferenceReader:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDMTSAuthorizationServer *v12;
  HMDMTSAuthorizationServer *v13;
  void *v14;
  id systemPreferenceReader;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDMTSAuthorizationServer;
  v12 = -[HMDMTSAuthorizationServer init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uiDialogPresenter, a3);
    v14 = _Block_copy(v11);
    systemPreferenceReader = v13->_systemPreferenceReader;
    v13->_systemPreferenceReader = v14;

    objc_storeStrong((id *)&v13->_accountManager, a4);
  }

  return v13;
}

- (HMDMTSAuthorizationServer)initWithAccountManager:(id)a3
{
  id v4;
  void *v5;
  HMDMTSAuthorizationServer *v6;

  v4 = a3;
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDMTSAuthorizationServer initWithUIDialogPresenter:accountManager:systemPreferenceReader:](self, "initWithUIDialogPresenter:accountManager:systemPreferenceReader:", v5, v4, &__block_literal_global_176492);

  return v6;
}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  void *v3;
  HMDMTSAuthorizationServer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Showing restricted characteristics access warning", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMTSAuthorizationServer uiDialogPresenter](v4, "uiDialogPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMTSAuthorizationServer accountManager](v4, "accountManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HMDMTSAuthorizationServer_showRestrictedCharacteristicsAccessWarningAlert__block_invoke;
  v11[3] = &unk_1E89C2730;
  v11[4] = v4;
  objc_msgSend(v7, "displayRestrictedBluetoothCharacteristicsWarningWithDeviceName:completionHandler:", v10, v11);

}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HMDMTSAuthorizationServer *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[HMDMTSAuthorizationServer systemPreferenceReader](self, "systemPreferenceReader");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *))v5)[2](v5, CFSTR("EnableBluetoothCentralMatterClientSkipDeveloperModeRestrictionProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  v8 = v7;
  if ((_DWORD)v7)
    v7 = -[HMDMTSAuthorizationServer showRestrictedCharacteristicsAccessWarningAlert](self, "showRestrictedCharacteristicsAccessWarningAlert");
  v9 = (void *)MEMORY[0x1D17BA0A0](v7);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Restricted characteristics access allowed returning %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v4[2](v4, v8);

}

- (HMDUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (id)systemPreferenceReader
{
  return self->_systemPreferenceReader;
}

- (HMDAppleAccountManager)accountManager
{
  return self->_accountManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong(&self->_systemPreferenceReader, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
}

void __76__HMDMTSAuthorizationServer_showRestrictedCharacteristicsAccessWarningAlert__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Restricted characteristics access warning dismissed", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

id __52__HMDMTSAuthorizationServer_initWithAccountManager___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D286C0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithKey:options:domain:defaultValue:", v3, 0, CFSTR("com.apple.homed"), 0);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_176499 != -1)
    dispatch_once(&logCategory__hmf_once_t3_176499, &__block_literal_global_4_176500);
  return (id)logCategory__hmf_once_v4_176501;
}

void __40__HMDMTSAuthorizationServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_176501;
  logCategory__hmf_once_v4_176501 = v0;

}

@end
