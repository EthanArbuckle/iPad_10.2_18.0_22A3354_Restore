@implementation HMDAccessorySettingsMessageHandlerRoar

- (void)relayUpdateValue:(id)a3 keyPath:(id)a4 destination:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDRemoteDeviceMessageDestination *v18;
  void *v19;
  void *v20;
  HMDRemoteDeviceMessageDestination *v21;
  void *v22;
  void *v23;
  HMDAccessorySettingsMessageHandlerRoar *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessorySettingsMessageHandlerRoar *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32 = v11;
  v33 = a6;
  if (v12)
  {
    v13 = *MEMORY[0x24BDD6CD0];
    v43[0] = v11;
    v14 = *MEMORY[0x24BDD4E90];
    v42[0] = v13;
    v42[1] = v14;
    v15 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    encodeRootObject();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    v18 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAccessorySettingsMessageHandler messageTargetUUID](self, "messageTargetUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v18, "initWithTarget:device:", v19, v20);

    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", *MEMORY[0x24BDD4E80], 25, v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke;
    v34[3] = &unk_24E79AFA0;
    objc_copyWeak(&v36, &location);
    v35 = v33;
    v23 = (void *)MEMORY[0x227676638](objc_msgSend(v22, "setResponseHandler:", v34));
    v24 = self;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      v40 = 2112;
      v41 = v22;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Relaying key path targeted update value message. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDAccessorySettingsMessageHandler messageDispatcher](v24, "messageDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sendMessage:completionHandler:", v22, 0);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v33 + 2))(v33, 0, 0, v17);
  }

}

- (void)relayReplaceConstraints:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 destination:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  void *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  void *v21;
  HMDAccessorySettingsMessageHandlerRoar *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAccessorySettingsMessageHandlerRoar *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v33 = a4;
  v34 = a5;
  v13 = a6;
  v14 = a7;
  v32 = v12;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD7AD0], "_encodedConstraintsToAdd:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "na_map:", &__block_literal_global_115144);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD7AD0], "_replaceConstraintsPayloadWithAdditions:removals:keyPath:", v15, v31, v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDAccessorySettingsMessageHandler messageTargetUUID](self, "messageTargetUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v16, "initWithTarget:device:", v17, v18);

    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", *MEMORY[0x24BDD4E58], 25, v19, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2;
    v35[3] = &unk_24E79AFA0;
    objc_copyWeak(&v37, &location);
    v36 = v14;
    v21 = (void *)MEMORY[0x227676638](objc_msgSend(v20, "setResponseHandler:", v35));
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Relaying key path targeted replace constraints message. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    -[HMDAccessorySettingsMessageHandler messageDispatcher](v22, "messageDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sendMessage:completionHandler:", v20, 0);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot send setting message as device is not known", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v15);
  }

}

void __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3;
    v7[3] = &unk_24E79C2B8;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __119__HMDAccessorySettingsMessageHandlerRoar_relayReplaceConstraints_constraintIdsToRemove_keyPath_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke_2;
    block[3] = &unk_24E79B440;
    block[4] = v6;
    v9 = v4;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
}

void __90__HMDAccessorySettingsMessageHandlerRoar_relayUpdateValue_keyPath_destination_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  v4 = objc_msgSend(v2, "_decodeUpdateValueMessagePayload:outValue:", v3, &v14);
  v5 = v14;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", CFSTR("cv"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v6 + 16))(v6, v5, objc_msgSend(v7, "unsignedIntegerValue"), 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode response %@ of relayed key path targeted update value message.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v7);
  }

}

@end
