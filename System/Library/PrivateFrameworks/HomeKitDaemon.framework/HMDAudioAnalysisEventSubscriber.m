@implementation HMDAudioAnalysisEventSubscriber

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldPublishEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAudioAnalysisEventSubscriber *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  HMDAudioAnalysisEventSubscriber *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!_os_feature_enabled_impl())
    goto LABEL_4;
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAudioAnalysisEventNotificationEnabled");

  if ((v6 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v15 = "%{public}@Notification is not enabled for uuid %@";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v9);
    goto LABEL_11;
  }
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioAnalysisEventNotificationCondition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v15 = "%{public}@Notification does not have a condition set for uuid %@";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v6 = 1;
LABEL_11:

  return v6;
}

- (id)stereoPairedCounterpartAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "mediaSystemController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaSystems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke;
    v15[3] = &unk_24E77E3B8;
    v15[4] = self;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_3;
    v14[3] = &unk_24E790530;
    v14[4] = self;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMDAudioAnalysisEventSubscriber)initWithContext:(id)a3
{
  id v4;
  HMDAudioAnalysisEventSubscriber *v5;
  HMDAudioAnalysisEventSubscriber *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAudioAnalysisEventSubscriber;
  v5 = -[HMDAudioAnalysisEventSubscriber init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HMDAudioAnalysisEventSubscriber configureWithContext:](v5, "configureWithContext:", v4);

  return v6;
}

- (void)configureWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  -[HMDAudioAnalysisEventSubscriber registerForMessages](self, "registerForMessages");
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("HMDAudioAnalysisEventMessageKey"), self, v7, sel__handleAudioAnalysisEventMessage_);

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", CFSTR("HMDAudioAnalysisPrimaryResidentRouteEventRequestMessage"), self, v7, sel__handleAudioAnalysisEventMessage_);

}

- (void)deregisterForMessages
{
  void *v3;
  id v4;

  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

}

- (void)postNotificationForEvent:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisEventSubscriber *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAudioAnalysisEventSubscriber *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544386;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting notification from accessoryUUID: %@, reason: %@, state: %@, notificationUUID: %@", (uint8_t *)&v17, 0x34u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAudioAnalysisEventSubscriber shouldPublishEvent:](v6, "shouldPublishEvent:", v4))
  {
    -[HMDAudioAnalysisEventSubscriber postOrUpdateNotificationWithBulletinIfneeded:](v6, "postOrUpdateNotificationWithBulletinIfneeded:", v4);
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Notification predicate evaluation failed, not posting the notification for bulletin: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)postOrUpdateNotificationWithBulletinIfneeded:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[HMDAudioAnalysisEventSubscriber stereoPairedCounterpartAccessory](self, "stereoPairedCounterpartAccessory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    -[HMDAudioAnalysisEventSubscriber _postOrUpdateNotificationWithBulletin:stereoPairedAccessory:](self, "_postOrUpdateNotificationWithBulletin:stereoPairedAccessory:", v4, v5);
  else
    -[HMDAudioAnalysisEventSubscriber _postOrUpdateNotificationWithBulletin:](self, "_postOrUpdateNotificationWithBulletin:", v4);

}

- (void)_postOrUpdateNotificationWithBulletin:(id)a3 stereoPairedAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAudioAnalysisEventSubscriber *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAudioAnalysisEventSubscriber context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventSubscriber mediaSystemLastKnownEventKeyForAccessoryUUID:pairedAccessoryUUID:reason:](self, "mediaSystemLastKnownEventKeyForAccessoryUUID:pairedAccessoryUUID:reason:", v9, v10, objc_msgSend(v6, "reason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Comparing key for stereo paired accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDAudioAnalysisEventSubscriber transformHMDBulletinToHMBulletin:](v13, "transformHMDBulletinToHMBulletin:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventSubscriber context](v13, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "audioAnalysisStereoPairController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __95__HMDAudioAnalysisEventSubscriber__postOrUpdateNotificationWithBulletin_stereoPairedAccessory___block_invoke;
  v26[3] = &unk_24E77C888;
  v26[4] = v13;
  v27 = v11;
  v28 = v6;
  v23 = v6;
  v24 = v11;
  objc_msgSend(v19, "compareOrUpdateRecentAudioAnalysisStereoPairEvent:key:accessory:notificationUUID:window:completion:", v16, v24, v21, v22, 20, v26);

}

- (id)mediaSystemLastKnownEventKeyForAccessoryUUID:(id)a3 pairedAccessoryUUID:(id)a4 reason:(unint64_t)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v5 = 0;
  v18[2] = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v8 = a4;
    objc_msgSend(a3, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(v8, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("accessory:%@.accessory:%@.reason.%@"), v14, v15, v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_postOrUpdateNotificationWithBulletin:(id)a3
{
  id v4;

  v4 = a3;
  -[HMDAudioAnalysisEventSubscriber _postUpdateEventRouterEventIfDifferent:](self, "_postUpdateEventRouterEventIfDifferent:", v4);
  -[HMDAudioAnalysisEventSubscriber _postBulletinNotificationWithBulletin:](self, "_postBulletinNotificationWithBulletin:", v4);

}

- (void)_postBulletinNotificationWithBulletin:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisEventSubscriber *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting audio analysis bulletin notification: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_msgSend(v4, "state");
  if (v9 == 1)
  {
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bulletinBoard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateAudioAnalysisEventNotification:", v4);
    goto LABEL_7;
  }
  if (!v9)
  {
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bulletinBoard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertAudioAnalysisEventNotification:", v4);
LABEL_7:

  }
}

- (void)_handleAudioAnalysisEventMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisEventSubscriber *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAudioAnalysisEventBulletin *v11;
  HMDAudioAnalysisNotificationReceivedLogEvent *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDAudioAnalysisNotificationReceivedLogEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received audio analysis notification message %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmf_dictionaryForKey:", CFSTR("HMDAudioAnalysisBulletinDataMessageKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMDAudioAnalysisEventBulletin initWithDictionary:]([HMDAudioAnalysisEventBulletin alloc], "initWithDictionary:", v10);
  v12 = [HMDAudioAnalysisNotificationReceivedLogEvent alloc];
  v13 = -[HMDAudioAnalysisEventBulletin reason](v11, "reason");
  v14 = -[HMDAudioAnalysisEventBulletin state](v11, "state");
  -[HMDAudioAnalysisEventBulletin dateOfOccurrence](v11, "dateOfOccurrence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDAudioAnalysisNotificationReceivedLogEvent initWithReason:state:notificationSentDate:](v12, "initWithReason:state:notificationSentDate:", v13, v14, v15);

  -[HMDAudioAnalysisEventSubscriber context](v6, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioAnalysisEventBulletin configureWithContext:](v11, "configureWithContext:", v17);

  if (v11)
  {
    -[HMDAudioAnalysisEventSubscriber postNotificationForEvent:](v6, "postNotificationForEvent:", v11);
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "submitLogEvent:", v16);

  }
  -[HMDAudioAnalysisEventSubscriber context](v6, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitLogEvent:", v16);

  objc_msgSend(v4, "respondWithPayload:", 0);
}

- (id)transformHMDBulletinToHMBulletin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD74C8]);
  objc_msgSend(v5, "spiClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spiClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "reason");
  v13 = objc_msgSend(v3, "state");

  v14 = (void *)objc_msgSend(v6, "initWithAccessoryIdentifier:homeIdentifier:startDate:endDate:reason:state:", v7, v9, v10, v11, v12, v13);
  return v14;
}

- (void)_postUpdateEventRouterEventIfDifferent:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisEventSubscriber *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  HMDAudioAnalysisEventSubscriber *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  HMDAudioAnalysisEventSubscriber *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  HMDAudioAnalysisEventSubscriber *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HMDAudioAnalysisEventSubscriber *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDAudioAnalysisEventSubscriber *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *context;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
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
    v58 = v8;
    v59 = 2112;
    v60 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting audio analysis event for bulletin: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDAudioAnalysisEventSubscriber transformHMDBulletinToHMBulletin:](v6, "transformHMDBulletinToHMBulletin:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD74C0];
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topicWithAccessoryUUID:homeUUID:", v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v6;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@nil topic", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      goto LABEL_29;
    }
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eventStoreReadHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v20;
    objc_msgSend(v20, "lastEventForTopic:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v21;
    if (!v21)
      goto LABEL_21;
    v55 = 0;
    objc_msgSend(MEMORY[0x24BDD74C0], "decodeBulletinsFromEvent:error:", v21, &v55);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v55;
    if (!v23)
    {
      if (v22)
        goto LABEL_11;
    }
    v51 = v13;
    context = (void *)MEMORY[0x227676638]();
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v26;
      v59 = 2112;
      v60 = v18;
      v61 = 2112;
      v62 = v23;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored event for topic %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);

    v13 = v51;
    if (v22)
    {
LABEL_11:
      v27 = v13;
      v28 = objc_msgSend(v22, "checkIfBulletinExists:", v13, context);
      v52 = (void *)MEMORY[0x227676638]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (v31)
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v58 = v32;
          v59 = 2112;
          v60 = v27;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Bulletin:%@ exists in events", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v52);
        v13 = v27;
        goto LABEL_28;
      }
      if (v31)
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        v59 = 2112;
        v60 = v27;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin:%@ to events", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v52);
      v13 = v27;
      objc_msgSend(v22, "bulletinsByAddingOrReplacingBulletin:", v27);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_21:
      v41 = (void *)MEMORY[0x227676638]();
      v42 = v6;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v44;
        v59 = 2112;
        v60 = v13;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding new bulletin:%@ to events", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      v56 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
    }
    v47 = objc_alloc(MEMORY[0x24BDD74C0]);
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v48 = (void *)objc_msgSend(v47, "initWithBulletins:eventSource:eventTimestamp:", v45, v12);
    -[HMDAudioAnalysisEventSubscriber context](v6, "context");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "forwardEvent:topic:completion:", v48, v18, &__block_literal_global_156);

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v6;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v36;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@nil event source", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v33);
LABEL_30:

}

- (HMDAudioAnalysisEventSubscriberContext)context
{
  return (HMDAudioAnalysisEventSubscriberContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __95__HMDAudioAnalysisEventSubscriber__postOrUpdateNotificationWithBulletin_stereoPairedAccessory___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  HMDAudioAnalysisEventSubscriberContext *v11;
  void *v12;
  void *v13;
  HMDAudioAnalysisEventSubscriberContext *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessory");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v7)
    {
      v11 = [HMDAudioAnalysisEventSubscriberContext alloc];
      objc_msgSend(*(id *)(a1 + 32), "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "workQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAudioAnalysisEventSubscriberContext initWithAccessory:queue:](v11, "initWithAccessory:queue:", v7, v13);

      objc_msgSend(*(id *)(a1 + 48), "configureWithContext:", v14);
    }
    objc_msgSend(*(id *)(a1 + 48), "setNotificationUUID:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_postOrUpdateNotificationWithBulletin:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Home found existing recent notification for key: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_2;
  v6[3] = &unk_24E790530;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7) ^ 1;
  return v8;
}

uint64_t __67__HMDAudioAnalysisEventSubscriber_stereoPairedCounterpartAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_50378 != -1)
    dispatch_once(&logCategory__hmf_once_t2_50378, &__block_literal_global_129);
  return (id)logCategory__hmf_once_v3_50379;
}

void __46__HMDAudioAnalysisEventSubscriber_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_50379;
  logCategory__hmf_once_v3_50379 = v0;

}

@end
