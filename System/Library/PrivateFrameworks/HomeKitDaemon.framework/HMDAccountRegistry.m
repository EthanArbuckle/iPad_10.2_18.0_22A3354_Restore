@implementation HMDAccountRegistry

- (void)accountInformationChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "dumpForLoggingWithPrefix:logType:", CFSTR("Account Registry"), 0);
  objc_msgSend(v4, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __sendChangeNotifications(self, v5, 4);

  objc_msgSend(v4, "inserts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __sendChangeNotifications(self, v6, 1);

  objc_msgSend(v4, "deletes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  __sendChangeNotifications(self, v7, 2);
}

- (id)fetchAccountsWithLocalFlag:(BOOL)a3
{
  id v3;
  _QWORD v5[7];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__36935;
  v13[4] = __Block_byref_object_dispose__36936;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36935;
  v11 = __Block_byref_object_dispose__36936;
  v12 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke;
  v5[3] = &unk_24E77A458;
  v6 = a3;
  v5[4] = self;
  v5[5] = v13;
  v5[6] = &v7;
  -[HMCContextProvider unsafeSynchronousBlock:](self, "unsafeSynchronousBlock:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v3;
}

- (void)addAccount:(id)a3 isLocal:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDAccountRegistry *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__HMDAccountRegistry_Roar__addAccount_isLocal___block_invoke;
  v8[3] = &unk_24E77A480;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[HMCContextProvider performBlock:](self, "performBlock:", v8);

}

- (void)removeAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccountRegistry *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  HMDAccountRegistry *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "modelIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__HMDAccountRegistry_Roar__removeAccount___block_invoke;
    v11[3] = &unk_24E77A4A8;
    v12 = v5;
    v13 = self;
    -[HMCContextProvider performBlock:](self, "performBlock:", v11);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Requested to remove a nil account or an account without an identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)updateAccount:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HMDAccountRegistry *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__HMDAccountRegistry_Roar__updateAccount___block_invoke;
  v6[3] = &unk_24E77A4A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HMCContextProvider performBlock:](self, "performBlock:", v6);

}

- (id)updateDevices:(id)a3 onAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HMDAccountRegistry *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke;
  v19[3] = &unk_24E77A4D0;
  v10 = v7;
  v20 = v10;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_2;
  v14[3] = &unk_24E77A4F8;
  v15 = v10;
  v16 = self;
  v17 = v6;
  v18 = v21;
  v11 = v6;
  v12 = v10;
  -[HMCContextProvider performBlock:](self, "performBlock:", v14);

  return v8;
}

- (void)updateDevice:(id)a3 toVersion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__HMDAccountRegistry_Roar__updateDevice_toVersion___block_invoke;
  v10[3] = &unk_24E77A520;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HMCContextProvider performBlock:](self, "performBlock:", v10);

}

- (id)findBackingModelFromDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccountRegistry *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "modelIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMCContext findDeviceWithModelID:](HMCContext, "findDeviceWithModelID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      v5 = 0;
    }
  }

  return v5;
}

- (void)updateDevice:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HMDAccountRegistry *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_4;
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_4:
    objc_msgSend(v7, "setAccount:", v9);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__HMDAccountRegistry_Roar__updateDevice_withDevice___block_invoke;
  v12[3] = &unk_24E77A520;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  -[HMCContextProvider performBlock:](self, "performBlock:", v12);

}

- (void)addDevice:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HMDAccountRegistry *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  if ((objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_4:
    objc_msgSend(v6, "setAccount:", v7);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HMDAccountRegistry_Roar__addDevice_toAccount___block_invoke;
  v12[3] = &unk_24E77A520;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  -[HMCContextProvider performBlock:](self, "performBlock:", v12);

}

- (void)removeDevice:(id)a3 fromAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccountRegistry *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__HMDAccountRegistry_Roar__removeDevice_fromAccount___block_invoke;
    v12[3] = &unk_24E77A520;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    -[HMCContextProvider performBlock:](self, "performBlock:", v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = 0;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Requested to remove a nil device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)addHandle:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HMDAccountRegistry *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "modelIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setModelParentIdentifier:", v8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__HMDAccountRegistry_Roar__addHandle_toAccount___block_invoke;
  v12[3] = &unk_24E77A4F8;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  -[HMCContextProvider performBlock:](self, "performBlock:", v12);

}

- (void)removeHandle:(id)a3 fromAccount:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  HMDAccountRegistry *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__HMDAccountRegistry_Roar__removeHandle_fromAccount___block_invoke;
  v10[3] = &unk_24E77A520;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[HMCContextProvider performBlock:](self, "performBlock:", v10);

}

void __53__HMDAccountRegistry_Roar__removeHandle_fromAccount___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccountHandleWithModelID:](HMCContext, "findAccountHandleWithModelID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "modelIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      objc_msgSend(v5, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "modelIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v11)
      {
        objc_msgSend(v3, "deleteObject:", v5);
LABEL_12:
        objc_msgSend(v3, "save");
        goto LABEL_13;
      }
    }
    else
    {

    }
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1[5];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "modelIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "modelID");
      v26 = v17;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "modelIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v28 = v20;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Refusing to remove a handle which doesn't appear attached to the correct account (%@ != %@ || %@ != %@)", buf, 0x34u);

      v17 = v26;
    }

    objc_autoreleasePoolPop(v17);
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1[5];
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "modelIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account handle with modelID %@ to remove.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
LABEL_13:

}

void __48__HMDAccountRegistry_Roar__addHandle_toAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMCContext findAccountWithModelID:](HMCContext, "findAccountWithModelID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v16 = 138543874;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding account handle %@ to account %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 48), "modelIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materializeOrCreateHandlesRelationWithModelID:createdNew:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "updateBackingModel:error:", v13, 0);
    objc_msgSend(v3, "save");

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to add handle to.", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __53__HMDAccountRegistry_Roar__removeDevice_fromAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findBackingModelFromDevice:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v14 = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing device model for device %@ from account %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v3, "deleteObject:", v4);
    objc_msgSend(v3, "save");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "modelIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device with modelID %@ to remove device", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __48__HMDAccountRegistry_Roar__addDevice_toAccount___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccountWithModelID:](HMCContext, "findAccountWithModelID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v25 = 0;
    objc_msgSend(a1[6], "modelIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "materializeOrCreateDevicesRelationWithModelID:createdNew:", v6, &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = a1[5];
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1[6];
        v13 = a1[4];
        *(_DWORD *)buf = 138543874;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Requested to add device %@ to account %@, but it appears to already be there.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
    }
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1[5];
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1[6];
      v19 = a1[4];
      *(_DWORD *)buf = 138543874;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding created device model for device %@ to account %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(a1[6], "updateBackingModel:error:", v7, 0);
    objc_msgSend(v3, "save");

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1[5];
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "modelIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to add device to.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

void __52__HMDAccountRegistry_Roar__updateDevice_withDevice___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findDeviceWithModelID:](HMCContext, "findDeviceWithModelID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[5];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v12 = a1[6];
      v15 = 138543874;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating device model from device %@ to device %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(a1[6], "updateBackingModel:error:", v5, 0);
    objc_msgSend(v3, "save");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "modelIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device with modelID %@ to update device", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __51__HMDAccountRegistry_Roar__updateDevice_toVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findBackingModelFromDevice:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setVersion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "save");
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device %@ to update device version: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v3)
    goto LABEL_4;
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_4:
    objc_msgSend(v6, "setAccount:", v5);
  }

}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  +[HMCContext findAccountWithModelID:error:](HMCContext, "findAccountWithModelID:error:", v4, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    objc_msgSend(a1[4], "updateBackingModel:error:", v5, 0);
    objc_msgSend(a1[6], "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeDevicesRelationWith:", v13);

    objc_msgSend(v5, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_18;
    v21[3] = &unk_24E781348;
    v21[4] = a1[5];
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1[5];
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = a1[4];
      v20 = a1[6];
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating account %@ with devices: %@.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v3, "save");
    objc_msgSend(a1[7], "fulfillWithNoValue");
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1[5];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "modelIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to update devices on account: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mediaRouteID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "updateMediaRouteIDOfDeviceWithIdentifier:", v7);

  }
}

void __42__HMDAccountRegistry_Roar__updateAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "findHomeManagerWithError:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    _HMFPreconditionFailure();
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "materializeOrCreateAccountsRelationWithModelID:createdNew:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating account %@ in database.", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "updateBackingModel:error:", v7, 0);
    objc_msgSend(v3, "save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine existance of account %@ in database.", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __42__HMDAccountRegistry_Roar__removeAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findAccountWithModelID:](HMCContext, "findAccountWithModelID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 32);
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing account %@ from database.", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "deleteObject:", v5);
    objc_msgSend(v3, "save");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ for removal.", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __47__HMDAccountRegistry_Roar__addAccount_isLocal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "findHomeManagerWithError:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    _HMFPreconditionFailure();
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "materializeOrCreateAccountsRelationWithModelID:createdNew:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      v17 = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding account %@ to database.", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "updateBackingModel:error:", v7, 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocal:", v14);

    objc_msgSend(v3, "save");
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine existence of account %@ in database.", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    v25 = 0;
    objc_msgSend(v3, "findLocalAccountWithError:", &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;
    if (v5)
    {
      v32[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
  else
  {
    v24 = 0;
    objc_msgSend(v3, "findRemoteAccountsWithError:", &v24);
    v10 = objc_claimAutoreleasedReturnValue();
    v6 = v24;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_12;
  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v27 = v15;
    if (v16)
      v17 = CFSTR("the local account");
    else
      v17 = CFSTR("remote accounts");
    v28 = 2112;
    v29 = v17;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke_6;
    v23[3] = &unk_24E77A430;
    v23[4] = v21;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
  }

}

void __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  HMDAccount *v4;
  HMDAccount *v5;

  v3 = a2;
  v5 = -[HMDAccount initWithBackingModel:]([HMDAccount alloc], "initWithBackingModel:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  NSStringFromSelector(sel_started);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___HMDAccountRegistry;
    v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

+ (HMDAccountRegistry)sharedRegistry
{
  if (sharedRegistry__hmf_once_t0 != -1)
    dispatch_once(&sharedRegistry__hmf_once_t0, &__block_literal_global_58646);
  return (HMDAccountRegistry *)(id)sharedRegistry__hmf_once_v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1)
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_31);
  return (id)logCategory__hmf_once_v29;
}

void __33__HMDAccountRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;

}

void __36__HMDAccountRegistry_sharedRegistry__block_invoke()
{
  HMDAccountRegistry *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [HMDAccountRegistry alloc];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[HMDAccountRegistry initWithAppleAccountManager:remoteAccountManager:](v0, "initWithAppleAccountManager:remoteAccountManager:", v4, v1);
  v3 = (void *)sharedRegistry__hmf_once_v1;
  sharedRegistry__hmf_once_v1 = v2;

}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccountRegistry *v11;

  v6 = a4;
  v7 = a3;
  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coreData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextWithRootPartition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDAccountRegistry initWithAppleAccountManager:remoteAccountManager:context:](self, "initWithAppleAccountManager:remoteAccountManager:context:", v7, v6, v10);

  return v11;
}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  HMDAccountRegistry *v10;
  HMDAccountRegistry *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *clientQueue;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccountRegistry;
  v10 = -[HMCContextProvider initWithContext:](&v21, sel_initWithContext_, a5);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    clientQueue = v11->_clientQueue;
    v11->_clientQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v11->_appleAccountManager, v8);
    objc_storeWeak((id *)&v11->_remoteAccountManager, v9);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v11, sel___handleAppleAccountUpdate_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel___handleAddedRemoteAccount_, CFSTR("HMDRemoteAccountManagerAddedAccountNotification"), v9);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v11, sel___handleRemovedRemoteAccount_, CFSTR("HMDRemoteAccountManagerRemovedAccountNotification"), v9);

    objc_msgSend(v8, "configureWithAccountRegistry:", v11);
    objc_msgSend(v9, "configureWithAccountRegistry:", v11);
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccountRegistry accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("AC"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)started
{
  HMDAccountRegistry *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)start
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HMDAccountRegistry *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccountRegistry registerForDatabaseChanges](v4, "registerForDatabaseChanges");
  -[HMDAccountRegistry appleAccountManager](v4, "appleAccountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    __registerForAccountUpdates(v4, v8);
    -[HMDAccountRegistry clientQueue](v4, "clientQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __27__HMDAccountRegistry_start__block_invoke;
    v16 = &unk_24E79C268;
    v17 = v4;
    v18 = v8;
    dispatch_async(v9, &v13);

  }
  objc_msgSend(v7, "start", v13, v14, v15, v16, v17);
  -[HMDAccountRegistry remoteAccountManager](v4, "remoteAccountManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  NSStringFromSelector(sel_started);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry willChangeValueForKey:](v4, "willChangeValueForKey:", v11);

  os_unfair_lock_lock_with_options();
  v4->_started = 1;
  os_unfair_lock_unlock(&v4->_lock);
  NSStringFromSelector(sel_started);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry didChangeValueForKey:](v4, "didChangeValueForKey:", v12);

}

- (void)stop
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  __registerForAccountUpdates(v4, 0);
  NSStringFromSelector(sel_started);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry willChangeValueForKey:](v4, "willChangeValueForKey:", v7);

  os_unfair_lock_lock_with_options();
  v4->_started = 0;
  os_unfair_lock_unlock(&v4->_lock);
  NSStringFromSelector(sel_started);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry didChangeValueForKey:](v4, "didChangeValueForKey:", v8);

}

- (void)reset
{
  void *v3;
  HMDAccountRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccountRegistry remoteAccountManager](v4, "remoteAccountManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

}

- (NSArray)accounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountRegistry appleAccountManager](self, "appleAccountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[HMDAccountRegistry remoteAccountManager](self, "remoteAccountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v8;
}

- (BOOL)accountExistsForHandle:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  __accountForHandle(self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)accountForHandle:(id)a3
{
  return -[HMDAccountRegistry accountForHandle:exists:](self, "accountForHandle:exists:", a3, 0);
}

- (id)accountForHandle:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccount *v10;
  HMDAccount *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __accountForHandle(self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = 1;
      v10 = v8;
    }
    else
    {
      v11 = [HMDAccount alloc];
      +[HMDAccountIdentifier accountIdentifierForAccountHandle:](HMDAccountIdentifier, "accountIdentifierForAccountHandle:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDAccount initWithIdentifier:handles:devices:](v11, "initWithIdentifier:handles:devices:", v12, v13, MEMORY[0x24BDBD1A8]);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)existingAccountWithMergeIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[HMDAccountRegistry accounts](self, "accounts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "senderCorrelationIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)deviceForIdentifier:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self;
    v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "deviceForIdentifier:", v4, (_QWORD)v13);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            goto LABEL_12;
          }
        }
        v7 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDevice *v9;
  HMDDevice *v10;
  void *v11;
  void *v12;
  HMDDevice *v13;
  void *v14;
  void *v15;
  HMDAccountRegistry *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  HMDDevice *v20;
  void *v21;
  void *v22;
  HMDAccountRegistry *v23;
  NSObject *v24;
  void *v25;
  HMDDevice *v26;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  HMDDevice *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "idsIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __deviceForHandle(self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = v9;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v5, "idsDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    __deviceForHandle(self, v12);
    v13 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (!v13)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v25;
        v30 = 2112;
        v31 = (uint64_t)v5;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing HMDDevice for %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v26 = -[HMDDevice initWithDeviceAddress:]([HMDDevice alloc], "initWithDeviceAddress:", v5);
      goto LABEL_16;
    }
    -[HMDDevice idsIdentifier](v13, "idsIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDevice idsIdentifier](v9, "idsIdentifier");
        v20 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "idsIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544386;
        v29 = v19;
        v30 = 2160;
        v31 = 1752392040;
        v32 = 2112;
        v33 = v20;
        v34 = 2160;
        v35 = 1752392040;
        v36 = 2112;
        v37 = v21;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_FAULT, "%{public}@IDS identifier mismatch %{mask.hash}@ != %{mask.hash}@", (uint8_t *)&v28, 0x34u);

LABEL_14:
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = (uint64_t)v7;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding local handle %@ to %@", (uint8_t *)&v28, 0x20u);
      goto LABEL_14;
    }

    objc_autoreleasePoolPop(v15);
    -[HMDDevice addHandle:](v9, "addHandle:", v7);
    v26 = v9;
LABEL_16:
    v10 = v26;

    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (id)deviceForHandle:(id)a3
{
  return -[HMDAccountRegistry deviceForHandle:exists:](self, "deviceForHandle:exists:", a3, 0);
}

- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDDevice *v10;
  HMDDevice *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __deviceForHandle(self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a4)
        *a4 = 1;
      v10 = v8;
    }
    else
    {
      v11 = [HMDDevice alloc];
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v11, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v12, v13, 0, 0, 0, 0);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)deviceExistsForDevice:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  __deviceForDevice(self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)deviceForDevice:(id)a3
{
  return -[HMDAccountRegistry deviceForDevice:exists:](self, "deviceForDevice:exists:", a3, 0);
}

- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (v6)
  {
    __deviceForDevice(self, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    if (v8 && a4)
    {
      *a4 = 1;
      v10 = (void *)v8;
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceForPushToken:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HMDAccountRegistry *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self;
  v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v36;
    v26 = v5;
    v23 = *(_QWORD *)v36;
    do
    {
      v8 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
          v25 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v32 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              objc_msgSend(v15, "globalHandles", v23);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v28;
                while (2)
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v28 != v19)
                      objc_enumerationMutation(v16);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "matchesPushToken:", v4) & 1) != 0)
                    {
                      v21 = v15;

                      v5 = v26;
                      goto LABEL_26;
                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              v13 = v25;
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            v5 = v26;
            v7 = v23;
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v24);
      v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      v21 = 0;
    }
    while (v6);
  }
  else
  {
    v21 = 0;
  }
LABEL_26:

  return v21;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4;
  HMDAccountRegistry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  HMDAccountRegistry *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self;
  v6 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v24 = v5;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v10, "devices");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          v23 = v7;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v16, "idsIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "isEqual:", v4))
              {

LABEL_20:
                v20 = v16;

                v5 = v24;
                goto LABEL_21;
              }
              objc_msgSend(v16, "sharedUserIDSIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v4);

              if ((v19 & 1) != 0)
                goto LABEL_20;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v7 = v23;
            v5 = v24;
            v8 = v22;
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = -[HMDAccountRegistry countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v20 = 0;
    }
    while (v7);
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  return v20;
}

- (void)__handleAppleAccountUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAppleAccountHandlesUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAppleAccountDeviceAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleAddedRemoteAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__handleRemovedRemoteAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccountRegistry *v9;

  v4 = a3;
  -[HMDAccountRegistry clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDAccountRegistry *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v6)
  {
    -[HMDAccountRegistry appleAccountManager](self, "appleAccountManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v6);

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not resolving handle, %@, on our account", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (v7)
        v7[2](v7, v9, 0);
    }
    else
    {

      -[HMDAccountRegistry remoteAccountManager](self, "remoteAccountManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_resolveAccountForHandle:completionHandler:", v6, v7);
    }

  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HMDAccountRegistry accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_loadWeakRetained((id *)&self->_appleAccountManager);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return (HMDRemoteAccountManager *)objc_loadWeakRetained((id *)&self->_remoteAccountManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isRelatedToAccount:", v6);

    if ((v7 & 1) == 0)
      __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v8);
  }

}

void __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isRelatedToAccount:", v6);

    if ((v7 & 1) == 0)
      __notifyDelegateAccountAdded(*(void **)(a1 + 40), v8);
  }

}

void __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToAccount:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that device was added to our account: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v17 = *(void **)(a1 + 40);
      v18 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v11, "handles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __cleanupRemoteDevicesWithHandles(v17, v20);

    }
  }

}

void __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 40), "appleAccountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToAccount:", v5);

  if (v6)
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v7);

}

void __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HMDPreviousAccountNotificationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v5)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification current account added", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    __registerForAccountUpdates(*(void **)(a1 + 40), v5);
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v5);
    objc_msgSend(v5, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2 * objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "handles", (_QWORD)v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 40), v15);
    __notifyDelegateAccountAdded(*(void **)(a1 + 40), v5);
  }
  else if (v9)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Received notification current account removed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    __registerForAccountUpdates(*(void **)(a1 + 40), 0);
    __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v9);
  }

}

void __27__HMDAccountRegistry_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "handles", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 32), v3);
}

@end
