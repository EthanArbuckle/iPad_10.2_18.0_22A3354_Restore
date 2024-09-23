@implementation HMDNetworkRouterController

- (HMDNetworkRouterController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDNetworkRouterController *v11;
  HMDNetworkRouterController *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDNetworkRouterController;
  v11 = -[HMDNetworkRouterController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeWeak((id *)&v12->_routerService, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
  }

  return v12;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDNetworkRouterController *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryConfiguredNotification_, CFSTR("HMDAccessoryConnectedNotification"), v3);

    if (objc_msgSend(v3, "isReachable"))
    {
      -[HMDNetworkRouterController workQueue](self, "workQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__HMDNetworkRouterController_configure__block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = self;
      dispatch_async(v6, block);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not configuring network router controller as accessory is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterController *v4;
  HMDNetworkRouterController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDNetworkRouterController *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDNetworkRouterController routerService](self, "routerService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterController routerService](v5, "routerService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDNetworkRouterController routerService](self, "routerService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (NSString)wiFiSSID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  HMDNetworkRouterController *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterController routerService](self, "routerService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getConfiguredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@SSID unavailable", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)writeManagedNetworkEnable:(BOOL)a3 completion:(id)a4
{
  void *v4;

  if (a3)
    v4 = &unk_1E8B33EB8;
  else
    v4 = &unk_1E8B33ED0;
  -[HMDNetworkRouterController _writeValueIfDifferent:characteristicType:operationName:completion:](self, "_writeValueIfDifferent:characteristicType:operationName:completion:", v4, CFSTR("00000215-0000-1000-8000-0026BB765291"), CFSTR("Setting Managed Network Enable"), a4);
}

- (void)getClientStatusWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDNetworkRouterClientStatusControlOperation *v8;
  HMDNetworkRouterClientStatusControl *v9;
  void *v10;
  HMDNetworkRouterController *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  __CFString *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  HMDNetworkRouterClientStatusControl *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HMDNetworkRouterClientStatusControlOperation initWithOperation:]([HMDNetworkRouterClientStatusControlOperation alloc], "initWithOperation:", 1);
  v9 = -[HMDNetworkRouterClientStatusControl initWithOperation:clientStatusIdentifierList:]([HMDNetworkRouterClientStatusControl alloc], "initWithOperation:clientStatusIdentifierList:", v8, v6);
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v13;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = CFSTR("Get Client Status");
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Writing client status request %@ for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HMDNetworkRouterController_getClientStatusWithIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E89B58C8;
  v15[4] = v11;
  v16 = CFSTR("Get Client Status");
  v17 = v7;
  v14 = v7;
  -[HMDNetworkRouterController _writeTLVWithValueInResponse:characteristicType:operationName:completion:](v11, "_writeTLVWithValueInResponse:characteristicType:operationName:completion:", v9, CFSTR("0000020D-0000-1000-8000-0026BB765291"), CFSTR("Get Client Status"), v15);

}

- (void)getClientStatusWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDNetworkRouterClientStatusIdentifierList *v8;
  void *v9;
  HMDNetworkRouterClientStatusIdentifierList *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = [HMDNetworkRouterClientStatusIdentifierList alloc];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMDNetworkRouterClientStatusIdentifierList initWithClientStatusIdentifiers:](v8, "initWithClientStatusIdentifiers:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HMDNetworkRouterController_getClientStatusWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E89B5878;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[HMDNetworkRouterController getClientStatusWithIdentifiers:completion:](self, "getClientStatusWithIdentifiers:completion:", v10, v12);

}

- (void)addClientConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  clientControlWithOperationType(3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HMDNetworkRouterController_addClientConfiguration_completion___block_invoke;
  v12[3] = &unk_1E89B58A0;
  v13 = v6;
  v11 = v6;
  -[HMDNetworkRouterController _writeClientConfigurationControlRequest:operationName:completion:](self, "_writeClientConfigurationControlRequest:operationName:completion:", v8, CFSTR("Add Client Configuration"), v12);

}

- (void)readClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  clientControlWithOperationType(2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v7);

  objc_msgSend(v8, "operations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientIdentifier:", v9);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__HMDNetworkRouterController_readClientConfigurationWithClientIdentifier_completion___block_invoke;
  v14[3] = &unk_1E89B58A0;
  v15 = v6;
  v13 = v6;
  -[HMDNetworkRouterController _writeClientConfigurationControlRequest:operationName:completion:](self, "_writeClientConfigurationControlRequest:operationName:completion:", v8, CFSTR("Read Client Configuration"), v14);

}

- (void)updateClientConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  clientControlWithOperationType(5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfiguration:", v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HMDNetworkRouterController_updateClientConfiguration_completion___block_invoke;
  v12[3] = &unk_1E89B58A0;
  v13 = v6;
  v11 = v6;
  -[HMDNetworkRouterController _writeClientConfigurationControlRequest:operationName:completion:](self, "_writeClientConfigurationControlRequest:operationName:completion:", v8, CFSTR("Update Client Configuration"), v12);

}

- (void)removeClientConfigurationWithClientIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  clientControlWithOperationType(4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v7);

  objc_msgSend(v8, "operations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientIdentifier:", v9);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__HMDNetworkRouterController_removeClientConfigurationWithClientIdentifier_completion___block_invoke;
  v14[3] = &unk_1E89B58A0;
  v15 = v6;
  v13 = v6;
  -[HMDNetworkRouterController _writeClientConfigurationControlRequest:operationName:completion:](self, "_writeClientConfigurationControlRequest:operationName:completion:", v8, CFSTR("Remove Client Configuration"), v14);

}

- (void)fetchAccessViolationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  __CFString *v8;
  id v9;

  v4 = a3;
  accessViolationControlWithType(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMDNetworkRouterController_fetchAccessViolationsWithCompletion___block_invoke;
  v7[3] = &unk_1E89B58C8;
  v7[4] = self;
  v8 = CFSTR("Get Access Violation List");
  v9 = v4;
  v6 = v4;
  -[HMDNetworkRouterController _writeTLVWithValueInResponse:characteristicType:operationName:completion:](self, "_writeTLVWithValueInResponse:characteristicType:operationName:completion:", v5, CFSTR("0000021F-0000-1000-8000-0026BB765291"), CFSTR("Get Access Violation List"), v7);

}

- (void)resetAccessViolationForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDNetworkRouterClientIdentifierList *v10;
  void *v11;
  HMDNetworkRouterClientIdentifierList *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  accessViolationControlWithType(2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", v7);

  v10 = [HMDNetworkRouterClientIdentifierList alloc];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDNetworkRouterClientIdentifierList initWithClientIdentifiers:](v10, "initWithClientIdentifiers:", v11);
  objc_msgSend(v8, "setClientIdentifierList:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HMDNetworkRouterController_resetAccessViolationForClientIdentifier_completion___block_invoke;
  v14[3] = &unk_1E89B58F0;
  v15 = v6;
  v13 = v6;
  -[HMDNetworkRouterController _writeTLVWithValueInResponse:characteristicType:operationName:completion:](self, "_writeTLVWithValueInResponse:characteristicType:operationName:completion:", v8, CFSTR("0000021F-0000-1000-8000-0026BB765291"), CFSTR("Reset Access Violation"), v14);

}

- (void)_writeClientConfigurationControlRequest:(id)a3 operationName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDNetworkRouterController *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v14;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing client configuration request %@ for %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__HMDNetworkRouterController__writeClientConfigurationControlRequest_operationName_completion___block_invoke;
  v18[3] = &unk_1E89BF1B0;
  v18[4] = v12;
  v19 = v9;
  v20 = v8;
  v21 = v10;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  -[HMDNetworkRouterController _writeTLVWithValueInResponse:characteristicType:operationName:completion:](v12, "_writeTLVWithValueInResponse:characteristicType:operationName:completion:", v16, CFSTR("0000020C-0000-1000-8000-0026BB765291"), v17, v18);

}

- (void)_writeValueIfDifferent:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDNetworkRouterController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDNetworkRouterController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  void (**v30)(id, _QWORD);
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  -[HMDNetworkRouterController routerService](self, "routerService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "findCharacteristicWithType:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v10);

    if (v17)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        v33 = 2112;
        v34 = v12;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Omitting %@ write with value %@, cached value matches", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v13[2](v13, 0);
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __97__HMDNetworkRouterController__writeValueIfDifferent_characteristicType_operationName_completion___block_invoke;
      v27[3] = &unk_1E89B5918;
      v27[4] = self;
      v28 = v12;
      v29 = v10;
      v30 = v13;
      -[HMDNetworkRouterController _writeValue:forCharacteristic:completion:](self, "_writeValue:forCharacteristic:completion:", v29, v15, v27);

    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Characteristic not found for operation %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v13)[2](v13, v26);

  }
}

- (void)_writeTLVWithValueInResponse:(id)a3 characteristicType:(id)a4 operationName:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMDNetworkRouterController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDNetworkRouterController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = 0;
  objc_msgSend(v10, "serializeWithError:", &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;
  if (v14)
  {
    -[HMDNetworkRouterController routerService](self, "routerService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "findCharacteristicWithType:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __103__HMDNetworkRouterController__writeTLVWithValueInResponse_characteristicType_operationName_completion___block_invoke;
      v27[3] = &unk_1E89B5918;
      v27[4] = self;
      v28 = v12;
      v29 = v14;
      v30 = v13;
      -[HMDNetworkRouterController _writeValue:forCharacteristic:completion:](self, "_writeValue:forCharacteristic:completion:", v29, v17, v27);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Characteristic not found for operation %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v26, 0);

      v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v21;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v15;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize TLV: %@ with error: %@ for operation %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v17, 0);
  }

}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:type:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:type:", a4, a3, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterController accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterController workQueue](self, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HMDNetworkRouterController__writeValue_forCharacteristic_completion___block_invoke;
  v14[3] = &unk_1E89BD348;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v10, "writeCharacteristicValues:source:queue:completionHandler:", v11, 7, v12, v14);

}

- (void)_handleNetworkAccessViolationUpdate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDNetworkRouterController *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      v13 = "%{public}@Handling network access violation failed. No hapAccessory found.";
      v14 = v11;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_11:
      _os_log_impl(&dword_1CD062000, v14, v15, v13, buf, 0xCu);

    }
LABEL_12:

    objc_autoreleasePoolPop(v9);
    goto LABEL_13;
  }
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routerClientManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "started");

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      v13 = "%{public}@Device is not managing the network router, skipping handling of network violation update";
      v14 = v11;
      v15 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__HMDNetworkRouterController__handleNetworkAccessViolationUpdate__block_invoke;
  v16[3] = &unk_1E89B5940;
  v16[4] = self;
  -[HMDNetworkRouterController fetchAccessViolationsWithCompletion:](self, "fetchAccessViolationsWithCompletion:", v16);
LABEL_13:

}

- (void)_handleCharacteristicChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("0000021F-0000-1000-8000-0026BB765291"));

        if (v10)
          -[HMDNetworkRouterController _handleNetworkAccessViolationUpdate](self, "_handleNetworkAccessViolationUpdate");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_handleCharacteristicsChangedPayload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNetworkRouterController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
          -[HMDNetworkRouterController accessory](self, "accessory", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accessory");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = HMFEqualObjects();

          if (v16)
            objc_msgSend(v7, "addObject:", v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    -[HMDNetworkRouterController _handleCharacteristicChanges:](self, "_handleCharacteristicChanges:", v7);
    v6 = v17;
    v4 = v18;
  }

}

- (void)_handleAccessoryConnected
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDNetworkRouterController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v20 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterController routerService](self, "routerService");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "characteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "characteristicType");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("0000021F-0000-1000-8000-0026BB765291"));

          if (v14)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v5 = v20;
    if (objc_msgSend(v6, "count"))
    {
      -[HMDNetworkRouterController _handleCharacteristicChanges:](self, "_handleCharacteristicChanges:", v6);
      objc_msgSend(v20, "enableNotification:forCharacteristics:message:clientIdentifier:", 1, v6, 0, CFSTR("com.apple.HomeKitDaemon.networkRouter"));
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Handling connected accessory failed. No hapAccessory found.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDNetworkRouterController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMDNetworkRouterController_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDNetworkRouterController workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDNetworkRouterController_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (HMDService)routerService
{
  return (HMDService *)objc_loadWeakRetained((id *)&self->_routerService);
}

- (void)setRouterService:(id)a3
{
  objc_storeWeak((id *)&self->_routerService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routerService);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __68__HMDNetworkRouterController_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryConnected");
}

void __71__HMDNetworkRouterController_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_handleCharacteristicsChangedPayload:", v2);

}

void __65__HMDNetworkRouterController__handleNetworkAccessViolationUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessoryNetworkAccessViolation *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v46 = a1;
      v44 = v6;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v45 = v5;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v54 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v15, "clientIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v15, "clientIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKey:", v15, v19);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
        }
        while (v12);
      }

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v43 = v8;
      objc_msgSend(v8, "accessories");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      v21 = v46;
      if (v20)
      {
        v22 = v20;
        v48 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v50 != v48)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
            objc_msgSend(v24, "networkClientIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = v9;
              objc_msgSend(v9, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v27)
              {
                objc_msgSend(v27, "lastViolationTimestamp");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                HAPDateWithTimeIntervalSince1970();
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "lastResetTimestamp");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                HAPDateWithTimeIntervalSince1970();
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                v33 = -[HMDAccessoryNetworkAccessViolation initWithLastViolationDate:lastViolationResetDate:]([HMDAccessoryNetworkAccessViolation alloc], "initWithLastViolationDate:lastViolationResetDate:", v30, v32);
                objc_msgSend(v24, "saveNetworkAccessViolation:", v33);

              }
              else
              {
                v34 = (void *)MEMORY[0x1D17BA0A0]();
                v35 = *(id *)(v21 + 32);
                HMFGetOSLogHandle();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "name");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v58 = v37;
                  v59 = 2112;
                  v60 = v38;
                  v61 = 2112;
                  v62 = v25;
                  _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@No network access violation info for accessory %@ with client identifier %@", buf, 0x20u);

                  v21 = v46;
                }

                objc_autoreleasePoolPop(v34);
              }

              v9 = v26;
            }

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        }
        while (v22);
      }

      v6 = v44;
      v5 = v45;
      v8 = v43;
    }

  }
  else
  {
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v42;
      v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access violations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
  }

}

void __71__HMDNetworkRouterController__writeValue_forCharacteristic_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __103__HMDNetworkRouterController__writeTLVWithValueInResponse_characteristicType_operationName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@%@ with write value %@ failed with error %@", (uint8_t *)&v23, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "error");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v3, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v14);
      goto LABEL_8;
    }
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      v23 = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, v13, 0);
LABEL_8:

}

void __97__HMDNetworkRouterController__writeValueIfDifferent_characteristicType_operationName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@%@ with write value %@ failed with error %@", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "error");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v12 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v13);

LABEL_8:
}

void __95__HMDNetworkRouterController__writeClientConfigurationControlRequest_operationName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v48 = v10;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ operation failed with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v46 = 0;
    +[HMDNetworkRouterClientControlResponse parsedFromData:error:](HMDNetworkRouterClientControlResponse, "parsedFromData:error:", v6, &v46);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFString *)v46;
    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v48 = v17;
        v49 = 2112;
        v50 = v18;
        v51 = 2112;
        v52 = v19;
        v53 = 2112;
        v54 = v13;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response to %@ request: %@ with error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(v12, "operationResponses");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "clientIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v44 = v24;
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v21, "status");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          HMDNetworkRouterControlOperationStatusTypeAsString(objc_msgSend(v43, "status"));
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (returned client identifier = %@)"), v23);
            v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = &stru_1E89C3E38;
          }
          *(_DWORD *)buf = 138544130;
          v48 = v45;
          v49 = 2112;
          v50 = v41;
          v51 = 2112;
          v52 = v27;
          v53 = 2112;
          v42 = (__CFString *)v28;
          v54 = v28;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@%@ operation status %@%@", buf, 0x2Au);
          if (v23)

          v24 = v44;
        }

        objc_autoreleasePoolPop(v24);
        v36 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v21, "status");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "status");
        v39 = v38;
        if ((unint64_t)(v38 - 1) > 0xA)
        {
          v40 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", qword_1CDB8F7B8[v38 - 1]);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v39 && !v40)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        (*(void (**)(uint64_t, void *, void *))(v36 + 16))(v36, v40, v21);

      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_QWORD *)(a1 + 40);
          v34 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v48 = v32;
          v49 = 2112;
          v50 = v33;
          v51 = 2112;
          v52 = v34;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Invalid response from %@ with write value %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v29);
        v35 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 50);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v35 + 16))(v35, v23, 0);
      }

    }
  }

}

uint64_t __81__HMDNetworkRouterController_resetAccessViolationForClientIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__HMDNetworkRouterController_fetchAccessViolationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v21 = 0;
    +[HMDNetworkRouterAccessViolationControlResponse parsedFromData:error:](HMDNetworkRouterAccessViolationControlResponse, "parsedFromData:error:", v6, &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v7, "violations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v11, 0);

    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        v26 = 2112;
        v27 = v6;
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response to %@ request %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch access violation list TLV: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __87__HMDNetworkRouterController_removeClientConfigurationWithClientIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__HMDNetworkRouterController_updateClientConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__HMDNetworkRouterController_readClientConfigurationWithClientIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);

}

void __64__HMDNetworkRouterController_addClientConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v7);
  }
  else if (v10)
  {
    (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

void __71__HMDNetworkRouterController_getClientStatusWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v6, "clientStatuses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 < 2)
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "clientStatuses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
    else
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Router returned multiple client status results but only one was expected", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);
    }

  }
}

void __72__HMDNetworkRouterController_getClientStatusWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v20 = 0;
    +[HMDNetworkRouterClientStatusList parsedFromData:error:](HMDNetworkRouterClientStatusList, "parsedFromData:error:", v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v22 = v13;
        v23 = 2112;
        v24 = v14;
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v8;
        v15 = "%{public}@Failed to parse response to %@ request: %@ with error: %@";
        v16 = v12;
        v17 = OS_LOG_TYPE_ERROR;
        v18 = 42;
LABEL_8:
        _os_log_impl(&dword_1CD062000, v16, v17, v15, buf, v18);

      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v22 = v13;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v7;
      v15 = "%{public}@%@ returned response: %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_DEBUG;
      v18 = 32;
      goto LABEL_8;
    }

    objc_autoreleasePoolPop(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:

}

uint64_t __39__HMDNetworkRouterController_configure__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryConnected");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_125092 != -1)
    dispatch_once(&logCategory__hmf_once_t28_125092, &__block_literal_global_125093);
  return (id)logCategory__hmf_once_v29_125094;
}

void __41__HMDNetworkRouterController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29_125094;
  logCategory__hmf_once_v29_125094 = v0;

}

@end
