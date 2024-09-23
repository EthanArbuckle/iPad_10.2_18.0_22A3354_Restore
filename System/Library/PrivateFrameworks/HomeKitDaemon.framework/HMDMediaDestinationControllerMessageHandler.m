@implementation HMDMediaDestinationControllerMessageHandler

- (HMDMediaDestinationControllerMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 metricsEventDispatcher:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDMediaDestinationControllerMessageHandler *v24;
  HMDMediaDestinationControllerMessageHandler *v25;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[8];

  v10 = a7;
  v29[7] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v17)
    goto LABEL_12;
  v21 = v20;
  if (v10)
  {
    v29[0] = *MEMORY[0x24BDD6628];
    v29[1] = CFSTR("HMDHomeAccessoryRemovedNotification");
    v29[2] = CFSTR("HMDMediaSystemAddedNotification");
    v29[3] = CFSTR("HMDMediaSystemRemovedNotification");
    v29[4] = CFSTR("HMDNotificationAccessoryChangedRoom");
    v29[5] = CFSTR("HMDMediaDestinationControllerUpdatedDestinationNotification");
    v29[6] = CFSTR("HMDMediaGroupsAggregateConsumerUpdatedAggregateDataNotification");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }
  v28 = *MEMORY[0x24BDD65D8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)HMDMediaDestinationControllerMessageHandler;
  v24 = -[HMDAppleMediaAccessoryMessageHandler initWithMessageTargetUUID:messageDispatcher:notificationCenter:ownerPrivateRemoteMessages:adminPrivateRemoteMessages:internalMessages:notifications:notificationsToObject:](&v27, sel_initWithMessageTargetUUID_messageDispatcher_notificationCenter_ownerPrivateRemoteMessages_adminPrivateRemoteMessages_internalMessages_notifications_notificationsToObject_, v15, v16, v17, MEMORY[0x24BDBD1A8], v23, MEMORY[0x24BDBD1A8], v22, MEMORY[0x24BDBD1B8]);
  v25 = v24;
  if (v24)
  {
    objc_storeWeak((id *)&v24->_dataSource, v19);
    objc_storeWeak((id *)&v25->_delegate, v21);
    objc_storeStrong((id *)&v25->_metricsEventDispatcher, a6);
  }

  return v25;
}

- (void)notifyUpdatedDestinationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying updated destination with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMessageHandler messageTargetUUID](v6, "messageTargetUUID", CFSTR("HMDMediaDestinationControllerIdentifierNotificationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("HMDMediaDestinationIdentifierNotificationKey");
  v15[0] = v9;
  v10 = v4;
  if (!v4)
  {
    v11 = objc_alloc(MEMORY[0x24BDD1880]);
    v10 = (void *)objc_msgSend(v11, "initWithUUIDString:", *MEMORY[0x24BDD65F8]);
  }
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  -[HMDMessageHandler notificationCenter](v6, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("HMDMediaDestinationControllerUpdatedDestinationNotification"), v6, v12);

}

- (id)destinationIdentifierInMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDMediaDestinationControllerMessageHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDMediaDestinationControllerMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDMediaDestinationControllerMessageHandler *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x24BDD65F0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD65F8]) & 1) == 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
        v12 = v11;
        if (v11)
        {
          v13 = v11;
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
            v27 = 138543874;
            v28 = v25;
            v29 = 2112;
            v30 = v10;
            v31 = 2112;
            v32 = v6;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse destination identifier: %@ message: %@", (uint8_t *)&v27, 0x20u);

          }
          objc_autoreleasePoolPop(v22);
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
        }

        goto LABEL_21;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v21;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier from message: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v12 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
    }
    v12 = 0;
    goto LABEL_21;
  }
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v17;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)upateOptionsInMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  HMDMediaDestinationControllerMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDMediaDestinationControllerMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDMediaDestinationControllerMessageHandler *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmf_numberForKey:", *MEMORY[0x24BDD65E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
      if (v11 < 4)
      {
LABEL_18:

        goto LABEL_19;
      }
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMMediaDestinationControllerUpateOptionsAsString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v15;
        v29 = 2112;
        v30 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform update due to unknown update options: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (a4)
      {
        v17 = 3;
LABEL_16:
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v17);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
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
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get update options from message: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      if (a4)
      {
        v17 = 20;
        goto LABEL_16;
      }
    }
    v11 = 0;
    goto LABEL_18;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v21;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload from message: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
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
LABEL_19:

  return v11;
}

- (void)handleMediaDestinationControllerUpdateDestinationRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDMediaDestinationControllerMessageHandler *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMDMediaDestinationControllerMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDMediaDestinationControllerMessageHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDMediaDestinationControllerMessageHandler *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
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
    v36 = v8;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update destination request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v34 = 0;
    -[HMDMediaDestinationControllerMessageHandler destinationIdentifierInMessage:error:](v6, "destinationIdentifierInMessage:error:", v4, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;
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
        *(_DWORD *)buf = 138543874;
        v36 = v15;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v11;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination identifier from update destination message: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "respondWithError:", v11);
    }
    v33 = v11;
    v16 = -[HMDMediaDestinationControllerMessageHandler upateOptionsInMessage:error:](v6, "upateOptionsInMessage:error:", v4, &v33);
    v17 = v33;

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v21;
        v37 = 2112;
        v38 = v4;
        v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get update options from update destination message: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v4, "respondWithError:", v17);
    }
    -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "mediaDestinationControllerMessageHandler:didReceiveMediaDestinationControllerUpdateDestinationRequestMessage:destinationIdentifier:updateOptions:", v6, v4, v10, v16);
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v31;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of update destination request message due to no delegate", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v32);

    }
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v6;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response handler from update destination request message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
  }

}

- (void)handleMediaDestinationUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination updated notification: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "mediaDestinationControllerMessageHandler:didReceiveMediaDestinationUpdatedNotification:", v6, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media destination updated notification due to no delegate", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaDestinationControllerMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMediaDestinationControllerMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDMediaDestinationControllerMessageHandler *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling home accessory removed notification: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "audioDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDMediaDestinationControllerMessageHandler delegate](v9, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "mediaDestinationControllerMessageHandler:didReceiveHomeAccessoryRemovedNotification:destination:", v9, v4, v12);
      }
      else
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = v9;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v22;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of accessory removed notification due to no delegate", (uint8_t *)&v23, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
      }

    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v9;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping home accessory removed notification due to no destination", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
}

- (void)handleMediaSystemAddedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media system added notification: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "mediaDestinationControllerMessageHandler:didReceiveMediaSystemAddedNotification:", v6, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media system added notification due to no delegate", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleMediaSystemRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media system removed notification: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "mediaDestinationControllerMessageHandler:didReceiveMediaSystemRemovedNotification:", v6, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media system removed notification due to no delegate", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleNotificationAccessoryChangedRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDMediaDestinationControllerMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMediaDestinationControllerMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDMediaDestinationControllerMessageHandler *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling accessory changed room notification: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "audioDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioDestinationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12
      || (objc_msgSend(v13, "identifier"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDMessageHandler messageTargetUUID](v9, "messageTargetUUID"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "hmf_isEqualToUUID:", v16),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      -[HMDMediaDestinationControllerMessageHandler delegate](v9, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "mediaDestinationControllerMessageHandler:didReceiveAccessoryChangedRoomNotification:", v9, v4);
      }
      else
      {
        v20 = (void *)MEMORY[0x227676638]();
        v21 = v9;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v23;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of accessory changed rooms notification due to no delegate", (uint8_t *)&v28, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v9;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping accessory changed room notification due to no destination and no related destination controller", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }

  }
}

- (void)handleMediaDestinationControllerUpdatedDestinationNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDMediaDestinationControllerMessageHandler *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  HMDMediaDestinationControllerMessageHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDMediaDestinationControllerMessageHandler *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDMediaDestinationControllerMessageHandler *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v8;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination controller updated destination notification: %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "hmf_UUIDForKey:", CFSTR("HMDMediaDestinationControllerIdentifierNotificationKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v31;
        v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination controller identifier from media destination controller updated destination notification user info: %@", (uint8_t *)&v38, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      goto LABEL_26;
    }
    objc_msgSend(v10, "hmf_UUIDForKey:", CFSTR("HMDMediaDestinationIdentifierNotificationKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD65F8]);

      if (!v15)
      {
        -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "mediaDestinationControllerMessageHandler:didReceiveMediaDestinationControllerUpdatedDestinationNotification:destinationControllerIdentifier:destinationIdentifier:", v6, v4, v11, v13);
        }
        else
        {
          v34 = (void *)MEMORY[0x227676638]();
          v35 = v6;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 138543362;
            v39 = v37;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media destination controller updated destination notification due to no delegate", (uint8_t *)&v38, 0xCu);

          }
          objc_autoreleasePoolPop(v34);
        }

        goto LABEL_25;
      }
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v6;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543362;
        v39 = v19;
        v20 = "%{public}@Skipping media destination controller updated destination notification due to null destination";
        v21 = v18;
        v22 = OS_LOG_TYPE_INFO;
        v23 = 12;
LABEL_17:
        _os_log_impl(&dword_2218F0000, v21, v22, v20, (uint8_t *)&v38, v23);

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
        v38 = 138543618;
        v39 = v19;
        v40 = 2112;
        v41 = v10;
        v20 = "%{public}@Failed to get media destination identifier from media destination controller updated destination"
              " notification user info: %@";
        v21 = v18;
        v22 = OS_LOG_TYPE_ERROR;
        v23 = 22;
        goto LABEL_17;
      }
    }

    objc_autoreleasePoolPop(v16);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v27;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get user info in media destination controller updated destination notification: %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
LABEL_27:

}

- (void)handleMediaGroupsAggregateConsumerUpdatedAggregateDataNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaDestinationControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media groups aggregate consumer updated aggregate data notification", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationControllerMessageHandler delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "mediaDestinationControllerMessageHandler:didReceiveMediaGroupsAggregateConsumerUpdatedAggregateDataNotification:", v6, v4);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of media groups aggregate consumer updated aggregate data notification due to no delegate", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMessageHandler messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaDestinationControllerMessageHandlerDataSource)dataSource
{
  return (HMDMediaDestinationControllerMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationControllerMessageHandlerDelegate)delegate
{
  return (HMDMediaDestinationControllerMessageHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDMediaDestinationControllerMetricsEventDispatcher *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_212741 != -1)
    dispatch_once(&logCategory__hmf_once_t34_212741, &__block_literal_global_212742);
  return (id)logCategory__hmf_once_v35_212743;
}

void __58__HMDMediaDestinationControllerMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35_212743;
  logCategory__hmf_once_v35_212743 = v0;

}

@end
