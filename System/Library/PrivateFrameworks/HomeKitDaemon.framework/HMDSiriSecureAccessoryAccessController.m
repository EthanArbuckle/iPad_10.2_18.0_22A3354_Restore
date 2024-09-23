@implementation HMDSiriSecureAccessoryAccessController

- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3
{
  id v4;
  HMDAssistantWatchAuthenticationDataSource *v5;
  HMDSiriSecureAccessoryAccessController *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDAssistantWatchAuthenticationDataSource);
  v6 = -[HMDSiriSecureAccessoryAccessController initWithDataSource:watchAuthDataSource:](self, "initWithDataSource:watchAuthDataSource:", v4, v5);

  return v6;
}

- (HMDSiriSecureAccessoryAccessController)initWithDataSource:(id)a3 watchAuthDataSource:(id)a4
{
  id v6;
  id v7;
  HMDSiriSecureAccessoryAccessController *v8;
  HMDSiriSecureAccessoryAccessController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDSiriSecureAccessoryAccessController;
  v8 = -[HMDSiriSecureAccessoryAccessController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_watchAuthDataSource, a4);
  }

  return v9;
}

- (void)isUnsecuringSiriActionAllowedWithCompletion:(id)a3
{
  id WeakRetained;
  void *v5;
  HMDSiriSecureAccessoryAccessController *v6;
  NSObject *v7;
  void *v8;
  id v9;
  SEL v10;
  void *v11;
  HMDSiriSecureAccessoryAccessController *v12;
  NSObject *v13;
  void *v14;
  HMDSiriSecureAccessoryAccessController *v15;
  void *v16;
  void *v17;
  void (**v18)(id, _QWORD);
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = (void (**)(id, _QWORD))a3;
  if (!self)
    goto LABEL_16;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_msgSend(WeakRetained, "currentDeviceSupportsSiriUnsecuringActionsWithNoPasscodeForSiriSecureAccessoryAccessController:", self))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Denying Siri access due to running tvOS-only code path on other platform", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

  v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!objc_msgSend(v9, "currentDeviceSupportsSiriUnsecuringActionsWithWatchAuthForSiriSecureAccessoryAccessController:", self))
  {
LABEL_15:

LABEL_16:
    v18[2](v18, 0);
    goto LABEL_17;
  }
  if ((objc_msgSend(v9, "isCurrentDevicePairedWithWatchForSiriSecureAccessoryAccessController:", self) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Siri access is not allowed for request because current device has no paired watch", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v9, "homeLocationForSiriSecureAccessoryAccessController:", self) & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMStringFromHomeLocation();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Siri access is not allowed for request because current device is not at or near home (%@)", buf, 0x16u);

    }
LABEL_14:

    objc_autoreleasePoolPop(v11);
    goto LABEL_15;
  }

  objc_msgSend(objc_getProperty(self, v10, 16, 1), "getCurrentRequestIsWatchAuthenticatedWithCompletion:", v18);
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAuthDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
