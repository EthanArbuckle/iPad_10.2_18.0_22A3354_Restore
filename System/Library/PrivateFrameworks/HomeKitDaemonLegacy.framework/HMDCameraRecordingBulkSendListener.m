@implementation HMDCameraRecordingBulkSendListener

- (HMDCameraRecordingBulkSendListener)initWithWorkQueue:(id)a3
{
  id v5;
  HMDCameraRecordingBulkSendListener *v6;
  HMDCameraRecordingBulkSendListener *v7;
  uint64_t v8;
  NSUUID *UUID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingBulkSendListener;
  v6 = -[HMDCameraRecordingBulkSendListener init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v8;

  }
  return v7;
}

- (BOOL)isSessionOpenInProgress
{
  if (self)
    self = (HMDCameraRecordingBulkSendListener *)objc_getProperty(self, a2, 32, 1);
  return self != 0;
}

- (void)addPendingBulkSendSessionCallback:(id)a3
{
  const char *v4;
  NSObject *Property;
  SEL v6;
  id newValue;

  newValue = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_setProperty_atomic_copy(self, v6, newValue, 32);
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }

}

- (void)openBulkSendSessionWithAccessory:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  NSObject *Property;
  SEL v10;
  SEL v11;
  id v12;
  _QWORD v13[5];

  v6 = a4;
  v7 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v8, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_setProperty_atomic_copy(self, v10, v6, 32);
    v12 = objc_getProperty(self, v11, 24, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    v12 = 0;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke;
  v13[3] = &unk_1E89B5FD0;
  v13[4] = self;
  objc_msgSend(a3, "openBulkSendSessionForFileType:reason:metadata:queue:callback:", CFSTR("ipcamera.recording"), CFSTR("record"), 0, v12, v13);

}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  objc_msgSend(a4, "rejectBulkSendSessionWithStatus:", 1);
}

- (void)accessoryDidStartListening:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HMDCameraRecordingBulkSendListener_accessoryDidStartListening___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  const char *v5;
  id v6;
  NSObject *Property;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (self)
    Property = objc_getProperty(self, v5, 24, 1);
  else
    Property = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HMDCameraRecordingBulkSendListener_accessory_didCloseDataStreamWithError___block_invoke;
  v9[3] = &unk_1E89C2328;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(Property, v9);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingBulkSendListener UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingBulkSendListener UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraRecordingBulkSendListenerDelegate)delegate
{
  return (HMDCameraRecordingBulkSendListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingOpenSessionCallback, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __76__HMDCameraRecordingBulkSendListener_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory did close data stream", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3305);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[HMDCameraRecordingBulkSendListener _callPendingOpenSessionCallbackWithResult:error:](*(void **)(a1 + 32), 0, v7);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listenerDidReceiveDataStreamClose:", *(_QWORD *)(a1 + 32));

}

- (void)_callPendingOpenSessionCallbackWithResult:(void *)a3 error:
{
  id v5;
  const char *v6;
  id v7;
  NSObject *Property;
  SEL v9;
  void (**v10)(id, id, id);
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  SEL v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    v10 = (void (**)(id, id, id))objc_getProperty(a1, v9, 32, 1);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v14;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Calling pending callback with result: %@ error: %@", (uint8_t *)&v16, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_setProperty_atomic_copy(v12, v15, 0, 32);
      v10[2](v10, v5, v7);
    }

  }
}

void __65__HMDCameraRecordingBulkSendListener_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory did start listening", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8 = objc_getProperty(v7, v6, 32, 1);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling pending open bulk send session request", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "openBulkSendSessionWithAccessory:callback:", *(_QWORD *)(a1 + 40), v9);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "listenerDidReceiveDataStreamStart:", *(_QWORD *)(a1 + 32));

}

void __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;
  void *v8;
  NSObject *Property;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v5 = a2;
  v7 = a3;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    Property = objc_getProperty(v8, v6, 24, 1);
    v10 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v10 = 0;
    Property = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke_2;
  block[3] = &unk_1E89C20C8;
  block[4] = v10;
  v14 = v5;
  v15 = v7;
  v11 = v7;
  v12 = v5;
  dispatch_async(Property, block);

}

void __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke_2(void **a1)
{
  -[HMDCameraRecordingBulkSendListener _callPendingOpenSessionCallbackWithResult:error:](a1[4], a1[5], a1[6]);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_128191 != -1)
    dispatch_once(&logCategory__hmf_once_t4_128191, &__block_literal_global_128192);
  return (id)logCategory__hmf_once_v5_128193;
}

void __49__HMDCameraRecordingBulkSendListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_128193;
  logCategory__hmf_once_v5_128193 = v0;

}

@end
