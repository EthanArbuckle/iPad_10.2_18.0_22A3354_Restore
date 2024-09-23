@implementation HMDHAPAccessoryRemoteOperationWithLocalFallbackTask

- (HMDHAPAccessoryRemoteOperationWithLocalFallbackTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6
{
  id v11;
  HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *v12;
  HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHAPAccessoryRemoteOperationWithLocalFallbackTask;
  v12 = -[HMDHAPAccessoryTask initWithContext:requests:completion:](&v15, sel_initWithContext_requests_completion_, a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_remoteTaskDelegateDevice, a5);

  return v13;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask setExecutionTime:](self, "setExecutionTime:", v3);

  v4 = (void *)MEMORY[0x1E0C99E20];
  -[HMDHAPAccessoryTask requests](self, "requests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask remoteTaskDelegateDevice](self, "remoteTaskDelegateDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_execute__block_invoke;
    v20[3] = &unk_1E89C16C0;
    v20[4] = self;
    objc_msgSend(v18, "na_map:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask completion](self, "completion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask _makeLocalTaskWithRequests:completion:](self, "_makeLocalTaskWithRequests:completion:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask setLocalTask:](self, "setLocalTask:", v10);

    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask localTask](self, "localTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "execute");

    objc_msgSend(v18, "minusSet:", v7);
  }
  if (objc_msgSend(v18, "count", v18))
  {
    objc_msgSend(v19, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask _startScanningForSuspendedAccessoriesWithRequests:](self, "_startScanningForSuspendedAccessoriesWithRequests:", v12);

    objc_msgSend(v19, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask remoteTaskDelegateDevice](self, "remoteTaskDelegateDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask _remoteTaskCompletionHandler](self, "_remoteTaskCompletionHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask _makeRemoteTaskWithRequests:delegateDevice:completion:](self, "_makeRemoteTaskWithRequests:delegateDevice:completion:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask setRemoteTask:](self, "setRemoteTask:", v16);

    -[HMDHAPAccessoryRemoteOperationWithLocalFallbackTask remoteTask](self, "remoteTask");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "execute");

  }
}

- (void)_startScanningForSuspendedAccessoriesWithRequests:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *v15;
  _QWORD v16[4];
  id v17;

  v12 = a3;
  if (!isWatch())
  {
    -[HMDHAPAccessoryTask context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "homeLocation");

    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke;
      v16[3] = &unk_1E89C16E8;
      v9 = v7;
      v17 = v9;
      objc_msgSend(v12, "na_each:", v16);
      objc_msgSend(v9, "keyEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_2;
      v13[3] = &unk_1E89C1760;
      v14 = v9;
      v15 = self;
      v11 = v9;
      objc_msgSend(v10, "na_each:", v13);

    }
  }

}

- (BOOL)_shouldFallbackLocallyWithError:(id)a3 accessory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_30;
  if (objc_msgSend(v5, "isHMError"))
  {
    v7 = objc_msgSend(v5, "code");
    goto LABEL_4;
  }
  if (!objc_msgSend(v5, "isHAPError"))
  {
LABEL_26:
    v8 = 1;
    goto LABEL_31;
  }
  v11 = objc_msgSend(v5, "code");
  if (v11 <= 0x20)
  {
    v7 = qword_1CDB8F990[v11];
LABEL_4:
    v8 = 1;
    switch(v7)
    {
      case 2:
      case 3:
      case 8:
        goto LABEL_31;
      case 4:
        v9 = isFeatureMatteriPhoneOnlyPairingControlEnabled();
        v10 = objc_msgSend(v6, "hasBTLELink");
        if (!v9)
        {
          if (!v10 || (objc_msgSend(v6, "isReachable") & 1) == 0 && (objc_msgSend(v6, "isBLELinkConnected") & 1) == 0)
            break;
          goto LABEL_26;
        }
        if (v10 && ((objc_msgSend(v6, "isReachable") & 1) != 0 || (objc_msgSend(v6, "isBLELinkConnected") & 1) != 0)
          || (objc_msgSend(v6, "supportsCHIP") & 1) != 0)
        {
          goto LABEL_26;
        }
        break;
      case 5:
      case 6:
      case 7:
      case 9:
        break;
      case 10:
        if (!isWatch())
          break;
        goto LABEL_31;
      default:
        if (v7 != 54)
        {
          if (v7 != 3201)
            break;
          goto LABEL_31;
        }
        objc_msgSend(v5, "underlyingErrors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isHMError") && objc_msgSend(v13, "code") == 3203)
          goto LABEL_32;
        v14 = objc_msgSend(v6, "canWakeViaCustomWoBLE");

        if ((v14 & 1) != 0)
          goto LABEL_26;
        break;
    }
  }
  if (!objc_msgSend(v6, "canWakeViaCustomWoBLE"))
  {
LABEL_30:
    v8 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v5, "underlyingErrors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isHMError"))
    v8 = objc_msgSend(v13, "code") != 2400;
  else
LABEL_32:
    v8 = 1;

LABEL_31:
  return v8;
}

- (id)completion
{
  void *v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;
  id v9;
  objc_super v10;
  id location;

  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HMDHAPAccessoryRemoteOperationWithLocalFallbackTask;
  -[HMDHAPAccessoryTask completion](&v10, sel_completion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_completion__block_invoke;
  aBlock[3] = &unk_1E89C1648;
  objc_copyWeak(&v9, &location);
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

- (id)_remoteTaskCompletionHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke;
  v4[3] = &unk_1E89C17B0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_makeRemoteTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is unavailable"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HMDDevice)remoteTaskDelegateDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHAPAccessoryTask)remoteTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemoteTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMDHAPAccessoryTask)localTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocalTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HMDHAPAccessoryTask)fallbackLocalTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFallbackLocalTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLocalTask, 0);
  objc_storeStrong((id *)&self->_localTask, 0);
  objc_storeStrong((id *)&self->_remoteTask, 0);
  objc_storeStrong((id *)&self->_remoteTaskDelegateDevice, 0);
}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD);
  void *context;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "remoteTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v39 = v9;
    objc_msgSend(v9, "logEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
    v13 = v12;
    objc_msgSend(v6, "remoteTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_323;
    v44[3] = &unk_1E89C1788;
    v18 = v16;
    v45 = v18;
    v46 = v6;
    v19 = v17;
    v47 = v19;
    v20 = v11;
    v48 = v20;
    v49 = v13;
    objc_msgSend(v3, "na_map:", v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    objc_msgSend(v6, "addCharacteristicResponses:", v19);
    if (objc_msgSend(v19, "count"))
    {
      v23 = (void *)objc_opt_class();
      objc_msgSend(v6, "requestIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateLogEvents:withResponses:forTaskID:shouldSubmit:", v20, v19, v25, 1);

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_325;
      v42[3] = &unk_1E89C1490;
      v43 = v20;
      objc_msgSend(v19, "na_each:", v42);

    }
    if (objc_msgSend(v18, "count") && (objc_msgSend(v6, "supportsMultiPartResponse") & 1) == 0)
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v6;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v51 = v28;
        v52 = 2112;
        v53 = v26;
        v54 = 2112;
        v55 = v18;
        v56 = 2112;
        v57 = v3;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Missing remote responses. Falling back to locally processing requests: %@ -> %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(v22, "addObjectsFromArray:", v18);
    }
    if (objc_msgSend(v22, "count"))
    {
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_326;
      v40[3] = &unk_1E89C17B0;
      objc_copyWeak(&v41, v4);
      objc_msgSend(v6, "_makeLocalTaskWithRequests:completion:", v22, v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFallbackLocalTask:", v29);

      objc_msgSend(v6, "fallbackLocalTask");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32)
        objc_msgSend(v32, "setLogEvents:", v20);
      objc_msgSend(v6, "fallbackLocalTask");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "execute");

      objc_destroyWeak(&v41);
    }
    else
    {
      objc_msgSend(v6, "completion");
      v37 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v37)[2](v37, v19);

    }
  }
  else
  {
    v34 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v36;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for HMDHAPAccessoryRemoteOperationWithLocalFallbackTask remote task completion handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
  }

}

id __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_323(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(v3, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 40);
      v36 = 138543874;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v3;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Lost reference to accessory for response: %@", (uint8_t *)&v36, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    goto LABEL_13;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "_shouldFallbackLocallyWithError:accessory:", v4, v8))
  {
    v30 = *(void **)(a1 + 48);
    objc_msgSend(v8, "_updatedResponseForRemoteResponse:", v3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v31);

LABEL_13:
    v24 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setResidentFirstError:", v14);

    objc_msgSend(v13, "setResidentFirstEndTime:", *(double *)(a1 + 64));
  }
  objc_msgSend(*(id *)(a1 + 40), "requestToResponseMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v17)
  {
    if (v21)
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 40);
      v36 = 138543874;
      v37 = v22;
      v38 = 2112;
      v39 = v23;
      v40 = 2112;
      v41 = v3;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Skip falling back to locally processing accessory for response: %@", (uint8_t *)&v36, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v24 = 0;
  }
  else
  {
    if (v21)
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "request");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138544130;
      v37 = v32;
      v38 = 2112;
      v39 = v33;
      v40 = 2112;
      v41 = v34;
      v42 = 2112;
      v43 = v3;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Falling back to locally processing request: %@ -> %@", (uint8_t *)&v36, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v3, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:
  return v24;
}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_325(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v7);
    v6 = v7;
  }

}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_326(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "completion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v3);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback local task completion", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __65__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_completion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "addCharacteristicResponses:", v3);
    if (objc_msgSend(v5, "allResponsesReceived"))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "characteristicResponses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else if (objc_msgSend(v5, "supportsMultiPartResponse"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for HMDHAPAccessoryRemoteOperationWithLocalFallbackTask completion", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canWakeViaCustomWoBLE"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_msgSend(v7, "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v3);

  }
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sourceType");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_3;
  v9[3] = &unk_1E89C1738;
  objc_copyWeak(&v12, &location);
  v7 = v3;
  v10 = v7;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "wakeOrScanForSuspendedAccessoryForRequests:source:completion:", v8, v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_4;
    block[3] = &unk_1E89C1710;
    block[4] = v8;
    v11 = a1[4];
    v12 = a1[5];
    v13 = v5;
    v14 = v6;
    dispatch_async(v9, block);

  }
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 64);
    v22 = 138544642;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Scanning locally for suspended accessory (%@/%@/%@) completed with error: %@.", (uint8_t *)&v22, 0x3Eu);

  }
  objc_autoreleasePoolPop(v2);
  if (!*(_QWORD *)(a1 + 64) && objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(*(id *)(a1 + 48), "count");
      v22 = 138544642;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2048;
      v33 = v20;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Adding responses for suspended accessory %@/%@/%@ with %ld requests", (uint8_t *)&v22, 0x3Eu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 32), "addCharacteristicResponses:", *(_QWORD *)(a1 + 56));
    if (objc_msgSend(*(id *)(a1 + 32), "supportsMultiPartResponse"))
    {
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v21[2](v21, *(_QWORD *)(a1 + 56));

    }
  }
}

id __62__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRemoteAccessDeviceReachable"))
  {
    objc_msgSend(v3, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isBLELinkConnected"))
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(v3, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isMatterLocalLinkConnectedAndPreferred"))
        v6 = v3;
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

@end
