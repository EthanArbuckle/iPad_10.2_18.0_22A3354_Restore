@implementation HMDMediaDestinationMessageHandler

- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  return -[HMDMediaDestinationMessageHandler initWithDestination:messageDispatcher:notificationCenter:notifications:dataSource:delegate:](self, "initWithDestination:messageDispatcher:notificationCenter:notifications:dataSource:delegate:", a3, a4, a5, MEMORY[0x24BDBD1A8], a6, a7);
}

- (HMDMediaDestinationMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 notifications:(id)a6 dataSource:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDMediaDestinationMessageHandler *v24;
  objc_super v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
LABEL_11:
    _HMFPreconditionFailure();
  }
  if (!v17)
    goto LABEL_11;
  v20 = v19;
  v28[0] = *MEMORY[0x24BDD6618];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BDD6620];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HMDMediaDestinationMessageHandler;
  v24 = -[HMDAppleMediaAccessoryMessageHandler initWithMessageTargetUUID:messageDispatcher:notificationCenter:ownerPrivateRemoteMessages:adminPrivateRemoteMessages:internalMessages:notifications:notificationsToObject:](&v26, sel_initWithMessageTargetUUID_messageDispatcher_notificationCenter_ownerPrivateRemoteMessages_adminPrivateRemoteMessages_internalMessages_notifications_notificationsToObject_, v23, v15, v16, MEMORY[0x24BDBD1A8], v21, v22, v17, MEMORY[0x24BDBD1B8]);

  if (v24)
  {
    -[HMDMediaDestinationMessageHandler setDataSource:](v24, "setDataSource:", v18);
    -[HMDMediaDestinationMessageHandler setDelegate:](v24, "setDelegate:", v20);
  }

  return v24;
}

- (void)sendRequestToUpdateAudioGroupIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaDestinationMessageHandler *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HMDMediaDestinationMessageHandler *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMDMediaDestinationMessageHandler *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v11;
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v7)
  {
    v32 = *MEMORY[0x24BDD65C0];
    objc_msgSend(v6, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = *MEMORY[0x24BDD65F8];
    if (v12)
      v14 = v12;
    v33 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDMessageHandler messageTargetUUID](v9, "messageTargetUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

    v19 = objc_alloc(MEMORY[0x24BE3F1D0]);
    v20 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", *MEMORY[0x24BDD6618], v18, v15);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __88__HMDMediaDestinationMessageHandler_sendRequestToUpdateAudioGroupIdentifier_completion___block_invoke;
    v29 = &unk_24E7961A0;
    v30 = v9;
    v31 = v7;
    objc_msgSend(v20, "setResponseHandler:", &v26);
    v21 = (void *)objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    -[HMDMessageHandler routeMessage:](v9, "routeMessage:", v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v9;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to set completion to update support options", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (void)sendRequestToUpdateSupportOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMDMediaDestinationMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMediaDestinationMessageHandler *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  HMDMediaDestinationMessageHandler *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMMediaDestinationSupportOptionsAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending request to update destination support options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v30 = *MEMORY[0x24BDD6608];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDMessageHandler messageTargetUUID](v8, "messageTargetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);

    v17 = objc_alloc(MEMORY[0x24BE3F1D0]);
    v18 = (void *)objc_msgSend(v17, "initWithName:destination:payload:", *MEMORY[0x24BDD6620], v16, v13);
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __82__HMDMediaDestinationMessageHandler_sendRequestToUpdateSupportOptions_completion___block_invoke;
    v27 = &unk_24E7961A0;
    v28 = v8;
    v29 = v6;
    objc_msgSend(v18, "setResponseHandler:", &v24);
    v19 = (void *)objc_msgSend(v18, "copy", v24, v25, v26, v27, v28);
    -[HMDMessageHandler routeMessage:](v8, "routeMessage:", v19);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set completion to update support options", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)handleUpdatedDestination:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling updated destination: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMessageHandler notificationCenter](v6, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", *MEMORY[0x24BDD6628], v4);

}

- (id)audioGroupIdentifierInMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDMediaDestinationMessageHandler *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  HMDMediaDestinationMessageHandler *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x24BDD65C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD65F8]) & 1) != 0)
        goto LABEL_16;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
      if (v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        objc_autoreleasePoolPop(v12);
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
          v11 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
LABEL_16:
        v11 = 0;
        goto LABEL_17;
      }
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      v16 = "%{public}@Failed to parse audio group identifier from message payload: %@";
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v8;
      v16 = "%{public}@Failed to get audio group identifier from message payload: %@";
    }
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 0x16u);

    goto LABEL_14;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)supportedOptionsInMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  HMDMediaDestinationMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDMediaDestinationMessageHandler *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmf_numberForKey:", *MEMORY[0x24BDD6608]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supported options from message payload: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }

  }
  else if (a4)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)handleMediaDestinationUpdateAudioGroupIdentifierRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDMediaDestinationMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDMediaDestinationMessageHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDMediaDestinationMessageHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
    v29 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination audio group identifier request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v27 = 0;
    -[HMDMediaDestinationMessageHandler audioGroupIdentifierInMessage:error:](v6, "audioGroupIdentifierInMessage:error:", v4, &v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v27;
    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = v6;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2112;
        v31 = v4;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio group identifier from update audio group identifier request message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "respondWithError:", v11);
    }
    else
    {
      -[HMDMediaDestinationMessageHandler delegate](v6, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "mediaDestinationMessageHandler:didReceiveUpdateAudioGroupIdentifierRequestMessage:audioGroupIdentifier:", v6, v4, v10);
      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = v6;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v29 = v25;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to update audio group identifier due to no delegate", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v26);

      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination audio group identifier request message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (void)handleMediaDestinationUpdateSupportedOptionsRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  HMDMediaDestinationMessageHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDMediaDestinationMessageHandler *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDMediaDestinationMessageHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
    v30 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination supported options request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination supported options request message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v28 = 0;
  v10 = -[HMDMediaDestinationMessageHandler supportedOptionsInMessage:error:](v6, "supportedOptionsInMessage:error:", v4, &v28);
  v11 = v28;
  if (v11)
  {
    v12 = v11;
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supported options from update destination supported options request message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
LABEL_11:
    objc_msgSend(v4, "respondWithError:", v12);
    goto LABEL_18;
  }
  -[HMDMediaDestinationMessageHandler delegate](v6, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "mediaDestinationMessageHandler:didReceiveUpdateSupportedOptionsRequestMessage:supportOptions:", v6, v4, v10);
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to update supported options due to no delegate", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v27);

  }
  v12 = 0;
LABEL_18:

}

- (HMDMediaDestinationMessageHandlerDataSource)dataSource
{
  return (HMDMediaDestinationMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationMessageHandlerDelegate)delegate
{
  return (HMDMediaDestinationMessageHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __82__HMDMediaDestinationMessageHandler_sendRequestToUpdateSupportOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

void __88__HMDMediaDestinationMessageHandler_sendRequestToUpdateAudioGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void (*v11)(void);
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Update audio group identifier request message responded with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_169488 != -1)
    dispatch_once(&logCategory__hmf_once_t20_169488, &__block_literal_global_169489);
  return (id)logCategory__hmf_once_v21_169490;
}

void __48__HMDMediaDestinationMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21_169490;
  logCategory__hmf_once_v21_169490 = v0;

}

@end
