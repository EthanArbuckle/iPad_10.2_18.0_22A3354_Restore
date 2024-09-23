@implementation HMDDeviceSetupConfiguringController

- (HMDDeviceSetupConfiguringController)init
{
  return -[HMDDeviceSetupConfiguringController initWithDiagnosticInfoControllerInternal:](self, "initWithDiagnosticInfoControllerInternal:", 0);
}

- (HMDDeviceSetupConfiguringController)initWithDiagnosticInfoControllerInternal:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  HMDDeviceSetupConfiguringController *v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("HMDDeviceSetupConfiguringController_Queue", v5);
  v8 = -[HMDDeviceSetupConfiguringController initWithQueue:rpCompanionLinkClientFactory:diagnosticInfoController:](self, "initWithQueue:rpCompanionLinkClientFactory:diagnosticInfoController:", v7, &__block_literal_global_149755, v6);

  return v8;
}

- (HMDDeviceSetupConfiguringController)initWithQueue:(id)a3 rpCompanionLinkClientFactory:(id)a4 diagnosticInfoController:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDDeviceSetupConfiguringController *v12;
  HMDDeviceSetupConfiguringController *v13;
  void *v14;
  id rpCompanionLinkClientFactory;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDDeviceSetupConfiguringController;
  v12 = -[HMDDeviceSetupConfiguringController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_diagnosticInfoController, a5);
    v14 = _Block_copy(v10);
    rpCompanionLinkClientFactory = v13->_rpCompanionLinkClientFactory;
    v13->_rpCompanionLinkClientFactory = v14;

    v13->_requestIDRegistrationDelay = 3;
    v13->_restartRPClientDelay = 120;
  }

  return v13;
}

- (void)setupRPClient
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDDeviceSetupConfiguringController_setupRPClient__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)queryConfiguringState:(id)a3 additionalKeys:(id)a4 withCompletion:(id)a5
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
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __91__HMDDeviceSetupConfiguringController_queryConfiguringState_additionalKeys_withCompletion___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)registerRequestID
{
  void *v3;
  HMDDeviceSetupConfiguringController *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[HMDDeviceSetupConfiguringController _shouldRegisterRequest](self, "_shouldRegisterRequest"))
  {
    -[HMDDeviceSetupConfiguringController _registerRequest:after:](self, "_registerRequest:after:", CFSTR("com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID"), -[HMDDeviceSetupConfiguringController requestIDRegistrationDelay](self, "requestIDRegistrationDelay"));
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@No need to register request", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_registerRequest:(id)a3 after:(int64_t)a4
{
  id v6;
  void *v7;
  HMDDeviceSetupConfiguringController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Register requestID: %@ after %@ seconds", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = dispatch_time(0, 1000000000 * a4);
  -[HMDDeviceSetupConfiguringController workQueue](v8, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__HMDDeviceSetupConfiguringController__registerRequest_after___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v8;
  dispatch_after(v12, v13, block);

}

- (void)_queryWithRequestID:(id)a3 mediaRouteIdentifier:(id)a4 rpDevice:(id)a5 additionalKeys:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void (**v18)(void);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDDeviceSetupConfiguringController *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  HMDDeviceSetupConfiguringController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDDeviceSetupConfiguringController *v32;
  NSObject *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (v14)
  {
    -[HMDDeviceSetupConfiguringController rpCompanionLinkClientFactory](self, "rpCompanionLinkClientFactory");
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v35 = v13;
      -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDispatchQueue:", v20);

      objc_msgSend(v19, "setDestinationDevice:", v14);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v25;
        v43 = 2112;
        v44 = v21;
        v45 = 2112;
        v46 = v12;
        v47 = 2112;
        v48 = v14;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Send (messageRequestID %@) handlerID: %@ message to (device '%@')", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke;
      v36[3] = &unk_24E7969B8;
      v36[4] = v23;
      v40 = v16;
      v37 = v19;
      v38 = v15;
      v39 = v21;
      v26 = v21;
      objc_msgSend(v37, "activateWithCompletion:", v36);

      v13 = v35;
    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v34;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot create a RPCompanionLinkClient", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v16 + 2))(v16, 0, v26);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Device is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v19);
  }

}

- (void)_tearDownCompanionLinkClient
{
  NSObject *v3;
  void *v4;
  HMDDeviceSetupConfiguringController *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Tearing down the companion link client", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDDeviceSetupConfiguringController setClient:](v5, "setClient:", 0);
}

- (id)_activeDevicesWithMediaRouteIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDDeviceSetupConfiguringController *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDeviceSetupConfiguringController client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      v32 = 2112;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Discovering RPCompanionLinkDevice matching identifier %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDDeviceSetupConfiguringController client](v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke;
    v28[3] = &unk_24E7897A0;
    v15 = v4;
    v29 = v15;
    objc_msgSend(v13, "na_filter:", v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDeviceSetupConfiguringController client](v8, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    v24 = 3221225472;
    v25 = __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke_2;
    v26 = &unk_24E7897A0;
    v27 = v15;
    objc_msgSend(v18, "na_filter:", &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v19, v23, v24, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@RPClient is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v20 = 0;
  }

  return v20;
}

- (void)_registerRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDeviceSetupConfiguringController *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HMDDeviceSetupConfiguringController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDDeviceSetupConfiguringController client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@RPClient is nil", buf, 0xCu);

    }
    v20 = (void *)v16;
    goto LABEL_12;
  }
  -[HMDDeviceSetupConfiguringController diagnosticInfoController](self, "diagnosticInfoController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@DiagnosticInfoController is nil", buf, 0xCu);

    }
    v20 = v8;
LABEL_12:
    objc_autoreleasePoolPop(v20);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupConfiguringController client](v9, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v12;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering request %@ with handler for active devices %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDDeviceSetupConfiguringController client](v9, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__HMDDeviceSetupConfiguringController__registerRequest___block_invoke;
  v22[3] = &unk_24E7897C8;
  v22[4] = v9;
  objc_msgSend(v15, "registerRequestID:options:handler:", v4, 0, v22);

LABEL_13:
}

- (BOOL)_shouldRegisterRequest
{
  void *v2;
  BOOL v3;

  -[HMDDeviceSetupConfiguringController diagnosticInfoController](self, "diagnosticInfoController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setupCompanionLinkClient
{
  NSObject *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDeviceSetupConfiguringController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDDeviceSetupConfiguringController *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDeviceSetupConfiguringController rpCompanionLinkClientFactory](self, "rpCompanionLinkClientFactory");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupConfiguringController setClient:](self, "setClient:", v5);

  -[HMDDeviceSetupConfiguringController client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDDeviceSetupConfiguringController workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupConfiguringController client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDispatchQueue:", v7);

    -[HMDDeviceSetupConfiguringController client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setControlFlags:", 14);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD16E0];
      -[HMDDeviceSetupConfiguringController client](v11, "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "controlFlags"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v13;
      v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Set up the companion link client, controlFlags = %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_initWeak((id *)buf, v11);
    v17 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke;
    v37[3] = &unk_24E797318;
    objc_copyWeak(&v38, (id *)buf);
    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInvalidationHandler:", v37);

    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_18;
    v35[3] = &unk_24E797318;
    objc_copyWeak(&v36, (id *)buf);
    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInterruptionHandler:", v35);

    v33[0] = v17;
    v33[1] = 3221225472;
    v33[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_19;
    v33[3] = &unk_24E789AE8;
    objc_copyWeak(&v34, (id *)buf);
    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDeviceFoundHandler:", v33);

    v31[0] = v17;
    v31[1] = 3221225472;
    v31[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_21;
    v31[3] = &unk_24E789AE8;
    objc_copyWeak(&v32, (id *)buf);
    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceLostHandler:", v31);

    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_22;
    v29[3] = &unk_24E789B10;
    objc_copyWeak(&v30, (id *)buf);
    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceChangedHandler:", v29);

    -[HMDDeviceSetupConfiguringController client](v11, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_24;
    v28[3] = &unk_24E79BD80;
    v28[4] = v11;
    objc_msgSend(v23, "activateWithCompletion:", v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot create companion link client", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDDeviceSetupConfiguringController _setupRPClientAfter:](v25, "_setupRPClientAfter:", 120);
  }
}

- (void)_setupRPClientAfter:(int64_t)a3
{
  void *v5;
  HMDDeviceSetupConfiguringController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Will setup the RPCompanionLinkClient after %@s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = dispatch_time(0, 1000000000 * a3);
  -[HMDDeviceSetupConfiguringController workQueue](v6, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDDeviceSetupConfiguringController__setupRPClientAfter___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_after(v10, v11, block);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (id)rpCompanionLinkClientFactory
{
  return self->_rpCompanionLinkClientFactory;
}

- (void)setRpCompanionLinkClientFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMDAppleMediaAccessoryDiagnosticInfoController)diagnosticInfoController
{
  return self->_diagnosticInfoController;
}

- (void)setDiagnosticInfoController:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticInfoController, a3);
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (unint64_t)requestIDRegistrationDelay
{
  return self->_requestIDRegistrationDelay;
}

- (void)setRequestIDRegistrationDelay:(unint64_t)a3
{
  self->_requestIDRegistrationDelay = a3;
}

- (unint64_t)restartRPClientDelay
{
  return self->_restartRPClientDelay;
}

- (void)setRestartRPClientDelay:(unint64_t)a3
{
  self->_restartRPClientDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoController, 0);
  objc_storeStrong(&self->_rpCompanionLinkClientFactory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __59__HMDDeviceSetupConfiguringController__setupRPClientAfter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Tearing down RP client and setting up again", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_tearDownCompanionLinkClient");
  objc_msgSend(*(id *)(a1 + 32), "_setupCompanionLinkClient");
  result = objc_msgSend(*(id *)(a1 + 32), "_shouldRegisterRequest");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "registerRequestID");
  return result;
}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Queue setup after invalidation.", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(v3, "_setupRPClientAfter:", 120);

}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x227676638]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@RPClient was interrupted", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);

}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Device Found from RPClient: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Device lost from RPClient: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@device changed from RPClient: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __64__HMDDeviceSetupConfiguringController__setupCompanionLinkClient__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error activating RPClient: '%@'", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_setupRPClientAfter:", 120);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@RPClient activated successfully", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __56__HMDDeviceSetupConfiguringController__registerRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x24BDD5EE8];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_arrayForKey:ofClasses:", v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x24BDBD1A8];
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "diagnosticInfoController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "diagnosticInfoDataWithAdditionalKeys:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v36[0] = CFSTR("HMDDeviceSetupConfiguringControllerTimeStampKey");
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    objc_msgSend(v18, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = *MEMORY[0x24BDD5B40];
    v37[0] = v20;
    v37[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v25;
      v32 = 2112;
      v33 = CFSTR("com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID");
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending response for %@ = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v21, 0, 0);

  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Diagnostic info data is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
  }

}

unint64_t __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "mediaRouteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    if ((objc_msgSend(v3, "statusFlags") & 2) != 0)
      v5 = 1;
    else
      v5 = ((unint64_t)objc_msgSend(v3, "statusFlags") >> 1) & 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

unint64_t __78__HMDDeviceSetupConfiguringController__activeDevicesWithMediaRouteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "mediaRouteIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = ((unint64_t)objc_msgSend(v3, "statusFlags") >> 2) & 1;
  else
    v5 = 0;

  return v5;
}

void __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@There was an error activating: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
  else
  {
    v18[0] = CFSTR("HMDDeviceSetupConfiguringControllerTimeStampKey");
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = *MEMORY[0x24BDD5EE8];
    v19[0] = v10;
    v19[1] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v12 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_11;
    v13[3] = &unk_24E799C38;
    v14 = v12;
    objc_copyWeak(&v17, (id *)buf);
    v16 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v14, "sendRequestID:request:options:responseHandler:", CFSTR("com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID"), v11, 0, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
}

void __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_11(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1[4], "invalidate");
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_2;
    v15[3] = &unk_24E799C60;
    v16 = v9;
    v17 = v11;
    v18 = a1[5];
    v21 = a1[6];
    v19 = v7;
    v20 = v8;
    dispatch_async(v12, v15);

  }
  else
  {
    v13 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v14);

  }
}

uint64_t __119__HMDDeviceSetupConfiguringController__queryWithRequestID_mediaRouteIdentifier_rpDevice_additionalKeys_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@(Request %@) failed with error: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    v15 = 138544130;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@(Request %@) sent; response: %@ / options: %@",
      (uint8_t *)&v15,
      0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __62__HMDDeviceSetupConfiguringController__registerRequest_after___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerRequest:", CFSTR("com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID"));
}

void __91__HMDDeviceSetupConfiguringController_queryConfiguringState_additionalKeys_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_activeDevicesWithMediaRouteIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && !objc_msgSend(v2, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Active destination devices: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_queryWithRequestID:mediaRouteIdentifier:rpDevice:additionalKeys:withCompletion:", CFSTR("com.apple.HomeKit.HMDDeviceSetupConfiguringStateRequestID"), v16, v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      v17 = 138543618;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@RPClient did not discover peer device for identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);
  }

}

uint64_t __52__HMDDeviceSetupConfiguringController_setupRPClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupCompanionLinkClient");
}

id __80__HMDDeviceSetupConfiguringController_initWithDiagnosticInfoControllerInternal___block_invoke()
{
  return objc_alloc_init(MEMORY[0x24BE7CBF0]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_149759 != -1)
    dispatch_once(&logCategory__hmf_once_t29_149759, &__block_literal_global_25_149760);
  return (id)logCategory__hmf_once_v30_149761;
}

void __50__HMDDeviceSetupConfiguringController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v30_149761;
  logCategory__hmf_once_v30_149761 = v0;

}

@end
