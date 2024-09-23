@implementation HMAccessorySetting

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v3;
      v9 = "%{public}@Error in updating the setting through the settings controller: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v10, v11, v9, (uint8_t *)&v15, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v8;
    v9 = "%{public}@Update sent through the settings controller with no error";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v13, v14);

}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v3;
      v10 = "%{public}@Error in updating media system setting: %@, error: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v11, v12, v10, (uint8_t *)&v17, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v14;
    v10 = "%{public}@Updated media system setting: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v15, v16);

}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_93(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE location[12];
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "properties") & 2) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "delegateCaller");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "callCompletion:error:", v3, v4);

LABEL_5:
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "delegateCaller");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "callCompletion:error:", *(_QWORD *)(a1 + 72), 0);
    goto LABEL_5;
  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    encodeRootObject(v7);
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject(v8);
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageDestination");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v47[0] = CFSTR("value");
      v47[1] = CFSTR("keyPath");
      v10 = *(_QWORD *)(a1 + 48);
      v48[0] = v37;
      v48[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAS.uv"), v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_94;
      aBlock[3] = &unk_1E3AB5510;
      v43 = *(id *)(a1 + 56);
      objc_copyWeak(&v46, (id *)location);
      v44 = *(id *)(a1 + 40);
      v45 = *(id *)(a1 + 72);
      v14 = _Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 64), "pendingRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = _Block_copy(v14);
      objc_msgSend(v15, "addCompletionBlock:forIdentifier:", v17, v16);

      v38[0] = v13;
      v38[1] = 3221225472;
      v38[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_95;
      v38[3] = &unk_1E3AB60C8;
      v18 = v15;
      v39 = v18;
      v19 = v16;
      v40 = v19;
      v20 = v14;
      v41 = v20;
      objc_msgSend(v12, "setResponseHandler:", v38);
      objc_msgSend(*(id *)(a1 + 64), "messageDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendMessage:completionHandler:", v12, 0);

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v31;
        v50 = 2112;
        v51 = v32;
        v52 = 2112;
        v53 = v33;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v34, v35);

      v9 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v25;
      v50 = 2112;
      v51 = v26;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v27, v12);
  }

}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value to: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setValue:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(WeakRetained, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 48), v3);

  objc_msgSend(WeakRetained, "accessorySettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyPathForSetting:", WeakRetained);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_notifyDelegateDidUpdateKeyPath:", v14);

}

void __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_95(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __43___HMAccessorySetting__handleUpdatedValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    v5 = 0;
  else
    v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(WeakRetained, "setValue:", v5));
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v12 = 138543618;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value to: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v7, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_settingDidUpdateValue:", v7);

}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD aBlock[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v53 = v5;
    v54 = 2112;
    v55 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updating constraints: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  encodeRootObject(a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  if (v7)
  {
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyPathForSetting:", a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1[4], "messageDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0D285F8];
        v50[0] = CFSTR("constraint");
        v50[1] = CFSTR("keyPath");
        v51[0] = v7;
        v51[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("HMAS.uc"), v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, a1[4]);
        v15 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_86;
        aBlock[3] = &unk_1E3AB5510;
        v46 = a1[6];
        objc_copyWeak(&v49, (id *)buf);
        v47 = a1[5];
        v48 = a1[8];
        v16 = _Block_copy(aBlock);
        objc_msgSend(a1[7], "pendingRequests");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = _Block_copy(v16);
        objc_msgSend(v17, "addCompletionBlock:forIdentifier:", v19, v18);

        v40[0] = v15;
        v40[1] = 3221225472;
        v40[2] = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_87;
        v40[3] = &unk_1E3AB5358;
        objc_copyWeak(&v44, (id *)buf);
        v20 = v17;
        v41 = v20;
        v21 = v18;
        v42 = v21;
        v22 = v16;
        v43 = v22;
        objc_msgSend(v14, "setResponseHandler:", v40);
        objc_msgSend(a1[7], "messageDispatcher");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sendMessage:completionHandler:", v14, 0);

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v49);

        objc_destroyWeak((id *)buf);
      }
      else
      {
        v32 = (void *)MEMORY[0x1A1AC1AAC]();
        v33 = a1[4];
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = a1[4];
          *(_DWORD *)buf = 138543874;
          v53 = v35;
          v54 = 2112;
          v55 = v36;
          v56 = 2112;
          v57 = v10;
          _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(a1[4], "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "delegateCaller");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = a1[8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "callCompletion:error:", v38, v39);

        v11 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = a1[4];
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = a1[4];
        *(_DWORD *)buf = 138543618;
        v53 = v28;
        v54 = 2112;
        v55 = v29;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(a1[4], "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = a1[8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "callCompletion:error:", v30, v31);

      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v24, v14);
  }

}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (!v3)
    objc_msgSend(WeakRetained, "setConstraints:", *(_QWORD *)(a1 + 40));
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Got update constraints request completion", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  objc_msgSend(v5, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 48), v3);

}

void __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Got update constraints message response error:%@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
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
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v51 = v5;
    v52 = 2112;
    v53 = v6;
    v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing constraints, %@, with constraints, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 64), "hmf_isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callCompletion:error:", *(_QWORD *)(a1 + 88), 0);

  }
  +[_HMAccessorySetting _encodedConstraintsToRemove:](_HMAccessorySetting, "_encodedConstraintsToRemove:", *(_QWORD *)(a1 + 40));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HMAccessorySetting _encodedConstraintsToAdd:](_HMAccessorySetting, "_encodedConstraintsToAdd:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyPathForSetting:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "messageDestination");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        +[_HMAccessorySetting _replaceConstraintsPayloadWithAdditions:removals:keyPath:](_HMAccessorySetting, "_replaceConstraintsPayloadWithAdditions:removals:keyPath:", v10, v39, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAS.pc"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_85;
        aBlock[3] = &unk_1E3AB5308;
        v45 = *(id *)(a1 + 72);
        objc_copyWeak(&v49, (id *)buf);
        v46 = *(id *)(a1 + 56);
        v47 = *(id *)(a1 + 64);
        v48 = *(id *)(a1 + 88);
        v17 = _Block_copy(aBlock);
        objc_msgSend(*(id *)(a1 + 80), "pendingRequests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = _Block_copy(v17);
        objc_msgSend(v18, "addCompletionBlock:forIdentifier:", v20, v19);

        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_2;
        v40[3] = &unk_1E3AB60C8;
        v21 = v18;
        v41 = v21;
        v22 = v19;
        v42 = v22;
        v23 = v17;
        v43 = v23;
        objc_msgSend(v16, "setResponseHandler:", v40);
        objc_msgSend(*(id *)(a1 + 80), "messageDispatcher");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sendMessage:completionHandler:", v16, 0);

        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v32 = (void *)MEMORY[0x1A1AC1AAC]();
        v33 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v51 = v35;
          v52 = 2112;
          v53 = v36;
          v54 = 2112;
          v55 = v13;
          _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(*(id *)(a1 + 32), "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegateCaller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(_QWORD *)(a1 + 88);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "callCompletion:error:", v37, v38);

        v14 = 0;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v51 = v29;
        v52 = 2112;
        v53 = v30;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 88);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v31, v16);
    }

  }
  else
  {
    objc_msgSend(v11, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:error:", v25, v15);
  }

}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!v3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(WeakRetained, "removeConstraint:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = *(id *)(a1 + 48);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(WeakRetained, "addConstraint:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), (_QWORD)v17);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
  objc_msgSend(WeakRetained, "context", (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 56), v3);

}

void __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE location[12];
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  encodeRootObject(a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  if (v2)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPathForSetting:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1[5], "messageDestination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0D285F8];
        v47[0] = CFSTR("constraint");
        v47[1] = CFSTR("keyPath");
        v48[0] = v2;
        v48[1] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMAS.rc"), v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, a1[5]);
        v10 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_83;
        aBlock[3] = &unk_1E3AB5510;
        v43 = a1[6];
        objc_copyWeak(&v46, (id *)location);
        v44 = a1[4];
        v45 = a1[8];
        v11 = _Block_copy(aBlock);
        objc_msgSend(a1[7], "pendingRequests");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _Block_copy(v11);
        objc_msgSend(v12, "addCompletionBlock:forIdentifier:", v14, v13);

        v38[0] = v10;
        v38[1] = 3221225472;
        v38[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_2;
        v38[3] = &unk_1E3AB60C8;
        v15 = v12;
        v39 = v15;
        v16 = v13;
        v40 = v16;
        v17 = v11;
        v41 = v17;
        objc_msgSend(v9, "setResponseHandler:", v38);
        objc_msgSend(a1[7], "messageDispatcher");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessage:completionHandler:", v9, 0);

        objc_destroyWeak(&v46);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v30 = (void *)MEMORY[0x1A1AC1AAC]();
        v31 = a1[5];
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = a1[5];
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v33;
          v50 = 2112;
          v51 = v34;
          v52 = 2112;
          v53 = v5;
          _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(a1[5], "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "delegateCaller");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = a1[8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "callCompletion:error:", v36, v37);

        v6 = 0;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = a1[5];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = a1[5];
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v26;
        v50 = 2112;
        v51 = v27;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(a1[5], "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegateCaller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = a1[8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "callCompletion:error:", v28, v29);

    }
  }
  else
  {
    objc_msgSend(v3, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:error:", v21, v22);

  }
}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "removeConstraint:", *(_QWORD *)(a1 + 40));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 48), v4);

}

void __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __57___HMAccessorySetting_notifyDelegateOfRemovedConstraint___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removed constraint: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed constraint: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "_setting:didRemoveConstraint:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke(void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE location[12];
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  encodeRootObject(a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  if (v2)
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPathForSetting:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1[5], "messageDestination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0D285F8];
        v47[0] = CFSTR("constraint");
        v47[1] = CFSTR("keyPath");
        v48[0] = v2;
        v48[1] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("HMAS.ac"), v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)location, a1[5]);
        v10 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_78;
        aBlock[3] = &unk_1E3AB5510;
        v43 = a1[6];
        objc_copyWeak(&v46, (id *)location);
        v44 = a1[4];
        v45 = a1[8];
        v11 = _Block_copy(aBlock);
        objc_msgSend(a1[7], "pendingRequests");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _Block_copy(v11);
        objc_msgSend(v12, "addCompletionBlock:forIdentifier:", v14, v13);

        v38[0] = v10;
        v38[1] = 3221225472;
        v38[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_2;
        v38[3] = &unk_1E3AB60C8;
        v15 = v12;
        v39 = v15;
        v16 = v13;
        v40 = v16;
        v17 = v11;
        v41 = v17;
        objc_msgSend(v9, "setResponseHandler:", v38);
        objc_msgSend(a1[7], "messageDispatcher");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessage:completionHandler:", v9, 0);

        objc_destroyWeak(&v46);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v30 = (void *)MEMORY[0x1A1AC1AAC]();
        v31 = a1[5];
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = a1[5];
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v33;
          v50 = 2112;
          v51 = v34;
          v52 = 2112;
          v53 = v5;
          _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to create accessory message destination for setting: %@ key path: %@", location, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(a1[5], "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "delegateCaller");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = a1[8];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "callCompletion:error:", v36, v37);

        v6 = 0;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1A1AC1AAC]();
      v24 = a1[5];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = a1[5];
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v26;
        v50 = 2112;
        v51 = v27;
        _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@No key path found for setting %@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(a1[5], "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegateCaller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = a1[8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "callCompletion:error:", v28, v29);

    }
  }
  else
  {
    objc_msgSend(v3, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a1[8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:error:", v21, v22);

  }
}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_78(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "addConstraint:", *(_QWORD *)(a1 + 40));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 48), v4);

}

void __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55___HMAccessorySetting_notifyDelegateOfAddedConstraint___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Added constraint: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added constraint: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "_setting:didAddConstraint:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __49___HMAccessorySetting_supportedConstraintClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedConstraintClasses_supportedConstraintClasses;
  supportedConstraintClasses_supportedConstraintClasses = v2;

}

void __44___HMAccessorySetting_supportedValueClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedValueClasses_supportedValueClasses_51641;
  supportedValueClasses_supportedValueClasses_51641 = v2;

}

void __34___HMAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v65_51672;
  logCategory__hmf_once_v65_51672 = v0;

}

- (HMAccessorySetting)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMAccessorySetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (HMAccessorySetting)initWithInternal:(id)a3
{
  id v5;
  uint64_t v6;
  HMAccessorySetting *v7;
  HMAccessorySetting *v8;
  HMAccessorySetting *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class();
    if (v6 == objc_opt_class())
      objc_exception_throw(objc_retainAutorelease((id)*MEMORY[0x1E0C99768]));
    v14.receiver = self;
    v14.super_class = (Class)HMAccessorySetting;
    v7 = -[HMSetting initWithInternal](&v14, sel_initWithInternal);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_internal, a3);
      objc_msgSend(v5, "setDelegate:", v8);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to create setting controller without internal object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySetting *v4;
  HMAccessorySetting *v5;
  HMAccessorySetting *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;

  v4 = (HMAccessorySetting *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_12;
    -[HMAccessorySetting internal](self, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySetting internal](v6, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      v27 = 1;
      goto LABEL_15;
    }
    -[HMAccessorySetting internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "properties");
    -[HMAccessorySetting internal](v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "properties");

    if (v10 != v12)
      goto LABEL_12;
    -[HMAccessorySetting internal](self, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");
    -[HMAccessorySetting internal](v6, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");

    if (v14 != v16)
      goto LABEL_12;
    -[HMAccessorySetting internal](self, "internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySetting internal](v6, "internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "isEqualToArray:", v20);

    if (!v21)
      goto LABEL_12;
    -[HMAccessorySetting keyPath](self, "keyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySetting keyPath](v6, "keyPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (v24)
    {
      -[HMAccessorySetting value](self, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySetting value](v6, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = HMFEqualObjects();

    }
    else
    {
LABEL_12:
      v27 = 0;
    }
LABEL_15:

    goto LABEL_16;
  }
  v27 = 1;
LABEL_16:

  return v27;
}

- (BOOL)isWritable
{
  void *v2;
  unint64_t v3;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "properties");

  return (v3 >> 1) & 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMSetting localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting isWritable](self, "isWritable");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Title = %@, Writeable = %@, Value = %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)keyPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[HMAccessorySetting group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMAccessorySetting internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return (NSString *)v7;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  void *v2;
  void *v3;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMAccessorySetting internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateValue:completionHandler:", v7, v6);

}

- (BOOL)isReflected
{
  void *v2;
  char v3;

  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReflected");

  return v3;
}

- (void)updateReflected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMAccessorySetting *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[HMAccessorySetting internal](v6, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isReflected"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating reflected from %@ to %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMAccessorySetting settingWillUpdateReflected](v6, "settingWillUpdateReflected");
  -[HMAccessorySetting internal](v6, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReflected:", v3);

  -[HMAccessorySetting settingDidUpdateReflected](v6, "settingDidUpdateReflected");
}

- (void)settingDidUpdateReflected
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HMAccessorySetting internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HMAccessorySetting_settingDidUpdateReflected__block_invoke;
  v6[3] = &unk_1E3AB5E18;
  v6[4] = self;
  objc_msgSend(v5, "invokeBlock:", v6);

}

- (void)_settingWillUpdateValue:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySetting *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Will update", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)_settingDidUpdateValue:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySetting *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Did update to: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMAccessorySetting internal](v6, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__HMAccessorySetting__settingDidUpdateValue___block_invoke;
  v13[3] = &unk_1E3AB5E18;
  v13[4] = v6;
  objc_msgSend(v12, "invokeBlock:", v13);

}

- (void)logAndPostNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMAccessorySetting *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    _HMFPreconditionFailure();
  v11 = v10;
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544130;
    v18 = v15;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@posting:%@ for object:%@ userinfo:%@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", v8, v9, v11);

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMAccessorySetting keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_HMAccessorySetting)internal
{
  return (_HMAccessorySetting *)objc_getProperty(self, a2, 72, 1);
}

- (HMAccessorySettingGroup)group
{
  return (HMAccessorySettingGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_internal, 0);
}

uint64_t __45__HMAccessorySetting__settingDidUpdateValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAndPostNotification:object:userInfo:", CFSTR("HMAccessorySettingValueUpdatedNotification"), *(_QWORD *)(a1 + 32), 0);
}

void __47__HMAccessorySetting_settingDidUpdateReflected__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("HMAccessorySettingReflectedUpdatedNotification"), *(_QWORD *)(a1 + 32));

}

+ (id)settingForInternal:(id)a3
{
  id v3;
  objc_class *v4;

  v3 = a3;
  v4 = 0;
  switch(objc_msgSend(v3, "type"))
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      v4 = (objc_class *)objc_opt_class();
      goto LABEL_3;
    default:
LABEL_3:
      v4 = (objc_class *)objc_msgSend([v4 alloc], "initWithInternal:", v3);
      break;
  }

  return v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t76 != -1)
    dispatch_once(&logCategory__hmf_once_t76, &__block_literal_global_295);
  return (id)logCategory__hmf_once_v77;
}

void __33__HMAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v77;
  logCategory__hmf_once_v77 = v0;

}

@end
