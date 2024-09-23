@implementation HMDRemoteLoginMessageSender

- (HMDRemoteLoginMessageSender)initWithTarget:(id)a3 accessory:(id)a4 device:(id)a5 workQueue:(id)a6 messageDispatcher:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDRemoteLoginMessageSender *v18;
  HMDRemoteLoginMessageSender *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDRemoteLoginMessageSender;
  v18 = -[HMDRemoteLoginMessageSender init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_target, a3);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeWeak((id *)&v19->_accessory, v14);
    objc_storeStrong((id *)&v19->_workQueue, a6);
    objc_storeStrong((id *)&v19->_messageDispatcher, a7);
  }

  return v19;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemoteLoginMessageSender target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sendRemoteMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDRemoteLoginMessageSender *v14;
  NSObject *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteLoginMessageSender *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDRemoteLoginMessageSender device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (-[HMDRemoteLoginMessageSender accessory](self, "accessory"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "device"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v16;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDRemoteLoginMessageSender target](v14, "target");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v17, "initWithTarget:device:", v18, v11);

    +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", v8, v19, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v14);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke;
    v29 = &unk_24E79AFA0;
    objc_copyWeak(&v31, (id *)buf);
    v30 = v10;
    objc_msgSend(v20, "setResponseHandler:", &v26);
    -[HMDRemoteLoginMessageSender messageDispatcher](v14, "messageDispatcher", v26, v27, v28, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:completionHandler:", v20, 0);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

    goto LABEL_6;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v25;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Remote device to send the message is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 54);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v11, 0);
LABEL_6:

  }
}

- (NSUUID)target
{
  return self->_target;
}

- (HMDDevice)device
{
  return self->_device;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

void __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke_2;
    block[3] = &unk_24E79B440;
    v13 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __81__HMDRemoteLoginMessageSender_sendRemoteMessageWithName_payload_responseHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_139227 != -1)
    dispatch_once(&logCategory__hmf_once_t0_139227, &__block_literal_global_139228);
  return (id)logCategory__hmf_once_v1_139229;
}

void __42__HMDRemoteLoginMessageSender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_139229;
  logCategory__hmf_once_v1_139229 = v0;

}

@end
