@implementation HMDSettingMessageMapper

- (HMDSettingMessageMapper)initWithIdentifier:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  HMDSettingMessageMapper *v9;
  HMDSettingMessageMapper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSettingMessageMapper;
  v9 = -[HMDSettingMessageMapper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (void)registerForMessage:(id)a3 policies:(id)a4 messageDispatcher:(id)a5 messageHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__HMDSettingMessageMapper_registerForMessage_policies_messageDispatcher_messageHandler___block_invoke;
  v12[3] = &unk_1E89C2008;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a5, "registerForMessage:receiver:policies:messageHandler:", a3, self, a4, v12);

}

- (void)deregisterFromAllMessages
{
  void *v3;
  HMDSettingMessageMapper *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSettingMessageMapper identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deregistering from messages %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSettingMessageMapper messageDispatcher](v4, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deregisterReceiver:", v4);

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __88__HMDSettingMessageMapper_registerForMessage_policies_messageDispatcher_messageHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
