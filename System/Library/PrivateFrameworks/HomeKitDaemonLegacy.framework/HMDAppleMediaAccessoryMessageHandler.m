@implementation HMDAppleMediaAccessoryMessageHandler

- (HMDAppleMediaAccessoryMessageHandler)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 ownerPrivateRemoteMessages:(id)a6 adminPrivateRemoteMessages:(id)a7 internalMessages:(id)a8 notifications:(id)a9 notificationsToObject:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAppleMediaAccessoryMessageHandler *v32;
  void *v33;
  void *v34;
  HMDAppleMediaAccessoryMessageHandler *v35;
  void *v37;
  objc_super v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
LABEL_17:
    _HMFPreconditionFailure();
  }
  v24 = v23;
  if (!v23)
    goto LABEL_17;
  v25 = objc_msgSend(v22, "mutableCopy");
  v37 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = self;
  v33 = (void *)v25;
  v39[0] = CFSTR("HMDAppleMediaAccessoryDeviceUpdatedNotification");
  v39[1] = CFSTR("HMDAppleMediaAccessoryDeviceIsReachableNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v34);

  v38.receiver = v32;
  v38.super_class = (Class)HMDAppleMediaAccessoryMessageHandler;
  v35 = -[HMDMessageHandler initWithMessageTargetUUID:messageDispatcher:notificationCenter:ownerPrivateRemoteMessages:adminPrivateRemoteMessages:internalMessages:notifications:notificationsToObject:](&v38, sel_initWithMessageTargetUUID_messageDispatcher_notificationCenter_ownerPrivateRemoteMessages_adminPrivateRemoteMessages_internalMessages_notifications_notificationsToObject_, v31, v30, v29, v28, v27, v26, v33, v24);

  return v35;
}

- (void)handleAppleMediaAccessoryDeviceUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryMessageHandler *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDMessageHandler hasQueuedOutgoingMessages](self, "hasQueuedOutgoingMessages"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling apple media accessory device updated notification: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMessageHandler sendQueuedOutgoingMessages](v6, "sendQueuedOutgoingMessages");
  }

}

- (void)handleAppleMediaAccessoryDeviceIsReachableNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessoryMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAppleMediaAccessoryMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
    if (-[HMDMessageHandler hasQueuedOutgoingMessagesForDevice:](self, "hasQueuedOutgoingMessagesForDevice:", v7))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v11;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling remote device is reachable notification with device: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDMessageHandler sendQueuedOutgoingMessagesForDevice:](v9, "sendQueuedOutgoingMessagesForDevice:", v7);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get device from remote device is reachable notification object: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

@end
