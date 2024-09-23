@implementation HMMTRAttestationStatus

- (HMMTRAttestationStatus)initWithQueue:(id)a3 uiDialogPresenter:(id)a4 failSafeExpiryTimeoutSecs:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRAttestationStatus *v12;
  HMMTRAttestationStatus *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRAttestationStatus;
  v12 = -[HMMTRAttestationStatus init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_failSafeExpiryTimeoutSecs, a5);
    objc_storeStrong((id *)&v13->_clientQueue, a3);
    objc_storeStrong((id *)&v13->_uiDialogPresenter, a4);
  }

  return v13;
}

- (void)setUserAuthorizationDelegate:(id)a3
{
  objc_storeStrong(&self->_userAuthorizationDelegate, a3);
}

- (void)_requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRAttestationStatus *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRAttestationStatus *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HMMTRAttestationStatus *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v11;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRAttestationStatus userAuthorizationDelegate](v9, "userAuthorizationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x242656984]();
  v14 = v9;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory - delegate set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMMTRAttestationStatus userAuthorizationDelegate](v14, "userAuthorizationDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();
    v20 = (void *)MEMORY[0x242656984]();
    v21 = v14;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if ((v19 & 1) != 0)
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@HMMTRAttestationStatus: _requestUserPermissionForBridgeAccessory - calling delegate", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      -[HMMTRAttestationStatus accessoryServer](v21, "accessoryServer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __85__HMMTRAttestationStatus__requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
      v29[3] = &unk_250F23A30;
      v29[4] = v21;
      v30 = v7;
      objc_msgSend(v18, "requestUserPermissionForBridgeAccessory:completionHandler:", v25, v29);

    }
    else
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v27;
        _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not respond to selector", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v28);

    }
  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@User Authorization delegate is not set", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)deviceAttestationCompletedForController:(id)a3 opaqueDeviceHandle:(void *)a4 attestationDeviceInfo:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  void *v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HMMTRAttestationStatus clientQueue](self, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke;
  block[3] = &unk_250F23B20;
  block[4] = self;
  v18 = v12;
  v20 = v11;
  v21 = a4;
  v19 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(v13, block);

}

- (void)populateDelegate:(id)a3
{
  NSNumber *failSafeExpiryTimeoutSecs;
  id v5;

  failSafeExpiryTimeoutSecs = self->_failSafeExpiryTimeoutSecs;
  v5 = a3;
  objc_msgSend(v5, "setFailSafeExpiryTimeoutSecs:", failSafeExpiryTimeoutSecs);
  objc_msgSend(v5, "setDeviceAttestationDelegate:", self);

}

- (void)setAccessoryServer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServer, a3);
}

- (NSNumber)failSafeExpiryTimeoutSecs
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (void)setUiDialogPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_uiDialogPresenter, a3);
}

- (id)userAuthorizationDelegate
{
  return self->_userAuthorizationDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userAuthorizationDelegate, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_accessoryServer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_failSafeExpiryTimeoutSecs, 0);
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v41 = v5;
    v42 = 2112;
    v43 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Device attestation completed for device under commissioning. Error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_8;
  v37[3] = &unk_250F23A58;
  v37[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v38 = v8;
  v39 = v9;
  v10 = (void *)MEMORY[0x242656B10](v37);
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_9;
  v33[3] = &unk_250F23AA8;
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v34 = v11;
  v35 = v12;
  v13 = v10;
  v36 = v13;
  v14 = (void *)MEMORY[0x242656B10](v33);
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_13;
  v31[3] = &unk_250F23CD0;
  v31[4] = *(_QWORD *)(a1 + 32);
  v15 = v14;
  v32 = v15;
  v16 = (void *)MEMORY[0x242656B10](v31);
  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateVidPidWithAttestationDeviceInfo:", *(_QWORD *)(a1 + 56));

    v19 = (void *)MEMORY[0x242656984]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v22;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Validating device attestation through accessory server: %@", buf, 0x16u);

      v7 = MEMORY[0x24BDAC760];
    }

    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 56);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_16;
    v27[3] = &unk_250F23AF8;
    v26 = *(void **)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = v26;
    v29 = v16;
    v30 = v15;
    objc_msgSend(v24, "validateAttestationDeviceInfo:error:completion:", v25, v28, v27);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
  }

}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = "NO";
    if ((_DWORD)a2)
      v11 = "YES";
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2080;
    v24 = v11;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Continuing commissioning with ignore attestation failure: %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v20 = 0;
  objc_msgSend(v12, "continueCommissioningDevice:ignoreAttestationFailure:error:", v13, a2, &v20);
  v14 = (char *)v20;
  if (v14)
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = (uint64_t)v18;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Continue commissioning device failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setupThreadPairing");

}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_9(uint64_t a1, int a2, void *a3)
{
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32) == 0;
  objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCertified:", v6);

  v8 = *(_QWORD *)(a1 + 32);
  if (!v5 || v8 || (a2 & 1) != 0)
  {
    if ((!v8 || a2)
      && (objc_msgSend(*(id *)(a1 + 40), "accessoryServer"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "category"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqual:", &unk_250F40158),
          v16,
          v15,
          v17))
    {
      v18 = *(void **)(a1 + 40);
      objc_msgSend(v18, "accessoryServer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_12;
      v26[3] = &unk_250F23A80;
      v21 = *(void **)(a1 + 48);
      v26[4] = *(_QWORD *)(a1 + 40);
      v28 = v21;
      v29 = a2;
      v27 = v5;
      objc_msgSend(v18, "_requestUserPermissionForBridgeAccessory:completionHandler:", v20, v26);

    }
    else
    {
      v22 = (void *)MEMORY[0x242656984]();
      v23 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v25;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, "%{public}@Continue commissioning.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v12;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Device attestation was rejected. Aborting.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 6, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessoryServer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "abortStagingWithError:context:", v5, v13);

  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPriorSuccessfulPairing");

  if (v5)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory server has prior successful pairing, skipping user permission dialog for unauthorized accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "uiDialogPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_14;
    v14[3] = &unk_250F23AA8;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v16 = v13;
    v15 = v3;
    objc_msgSend(v10, "requestUserPermissionForUnauthenticatedAccessory:completionHandler:", v12, v14);

  }
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_2;
  block[3] = &unk_250F23AD0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory server validated attestation device info with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_OWORD *)(a1 + 40) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      v14 = 138543362;
      v15 = (uint64_t)v10;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for unauthorized accessory. Fail pairing.", (uint8_t *)&v14, 0xCu);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = "NO";
    if (a2)
      v13 = "YES";
    v14 = 138543618;
    v15 = v11;
    v16 = 2080;
    v17 = v13;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for unauthorized accessory. Should cancel : %s", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __113__HMMTRAttestationStatus_deviceAttestationCompletedForController_opaqueDeviceHandle_attestationDeviceInfo_error___block_invoke_12(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Device commissioning was rejected.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 12, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[HMMTRAccessoryPairingEndContext hmmtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 6, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "abortStagingWithError:context:", v5, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__HMMTRAttestationStatus__requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      v14 = 138543362;
      v15 = (uint64_t)v10;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for bridge accessory. Fail pairing.", (uint8_t *)&v14, 0xCu);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = "NO";
    if (a2)
      v13 = "YES";
    v14 = 138543618;
    v15 = v11;
    v16 = 2080;
    v17 = v13;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for bridge accessory. Should cancel : %s", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
