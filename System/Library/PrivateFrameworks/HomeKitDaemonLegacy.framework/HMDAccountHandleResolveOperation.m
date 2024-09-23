@implementation HMDAccountHandleResolveOperation

- (HMDAccountHandleResolveOperation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccountHandleResolveOperation)initWithTimeout:(double)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (HMDAccountHandleResolveOperation)initWithQualityOfService:(int64_t)a3 timeout:(double)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ is unavailable"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (HMDAccountHandleResolveOperation)initWithHandle:(id)a3
{
  id v4;
  void *v5;
  HMDAccountHandleResolveOperation *v6;
  uint64_t v7;
  HMDAccountHandle *handle;
  uint64_t v9;
  NSMutableArray *resolveBlocks;
  void *v11;
  uint64_t v12;
  HMDIDSService *service;
  HMDIDSService *v14;
  void *v15;
  HMDAccountHandleResolveOperation *result;
  HMDAccountHandleResolveOperation *v17;
  SEL v18;
  objc_super v19;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    +[HMDAccountHandleResolveOperation timeout](HMDAccountHandleResolveOperation, "timeout");
    v19.receiver = self;
    v19.super_class = (Class)HMDAccountHandleResolveOperation;
    v6 = -[HMFOperation initWithTimeout:](&v19, sel_initWithTimeout_);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      handle = v6->_handle;
      v6->_handle = (HMDAccountHandle *)v7;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      resolveBlocks = v6->_resolveBlocks;
      v6->_resolveBlocks = (NSMutableArray *)v9;

      +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "service");
      v12 = objc_claimAutoreleasedReturnValue();
      service = v6->_service;
      v6->_service = (HMDIDSService *)v12;

      v14 = v6->_service;
      -[HMFOperation underlyingQueue](v6, "underlyingQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDIDSService addDelegate:queue:](v14, "addDelegate:queue:", v6, v15);

    }
    return v6;
  }
  else
  {
    v17 = (HMDAccountHandleResolveOperation *)_HMFPreconditionFailure();
    -[HMDAccountHandleResolveOperation main](v17, v18);
  }
  return result;
}

- (void)main
{
  void *v3;
  HMDAccountHandleResolveOperation *v4;
  NSObject *v5;
  void *v6;
  HMDRemoteAccountMessageDestination *v7;
  void *v8;
  void *v9;
  HMDRemoteAccountMessageDestination *v10;
  HMDRemoteMessage *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  HMDAccountHandleResolveOperation *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDIDSMessageContext *v35;
  void *v36;
  HMDIDSMessageContext *v37;
  void *v38;
  void *v39;
  HMDAccountHandleResolveOperation *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  HMDRemoteAccountMessageDestination *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  const __CFString *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v55 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = [HMDRemoteAccountMessageDestination alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccountHandleResolveOperation handle](v4, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v7, "initWithTarget:handle:multicast:", v8, v9, 1);

  v11 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("kPingInternalRequestKey"), -1, v10, 0, 0, 0, 0.0);
  v49 = 0;
  +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v11, &v49);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v49;
  v14 = v13;
  if (v12)
  {
    v45 = v10;
    v46 = v13;
    v52[0] = *MEMORY[0x1E0D341C8];
    v15 = (void *)MEMORY[0x1E0CB37E8];
    +[HMDAccountHandleResolveOperation timeout](HMDAccountHandleResolveOperation, "timeout");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = *MEMORY[0x1E0D34160];
    v53[0] = v16;
    v53[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccountHandleResolveOperation service](v4, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    -[HMDAccountHandleResolveOperation handle](v4, "handle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "remoteDestinationString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = 0;
    v23 = objc_msgSend(v18, "sendMessage:toDestinations:priority:options:identifier:error:", v12, v22, 300, v17, &v48, &v47);
    v24 = v48;
    v44 = v47;

    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v4;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v23 & 1) != 0)
    {
      v29 = v24;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v30;
        v56 = 2112;
        v57 = v24;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Started resolve with identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", v11, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "submitLogEvent:", v32);

      v50 = CFSTR("transactionID");
      -[HMDRemoteMessage transactionIdentifier](v11, "transactionIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = [HMDIDSMessageContext alloc];
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v24);
      v10 = v45;
      v37 = -[HMDIDSMessageContext initWithIdentifier:destination:userInfo:](v35, "initWithIdentifier:destination:userInfo:", v36, v45, v34);
      -[HMDAccountHandleResolveOperation setMessageContext:](v26, "setMessageContext:", v37);

      v38 = v44;
    }
    else
    {
      v38 = v44;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v43;
        v56 = 2112;
        v57 = v44;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to send message with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, 0, 0, 0, v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      __callResolveBlocks(v26, 0, v34);
      -[HMFOperation cancelWithError:](v26, "cancelWithError:", v34);
      v29 = v24;
      v10 = v45;
    }

    v14 = v46;
  }
  else
  {
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = v4;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v42;
      v56 = 2112;
      v57 = v14;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize message with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", -1, 0, 0, 0, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __callResolveBlocks(v40, 0, v17);
    -[HMFOperation cancelWithError:](v40, "cancelWithError:", v17);
  }

}

- (void)addResolveBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMFOperation underlyingQueue](self, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAccountHandleResolveOperation_addResolveBlock___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccountHandleResolveOperation handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDAccountHandleResolveOperation *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v10 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (-[HMFOperation isExecuting](self, "isExecuting"))
  {
    -[HMDAccountHandleResolveOperation messageContext](self, "messageContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hmf_isEqualToUUIDString:", v16);

    if (v21)
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v10)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v26;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Confirmed resolve sent successfully", (uint8_t *)&v29, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v27;
          v31 = 2112;
          v32 = v17;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send message to server with error: %@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, 0, 0, 0, v17);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        __callResolveBlocks(v23, 0, v28);
        -[HMFOperation cancelWithError:](v23, "cancelWithError:", v28);

      }
    }
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMDAccountHandleResolveOperation *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  HMDRemoteMessageSenderContext *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAccountHandleResolveOperation *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDAccountHandleResolveOperation *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (-[HMFOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kIDSMessageNameKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("kPingInternalRequestKey")))
    {
      -[HMDAccountHandleResolveOperation messageContext](self, "messageContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmf_UUIDForKey:", CFSTR("transactionID"));
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)v20;
      if ((objc_msgSend(v21, "hmf_isEqualToUUID:", v20) & 1) != 0)
      {
        +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v15);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v15);
        v22 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v22;
        if (v22)
        {
          v23 = (void *)v22;
          v47 = v21;
          -[HMDAccountHandleResolveOperation handle](self, "handle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqual:", v24);

          v26 = (void *)MEMORY[0x1D17BA0A0]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
          if ((v25 & 1) != 0)
          {
            if (v29)
            {
              HMFGetLogIdentifier();
              v30 = v26;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v31;
              v55 = 2112;
              v56 = v50;
              _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Received response from: %@", buf, 0x16u);

              v26 = v30;
            }

            objc_autoreleasePoolPop(v26);
            +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v16);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v50, v49, v46, 0, 0);
            +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "accountForSenderContext:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            __callResolveBlocks(v27, v34, 0);
            -[HMFOperation finish](v27, "finish");

          }
          else
          {
            if (v29)
            {
              HMFGetLogIdentifier();
              v44 = v26;
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v45;
              v55 = 2112;
              v56 = v50;
              _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Ignoring response from unsupported device: %@", buf, 0x16u);

              v26 = v44;
            }

            objc_autoreleasePoolPop(v26);
          }
          v21 = v47;
        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = v21;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v43;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Failed to parse sender account handle", buf, 0xCu);

            v21 = v48;
          }

          objc_autoreleasePoolPop(v40);
        }

      }
      else
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v51 = v35;
          v38 = v21;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v54 = v39;
          v55 = 2112;
          v56 = v38;
          v57 = 2112;
          v58 = v52;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring message with transaction ID: %@, expected %@", buf, 0x20u);

          v21 = v38;
          v35 = v51;
        }

        objc_autoreleasePoolPop(v35);
      }

    }
  }

}

- (HMDAccountHandle)handle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 312, 1);
}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 320, 1);
}

- (HMDIDSMessageContext)messageContext
{
  return self->_messageContext;
}

- (void)setMessageContext:(id)a3
{
  objc_storeStrong((id *)&self->_messageContext, a3);
}

- (NSMutableArray)resolveBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveBlocks, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

void __52__HMDAccountHandleResolveOperation_addResolveBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveBlocks");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = _Block_copy(v2);
    objc_msgSend(v4, "addObject:", v3);

  }
}

+ (double)timeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("accountResolutionTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = 65.0;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_50868 != -1)
    dispatch_once(&logCategory__hmf_once_t4_50868, &__block_literal_global_50869);
  return (id)logCategory__hmf_once_v5_50870;
}

void __47__HMDAccountHandleResolveOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_50870;
  logCategory__hmf_once_v5_50870 = v0;

}

@end
