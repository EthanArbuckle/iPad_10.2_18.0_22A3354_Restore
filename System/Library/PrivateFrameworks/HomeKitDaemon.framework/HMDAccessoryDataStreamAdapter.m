@implementation HMDAccessoryDataStreamAdapter

- (HMDAccessoryDataStreamAdapter)initWithAccessory:(id)a3 workQueue:(id)a4 fileType:(id)a5 metadata:(id)a6 reason:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDAccessoryDataStreamAdapter *v17;
  HMDAccessoryDataStreamAdapter *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HMDAccessoryDataStreamAdapter;
  v17 = -[HMDAccessoryDataStreamAdapter init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_fileType, a5);
    objc_storeStrong((id *)&v18->_reason, a7);
    objc_storeStrong((id *)&v18->_metadata, a6);
  }

  return v18;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDataStreamAdapter fileType](self, "fileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Diagnostics DataStream File Type"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDataStreamAdapter transportReady](self, "transportReady");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("TransportReady"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDataStreamAdapter didBulkSendFail](self, "didBulkSendFail");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("DidBulkSendFail"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryDataStreamAdapter didBulkSendComplete](self, "didBulkSendComplete");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("DidBulkSendComplete"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)shutDown
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDataStreamAdapter currentBulkSendSession](self, "currentBulkSendSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[HMDAccessoryDataStreamAdapter didBulkSendComplete](self, "didBulkSendComplete");
    -[HMDAccessoryDataStreamAdapter currentBulkSendSession](self, "currentBulkSendSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = 0;
    else
      v8 = 5;
    objc_msgSend(v6, "cancelWithReason:", v8);

    -[HMDAccessoryDataStreamAdapter setCurrentBulkSendSession:](self, "setCurrentBulkSendSession:", 0);
  }
  -[HMDAccessoryDataStreamAdapter pendingOpenSessionCallback](self, "pendingOpenSessionCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDataStreamAdapter _callPendingOpenSessionCallbackWithResult:error:](self, "_callPendingOpenSessionCallbackWithResult:error:", 0, v10);

  }
  -[HMDAccessoryDataStreamAdapter accessory](self, "accessory");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "removeDataStreamBulkSendListener:", self);
    HAPStringFromAccessoryServerSession();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deregisterFromSessionRestore:", v11);

  }
  -[HMDAccessoryDataStreamAdapter setTransportReady:](self, "setTransportReady:", 0);

}

- (void)dealloc
{
  void *v3;
  HMDAccessoryDataStreamAdapter *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMDAccessoryDataStreamAdapter;
  -[HMDAccessoryDataStreamAdapter dealloc](&v7, sel_dealloc);
}

- (BOOL)isBulkSendActive
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDataStreamAdapter currentBulkSendSession](self, "currentBulkSendSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[HMDAccessoryDataStreamAdapter didBulkSendFail](self, "didBulkSendFail"))
    v5 = !-[HMDAccessoryDataStreamAdapter didBulkSendComplete](self, "didBulkSendComplete");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)setUpWithCallback:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessoryDataStreamAdapter *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDataStreamAdapter pendingOpenSessionCallback](self, "pendingOpenSessionCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Session is being setup already", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v11);

  }
  else
  {
    -[HMDAccessoryDataStreamAdapter _setUpTransport](self, "_setUpTransport");
    -[HMDAccessoryDataStreamAdapter setPendingOpenSessionCallback:](self, "setPendingOpenSessionCallback:", v4);
  }

}

- (void)readData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryDataStreamAdapter *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDataStreamAdapter currentBulkSendSession](self, "currentBulkSendSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDAccessoryDataStreamAdapter currentBulkSendSession](self, "currentBulkSendSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__HMDAccessoryDataStreamAdapter_readData__block_invoke;
    v11[3] = &unk_24E79A980;
    v11[4] = self;
    objc_msgSend(v5, "read:", v11);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryDataStreamAdapter accessory](v7, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Read data failed with no bulkSend session present for accessory:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryDataStreamAdapter _bulkSendDidFail](v7, "_bulkSendDidFail");
  }
}

- (void)_setUpTransport
{
  NSObject *v3;
  void *v4;
  HMDAccessoryDataStreamAdapter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting up data stream transport", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryDataStreamAdapter accessory](v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter fileType](v5, "fileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDataStreamBulkSendListener:fileType:", v5, v9);

}

- (void)_openSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  -[HMDAccessoryDataStreamAdapter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter fileType](self, "fileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__HMDAccessoryDataStreamAdapter__openSession__block_invoke;
  v9[3] = &unk_24E77AEE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "openBulkSendSessionForFileType:reason:metadata:queue:callback:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryDataStreamAdapter_callPendingOpenSessionCallbackWithResult_error___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_callPendingOpenSessionCallbackWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryDataStreamAdapter *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryDataStreamAdapter setCurrentBulkSendSession:](self, "setCurrentBulkSendSession:", v9);

  -[HMDAccessoryDataStreamAdapter pendingOpenSessionCallback](self, "pendingOpenSessionCallback");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11 = -[HMDAccessoryDataStreamAdapter setPendingOpenSessionCallback:](self, "setPendingOpenSessionCallback:", 0);
  if (!v7)
  {
    -[HMDAccessoryDataStreamAdapter accessory](self, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerForSessionRestore:", v13);

  }
  v14 = (void *)MEMORY[0x227676638](v11);
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v17;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Calling pending callback with result: %@ error: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  ((void (**)(_QWORD, id, id))v10)[2](v10, v6, v7);

}

- (void)_handleAccessoryDidClose
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDataStreamAdapter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HAPStringFromAccessoryServerSession();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterFromSessionRestore:", v5);

  -[HMDAccessoryDataStreamAdapter pendingOpenSessionCallback](self, "pendingOpenSessionCallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessoryDataStreamAdapter setTransportReady:](self, "setTransportReady:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryDataStreamAdapter _callPendingOpenSessionCallbackWithResult:error:](self, "_callPendingOpenSessionCallbackWithResult:error:", 0, v7);

  }
  else if (-[HMDAccessoryDataStreamAdapter isBulkSendActive](self, "isBulkSendActive"))
  {
    -[HMDAccessoryDataStreamAdapter _bulkSendDidFail](self, "_bulkSendDidFail");
  }
}

- (BOOL)isSessionOpenInProgress
{
  HMDAccessoryDataStreamAdapter *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryDataStreamAdapter pendingOpenSessionCallback](v2, "pendingOpenSessionCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)_handleFrame:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryDataStreamAdapter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "dataStreamAdapter:didReceiveData:", self, v4);

  return (char)self;
}

- (void)_bulkSendDidFail
{
  NSObject *v3;
  id v4;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryDataStreamAdapter isBulkSendActive](self, "isBulkSendActive"))
    -[HMDAccessoryDataStreamAdapter setDidBulkSendFail:](self, "setDidBulkSendFail:", 1);
  -[HMDAccessoryDataStreamAdapter delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataStreamAdapterDidFailDataRead:", self);

}

- (void)_bulkSendDidComplete
{
  NSObject *v3;
  id v4;

  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryDataStreamAdapter isBulkSendActive](self, "isBulkSendActive"))
    -[HMDAccessoryDataStreamAdapter setDidBulkSendComplete:](self, "setDidBulkSendComplete:", 1);
  -[HMDAccessoryDataStreamAdapter delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataStreamAdapterDidCompleteDataRead:", self);

}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  objc_msgSend(a4, "rejectBulkSendSessionWithStatus:", 1);
}

- (void)accessoryDidStartListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDAccessoryDataStreamAdapter_accessoryDidStartListening___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[HMDAccessoryDataStreamAdapter workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__HMDAccessoryDataStreamAdapter_accessory_didCloseDataStreamWithError___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryDataStreamAdapter accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAccessoryDataStreamAdapterDelegate)delegate
{
  return (HMDAccessoryDataStreamAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (HMDDataStreamBulkSendSession)currentBulkSendSession
{
  return (HMDDataStreamBulkSendSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentBulkSendSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)pendingOpenSessionCallback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPendingOpenSessionCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)transportReady
{
  return self->_transportReady;
}

- (void)setTransportReady:(BOOL)a3
{
  self->_transportReady = a3;
}

- (BOOL)didBulkSendFail
{
  return self->_didBulkSendFail;
}

- (void)setDidBulkSendFail:(BOOL)a3
{
  self->_didBulkSendFail = a3;
}

- (BOOL)didBulkSendComplete
{
  return self->_didBulkSendComplete;
}

- (void)setDidBulkSendComplete:(BOOL)a3
{
  self->_didBulkSendComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingOpenSessionCallback, 0);
  objc_storeStrong((id *)&self->_currentBulkSendSession, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__HMDAccessoryDataStreamAdapter_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory:%@ closed data stream", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryDidClose");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v13 = 138543874;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Accessory Closed Data Stream, expected accessory: %@ actual accessory: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __60__HMDAccessoryDataStreamAdapter_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory:%@ started listening", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setTransportReady:", 1);
    objc_msgSend(*(id *)(a1 + 32), "pendingOpenSessionCallback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling pending start bulk send session request", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 32), "_openSession");
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Accessory start listening failed, expected accessory: %@ actual accessory: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __80__HMDAccessoryDataStreamAdapter_callPendingOpenSessionCallbackWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pendingOpenSessionCallback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_callPendingOpenSessionCallbackWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Pending open session callback was unexpectedly nil", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __45__HMDAccessoryDataStreamAdapter__openSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "callPendingOpenSessionCallbackWithResult:error:", v6, v5);

}

void __41__HMDAccessoryDataStreamAdapter_readData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "_bulkSendDidFail");
      goto LABEL_6;
    }
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Diagnostics transfer read data channel has error:(%@)", (uint8_t *)&v20, 0x16u);
LABEL_4:

    goto LABEL_5;
  }
  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "_handleFrame:", v5) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v19;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received data frame is not accepted for accessory:%@", (uint8_t *)&v20, 0x16u);

    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentBulkSendSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isActive");

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "readData");
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Diagnostics data transfer is completed for accessory:%@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "_bulkSendDidComplete");
  }
LABEL_6:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_40006 != -1)
    dispatch_once(&logCategory__hmf_once_t14_40006, &__block_literal_global_40007);
  return (id)logCategory__hmf_once_v15_40008;
}

void __44__HMDAccessoryDataStreamAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v15_40008;
  logCategory__hmf_once_v15_40008 = v0;

}

@end
