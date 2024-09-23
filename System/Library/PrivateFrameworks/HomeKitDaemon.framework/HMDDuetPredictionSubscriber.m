@implementation HMDDuetPredictionSubscriber

- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  HMDDuetPredictionSubscriber *v10;

  v6 = (objc_class *)MEMORY[0x24BDD7608];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[HMDDuetPredictionSubscriber initWithWorkQueue:messageDispatcher:darwinNotificationProvider:](self, "initWithWorkQueue:messageDispatcher:darwinNotificationProvider:", v8, v7, v9);

  return v10;
}

- (HMDDuetPredictionSubscriber)initWithWorkQueue:(id)a3 messageDispatcher:(id)a4 darwinNotificationProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDDuetPredictionSubscriber *v12;
  HMDDuetPredictionSubscriber *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDuetPredictionSubscriber;
  v12 = -[HMDDuetPredictionSubscriber init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_messageDispatcher, a4);
    objc_storeStrong((id *)&v13->_darwinNotificationProvider, a5);
    v13->_duetPredictionsChangedNotificationToken = -1;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_duetPredictionsChangedNotificationToken != -1)
    -[HMDarwinNotificationProvider notifyCancel:](self->_darwinNotificationProvider, "notifyCancel:");
  v3.receiver = self;
  v3.super_class = (Class)HMDDuetPredictionSubscriber;
  -[HMDDuetPredictionSubscriber dealloc](&v3, sel_dealloc);
}

- (void)configure
{
  void *v3;
  HMDDuetPredictionSubscriber *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[HMDDuetPredictionSubscriber duetPredictionsChangedNotificationToken](self, "duetPredictionsChangedNotificationToken") == -1)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering for duet prediction change notifications", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_initWeak((id *)buf, v4);
    -[HMDDuetPredictionSubscriber darwinNotificationProvider](v4, "darwinNotificationProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(CFSTR("com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery"), "UTF8String");
    -[HMDDuetPredictionSubscriber workQueue](v4, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__HMDDuetPredictionSubscriber_configure__block_invoke;
    v10[3] = &unk_24E792558;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v7, "notifyRegisterDispatch:outToken:queue:handler:", v8, &v4->_duetPredictionsChangedNotificationToken, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (HMDDuetPredictionSubscriberDataSource)dataSource
{
  return (HMDDuetPredictionSubscriberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 40, 1);
}

- (int)duetPredictionsChangedNotificationToken
{
  return self->_duetPredictionsChangedNotificationToken;
}

- (void)setDuetPredictionsChangedNotificationToken:(int)a3
{
  self->_duetPredictionsChangedNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __40__HMDDuetPredictionSubscriber_configure__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = WeakRetained;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification duet predictions changed", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = objc_alloc(MEMORY[0x24BE3F1B8]);
    objc_msgSend(v2, "updateMessageTargetForDuetPredictionSubscriber:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

    objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD7000], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDestination:", v9);
    objc_msgSend(v4, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:", v10);

  }
}

@end
