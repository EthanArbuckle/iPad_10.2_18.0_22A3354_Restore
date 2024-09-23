@implementation HMDUserCloudShareManager

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserCloudShareManager *v9;

  v4 = a3;
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserCloudShareManager_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMDUserCloudShareManager)initWithHomeManager:(id)a3
{
  id v4;
  HMDUserCloudShareManagerCreatorDependency *v5;
  HMDUserCloudShareManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDUserCloudShareManagerCreatorDependency);
  v6 = -[HMDUserCloudShareManager initWithHomeManager:dependency:](self, "initWithHomeManager:dependency:", v4, v5);

  return v6;
}

- (HMDUserCloudShareManager)initWithHomeManager:(id)a3 dependency:(id)a4
{
  id v6;
  id v7;
  HMDUserCloudShareManager *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *clientQueue;
  id v14;
  uint64_t v15;
  NSUUID *identifier;
  uint64_t v17;
  HMDUserCloudShareController *userCloudShareController;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserCloudShareManager;
  v8 = -[HMDUserCloudShareManager init](&v20, sel_init);
  if (v8)
  {
    HMDispatchQueueNameString();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc(MEMORY[0x24BDD1880]);
    v15 = objc_msgSend(v14, "initWithUUIDString:", *MEMORY[0x24BDD7088]);
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v15;

    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_msgSend(v7, "createUserCloudShareControllerWithDelegate:queue:", v8, v8->_clientQueue);
    v17 = objc_claimAutoreleasedReturnValue();
    userCloudShareController = v8->_userCloudShareController;
    v8->_userCloudShareController = (HMDUserCloudShareController *)v17;

  }
  return v8;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserCloudShareManager_configureWithMessageDispatcher___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerForMessages
{
  NSObject *v3;
  void *v4;
  HMDUserCloudShareManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for user share messages.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDUserCloudShareManager messageDispatcher](v5, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDD7078];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 517);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", v9, v5, v11, sel__handleRegisterRequest_);

}

- (void)userCloudShareController:(id)a3 sendShareRequestMessageWithConnection:(id)a4 fromUser:(id)a5 toUser:(id)a6 home:(id)a7 shareURL:(id)a8 shareToken:(id)a9 containerID:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[6];
  _QWORD v51[8];

  v51[6] = *MEMORY[0x24BDAC8D0];
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  if (v17)
  {
    v50[0] = *MEMORY[0x24BDD71C0];
    v20 = a7;
    v21 = a5;
    v22 = a4;
    encodeRootObjectForIncomingXPCMessage(a6, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v23;
    v50[1] = *MEMORY[0x24BDD7188];
    encodeRootObjectForIncomingXPCMessage(v21, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v51[1] = v24;
    v50[2] = *MEMORY[0x24BDD7190];
    encodeRootObjectForIncomingXPCMessage(v20, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *MEMORY[0x24BDD71D0];
    v51[2] = v25;
    v51[3] = v16;
    v27 = *MEMORY[0x24BDD71C8];
    v50[3] = v26;
    v50[4] = v27;
    v50[5] = *MEMORY[0x24BDD7180];
    v51[4] = v17;
    v51[5] = v18;
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = v51;
    v30 = v50;
    v31 = 6;
  }
  else
  {
    v48[0] = *MEMORY[0x24BDD71C0];
    v32 = a7;
    v33 = a5;
    v34 = a4;
    encodeRootObjectForIncomingXPCMessage(a6, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v23;
    v48[1] = *MEMORY[0x24BDD7188];
    encodeRootObjectForIncomingXPCMessage(v33, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v49[1] = v24;
    v48[2] = *MEMORY[0x24BDD7190];
    encodeRootObjectForIncomingXPCMessage(v32, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = *MEMORY[0x24BDD71D0];
    v49[2] = v25;
    v49[3] = v16;
    v36 = *MEMORY[0x24BDD7180];
    v48[3] = v35;
    v48[4] = v36;
    v49[4] = v18;
    v28 = (void *)MEMORY[0x24BDBCE70];
    v29 = v49;
    v30 = v48;
    v31 = 5;
  }
  objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x24BE3F1B0];
  v39 = MEMORY[0x24BDAC760];
  v40 = *MEMORY[0x24BDD7070];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke;
  v46[3] = &unk_24E7961A0;
  v46[4] = self;
  v41 = v19;
  v47 = v41;
  objc_msgSend(v38, "messageWithName:messagePayload:responseHandler:", v40, v37, v46);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v39;
  v44[1] = 3221225472;
  v44[2] = __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke_41;
  v44[3] = &unk_24E79B3A0;
  v44[4] = self;
  v45 = v41;
  v43 = v41;
  objc_msgSend(a4, "sendMessage:completionHandler:", v42, v44);

}

- (void)userCloudShareController:(id)a3 sendRepairInfo:(id)a4 toConnection:(id)a5 home:(id)a6 containerID:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD7180];
  v26[0] = a7;
  v12 = *MEMORY[0x24BDD71B0];
  v25[0] = v11;
  v25[1] = v12;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  encodeRootObjectForIncomingXPCMessage(a4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v16;
  v25[2] = *MEMORY[0x24BDD7198];
  objc_msgSend(v14, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v26[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x24BE3F1B8]);
  v20 = objc_alloc(MEMORY[0x24BDD1880]);
  v21 = (void *)objc_msgSend(v20, "initWithUUIDString:", *MEMORY[0x24BDD7088]);
  v22 = (void *)objc_msgSend(v19, "initWithTarget:", v21);

  objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:destination:payload:", *MEMORY[0x24BDD7068], v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __98__HMDUserCloudShareManager_userCloudShareController_sendRepairInfo_toConnection_home_containerID___block_invoke;
  v24[3] = &unk_24E79BD80;
  v24[4] = self;
  objc_msgSend(v15, "sendMessage:completionHandler:", v23, v24);

}

- (void)userCloudShareController:(id)a3 wakeClientWithContainerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDUserCloudShareManager *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%@"), *MEMORY[0x24BDD7090], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = objc_retainAutorelease(v8);
  notify_post((const char *)objc_msgSend(v13, "UTF8String"));

}

- (void)userCloudShareController:(id)a3 wakeClientForRepairWithContainerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDUserCloudShareManager *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%@"), *MEMORY[0x24BDD7080], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client to repair share %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = objc_retainAutorelease(v8);
  notify_post((const char *)objc_msgSend(v13, "UTF8String"));

}

- (id)userCloudShareController:(id)a3 timerWithInterval:(double)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a4);
}

- (id)currentDateForUserCloudShareController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
}

- (void)handleHomeChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareManager clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDUserCloudShareManager_handleHomeChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUsersChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareManager clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDUserCloudShareManager_handleUsersChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleAccessoryAdded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserCloudShareManager *v9;

  v4 = a3;
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUserCloudShareManager__handleAccessoryAdded___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_postMultiUserStatusChangedNotification
{
  notify_post((const char *)*MEMORY[0x24BDD7098]);
}

- (void)_handleEnableMultiUserChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareManager clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDUserCloudShareManager__handleEnableMultiUserChangedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleUserSettingsUpdatedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareManager clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDUserCloudShareManager__handleUserSettingsUpdatedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleLocalHomeDataRemovedNotification:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserCloudShareManager clientQueue](self, "clientQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDUserCloudShareManager__handleLocalHomeDataRemovedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleRegisterRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDUserCloudShareManager *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDUserCloudShareManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDUserCloudShareManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "transport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Found xpc connection in message", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7060]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[HMDUserCloudShareManager userCloudShareController](v10, "userCloudShareController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "registerWithXpcClient:containerIDs:", v8, v14);

        v16 = 0;
      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v10;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "applicationBundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v25;
          v31 = 2112;
          v32 = v26;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing container IDs while trying to register from process %@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Container IDs required"), CFSTR("No containerIDs specified"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v21;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Transport is not XPC connection.", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Transport is not XPC"), CFSTR("Need xpc connection"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

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
      v29 = 138543362;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@No transport on message.", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Did not find transport"), CFSTR("Need xpc connection"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "responseHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v4, "responseHandler");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v28)[2](v28, v16, 0);

  }
}

- (void)handleRemoteUserClientCloudShareRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserCloudShareManager *v9;

  v4 = a3;
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleRemoteUserClientCloudShareRepairRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDUserCloudShareManager *v9;

  v4 = a3;
  -[HMDUserCloudShareManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleDeregisterRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v11 = a3;
  objc_msgSend(v11, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v11, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      -[HMDUserCloudShareManager userCloudShareController](self, "userCloudShareController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deregisterXpcClient:", v7);

    }
  }
  objc_msgSend(v11, "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "responseHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, 0);

  }
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDUserCloudShareManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (HMDUserCloudShareController)userCloudShareController
{
  return self->_userCloudShareController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCloudShareController, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __59__HMDUserCloudShareManager_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "userCloudShareController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateXpcClient:", v4);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Received connection invalidated notification, but no connection object was found: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuidForKey:", *MEMORY[0x24BDD7190]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_homeWithUUID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Handling share repair message %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "userCloudShareController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messagePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke_66;
    v16[3] = &unk_24E79BD80;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v11, "handleShareRepairForRemoteClientRequest:home:completion:", v12, v4, v16);

    v13 = v17;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not find home for share repair request on remote.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Home in share repair request not found in remote."), CFSTR("Home is needed for share repair"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "respondWithError:", v13);
  }

}

void __74__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRepairRequest___block_invoke_66(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

void __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuidForKey:", *MEMORY[0x24BDD7190]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_homeWithUUID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "userCloudShareController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messagePayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke_2;
    v16[3] = &unk_24E793AC0;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    v18 = v8;
    objc_msgSend(v5, "handleShareForRemoteClientRequest:home:completionHandler:", v6, v4, v16);

    v9 = v17;
LABEL_7:

    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not find home for share request on remote.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Home in share request not found in remote."), CFSTR("Home is needed to share"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v15, 0);

    goto LABEL_7;
  }
LABEL_8:

}

void __68__HMDUserCloudShareManager_handleRemoteUserClientCloudShareRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v5)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Forwarding received client info.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v14 = *MEMORY[0x24BDD7170];
      v15 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v13)[2](v13, v6, v12);

  }
}

uint64_t __68__HMDUserCloudShareManager__handleLocalHomeDataRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Local home data removed, notifying clients", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postMultiUserStatusChangedNotification");
}

uint64_t __67__HMDUserCloudShareManager__handleUserSettingsUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@User settings updated, notifying clients.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postMultiUserStatusChangedNotification");
}

uint64_t __70__HMDUserCloudShareManager__handleEnableMultiUserChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Enable Multi-User changed, notifying clients.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postMultiUserStatusChangedNotification");
}

void __50__HMDUserCloudShareManager__handleAccessoryAdded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on adding accessory %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "_postMultiUserStatusChangedNotification");
  }

}

uint64_t __59__HMDUserCloudShareManager_handleUsersChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on users changed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postMultiUserStatusChangedNotification");
}

uint64_t __58__HMDUserCloudShareManager_handleHomeChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting notification to wake client on home change", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_postMultiUserStatusChangedNotification");
}

void __98__HMDUserCloudShareManager_userCloudShareController_sendRepairInfo_toConnection_home_containerID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message to client.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Got error from client %@.", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD7058]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@No error but client did not accept share, treating as error.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Client failed to accept share"), CFSTR("Did not accept share"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v7, "hmf_dataForKey:", *MEMORY[0x24BDD7050]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __155__HMDUserCloudShareManager_userCloudShareController_sendShareRequestMessageWithConnection_fromUser_toUser_home_shareURL_shareToken_containerID_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message to client.", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__HMDUserCloudShareManager_configureWithMessageDispatcher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMessageDispatcher:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "registerForMessages");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleHomeChangedNotification_, CFSTR("HMDHomeAddedNotification"), v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleHomeChangedNotification_, CFSTR("HMDHomeRemovedNotification"), v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleXPCConnectionInvalidated_, CFSTR("HMDXPCClientConnectionInvalidatedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleAccessoryAdded_, CFSTR("HMDNotificationHomeAddedAccessory"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleEnableMultiUserChangedNotification_, *MEMORY[0x24BDD61E0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleUserSettingsUpdatedNotification_, CFSTR("HMDUserSettingsUpdatedNotificationKey"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleLocalHomeDataRemovedNotification_, CFSTR("HMDHomeManagerLocalHomeDataRemovedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleUsersChangedNotification_, CFSTR("HMDHomeUserRemovedNotification"), 0);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1)
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_2891);
  return (id)logCategory__hmf_once_v27;
}

void __39__HMDUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27;
  logCategory__hmf_once_v27 = v0;

}

@end
