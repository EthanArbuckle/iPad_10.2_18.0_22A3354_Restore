@implementation HMDCameraResidentMessageHandler

- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCameraResidentMessageHandler *v9;

  v6 = a4;
  v7 = a3;
  +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCameraResidentMessageHandler initWithAccessory:logIdentifier:messageDispatcher:](self, "initWithAccessory:logIdentifier:messageDispatcher:", v7, v6, v8);

  return v9;
}

- (HMDCameraResidentMessageHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraResidentMessageHandler *v12;
  HMDCameraResidentMessageHandler *v13;
  uint64_t v14;
  NSString *logIdentifier;
  uint64_t v16;
  NSMutableDictionary *queuedMessagesByDeviceIdentifier;
  HMDCameraResidentMessageHandler *result;
  HMDCameraResidentMessageHandler *v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v19 = (HMDCameraResidentMessageHandler *)_HMFPreconditionFailure();
    -[HMDCameraResidentMessageHandler sendMessageWithName:cameraSessionID:payload:target:device:responseQueue:responseHandler:](v19, v20, v21, v22, v23, v24, v25, v26, v28);
    return result;
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraResidentMessageHandler;
  v12 = -[HMDCameraResidentMessageHandler init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessory, v8);
    objc_storeStrong((id *)&v13->_messageDispatcher, a5);
    v14 = objc_msgSend(v9, "copy");
    logIdentifier = v13->_logIdentifier;
    v13->_logIdentifier = (NSString *)v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    queuedMessagesByDeviceIdentifier = v13->_queuedMessagesByDeviceIdentifier;
    v13->_queuedMessagesByDeviceIdentifier = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 device:(id)a7 responseQueue:(id)a8 responseHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  HMDCameraResidentMessageHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  HMDRemoteDeviceMessageDestination *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  HMDCameraResidentMessageHandler *v42;
  id v43;
  id v44;
  id v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v19)
  {
    v39 = v18;
    v37 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:]([HMDRemoteDeviceMessageDestination alloc], "initWithTarget:device:", v18, v19);
    +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", v15, 33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_10;
    v40[3] = &unk_24E799BC0;
    v41 = v20;
    v38 = v21;
    v45 = v21;
    v42 = self;
    v36 = v23;
    v43 = v36;
    v24 = v19;
    v44 = v24;
    v25 = (void *)MEMORY[0x227676638](objc_msgSend(v22, "setResponseHandler:", v40));
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = v25;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v35 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v34 = v20;
      v30 = v16;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v51 = v28;
      v52 = 2112;
      v53 = v30;
      v54 = 2112;
      v55 = v29;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Enqueueing camera message for session ID %@ to %@ using %@", buf, 0x2Au);

      v16 = v30;
      v20 = v34;

      v17 = v35;
      v25 = v33;
    }

    objc_autoreleasePoolPop(v25);
    objc_msgSend(v24, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraResidentMessageHandler enqueueMessage:forDeviceIdentifier:](v26, "enqueueMessage:forDeviceIdentifier:", v22, v32);

    v21 = v38;
    v18 = v39;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke;
    block[3] = &unk_24E79B3F0;
    block[4] = self;
    v47 = v15;
    v48 = v16;
    v49 = v21;
    dispatch_async(v20, block);

  }
}

- (void)sendMessageWithName:(id)a3 cameraSessionID:(id)a4 payload:(id)a5 target:(id)a6 responseQueue:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[HMDCameraResidentMessageHandler remoteAccessDevice](self, "remoteAccessDevice");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraResidentMessageHandler sendMessageWithName:cameraSessionID:payload:target:device:responseQueue:responseHandler:](self, "sendMessageWithName:cameraSessionID:payload:target:device:responseQueue:responseHandler:", v19, v18, v17, v16, v20, v15, v14);

}

- (HMDDevice)remoteAccessDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDCameraResidentMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDCameraResidentMessageHandler *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraResidentMessageHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "homeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "companionDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
    }
    else
    {
      -[HMDCameraResidentMessageHandler messageDispatcher](self, "messageDispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "remoteAccessDeviceForHome:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v13 = v7;
      }
      else
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v17;
          v21 = 2112;
          v22 = v4;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find remote access device for home %@", (uint8_t *)&v19, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
      }

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get home to determine remote access device", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return (HMDDevice *)v7;
}

- (BOOL)isUsingCompanionForRemoteAccessDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HMDCameraResidentMessageHandler remoteAccessDevice](self, "remoteAccessDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraResidentMessageHandler accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "companionDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqual:", v7);

  return v8;
}

- (BOOL)isRemoteAccessDeviceReachable
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCameraResidentMessageHandler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRemoteAccessDeviceReachable");

  return v4;
}

- (void)enqueueMessage:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMDCameraResidentMessageHandler queuedMessagesByDeviceIdentifier](self, "queuedMessagesByDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraResidentMessageHandler queuedMessagesByDeviceIdentifier](self, "queuedMessagesByDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(v8, "addObject:", v11);

  os_unfair_lock_unlock(&self->_lock);
  if (!v10)
    -[HMDCameraResidentMessageHandler sendNextMessageForDeviceIdentifier:](self, "sendNextMessageForDeviceIdentifier:", v6);

}

- (void)dequeueRespondedMessageForDeviceIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraResidentMessageHandler queuedMessagesByDeviceIdentifier](self, "queuedMessagesByDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hmf_removeFirstObject");
  if (!objc_msgSend(v6, "count"))
  {
    -[HMDCameraResidentMessageHandler queuedMessagesByDeviceIdentifier](self, "queuedMessagesByDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)nextMessageForDeviceIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCameraResidentMessageHandler queuedMessagesByDeviceIdentifier](self, "queuedMessagesByDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)sendNextMessageForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraResidentMessageHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraResidentMessageHandler nextMessageForDeviceIdentifier:](self, "nextMessageForDeviceIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending next queued message %@ to device with identifier: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraResidentMessageHandler messageDispatcher](v7, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:", v5);

  }
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)queuedMessagesByDeviceIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedMessagesByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

void __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Did not find the resident device to send the message %@ for session %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1034);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

}

void __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_2;
  block[3] = &unk_24E79B440;
  v22 = *(id *)(a1 + 64);
  v8 = v5;
  v20 = v8;
  v9 = v6;
  v21 = v9;
  dispatch_async(v7, block);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received response for message with identifier %@. Sending next message", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dequeueRespondedMessageForDeviceIdentifier:", v16);

  v17 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendNextMessageForDeviceIdentifier:", v18);

}

uint64_t __123__HMDCameraResidentMessageHandler_sendMessageWithName_cameraSessionID_payload_target_device_responseQueue_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_107684 != -1)
    dispatch_once(&logCategory__hmf_once_t9_107684, &__block_literal_global_107685);
  return (id)logCategory__hmf_once_v10_107686;
}

void __46__HMDCameraResidentMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_107686;
  logCategory__hmf_once_v10_107686 = v0;

}

@end
