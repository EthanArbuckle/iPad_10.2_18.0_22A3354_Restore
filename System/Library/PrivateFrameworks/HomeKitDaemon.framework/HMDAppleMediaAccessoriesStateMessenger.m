@implementation HMDAppleMediaAccessoriesStateMessenger

- (HMDAppleMediaAccessoriesStateMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDAppleMediaAccessoriesStateMessenger *v10;
  HMDAppleMediaAccessoriesStateMessenger *v11;
  HMDAppleMediaAccessoriesStateMessenger *result;
  HMDAppleMediaAccessoriesStateMessenger *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMDAppleMediaAccessoriesStateMessenger *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoriesStateMessenger registerForMessagesWithHome:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessoriesStateMessenger;
  v10 = -[HMDAppleMediaAccessoriesStateMessenger init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoriesStateMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoriesStateMessenger messageDispatcher](v6, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload messageName](HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload, "messageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, v6, v14, sel_handleAppleMediaAccessoryModelIdentifierRequestMessage_);

}

- (void)sendModelIdentifierRequestMessageToAppleMediaAccessory:(id)a3 withAccessoryIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAppleMediaAccessoriesStateMessenger *v12;
  NSObject *v13;
  void *v14;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending model identifier request message to apple media accessory: %@ accessory identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload initWithAccessoryIdentifier:]([HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload alloc], "initWithAccessoryIdentifier:", v9);
  +[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload messageName](HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload, "messageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload payloadCopy](v15, "payloadCopy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoriesStateMessenger relayMessageName:payload:toAppleMediaAccessory:](v12, "relayMessageName:payload:toAppleMediaAccessory:", v16, v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke;
  v26[3] = &unk_24E79B3A0;
  v26[4] = v12;
  v20 = v10;
  v27 = v20;
  v21 = (id)objc_msgSend(v18, "addFailureBlock:", v26);
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke_12;
  v24[3] = &unk_24E7923E0;
  v24[4] = v12;
  v25 = v20;
  v22 = v20;
  v23 = (id)objc_msgSend(v18, "addSuccessBlock:", v24);

}

- (id)relayMessageName:(id)a3 payload:(id)a4 toAppleMediaAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDRemoteDeviceMessageDestination *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessoriesStateMessenger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAppleMediaAccessoriesStateMessenger *v23;
  NSObject *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_msgSend(v10, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAppleMediaAccessoriesStateMessenger messageTargetUUID](self, "messageTargetUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v13, "initWithTarget:device:", v14, v12);

    v27 = v8;
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v8, -1, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __89__HMDAppleMediaAccessoriesStateMessenger_relayMessageName_payload_toAppleMediaAccessory___block_invoke;
    v28[3] = &unk_24E79B7E0;
    v29 = v11;
    v17 = (void *)MEMORY[0x227676638](objc_msgSend(v16, "setResponseHandler:", v28));
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v20;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Relaying message: %@ to accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDAppleMediaAccessoriesStateMessenger messageDispatcher](v18, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:", v16);

    v8 = v27;
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v25;
      v32 = 2112;
      v33 = v8;
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to get device to relay message name: %@ payload: %@ to apple media accessory: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
    v15 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v15);
  }

  return v11;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoriesStateMessenger identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("8218CC5D-C283-4FE6-9E57-848EF1092455"));
  v4 = (void *)MEMORY[0x24BDD1880];
  -[HMDAppleMediaAccessoriesStateMessenger identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v8;
}

- (void)handleAppleMediaAccessoryModelIdentifierRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoriesStateMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAppleMediaAccessoriesStateMessenger *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDAppleMediaAccessoriesStateMessenger *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAppleMediaAccessoriesStateMessenger *v22;
  NSObject *v23;
  void *v24;
  int v25;
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
    v25 = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling apple media accessory model identifier request message: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload initWithPayload:]([HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload alloc], "initWithPayload:", v9);
    if (v10)
    {
      -[HMDAppleMediaAccessoriesStateMessenger delegate](v6, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload accessoryIdentifier](v10, "accessoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appleMediaAccessoriesStateMessenger:didReceiveModelIdentifierRequestMessage:withAccessoryIdentifier:", v6, v4, v12);
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v6;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify delegate of model identifier request message due to no delegate", (uint8_t *)&v25, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v12);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v20;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get model identifier request payload from payload: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message payload from model identifier request message: %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v10 = (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (HMDAppleMediaAccessoriesStateMessengerDelegate)delegate
{
  return (HMDAppleMediaAccessoriesStateMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __89__HMDAppleMediaAccessoriesStateMessenger_relayMessageName_payload_toAppleMediaAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }
  else
  {
    v6 = (uint64_t)v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v6;
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }

}

void __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Relay model identifier request payload completed with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __132__HMDAppleMediaAccessoriesStateMessenger_sendModelIdentifierRequestMessageToAppleMediaAccessory_withAccessoryIdentifier_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *v8;
  HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v7;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Relay model identifier request payload completed with response payload: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload initWithPayload:]([HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload alloc], "initWithPayload:", v3);
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 40);
    -[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload modelIdentifier](v8, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode model identifier response payload: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v11, 0);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_208586 != -1)
    dispatch_once(&logCategory__hmf_once_t7_208586, &__block_literal_global_208587);
  return (id)logCategory__hmf_once_v8_208588;
}

void __53__HMDAppleMediaAccessoriesStateMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_208588;
  logCategory__hmf_once_v8_208588 = v0;

}

@end
