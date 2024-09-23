@implementation MTSDeviceSetupExtensionMessenger

- (MTSDeviceSetupExtensionMessenger)initWithContainingAppBundleURL:(id)a3
{
  id v4;
  void *v5;
  MTSDeviceSetupExtensionMessenger *v6;
  uint64_t v7;
  NSURL *containingAppBundleURL;
  id executeExtensionQueryHandler;
  id extensionProcessFactory;
  MTSDeviceSetupExtensionMessenger *result;
  MTSDeviceSetupExtensionMessenger *v12;
  SEL v13;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)MTSDeviceSetupExtensionMessenger;
    v6 = -[MTSDeviceSetupExtensionMessenger init](&v14, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      containingAppBundleURL = v6->_containingAppBundleURL;
      v6->_containingAppBundleURL = (NSURL *)v7;

      executeExtensionQueryHandler = v6->_executeExtensionQueryHandler;
      v6->_executeExtensionQueryHandler = &__block_literal_global_1638;

      extensionProcessFactory = v6->_extensionProcessFactory;
      v6->_extensionProcessFactory = &__block_literal_global_57;

    }
    return v6;
  }
  else
  {
    v12 = (MTSDeviceSetupExtensionMessenger *)_HMFPreconditionFailure();
    -[MTSDeviceSetupExtensionMessenger dealloc](v12, v13);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[MTSDeviceSetupExtensionProcess invalidate](self->_extensionProcess, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTSDeviceSetupExtensionMessenger;
  -[MTSDeviceSetupExtensionMessenger dealloc](&v3, sel_dealloc);
}

- (BOOL)startWithError:(id *)a3
{
  void *v5;
  MTSDeviceSetupExtensionMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  MTSDeviceSetupExtensionMessenger *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  MTSDeviceSetupExtensionMessenger *v31;
  NSObject *v32;
  void *v33;
  MTSDeviceSetupExtensionMessenger *v34;
  NSObject *v35;
  void *v36;
  __CFString *v37;
  void *context;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x23493F978](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v8;
    _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting device setup extension messenger", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.matter.support.extension.device-setup"));
  -[MTSDeviceSetupExtensionMessenger executeExtensionQueryHandler](v6, "executeExtensionQueryHandler");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v10)[2](v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke;
  v46[3] = &unk_250599E38;
  v46[4] = v6;
  objc_msgSend(v11, "na_firstObjectPassingTest:", v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79D8]), "initWithExtensionIdentity:", v13);
    -[MTSDeviceSetupExtensionMessenger extensionProcessFactory](v6, "extensionProcessFactory");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v45 = 0;
    ((void (**)(_QWORD, __CFString *, id *))v15)[2](v15, v14, &v45);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v45;
    -[MTSDeviceSetupExtensionMessenger setExtensionProcess:](v6, "setExtensionProcess:", v16);

    -[MTSDeviceSetupExtensionMessenger extensionProcess](v6, "extensionProcess");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = v17 == 0;

    if ((_DWORD)v16)
    {
      v30 = (void *)MEMORY[0x23493F978]();
      v31 = v6;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v33;
        v49 = 2112;
        v50 = v14;
        v51 = 2112;
        v52 = v41;
        _os_log_impl(&dword_2344FE000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create extension process from configuration %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      v21 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v41);
    }
    else
    {
      -[MTSDeviceSetupExtensionMessenger extensionProcess](v6, "extensionProcess");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v18, "makeMTSXPCConnectionWithError:", &v44);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v44;
      -[MTSDeviceSetupExtensionMessenger setXpcConnection:](v6, "setXpcConnection:", v19);

      -[MTSDeviceSetupExtensionMessenger xpcConnection](v6, "xpcConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 != 0;

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD1990], "mts_deviceSetupExtensionInterface");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTSDeviceSetupExtensionMessenger xpcConnection](v6, "xpcConnection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRemoteObjectInterface:", v22);

        objc_initWeak((id *)buf, v6);
        v42[0] = v12;
        v42[1] = 3221225472;
        v42[2] = __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke_66;
        v42[3] = &unk_250599F70;
        objc_copyWeak(&v43, (id *)buf);
        -[MTSDeviceSetupExtensionMessenger xpcConnection](v6, "xpcConnection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setInterruptionHandler:", v42);

        -[MTSDeviceSetupExtensionMessenger xpcConnection](v6, "xpcConnection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "activate");

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        context = (void *)MEMORY[0x23493F978]();
        v34 = v6;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTSDeviceSetupExtensionMessenger extensionProcess](v34, "extensionProcess");
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = v36;
          v49 = 2112;
          v50 = v37;
          v51 = 2112;
          v52 = v40;
          _os_log_impl(&dword_2344FE000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to make XPC connection with extension process %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        if (a3)
          *a3 = objc_retainAutorelease(v40);
      }

    }
  }
  else
  {
    v26 = (void *)MEMORY[0x23493F978]();
    v27 = v6;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v29;
      v49 = 2112;
      v50 = CFSTR("com.apple.matter.support.extension.device-setup");
      _os_log_impl(&dword_2344FE000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to find identity for extension identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v21 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)selectWiFiNetworkFromScanResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDeviceSetupExtensionMessenger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MTSDeviceSetupExtensionMessenger *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23493F978]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending select WiFi network request with wifiScanResults: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v9, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __87__MTSDeviceSetupExtensionMessenger_selectWiFiNetworkFromScanResults_completionHandler___block_invoke;
  v18 = &unk_250599F98;
  v19 = v9;
  v20 = v7;
  v13 = v7;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "selectWiFiNetworkFromScanResults:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

- (void)selectThreadNetworkFromScanResults:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDeviceSetupExtensionMessenger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MTSDeviceSetupExtensionMessenger *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23493F978]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending select thread network request with threadScanResults: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v9, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __89__MTSDeviceSetupExtensionMessenger_selectThreadNetworkFromScanResults_completionHandler___block_invoke;
  v18 = &unk_250599F98;
  v19 = v9;
  v20 = v7;
  v13 = v7;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "selectThreadNetworkFromScanResults:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

- (void)validateDeviceCredential:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDeviceSetupExtensionMessenger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MTSDeviceSetupExtensionMessenger *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23493F978]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending validate device credential request with deviceCredential: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v9, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __79__MTSDeviceSetupExtensionMessenger_validateDeviceCredential_completionHandler___block_invoke;
  v18 = &unk_250599F98;
  v19 = v9;
  v20 = v7;
  v13 = v7;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "validateDeviceCredential:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

- (void)pairDeviceInHome:(id)a3 onboardingPayload:(id)a4 uuid:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MTSDeviceSetupExtensionMessenger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  MTSDeviceSetupExtensionMessenger *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x23493F978]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_2344FE000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending pair device request with home: %@, onboardingPayload: %@, uuid: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v15, "xpcConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __94__MTSDeviceSetupExtensionMessenger_pairDeviceInHome_onboardingPayload_uuid_completionHandler___block_invoke;
  v24 = &unk_250599F98;
  v25 = v15;
  v26 = v13;
  v19 = v13;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "pairDeviceInHome:onboardingPayload:uuid:completionHandler:", v10, v11, v12, v19, v21, v22, v23, v24, v25);
}

- (void)fetchRoomsInHome:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDeviceSetupExtensionMessenger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  MTSDeviceSetupExtensionMessenger *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x23493F978]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2344FE000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending fetch rooms request with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v9, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __71__MTSDeviceSetupExtensionMessenger_fetchRoomsInHome_completionHandler___block_invoke;
  v18 = &unk_250599F98;
  v19 = v9;
  v20 = v7;
  v13 = v7;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "fetchRoomsInHome:completionHandler:", v6, v13, v15, v16, v17, v18, v19);
}

- (void)configureDeviceWithName:(id)a3 room:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MTSDeviceSetupExtensionMessenger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  MTSDeviceSetupExtensionMessenger *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x23493F978]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v14;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_2344FE000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending configure device request with name: %@, room: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[MTSDeviceSetupExtensionMessenger xpcConnection](v12, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __83__MTSDeviceSetupExtensionMessenger_configureDeviceWithName_room_completionHandler___block_invoke;
  v21 = &unk_250599F98;
  v22 = v12;
  v23 = v10;
  v16 = v10;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "configureDeviceWithName:room:completionHandler:", v8, v9, v16, v18, v19, v20, v21, v22);
}

- (NSURL)containingAppBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (MTSDeviceSetupExtensionProcess)extensionProcess
{
  return (MTSDeviceSetupExtensionProcess *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtensionProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MTSXPCConnection)xpcConnection
{
  return (MTSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)executeExtensionQueryHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setExecuteExtensionQueryHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)extensionProcessFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setExtensionProcessFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionProcessFactory, 0);
  objc_storeStrong(&self->_executeExtensionQueryHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_containingAppBundleURL, 0);
}

void __83__MTSDeviceSetupExtensionMessenger_configureDeviceWithName_room_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to configure device: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__MTSDeviceSetupExtensionMessenger_fetchRoomsInHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to fetch rooms: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __94__MTSDeviceSetupExtensionMessenger_pairDeviceInHome_onboardingPayload_uuid_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to pair device: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__MTSDeviceSetupExtensionMessenger_validateDeviceCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to validate device: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89__MTSDeviceSetupExtensionMessenger_selectThreadNetworkFromScanResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to select thread network: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__MTSDeviceSetupExtensionMessenger_selectWiFiNetworkFromScanResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2344FE000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to obtain deviceSetupProxy to select wifi network: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "containingAppBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containingAppBundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __51__MTSDeviceSetupExtensionMessenger_startWithError___block_invoke_66(uint64_t a1)
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
  v2 = (void *)MEMORY[0x23493F978]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2344FE000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Device setup XPC connection was interrupted", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);

}

uint64_t __67__MTSDeviceSetupExtensionMessenger_initWithContainingAppBundleURL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDC79D0], "extensionProcessWithConfiguration:error:", a2, a3);
}

uint64_t __67__MTSDeviceSetupExtensionMessenger_initWithContainingAppBundleURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1)
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_68);
  return (id)logCategory__hmf_once_v9;
}

void __47__MTSDeviceSetupExtensionMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_v9 = v0;

}

@end
