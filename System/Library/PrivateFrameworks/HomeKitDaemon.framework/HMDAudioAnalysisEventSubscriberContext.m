@implementation HMDAudioAnalysisEventSubscriberContext

- (BOOL)isAudioAnalysisEventNotificationEnabled
{
  void *v2;
  char v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudioAnalysisEventNotificationEnabled");

  return v3;
}

- (NSPredicate)audioAnalysisEventNotificationCondition
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioAnalysisEventNotificationCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v3;
}

- (HMDDevice)device
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (HMEEventForwarder)eventForwarder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventForwarder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMEEventForwarder *)v5;
}

- (HMFMessageDispatcher)dispatcher
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFMessageDispatcher *)v3;
}

- (BOOL)dropInEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDAudioAnalysisEventSubscriberContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "audioAnalysisUserDropInAccessLevel") == 2;

  return v4;
}

- (HMDAudioAnalysisEventSubscriberContext)initWithAccessory:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  HMDAudioAnalysisEventSubscriberContext *v8;
  HMDAudioAnalysisEventSubscriberContext *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAudioAnalysisEventSubscriberContext;
  v8 = -[HMDAudioAnalysisEventSubscriberContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStoreReadHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMELastEventStoreReadHandle *)v5;
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)spiClientIdentifier
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spiClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isCurrentAccessory
{
  void *v2;
  char v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentAccessory");

  return v3;
}

- (NSString)roomName
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HMDHome)home
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHome *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAudioAnalysisEventSubscriberContext uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
}

- (void)submitLogEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v3);

}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitLogEvent:error:", v6, v5);

}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDAudioAnalysisEventSubscriberContext eventForwarder](self, "eventForwarder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__HMDAudioAnalysisEventSubscriberContext_forwardEvent_topic_completion___block_invoke;
  v13[3] = &unk_24E79A050;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "forwardEvent:topic:completion:", v10, v9, v13);

}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

uint64_t __72__HMDAudioAnalysisEventSubscriberContext_forwardEvent_topic_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_50308 != -1)
    dispatch_once(&logCategory__hmf_once_t0_50308, &__block_literal_global_50309);
  return (id)logCategory__hmf_once_v1_50310;
}

void __53__HMDAudioAnalysisEventSubscriberContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_50310;
  logCategory__hmf_once_v1_50310 = v0;

}

@end
