@implementation HMDMessageHandlerQueuedMessage

- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3
{
  return -[HMDMessageHandlerQueuedMessage initWithMessage:timeInterval:](self, "initWithMessage:timeInterval:", a3, 60.0);
}

- (HMDMessageHandlerQueuedMessage)initWithMessage:(id)a3 timeInterval:(double)a4
{
  id v7;
  void *v8;
  HMDMessageHandlerQueuedMessage *v9;
  HMDMessageHandlerQueuedMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 2, a4);
  v12.receiver = self;
  v12.super_class = (Class)HMDMessageHandlerQueuedMessage;
  v9 = -[HMDMessageHandlerQueuedMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_timer, v8);
    -[HMFTimer setDelegate:](v10->_timer, "setDelegate:", v10);
  }

  return v10;
}

- (void)resumeTimer
{
  id v2;

  -[HMDMessageHandlerQueuedMessage timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)suspendTimer
{
  id v2;

  -[HMDMessageHandlerQueuedMessage timer](self, "timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMDMessageHandlerQueuedMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMDMessageHandlerQueuedMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMessageHandlerQueuedMessage *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMessageHandlerQueuedMessage delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did trigger message handler queued message with delegate: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "didTriggerMessageHandlerQueuedMessage:", v7);

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMessageHandlerQueuedMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMessageHandlerQueuedMessage name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("name"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMessageHandlerQueuedMessage message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDMessageHandlerQueuedMessageDelegate)delegate
{
  return (HMDMessageHandlerQueuedMessageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_127155 != -1)
    dispatch_once(&logCategory__hmf_once_t1_127155, &__block_literal_global_127156);
  return (id)logCategory__hmf_once_v2_127157;
}

void __45__HMDMessageHandlerQueuedMessage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_127157;
  logCategory__hmf_once_v2_127157 = v0;

}

@end
