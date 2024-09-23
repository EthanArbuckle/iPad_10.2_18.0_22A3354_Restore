@implementation HMDMediaDestinationsMessageHandler

- (HMDMediaDestinationsMessageHandler)initWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMDMediaDestinationsMessageHandler *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v13)
  {
LABEL_6:
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  if (!v14)
    goto LABEL_7;
  v17 = v16;
  v22[0] = *MEMORY[0x1E0CB94C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HMDMediaDestinationsMessageHandler;
  v19 = -[HMDMediaDestinationMessageHandler initWithDestination:messageDispatcher:notificationCenter:notifications:dataSource:delegate:](&v21, sel_initWithDestination_messageDispatcher_notificationCenter_notifications_dataSource_delegate_, v12, v13, v14, v18, v15, v17);

  return v19;
}

- (void)handleMediaDestinationUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDMediaDestinationsMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  HMDMediaDestinationsMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDMediaDestinationsMessageHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDMediaDestinationsMessageHandler *v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543362;
    v32 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination updated notification", (uint8_t *)&v31, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaDestinationsMessageHandler delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      objc_opt_class();
      v13 = objc_opt_isKindOfClass() & 1;
      if (v13)
        v14 = v12;
      else
        v14 = 0;
      v15 = v14;

      if (v13)
      {
        objc_msgSend(v12, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMessageHandler messageTargetUUID](v6, "messageTargetUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "hmf_isEqualToUUID:", v17);

        if ((v18 & 1) == 0)
          objc_msgSend(v9, "mediaDestinationsMessageHandler:didReceiveDestinationUpdatedNotification:destination:", v6, v4, v12);
      }
      else
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = v6;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v30;
          v33 = 2112;
          v34 = v4;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination from media destination updated notification: %@", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
      }

    }
    else
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v6;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v26;
        v33 = 2112;
        v34 = v4;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to get notification object from media destination updated notification: %@", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v9, "mediaDestinationsMessageHandler:didReceiveDestinationUpdatedNotification:destination:", v24, v4, 0);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle destination updated notification due to no delegate", (uint8_t *)&v31, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)handleUpdatedDestination:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDMediaDestinationsMessageHandler;
  v4 = a3;
  -[HMDMediaDestinationMessageHandler handleUpdatedDestination:](&v6, sel_handleUpdatedDestination_, v4);
  v5 = objc_msgSend(v4, "supportedOptions", v6.receiver, v6.super_class);

  if (v5)
  {
    if (-[HMDMessageHandler hasQueuedIncomingMessages](self, "hasQueuedIncomingMessages"))
      -[HMDMessageHandler routeQueuedIncomingMessages](self, "routeQueuedIncomingMessages");
  }
}

- (HMDMediaDestinationsMessageHandlerDataSource)dataSource
{
  return (HMDMediaDestinationsMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaDestinationsMessageHandlerDelegate)delegate
{
  return (HMDMediaDestinationsMessageHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
