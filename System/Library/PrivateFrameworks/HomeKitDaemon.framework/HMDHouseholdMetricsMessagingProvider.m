@implementation HMDHouseholdMetricsMessagingProvider

- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3
{
  id v4;
  void *v5;
  HMDHouseholdMetricsMessagingProvider *v6;

  v4 = a3;
  +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDHouseholdMetricsMessagingProvider initWithReceiver:messageDispatcher:](self, "initWithReceiver:messageDispatcher:", v4, v5);

  return v6;
}

- (HMDHouseholdMetricsMessagingProvider)initWithReceiver:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  HMDHouseholdMetricsMessagingProvider *v9;
  HMDHouseholdMetricsMessagingProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHouseholdMetricsMessagingProvider;
  v9 = -[HMDHouseholdMetricsMessagingProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_receiver, a3);
    objc_storeStrong((id *)&v10->_messageDispatcher, a4);
  }

  return v10;
}

- (void)sendMessage:(id)a3 toDevice:(id)a4 withPayload:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDRemoteDeviceMessageDestination *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDHouseholdMetricsMessagingProvider receiver](self, "receiver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageTargetUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v14, "initWithTarget:device:", v16, v12);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1D0]), "initWithName:destination:payload:", v13, v19, v11);
  objc_msgSend(v17, "setTimeout:", 0.0);
  objc_msgSend(v17, "setSecureRemote:", 1);
  objc_msgSend(v17, "setResponseHandler:", v10);

  objc_msgSend(v17, "setRemoteRestriction:", 9);
  -[HMDHouseholdMetricsMessagingProvider messageDispatcher](self, "messageDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendMessage:completionHandler:", v17, 0);

}

- (void)registerForMessage:(id)a3 messageHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[HMDHouseholdMetricsMessagingProvider messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdMetricsMessagingProvider receiver](self, "receiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__HMDHouseholdMetricsMessagingProvider_registerForMessage_messageHandler___block_invoke;
  v13[3] = &unk_24E77E008;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v8, "registerForMessage:receiver:policies:messageHandler:", v7, v9, v11, v13);

}

- (void)deregisterForMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDHouseholdMetricsMessagingProvider messageDispatcher](self, "messageDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdMetricsMessagingProvider receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterForMessage:receiver:", v4, v5);

}

- (HMFMessageReceiver)receiver
{
  return self->_receiver;
}

- (HMDMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

void __74__HMDHouseholdMetricsMessagingProvider_registerForMessage_messageHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "messagePayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  (*(void (**)(void))(v5 + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v3, "respondWithPayload:error:", v6, v7);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_59649 != -1)
    dispatch_once(&logCategory__hmf_once_t0_59649, &__block_literal_global_59650);
  return (id)logCategory__hmf_once_v1_59651;
}

void __51__HMDHouseholdMetricsMessagingProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_59651;
  logCategory__hmf_once_v1_59651 = v0;

}

@end
