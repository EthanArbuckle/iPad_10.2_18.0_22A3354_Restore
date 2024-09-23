@implementation HMMTRSoftwareUpdateProvider

- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3 browser:(id)a4
{
  id v7;
  id v8;
  HMMTRSoftwareUpdateProvider *v9;
  HMMTRSoftwareUpdateProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSoftwareUpdateProvider;
  v9 = -[HMMTRSoftwareUpdateProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
  }

  return v10;
}

- (HMMTRSoftwareUpdateProvider)initWithQueue:(id)a3
{
  return -[HMMTRSoftwareUpdateProvider initWithQueue:browser:](self, "initWithQueue:browser:", a3, 0);
}

- (void)notifyDelegateOfQueryImageWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRSoftwareUpdateProvider clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __101__HMMTRSoftwareUpdateProvider_notifyDelegateOfQueryImageWithPairing_requestParams_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)notifyDelegateOfApplyUpdateWithPairing:(id)a3 requestParams:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRSoftwareUpdateProvider clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__HMMTRSoftwareUpdateProvider_notifyDelegateOfApplyUpdateWithPairing_requestParams_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)notifyDelegateOfNotifyUpdateWithPairing:(id)a3 params:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRSoftwareUpdateProvider clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __96__HMMTRSoftwareUpdateProvider_notifyDelegateOfNotifyUpdateWithPairing_params_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)notifyDelegateCheckFirmwareUpdateSessionWithPairing:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRSoftwareUpdateProvider clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__HMMTRSoftwareUpdateProvider_notifyDelegateCheckFirmwareUpdateSessionWithPairing_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)notifyUpdateRequestedForNodeID:(id)a3 isUserTriggered:(BOOL)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSoftwareUpdateProvider *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  void *v19;
  HMMTRSoftwareUpdateProvider *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  v8 = WeakRetained;
  if (!WeakRetained)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2112;
      v29 = v6;
      v15 = "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@";
      v16 = v13;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 22;
LABEL_9:
      _os_log_impl(&dword_23E95B000, v16, v17, v15, buf, v18);

    }
LABEL_10:

    objc_autoreleasePoolPop(v11);
    goto LABEL_15;
  }
  if (!a4)
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      v15 = "%{public}@Ignoring announcement request for automatic software updates";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "threadSoftwareUpdateController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __78__HMMTRSoftwareUpdateProvider_notifyUpdateRequestedForNodeID_isUserTriggered___block_invoke;
    v23[3] = &unk_250F21EC8;
    v23[4] = self;
    v24 = v6;
    v25 = v8;
    objc_msgSend(v10, "handleUpdateRequestedForAccessoryServer:completion:", v9, v23);

  }
  else
  {
    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for notifyUpdateRequestedForNodeID:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

LABEL_15:
}

- (void)updateOTAProviderStateForNodeID:(id)a3 otaProviderState:(int64_t)a4
{
  id v6;
  void *v7;
  HMMTRSoftwareUpdateProvider *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMTRSoftwareUpdateProvider *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMMTRSoftwareUpdateProvider *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMMTRSoftwareUpdateProvider *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HAPOTAProviderStateAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@HK informed to update OTA provider state to:%@, for nodeID: %@", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_browser);
  if (WeakRetained)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
    {
      objc_msgSend(WeakRetained, "accessoryServerWithNodeID:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "matterFirmwareUpdateStatus");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v14, "matterFirmwareUpdateStatus");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateFirmwareUpdateStatus:", a4);

        }
        else
        {
          v25 = (void *)MEMORY[0x242656984]();
          v26 = v8;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543618;
            v30 = v28;
            v31 = 2112;
            v32 = v6;
            _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_ERROR, "%{public}@MatterFirmwareUpdateStatus instance not found for nodeID:%@", (uint8_t *)&v29, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
        }

      }
      else
      {
        v21 = (void *)MEMORY[0x242656984]();
        v22 = v8;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v24;
          v31 = 2112;
          v32 = v6;
          _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not associate with a paired accessory for updateOTAProviderStateForNodeID:%@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x242656984]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v20;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (BOOL)canEstablishConnectionForNodeID:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  HMMTRSoftwareUpdateProvider *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v4;
      v12 = "%{public}@Unable to get browser ref for canEstablishConnectionForNodeID:%@";
      v13 = v10;
      v14 = 22;
LABEL_8:
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, v14);

    }
LABEL_9:

    objc_autoreleasePoolPop(v8);
    v7 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(WeakRetained, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResident") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      v12 = "%{public}@OTA request should be coming through resident";
      v13 = v10;
      v14 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = objc_msgSend(v6, "canEstablishConnectionForNodeID:", v4);
LABEL_10:

  return v7;
}

- (HMMTRSoftwareUpdateProviderDelegate)delegate
{
  return (HMMTRSoftwareUpdateProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __78__HMMTRSoftwareUpdateProvider_notifyUpdateRequestedForNodeID_isUserTriggered___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to send update available announcement to the accessory with nodeID:%@ %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "announceOtaProviderForNodeID:", *(_QWORD *)(a1 + 40));
  }

}

void __101__HMMTRSoftwareUpdateProvider_notifyDelegateCheckFirmwareUpdateSessionWithPairing_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v9;
      v10 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v6);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v3);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v9;
      v10 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifyCheckFirmwareUpdateSessionWithPairing:queue:completionHandler:", v4, v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
LABEL_14:

}

void __96__HMMTRSoftwareUpdateProvider_notifyDelegateOfNotifyUpdateWithPairing_params_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v3);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notifyUpdateWithPairing:params:queue:completionHandler:", v5, v4, v6, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
LABEL_14:

}

void __102__HMMTRSoftwareUpdateProvider_notifyDelegateOfApplyUpdateWithPairing_requestParams_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v3);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyUpdateWithPairing:requestParams:queue:completionHandler:", v5, v4, v6, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

  }
LABEL_14:

}

void __101__HMMTRSoftwareUpdateProvider_notifyDelegateOfQueryImageWithPairing_requestParams_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Software update delegate is not set";
LABEL_9:
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v19, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v3);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      v11 = "%{public}@Pairing info is nil";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryImageWithPairing:requestParams:queue:completionHandler:", v5, v4, v6, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v16;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

  }
LABEL_14:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_6557);
  return (id)logCategory__hmf_once_v23;
}

void __42__HMMTRSoftwareUpdateProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

@end
