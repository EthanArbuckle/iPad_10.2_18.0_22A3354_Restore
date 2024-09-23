@implementation HMDAccessorySetupManager

- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMDSBSRemoteAlertHandleProvider *v12;
  HMDAccessorySetupManager *v13;

  v6 = a4;
  v7 = a3;
  +[HMDXPCMessageTransport accessorySetupTransport](HMDXPCMessageTransport, "accessorySetupTransport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE3F1C0]);
  +[HMDXPCMessageTransport accessorySetupTransport](HMDXPCMessageTransport, "accessorySetupTransport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTransport:", v10);
  v12 = objc_alloc_init(HMDSBSRemoteAlertHandleProvider);
  v13 = -[HMDAccessorySetupManager initWithWorkQueue:homeManager:xpcMessageTransport:messageDispatcher:alertHandleProvider:](self, "initWithWorkQueue:homeManager:xpcMessageTransport:messageDispatcher:alertHandleProvider:", v7, v6, v8, v11, v12);

  return v13;
}

- (HMDAccessorySetupManager)initWithWorkQueue:(id)a3 homeManager:(id)a4 xpcMessageTransport:(id)a5 messageDispatcher:(id)a6 alertHandleProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDAccessorySetupManager *v19;
  HMDAccessorySetupManager *v20;
  HMDAccessorySetupManager *v22;
  SEL v23;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v15)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v16)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v18 = v17;
  if (!v17)
  {
LABEL_13:
    v22 = (HMDAccessorySetupManager *)_HMFPreconditionFailure();
    return (HMDAccessorySetupManager *)-[HMDAccessorySetupManager accessorySetupHostClientConnection](v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessorySetupManager;
  v19 = -[HMDAccessorySetupManager init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a3);
    objc_storeWeak((id *)&v20->_homeManager, v14);
    objc_storeStrong((id *)&v20->_xpcMessageTransport, a5);
    objc_storeStrong((id *)&v20->_messageDispatcher, a6);
    objc_storeStrong((id *)&v20->_alertHandleProvider, a7);
  }

  return v20;
}

- (HMDXPCClientConnection)accessorySetupHostClientConnection
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDAccessorySetupManager xpcMessageTransport](self, "xpcMessageTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDAccessorySetupManager_accessorySetupHostClientConnection__block_invoke;
  v7[3] = &unk_24E774DD8;
  v7[4] = self;
  objc_msgSend(v4, "hmf_objectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDXPCClientConnection *)v5;
}

- (void)configure
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessorySetupManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD4FB0];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v6, sel__handlePerformAccessorySetupMessage_);

  -[HMDAccessorySetupManager messageDispatcher](self, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD4FB8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v8, self, v10, sel__handleResumeAccessorySetupMessage_);

  -[HMDAccessorySetupManager messageDispatcher](self, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDD4F80];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", v12, self, v14, sel__handleFinishAccessorySetupMessage_);

  -[HMDAccessorySetupManager messageDispatcher](self, "messageDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD4F78];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", v16, self, v18, sel__handleFailAccessorySetupMessage_);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handleNFCProxSetupNotification_, *MEMORY[0x24BE1B738], 0);

  objc_msgSend(MEMORY[0x24BE1BB80], "start");
}

- (void)launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID:(id)a3 accessoryName:(id)a4 homeUUID:(id)a5 clientConnection:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke;
  v23[3] = &unk_24E799C60;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest:(id)a3 clientProxy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HMDAccessorySetupManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (id)_createSetupAccessoryPayloadWithSetupPayloadURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessorySetupManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(MEMORY[0x24BDD7450], "isHAPSetupPayloadURL:", v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD79A0]), "initWithHAPSetupPayloadURL:error:", v6, a4);
  }
  else if (objc_msgSend(MEMORY[0x24BDD7450], "isCHIPSetupPayloadURL:", v6))
  {
    -[HMDAccessorySetupManager accessorySetupCoordinator](self, "accessorySetupCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createCHIPSetupAccessoryPayloadWithSetupPayloadURL:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unsupported URL scheme %@ in setupPayloadURL: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_launchHUISWithNFCProxSetupURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySetupManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySetupManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAccessorySetupManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with NFC prox setup URL: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v26 = 0;
  -[HMDAccessorySetupManager _createSetupAccessoryPayloadWithSetupPayloadURL:error:](v7, "_createSetupAccessoryPayloadWithSetupPayloadURL:error:", v4, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;
  if (v10)
  {
    v12 = objc_alloc(MEMORY[0x24BDD7998]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v10, v14, 0, 0);

    v16 = (void *)MEMORY[0x227676638](objc_msgSend(v15, "setEntitledForHomeKitSPI:", 1));
    v17 = v7;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with NFC prox setup accessory description: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __59__HMDAccessorySetupManager__launchHUISWithNFCProxSetupURL___block_invoke;
    v24[3] = &unk_24E774E50;
    v24[4] = v17;
    v25 = v11;
    -[HMDAccessorySetupManager _launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:](v17, "_launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:", v15, 0, 0, v24);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v4;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate HMSetupAccessoryPayload with url %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)_launchHUISWithRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySetupManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessorySetupManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAccessorySetupManager *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  HMDAccessorySetupManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDAccessorySetupManager *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  HMDAccessorySetupManager *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  HMDAccessorySetupManager *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  HMDAccessorySetupManager *v81;
  NSObject *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  HMDAccessorySetupManager *v102;
  id v103;
  void (**v104)(id, _QWORD, void *);
  id v105;
  id v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  id v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v9, "applicationBundleIdentifier");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  objc_msgSend(v12, "clientIdentifierSalt:", &v106);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v106;

  if (v13)
  {
    -[HMDAccessorySetupManager homeManager](self, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "homeUniqueIdentifier");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v13;
      if (v97)
      {
        objc_msgSend(v15, "_homeWithUniqueIdentifier:forClientIdentifierSalt:", v97, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          v13 = v92;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v89 = v14;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v108 = v20;
            v109 = 2112;
            v110 = v97;
            v111 = 2112;
            v112 = v92;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find home with unique identifier %@ for client identifier salt: %@", buf, 0x20u);

            v14 = v89;
          }

          objc_autoreleasePoolPop(v17);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v21);
          goto LABEL_46;
        }
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v8, "matterPayload");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v90 = v14;
      v91 = v16;
      if (v31)
      {
        if ((objc_msgSend(v9, "isEntitledForSPIAccess") & 1) == 0
          && (objc_msgSend(v9, "isEntitledToProvideMatterSetupPayload") & 1) == 0)
        {
          v52 = (void *)MEMORY[0x227676638]();
          v53 = self;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          v13 = v92;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = v14;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v108 = v56;
            _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Client provided a matter setup payload but is not entitled to do so", buf, 0xCu);

            v14 = v55;
          }

          objc_autoreleasePoolPop(v52);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, 0);
          v21 = v91;

          goto LABEL_46;
        }
        -[HMDAccessorySetupManager accessorySetupCoordinator](self, "accessorySetupCoordinator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "matterPayload");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = 0;
        objc_msgSend(v32, "createSetupAccessoryPayloadWithCHIPSetupPayload:error:", v33, &v105);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v105;

        v93 = (void *)v34;
        if (!v34 || v35)
        {
          v47 = (void *)MEMORY[0x227676638]();
          v48 = self;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          v13 = v92;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v108 = v50;
            v109 = 2112;
            v110 = v35;
            _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to create Setup Payload from input matter payload with error %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v47);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v51);

          v14 = v90;
          v21 = v91;
          goto LABEL_45;
        }
        v36 = objc_alloc(MEMORY[0x24BDD7998]);
        v16 = v91;
        objc_msgSend(v91, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v36;
        v39 = v93;
        v40 = objc_msgSend(v38, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v93, v99, v37, 0);

        v93 = (void *)v40;
        v14 = v90;
      }
      else
      {
        objc_msgSend(v8, "payload");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          if ((objc_msgSend(v9, "isEntitledForSPIAccess") & 1) == 0
            && (objc_msgSend(v9, "isEntitledToProvideAccessorySetupPayload") & 1) == 0)
          {
            v80 = (void *)MEMORY[0x227676638]();
            v81 = self;
            HMFGetOSLogHandle();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v83 = v14;
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v108 = v84;
              _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_ERROR, "%{public}@Client provided an accessory setup payload but is not entitled to do so", buf, 0xCu);

              v14 = v83;
            }

            objc_autoreleasePoolPop(v80);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, 0);
            v21 = v16;
            v13 = v92;

            goto LABEL_46;
          }
          v94 = objc_alloc(MEMORY[0x24BDD7998]);
          objc_msgSend(v8, "payload");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "internalSetupPayload");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uuid");
          v86 = v15;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "payload");
          v88 = v8;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "ownershipToken");
          v45 = v14;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)objc_msgSend(v94, "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v42, v99, v43, v46);

          v14 = v45;
          v8 = v88;

          v15 = v86;
        }
        else
        {
          v57 = objc_alloc(MEMORY[0x24BDD7998]);
          objc_msgSend(v16, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)objc_msgSend(v57, "initWithAppIdentifier:homeUUID:", v99, v39);
        }
      }

      objc_msgSend(v8, "suggestedRoomUniqueIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v16;
      v13 = v92;
      v87 = v58;
      if (v59 && v58)
      {
        objc_msgSend(v59, "roomWithUniqueIdentifier:forClientIdentifierSalt:", v58, v92);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v60)
        {
          v76 = (void *)MEMORY[0x227676638]();
          v77 = self;
          HMFGetOSLogHandle();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v108 = v79;
            v109 = 2112;
            v110 = v87;
            v111 = 2112;
            v112 = v92;
            _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_ERROR, "%{public}@Could not find room with unique identifier %@ for client identifier salt: %@", buf, 0x20u);

            v14 = v90;
          }

          objc_autoreleasePoolPop(v76);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v75);
          v21 = v91;
          v58 = v87;
          goto LABEL_44;
        }
        v61 = v60;
        objc_msgSend(v60, "uuid");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setSuggestedRoomUUID:", v62);

        v58 = v87;
      }
      objc_msgSend(v8, "suggestedAccessoryName");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v63;
      if (v63)
      {
        v64 = v63;
        v65 = objc_msgSend(v63, "length");
        if (v65 > HMMaxLengthForNaming())
        {
          v66 = (void *)MEMORY[0x227676638]();
          v67 = self;
          HMFGetOSLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v108 = v69;
            _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Suggested accessory name is longer than the maximum allowed length", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v66);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 46);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v70);
          goto LABEL_43;
        }
        objc_msgSend(v93, "setSuggestedAccessoryName:", v64);
      }
      -[HMDAccessorySetupManager _updateAccessoryDescription:usingConnection:](self, "_updateAccessoryDescription:usingConnection:", v93, v9);
      objc_msgSend(v15, "accessoryBrowser");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "chipAccessoryServerBrowser");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v91, "matterFabricID");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setPreWarmTargetToFabricWithID:isOwner:", v70, objc_msgSend(v91, "isOwnerUser"));
      -[HMDAccessorySetupManager _setupRequestBlockingPairedAccessoriesForHome:](self, "_setupRequestBlockingPairedAccessoriesForHome:", v91);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = __80__HMDAccessorySetupManager__launchHUISWithRequest_connection_completionHandler___block_invoke;
      v100[3] = &unk_24E774E78;
      v101 = v72;
      v102 = self;
      v104 = v10;
      v103 = v92;
      v74 = v72;
      v58 = v87;
      -[HMDAccessorySetupManager _launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:](self, "_launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:", v93, v73, 0, v100);

LABEL_43:
      v14 = v90;
      v21 = v91;
      v75 = v85;
LABEL_44:

LABEL_45:
LABEL_46:

      goto LABEL_48;
    }
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = v14;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v108 = v30;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@home manager is no longer available", buf, 0xCu);

      v14 = v29;
    }

    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, 0);

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v108 = v25;
      v109 = 2112;
      v110 = v14;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine client identifier salt for accessory setup client: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);
  }
LABEL_48:

}

- (id)_setupRequestBlockingPairedAccessoriesForHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  HMDAccessorySetupManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  id v41;
  uint64_t v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  v36 = v4;
  v37 = v3;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v3, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    v38 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      v39 = v9;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (objc_msgSend(v14, "supportsCHIP"))
        {
          v41 = v14;
          v42 = v11;
          objc_msgSend(v14, "chipStorage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pairings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v46 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                v23 = (void *)MEMORY[0x227676638]();
                v24 = self;
                HMFGetOSLogHandle();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "operationalIdentity");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v26;
                  v55 = 2112;
                  v56 = v27;
                  _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Adding Matter operational identity to device setup request blocking paired accessories: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v23);
                v28 = objc_alloc(MEMORY[0x24BDDB878]);
                objc_msgSend(v22, "operationalIdentity");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "rootPublicKey");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "operationalIdentity");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "nodeID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)objc_msgSend(v28, "initWithRootPublicKey:nodeID:", v30, v32);
                objc_msgSend(v44, "addObject:", v33);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            }
            while (v19);
          }

          v10 = v38;
          v9 = v39;
          v14 = v41;
          v11 = v42;
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v9);
  }

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB870]), "initWithEcosystemName:homeNames:blockedDevicePairings:", &stru_24E79DB48, v36, v44);
  return v34;
}

- (void)_updateAccessoryDescription:(id)a3 usingConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a4)
  {
    v5 = a4;
    v9 = a3;
    objc_msgSend(v5, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainBundleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAppBundleURL:", v7);

    objc_msgSend(v9, "setEntitledForHomeKitSPI:", objc_msgSend(v5, "isEntitledForSPIAccess"));
    objc_msgSend(v9, "setEntitledForThirdPartySetupAccessoryPayload:", objc_msgSend(v5, "isEntitledToProvideAccessorySetupPayload"));
    v8 = objc_msgSend(v5, "isEntitledToProvideMatterSetupPayload");

    objc_msgSend(v9, "setEntitledForThirdPartyMatterSetupPayload:", v8);
  }
}

- (void)_launchHUISWithSetupAccessoryDescription:(id)a3 deviceSetupRequest:(id)a4 resumeSetupUserInfo:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;
  HMDAccessorySetupManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v23;
  HMDAccessorySetupManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  HMDAccessorySetupManager *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDAccessorySetupManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  HMDAccessorySetupManager *v59;
  NSObject *v60;
  void *v61;
  int v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  double v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (!v10 && !v11 && !v12)
    _HMFPreconditionFailure();
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 138544130;
    v63 = v18;
    v64 = 2112;
    v65 = (uint64_t)v10;
    v66 = 2112;
    v67 = *(double *)&v11;
    v68 = 2112;
    v69 = v12;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with setupAccessoryDescription: %@ deviceSetupRequest: %@ resumeSetupUserInfo: %@", (uint8_t *)&v62, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v10, "setDoNetworkScan:", objc_msgSend(v11, "shouldScanNetworks"));
  -[HMDAccessorySetupManager alertHandle](v16, "alertHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isActive");

  -[HMDAccessorySetupManager alertHandle](v16, "alertHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isValid");

  if (v20)
  {
    v23 = MEMORY[0x227676638]();
    v24 = v16;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138543362;
      v63 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot launch HomeUIService because it is already active", (uint8_t *)&v62, 0xCu);

    }
    v27 = (void *)v23;
LABEL_10:
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v28);
    goto LABEL_31;
  }
  mach_absolute_time();
  v29 = UpTicksToSeconds();
  if (v22)
  {
    v30 = (double)(unint64_t)v29;
    v31 = -[HMDAccessorySetupManager activationStartTime](v16, "activationStartTime");
    v33 = v30 - v32;
    v34 = (void *)MEMORY[0x227676638](v31);
    v35 = v16;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v33 < 2.0)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySetupManager activationStartTime](v35, "activationStartTime");
        v62 = 138544130;
        v63 = v38;
        v64 = 2048;
        v65 = 0x4000000000000000;
        v66 = 2048;
        v67 = v30;
        v68 = 2048;
        v69 = v39;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Not launching HomeUIService because a valid launch was attempted within the last %f seconds. Current time: %f, activationStartTime: %f", (uint8_t *)&v62, 0x2Au);

      }
      v27 = v34;
      goto LABEL_10;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupManager activationStartTime](v35, "activationStartTime");
      v42 = v41;
      -[HMDAccessorySetupManager alertHandle](v35, "alertHandle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138544386;
      v63 = v40;
      v64 = 2048;
      v65 = 0x4000000000000000;
      v66 = 2048;
      v67 = v30;
      v68 = 2048;
      v69 = v42;
      v70 = 2112;
      v71 = v43;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Alert is valid but not active and it has been more than %f seconds. Current time: %f, activationStartTime: %f. Invalidating remote alert: %@", (uint8_t *)&v62, 0x34u);

    }
    objc_autoreleasePoolPop(v34);
    -[HMDAccessorySetupManager alertHandle](v35, "alertHandle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "unregisterObserver:", v35);

    -[HMDAccessorySetupManager alertHandle](v35, "alertHandle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "invalidate");

    -[HMDAccessorySetupManager setAlertHandle:](v35, "setAlertHandle:", 0);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addEntriesFromDictionary:", v46);

  }
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addEntriesFromDictionary:", v47);

  }
  if (v12)
    objc_msgSend(v28, "addEntriesFromDictionary:", v12);
  -[HMDAccessorySetupManager alertHandleProvider](v16, "alertHandleProvider");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "createRemoteAlertHandleWithServiceName:viewControllerClassName:userInfo:", *MEMORY[0x24BDD6360], CFSTR("HSProximityCardHostViewController"), v28);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetupManager setAlertHandle:](v16, "setAlertHandle:", v49);

  -[HMDAccessorySetupManager alertHandle](v16, "alertHandle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "registerObserver:", v16);

  v51 = (void *)MEMORY[0x227676638]();
  v52 = v16;
  HMFGetOSLogHandle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySetupManager alertHandle](v52, "alertHandle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 138543618;
    v63 = v54;
    v64 = 2112;
    v65 = (uint64_t)v55;
    _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Activating remote alert: %@", (uint8_t *)&v62, 0x16u);

  }
  objc_autoreleasePoolPop(v51);
  -[HMDAccessorySetupManager alertHandle](v52, "alertHandle");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activate");

  mach_absolute_time();
  v57 = -[HMDAccessorySetupManager setActivationStartTime:](v52, "setActivationStartTime:", (double)(unint64_t)UpTicksToSeconds());
  if (v10)
  {
    v58 = (void *)MEMORY[0x227676638](v57);
    v59 = v52;
    HMFGetOSLogHandle();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 138543618;
      v63 = v61;
      v64 = 2112;
      v65 = (uint64_t)v10;
      _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating pending setup accessory description to %@", (uint8_t *)&v62, 0x16u);

    }
    objc_autoreleasePoolPop(v58);
    -[HMDAccessorySetupManager setPendingAccessorySetupCompletionHandler:](v59, "setPendingAccessorySetupCompletionHandler:", v13);
  }
LABEL_31:

}

- (void)_finishAccessorySetupWithSetupCompletedInfo:(id)a3 setupError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  HMDAccessorySetupManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySetupManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessorySetupManager pendingAccessorySetupCompletionHandler](self, "pendingAccessorySetupCompletionHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638](-[HMDAccessorySetupManager setPendingAccessorySetupCompletionHandler:](self, "setPendingAccessorySetupCompletionHandler:", 0));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupManager alertHandle](v11, "alertHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Invalidating remote alert: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessorySetupManager alertHandle](v11, "alertHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unregisterObserver:", v11);

    -[HMDAccessorySetupManager alertHandle](v11, "alertHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    -[HMDAccessorySetupManager setAlertHandle:](v11, "setAlertHandle:", 0);
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot finish accessory setup because no pending completion handler exists", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (id)_accessorySetupResultFromCompletedInfo:(id)a3 clientIdentifierSalt:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDD1880];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
  -[objc_class hm_deriveUUIDFromBaseUUID:identifierSalt:](v6, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addedAccessoryUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__HMDAccessorySetupManager__accessorySetupResultFromCompletedInfo_clientIdentifierSalt___block_invoke;
  v17[3] = &unk_24E774EA0;
  v18 = v5;
  v13 = v5;
  objc_msgSend(v12, "na_map:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7468]), "initWithHomeUniqueIdentifier:accessoryUniqueIdentifiers:", v11, v14);
  return v15;
}

- (void)_handlePerformAccessorySetupMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySetupManager *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDAccessorySetupManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessorySetupManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Performing accessory setup", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = *MEMORY[0x24BDD4F98];
  v31[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "proxyConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __64__HMDAccessorySetupManager__handlePerformAccessorySetupMessage___block_invoke;
      v25[3] = &unk_24E774EC8;
      v25[4] = v7;
      v26 = v4;
      -[HMDAccessorySetupManager _launchHUISWithRequest:connection:completionHandler:](v7, "_launchHUISWithRequest:connection:completionHandler:", v12, v14, v25);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v7;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v23;
        v29 = 2112;
        v30 = v4;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find proxy connection for message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v24);

      v14 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find request in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)_handleResumeAccessorySetupMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessorySetupManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "dictionaryForKey:", *MEMORY[0x24BDD4FA8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__HMDAccessorySetupManager__handleResumeAccessorySetupMessage___block_invoke;
    v13[3] = &unk_24E774EF0;
    v14 = v4;
    -[HMDAccessorySetupManager _launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:](self, "_launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:", 0, 0, v6, v13);
    v7 = v14;
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
      objc_msgSend(v4, "messagePayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find resume accessory setup user info in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v7);
  }

}

- (void)_handleFinishAccessorySetupMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessorySetupManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *MEMORY[0x24BDD4F88];
  v17[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Finishing accessory setup with accessorySetupCompletedInfo: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:setupError:](v10, "_finishAccessorySetupWithSetupCompletedInfo:setupError:", v8, 0);
  objc_msgSend(v4, "respondWithSuccess");

}

- (void)_handleFailAccessorySetupMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessorySetupManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "errorForKey:", *MEMORY[0x24BDD4F90]);
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
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failing accessory setup with setupError: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySetupManager _finishAccessorySetupWithSetupCompletedInfo:setupError:](v8, "_finishAccessorySetupWithSetupCompletedInfo:setupError:", 0, v6);
    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find setup error in message payload: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);

  }
}

- (void)handleNFCProxSetupNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySetupManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDAccessorySetupManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessorySetupManager *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE1B730]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD7450], "setupPayloadURLFromSetupPayloadURLString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[HMDAccessorySetupManager workQueue](v6, "workQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __59__HMDAccessorySetupManager_handleNFCProxSetupNotification___block_invoke;
      v23[3] = &unk_24E79C268;
      v23[4] = v6;
      v24 = v13;
      dispatch_async(v14, v23);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert URL string to URL: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v6;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Prox setup notification did not have expected URL string", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessorySetupManager *v9;

  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccessorySetupManager_remoteAlertHandleDidActivate___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessorySetupManager *v9;

  v4 = a3;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDAccessorySetupManager_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDAccessorySetupManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDAccessorySetupManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDAccessorySetupManager_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x24BDD7458], "UUID");
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessorySetupHostClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySetupHostClientConnection, a3);
}

- (HMDAccessorySetupCoordinator)accessorySetupCoordinator
{
  return self->_accessorySetupCoordinator;
}

- (void)setAccessorySetupCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySetupCoordinator, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDXPCMessageTransport)xpcMessageTransport
{
  return (HMDXPCMessageTransport *)objc_getProperty(self, a2, 56, 1);
}

- (HMDSBSRemoteAlertHandleProvider)alertHandleProvider
{
  return (HMDSBSRemoteAlertHandleProvider *)objc_getProperty(self, a2, 64, 1);
}

- (id)pendingAccessorySetupCompletionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPendingAccessorySetupCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (HMDSBSRemoteAlertHandle)alertHandle
{
  return (HMDSBSRemoteAlertHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlertHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (double)activationStartTime
{
  return self->_activationStartTime;
}

- (void)setActivationStartTime:(double)a3
{
  self->_activationStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong(&self->_pendingAccessorySetupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_alertHandleProvider, 0);
  objc_storeStrong((id *)&self->_xpcMessageTransport, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessorySetupCoordinator, 0);
  objc_storeStrong((id *)&self->_accessorySetupHostClientConnection, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

void __69__HMDAccessorySetupManager_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v2 == v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 48);
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Alert handle %@ did invalidate: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "pendingAccessorySetupCompletionHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_finishAccessorySetupWithSetupCompletedInfo:setupError:", 0, v16);

    }
    objc_msgSend(*(id *)(a1 + 40), "setAlertHandle:", 0);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 48);
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Received alert handle did invalidate for unexpected handle %@: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __59__HMDAccessorySetupManager_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Alert handle %@ did deactivate. This can happen when screen is turned off by user", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "pendingAccessorySetupCompletionHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_finishAccessorySetupWithSetupCompletedInfo:setupError:", 0, v14);

    }
    objc_msgSend(*(id *)(a1 + 40), "alertHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    objc_msgSend(*(id *)(a1 + 40), "setAlertHandle:", 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received alert handle did deactivate for unexpected handle %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __57__HMDAccessorySetupManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "alertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v13;
      v10 = "%{public}@Alert handle %@ did activate";
      v11 = v7;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_6;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v10 = "%{public}@Received alert handle did activate for unexpected handle %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
LABEL_6:
    _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

uint64_t __59__HMDAccessorySetupManager_handleNFCProxSetupNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchHUISWithNFCProxSetupURL:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__HMDAccessorySetupManager__handleResumeAccessorySetupMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithSuccess");
  else
    return objc_msgSend(v2, "respondWithError:");
}

void __64__HMDAccessorySetupManager__handlePerformAccessorySetupMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v13 = *MEMORY[0x24BDD4FA0];
    encodeRootObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v8, v13);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

id __88__HMDAccessorySetupManager__accessorySetupResultFromCompletedInfo_clientIdentifierSalt___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(MEMORY[0x24BDD1880], "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __80__HMDAccessorySetupManager__launchHUISWithRequest_connection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "clearPreWarmTarget");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_accessorySetupResultFromCompletedInfo:clientIdentifierSalt:", v5, *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638](v7);
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __59__HMDAccessorySetupManager__launchHUISWithNFCProxSetupURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully set up accessories with NFC prox setup completed info: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to set up accessories with NFC prox: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

void __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void (**v26)(id, void *);
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void (**v32)(id, id);
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "accessorySetupCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[5], "accessorySetupCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentBundleIdentifier:", v4);

  }
  objc_msgSend(a1[6], "setupPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD7998]), "initWithAppIdentifier:homeUUID:", v4, 0);
    goto LABEL_9;
  }
  if ((objc_msgSend(a1[4], "hasPrivateHomeKitEntitlement") & 1) != 0
    || (objc_msgSend(a1[4], "hasMatterSetupPayloadEntitlement") & 1) != 0)
  {
    objc_msgSend(a1[5], "accessorySetupCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setupPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v8, "createSetupAccessoryPayloadWithCHIPSetupPayload:error:", v9, &v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v37;

    if (v10)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD7998]), "initWithSetupAccessoryPayload:appID:homeUUID:ownershipToken:", v10, v4, 0, 0);

      v11 = (id)v12;
LABEL_9:
      objc_msgSend(a1[4], "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mainBundleURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAppBundleURL:", v15);

      objc_msgSend(v11, "setEntitledForHomeKitSPI:", objc_msgSend(a1[4], "hasPrivateHomeKitEntitlement"));
      objc_msgSend(v11, "setEntitledForThirdPartyMatterSetupPayload:", objc_msgSend(a1[4], "hasMatterSetupPayloadEntitlement"));
      objc_msgSend(v11, "setSetupInitiatedByOtherMatterEcosystem:", 1);
      objc_msgSend(v11, "setDoNetworkScan:", objc_msgSend(a1[6], "shouldScanNetworks"));
      objc_msgSend(a1[5], "homeManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessoryBrowser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "chipAccessoryServerBrowser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setPreWarmTargetToSystemCommissionerFabric");
      v19 = a1[5];
      v20 = a1[6];
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke_39;
      v33[3] = &unk_24E774E28;
      v34 = v18;
      v35 = v19;
      v36 = a1[7];
      v21 = v18;
      objc_msgSend(v19, "_launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:", v11, v20, 0, v33);

      goto LABEL_16;
    }
    v22 = (void *)MEMORY[0x227676638]();
    v23 = a1[5];
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v25;
      v40 = 2112;
      v41 = v11;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup accessory payload from input  %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v26 = (void (**)(id, void *))a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2](v26, v27);

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = a1[5];
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Client provided a Matter setup payload but is not entitled to do so", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    v32 = (void (**)(id, id))a1[7];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v32[2](v32, v11);
  }
LABEL_16:

}

void __120__HMDAccessorySetupManager_launchAccessorySetupHostToPerformMatterDeviceSetupWithRequest_clientProxy_completionHandler___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clearPreWarmTarget");
  objc_msgSend(*(id *)(a1 + 40), "accessorySetupCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopMetricsForThirdPartyPairingWithError:", v6);

  if (v5)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v8();

}

void __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService to request setup code for accessoryUUID: %@ accessoryName: %@ homeUUID: %@ clientConnection: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  v10 = objc_alloc(MEMORY[0x24BDD7998]);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 64), "applicationBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithAccessoryUUID:accessoryName:appID:homeUUID:", v11, v12, v13, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryDescription:usingConnection:", v14, *(_QWORD *)(a1 + 64));
  v15 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke_35;
  v16[3] = &unk_24E774E00;
  v17 = *(id *)(a1 + 72);
  objc_msgSend(v15, "_launchHUISWithSetupAccessoryDescription:deviceSetupRequest:resumeSetupUserInfo:completionHandler:", v14, 0, 0, v16);

}

uint64_t __149__HMDAccessorySetupManager_launchAccessorySetupHostToRequestSetupCodeForAccessoryWithUUID_accessoryName_homeUUID_clientConnection_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__HMDAccessorySetupManager_accessorySetupHostClientConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "applicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessorySetupHostBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (NSString)accessorySetupHostBundleIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BDD6360];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t48 != -1)
    dispatch_once(&logCategory__hmf_once_t48, &__block_literal_global_7627);
  return (id)logCategory__hmf_once_v49;
}

void __39__HMDAccessorySetupManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v49;
  logCategory__hmf_once_v49 = v0;

}

@end
