@implementation HAPPairSetupSession

- (HAPPairSetupSession)init
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

- (HAPPairSetupSession)initWithRole:(int64_t)a3 pairSetupType:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id *v9;
  void *v10;
  HAPPairSetupSession *v11;
  NSObject *v12;
  void *v13;
  HAPPairSetupSession *v14;
  id v15;
  HAPPairSetupSession *v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *clientQueue;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        v15 = 0;
LABEL_11:
        objc_msgSend(v8, "conformsToProtocol:", v15);
        if ((objc_msgSend(v8, "conformsToProtocol:", v15) & 1) != 0)
        {
          v28.receiver = self;
          v28.super_class = (Class)HAPPairSetupSession;
          v16 = -[HAPPairSetupSession init](&v28, sel_init);
          v11 = v16;
          if (!v16)
            goto LABEL_14;
          v17 = (const char *)HAPDispatchQueueName(v16, 0);
          dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = dispatch_queue_create(v17, v18);
          clientQueue = v11->_clientQueue;
          v11->_clientQueue = (OS_dispatch_queue *)v19;

          v11->_role = a3;
          v11->_handlingInvalidSetupCode = 0;
          v11->_pairSetupType = a4;
          objc_storeWeak((id *)&v11->_delegate, v8);
          if (-[HAPPairSetupSession _initializeSession](v11, "_initializeSession"))
          {
LABEL_14:
            v11 = v11;
            v14 = v11;
LABEL_23:

            goto LABEL_24;
          }
        }
        else
        {
          v21 = (void *)MEMORY[0x1D17B7244]();
          v11 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            v25 = CFSTR("unknown");
            if (a3 == 1)
              v25 = CFSTR("server");
            if (!a3)
              v25 = CFSTR("client");
            *(_DWORD *)buf = 138543618;
            v30 = v23;
            v31 = 2112;
            v32 = v25;
            v26 = v25;
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Delegate must conform to the %@ delegate", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v21);
        }
        v14 = 0;
        goto LABEL_23;
      }
      v9 = (id *)&protocolRef_HAPPairSetupSessionServerDelegate;
    }
    else
    {
      v9 = (id *)&protocolRef_HAPPairSetupSessionClientDelegate;
    }
    v15 = *v9;
    goto LABEL_11;
  }
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = (uint64_t)v13;
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  v14 = 0;
LABEL_24:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[HAPPairSetupSession _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HAPPairSetupSession;
  -[HAPPairSetupSession dealloc](&v3, sel_dealloc);
}

- (void)_invalidate
{
  PairingSessionPrivate *pairingSession;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HAPPairSetupSession shortDescription](self, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E894EFE8;
  }
  v8 = -[HAPPairSetupSession role](self, "role");
  v9 = CFSTR("unknown");
  v10 = CFSTR("server");
  if (v8 != 1)
    v10 = CFSTR("unknown");
  if (!v8)
    v10 = CFSTR("client");
  v11 = v10;
  v12 = -[HAPPairSetupSession state](self, "state");
  if (v12 <= 2)
    v9 = off_1E894BEE8[v12];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Role = %@, State = %@, Type: %tu>"), v6, v7, v11, v9, -[HAPPairSetupSession pairSetupType](self, "pairSetupType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v13;
}

- (NSString)debugDescription
{
  return (NSString *)-[HAPPairSetupSession descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[HAPPairSetupSession descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)_initializeSession
{
  int v3;
  void *v4;
  HAPPairSetupSession *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HAPPairSetupSession role](self, "role");
  -[HAPPairSetupSession role](self, "role");
  v3 = PairingSessionCreate();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HAPPairSetupSession setSessionReadKey:](self, "setSessionReadKey:", 0);
    -[HAPPairSetupSession setSessionWriteKey:](self, "setSessionWriteKey:", 0);
    -[HAPPairSetupSession setSessionReadNonce:](self, "setSessionReadNonce:", 0);
    -[HAPPairSetupSession setSessionWriteNonce:](self, "setSessionWriteNonce:", 0);
    if (-[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 1
      || -[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 3
      || -[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 4
      || -[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 6
      || -[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 5
      || -[HAPPairSetupSession pairSetupType](self, "pairSetupType") == 7)
    {
      -[HAPPairSetupSession pairingSession](self, "pairingSession");
      PairingSessionSetFlags();
    }
    -[HAPPairSetupSession pairingSession](self, "pairingSession");
    PairingSessionSetEventHandler();
  }
  return v3 == 0;
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  void *v5;
  HAPPairSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HAPPairSetupSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HAPPairSetupSession *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17B7244](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request for local pairing identity", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HAPPairSetupSession delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v22 = 0;
    objc_msgSend(v9, "pairSetupSession:didReceiveLocalPairingIdentityRequestWithError:", v6, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    if (!v11)
    {
      v13 = (void *)MEMORY[0x1D17B7244]();
      v14 = v6;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retrieve the local pairing identity with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      if (a3)
        *a3 = -6727;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local pairing identity, the delegate is missing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v11 = 0;
    if (a3)
      *a3 = -6705;
  }

  return v11;
}

- (void)_initiateClientPairSetupExchange
{
  void *v3;
  HAPPairSetupSession *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Sending initial client exchange", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPPairSetupSession _processSetupExchangeData:error:](v4, "_processSetupExchangeData:error:", 0, 0);
}

- (void)_initializeServer
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

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HAPPairSetupSession *v14;

  v6 = a3;
  v7 = a4;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HAPPairSetupSession_receivedSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  HAPPairSetupSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HAPPairSetupSession *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  HAPPairSetupSession *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (-[HAPPairSetupSession state](self, "state") != 1)
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HAPPairSetupSession state](v13, "state");
      if (v16 > 2)
        v17 = CFSTR("unknown");
      else
        v17 = off_1E894BEE8[v16];
      *(_DWORD *)buf = 138543618;
      v34 = v15;
      v35 = 2112;
      v36 = v17;
      v20 = "%{public}@Unable to handle setup exchange data in state '%@'";
      v21 = v14;
      v22 = OS_LOG_TYPE_DEFAULT;
      v23 = 22;
      goto LABEL_15;
    }
LABEL_16:

    objc_autoreleasePoolPop(v12);
    goto LABEL_17;
  }
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v11;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Closing session due to exchange error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HAPPairSetupSession _stopWithError:](v9, "_stopWithError:", v7);
    goto LABEL_17;
  }
  -[HAPPairSetupSession pairingSession](self, "pairingSession");
  v18 = objc_retainAutorelease(v6);
  objc_msgSend(v18, "bytes");
  objc_msgSend(v18, "length");
  v19 = PairingSessionExchange();
  if ((_DWORD)v19)
  {
    if ((_DWORD)v19 == -6771)
    {
      v12 = (void *)MEMORY[0x1D17B7244]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v15;
        v20 = "%{public}@The session is waiting for a client to handle an operation";
        v21 = v14;
        v22 = OS_LOG_TYPE_INFO;
        v23 = 12;
LABEL_15:
        _os_log_impl(&dword_1CCE01000, v21, v22, v20, buf, v23);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Failed to process exchange data"), 0, 0, v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1D17B7244]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v30;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to process exchange data with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    -[HAPPairSetupSession _stopWithError:](v28, "_stopWithError:", v26);

  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", 0, 0);
  if (objc_msgSend(v31, "length"))
  {
    -[HAPPairSetupSession delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pairSetupSession:didReceiveSetupExchangeData:", self, v31);

  }
LABEL_17:

}

- (void)_handlePairSetupExchangeComplete
{
  void *v3;
  HAPPairSetupSession *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Pair setup session did complete successfully", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPPairSetupSession _stopWithError:](v4, "_stopWithError:", 0);
}

- (void)handleSetupCodeRequest
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_processSetupCode:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPPairSetupSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  HAPPairSetupSession *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HAPPairSetupSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v11;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get setup code with error: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Pair Setup failed."), CFSTR("An error occurred getting the setup code."), 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPPairSetupSession _stopWithError:](v9, "_stopWithError:", v12);
LABEL_5:

    goto LABEL_17;
  }
  -[HAPPairSetupSession setHandlingInvalidSetupCode:](self, "setHandlingInvalidSetupCode:", 0);
  v13 = +[HAPPairSetupSession isValidSetupCode:](HAPPairSetupSession, "isValidSetupCode:", v6);
  v14 = (void *)MEMORY[0x1D17B7244]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v18;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Processing received setup code: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HAPPairSetupSession pairingSession](v15, "pairingSession");
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v19 = PairingSessionSetSetupCode();
    if (!(_DWORD)v19)
    {
      -[HAPPairSetupSession _processSetupExchangeData:error:](v15, "_processSetupExchangeData:error:", 0, 0);
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1D17B7244]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v23;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set setup code with error: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Pair Setup failed."), CFSTR("Failed to handle setup code."), 0, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPPairSetupSession _stopWithError:](v21, "_stopWithError:", v24);

    goto LABEL_5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v25;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received invalid setup code '%@'", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HAPPairSetupSession handleInvalidSetupCodeAndRestart:](v15, "handleInvalidSetupCodeAndRestart:", 0);
  -[HAPPairSetupSession handleSetupCodeRequest](v15, "handleSetupCodeRequest");
LABEL_17:

}

- (void)handleInvalidSetupCodeAndRestart:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HAPPairSetupSession_handleInvalidSetupCodeAndRestart___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)handleBackoffRequestWithTimeout:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HAPPairSetupSession_handleBackoffRequestWithTimeout___block_invoke;
  v6[3] = &unk_1E894D3B0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_handleBackoffExpiration
{
  void *v3;
  HAPPairSetupSession *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@The Pair Setup backoff did expire, requesting setup code", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPPairSetupSession setBackoffTimer:](v4, "setBackoffTimer:", 0);
  -[HAPPairSetupSession handleSetupCodeRequest](v4, "handleSetupCodeRequest");
}

- (BOOL)handleSavePeerRequestWithPeerIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  HAPPairSetupSession *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  void *v16;
  HAPPairSetupSession *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Received request to save peer '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPPairSetupSession delegate](v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v24 = 0;
    v13 = objc_msgSend(v11, "pairSetupSession:didPairWithPeer:error:", v8, v6, &v24);
    v14 = v24;
    if ((v13 & 1) != 0)
    {
      v15 = 1;
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1D17B7244]();
    v17 = v8;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to save the peer with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = v8;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to save the peer, the delegate is missing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to save peer"), CFSTR("The delegate is mising"), 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HAPPairSetupSession stopWithError:](v17, "stopWithError:", v14);
  if (a4)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    *a4 = v14;
  }
  else
  {
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (id)_showSetupCodeWithError:(id *)a3
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

- (void)_handleProductData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HAPPairSetupSession *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPPairSetupSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA40CD8) & 1) != 0)
  {
    -[HAPPairSetupSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "pairSetupSession:didReceiveProductData:", self, v4);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle product data, the delegate is missing", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v6 = 0;
LABEL_9:

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__HAPPairSetupSession_start__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stop
{
  -[HAPPairSetupSession stopWithError:](self, "stopWithError:", 0);
}

- (void)stopWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HAPPairSetupSession_stopWithError___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_stopWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  const void *v9;
  void *v10;
  HAPPairSetupSession *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v8 = 0;
    if (-[HAPPairSetupSession pairSetupType](self, "pairSetupType") != 5)
      v8 = -[HAPPairSetupSession pairSetupType](self, "pairSetupType") != 6;
    if (-[HAPPairSetupSession pairingSession](self, "pairingSession") && !v8)
    {
      -[HAPPairSetupSession pairingSession](self, "pairingSession");
      v9 = (const void *)PairingSessionCopyProperty();
      v10 = (void *)MEMORY[0x1D17B7244]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v13;
        v16 = 1024;
        v17 = 0;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Pair Setup completed with err: %d,  MFi Cert %@", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v10);
      if (v9)
      {
        -[HAPPairSetupSession setCertificate:](v11, "setCertificate:", v9);
        CFRelease(v9);
      }
    }
  }
  -[HAPPairSetupSession setHandlingInvalidSetupCode:](self, "setHandlingInvalidSetupCode:", 0);
  if (-[HAPPairSetupSession pairSetupType](self, "pairSetupType") != 3)
    -[HAPPairSetupSession _invalidate](self, "_invalidate");
  -[HAPPairSetupSession setState:](self, "setState:", 2);
  -[HAPPairSetupSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HAPPairSetupSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairSetupSession:didStopWithError:", self, v4);

  }
}

- (void)generateSessionKeys
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HAPPairSetupSession_generateSessionKeys__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)getCertificate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14169;
  v11 = __Block_byref_object_dispose__14170;
  v12 = 0;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__HAPPairSetupSession_getCertificate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)isSecureSession
{
  HAPPairSetupSession *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__HAPPairSetupSession_isSecureSession__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__14169;
    v28 = __Block_byref_object_dispose__14170;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__14169;
    v22 = __Block_byref_object_dispose__14170;
    v23 = 0;
    -[HAPPairSetupSession clientQueue](self, "clientQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__HAPPairSetupSession_encryptData_additionalAuthenticatedData_error___block_invoke;
    block[3] = &unk_1E894BEA8;
    block[4] = self;
    v16 = &v18;
    v17 = &v24;
    v14 = v8;
    v15 = v9;
    dispatch_sync(v10, block);

    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
    v11 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  HAPPairSetupSession *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD block[5];
  id v19;
  id v20;
  uint64_t *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend(v8, "length") <= 0xF)
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v8, "length");
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@The encrypted data has an invalid length of %tu bytes", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6743, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v15 = 0;
      *a5 = v14;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__14169;
  v31 = __Block_byref_object_dispose__14170;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14169;
  v27 = __Block_byref_object_dispose__14170;
  v28 = 0;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HAPPairSetupSession_decryptData_additionalAuthenticatedData_error___block_invoke;
  block[3] = &unk_1E894BEA8;
  block[4] = self;
  v21 = &v23;
  v19 = v8;
  v22 = buf;
  v20 = v9;
  dispatch_sync(v16, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  v15 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v15;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HAPPairSetupSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAPPairSetupSession backoffTimer](self, "backoffTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HAPPairSetupSession _handleBackoffExpiration](self, "_handleBackoffExpiration");
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  -[HAPPairSetupSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HAPPairSetupSession state](self, "state");
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E894BEE8[v9];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPPairSetupSession pairSetupType](self, "pairSetupType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@(%@ %@)"), v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HAPPairSetupSessionDelegate)delegate
{
  return (HAPPairSetupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (HMFTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (BOOL)isHandlingInvalidSetupCode
{
  return self->_handlingInvalidSetupCode;
}

- (void)setHandlingInvalidSetupCode:(BOOL)a3
{
  self->_handlingInvalidSetupCode = a3;
}

- (unint64_t)pairSetupType
{
  return self->_pairSetupType;
}

- (void)setPairSetupType:(unint64_t)a3
{
  self->_pairSetupType = a3;
}

- (NSData)sessionReadKey
{
  return self->_sessionReadKey;
}

- (void)setSessionReadKey:(id)a3
{
  objc_storeStrong((id *)&self->_sessionReadKey, a3);
}

- (NSData)sessionWriteKey
{
  return self->_sessionWriteKey;
}

- (void)setSessionWriteKey:(id)a3
{
  objc_storeStrong((id *)&self->_sessionWriteKey, a3);
}

- (NSMutableData)sessionReadNonce
{
  return self->_sessionReadNonce;
}

- (void)setSessionReadNonce:(id)a3
{
  objc_storeStrong((id *)&self->_sessionReadNonce, a3);
}

- (NSMutableData)sessionWriteNonce
{
  return self->_sessionWriteNonce;
}

- (void)setSessionWriteNonce:(id)a3
{
  objc_storeStrong((id *)&self->_sessionWriteNonce, a3);
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_sessionWriteNonce, 0);
  objc_storeStrong((id *)&self->_sessionReadNonce, 0);
  objc_storeStrong((id *)&self->_sessionWriteKey, 0);
  objc_storeStrong((id *)&self->_sessionReadKey, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__HAPPairSetupSession_decryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  _BYTE *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "sessionReadKey"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", objc_msgSend(*(id *)(a1 + 40), "length") - 16, 16);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", 0, objc_msgSend(*(id *)(a1 + 40), "length") - 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v5, "length"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "sessionReadKey");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "bytes");
    objc_msgSend(*(id *)(a1 + 32), "sessionReadNonce");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "bytes");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
    objc_msgSend(*(id *)(a1 + 48), "length");
    v11 = objc_retainAutorelease(v5);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)), "mutableBytes");
    v33 = objc_retainAutorelease(v32);
    objc_msgSend(v33, "bytes");
    v12 = chacha20_poly1305_decrypt_all_64x64();

    objc_msgSend(*(id *)(a1 + 32), "sessionReadNonce");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (_BYTE *)objc_msgSend(v13, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "sessionReadNonce");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    if (v16)
    {
      v17 = v16 - 1;
      do
      {
        if (++*v14++)
          v19 = 1;
        else
          v19 = v17 == 0;
        --v17;
      }
      while (!v19);
    }

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v12, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionReadKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v26;
      v36 = 2112;
      v37 = v27;
      v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil Session keys: readKey: %@, writeKey: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6709, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
}

void __69__HAPPairSetupSession_encryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _BYTE *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "sessionReadKey"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(*(id *)(a1 + 40), "length"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "bytes");
    objc_msgSend(*(id *)(a1 + 32), "sessionWriteNonce");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "bytes");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
    objc_msgSend(*(id *)(a1 + 48), "length");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
    objc_msgSend(*(id *)(a1 + 40), "length");
    objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)), "mutableBytes");
    chacha20_poly1305_encrypt_all_64x64();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "appendBytes:length:", &v26, 16);
    objc_msgSend(*(id *)(a1 + 32), "sessionWriteNonce");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (_BYTE *)objc_msgSend(v10, "mutableBytes");
    objc_msgSend(*(id *)(a1 + 32), "sessionWriteNonce");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    if (v13)
    {
      v14 = v13 - 1;
      do
      {
        if (++*v11++)
          v16 = 1;
        else
          v16 = v14 == 0;
        --v14;
      }
      while (!v16);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionReadKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil Session keys: readKey: %@, writeKey: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6709, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

  }
}

void __38__HAPPairSetupSession_isSecureSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "sessionReadKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37__HAPPairSetupSession_getCertificate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "certificate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__HAPPairSetupSession_generateSessionKeys__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[8];
  _BYTE __s[8];
  _BYTE v29[32];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Split pair setup done.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "pairingSession");
  if (PairingSessionDeriveKey()
    || (objc_msgSend(*(id *)(a1 + 32), "pairingSession"), PairingSessionDeriveKey()))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 6, CFSTR("Failed to generate session keys"), 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", v6);

  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSessionReadKey:", v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionWriteKey:", v10);

    memset_s(__s, 8uLL, 0, 8uLL);
    memset_s(v27, 8uLL, 0, 8uLL);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", __s, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSessionReadNonce:", v12);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v27, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSessionWriteNonce:", v14);

    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionReadKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionWriteKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Generated read key: %@, write key: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }
}

uint64_t __37__HAPPairSetupSession_stopWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", *(_QWORD *)(a1 + 40));
}

void __28__HAPPairSetupSession_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("A delegate is required for this session."), 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", v3);

LABEL_9:
    v5 = v6;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "role");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_initializeServer");
  }
  else if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_initiateClientPairSetupExchange");
  }
  v4 = objc_opt_respondsToSelector();
  v5 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "pairSetupSessionDidStart:", *(_QWORD *)(a1 + 32));
    goto LABEL_9;
  }
LABEL_10:

}

void __55__HAPPairSetupSession_handleBackoffRequestWithTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v19 = 138543618;
    v20 = v5;
    v21 = 2048;
    v22 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Peer requested a backoff of %g seconds", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFA40CD8))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v8, "pairSetupSession:didReceiveBackoffRequestWithTimeInterval:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40)))
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Client requested that no backoff be performed, requesting setup code", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "handleSetupCodeRequest");
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting Pair Setup backoff timer", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, *(double *)(a1 + 40));
    objc_msgSend(v13, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v14);

    objc_msgSend(*(id *)(a1 + 32), "setBackoffTimer:", v13);
    objc_msgSend(v13, "resume");

  }
}

void __56__HAPPairSetupSession_handleInvalidSetupCodeAndRestart___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@The Pair Setup session received an invalid setup code", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA40CD8))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "pairSetupSessionDidReceiveInvalidSetupCode:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setHandlingInvalidSetupCode:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_processSetupExchangeData:error:", 0, 0);
  }

}

void __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EFA40CD8) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v3, "pairSetupSession:didReceiveSetupCodeRequestWithCompletionHandler:");
      goto LABEL_8;
    }
  }
  else
  {

  }
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to request setup code, invalid delegate.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to request setup code."), CFSTR("The delegate is missing."), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stopWithError:", v3);
LABEL_8:

}

void __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_3;
  block[3] = &unk_1E894E120;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __45__HAPPairSetupSession_handleSetupCodeRequest__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processSetupCode:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__HAPPairSetupSession_receivedSetupExchangeData_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    v3 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling setup exchange data", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 48), "_processSetupExchangeData:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid setup exchange data: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Exchange data or an error is required"), 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_stopWithError:", v11);

  }
}

+ (void)initialize
{
  void *v2;

  v2 = (void *)_denylistedSetupCodes;
  _denylistedSetupCodes = (uint64_t)&unk_1E8989B70;

}

+ (BOOL)isValidSetupCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[0-9]{3}-[0-9]{2}-[0-9]{3}$"), 0, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D17B7244]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create setup code regex with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 1)
  {
LABEL_7:
    LOBYTE(v7) = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend((id)_denylistedSetupCodes, "containsObject:", v4) ^ 1;
LABEL_8:

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40 != -1)
    dispatch_once(&logCategory__hmf_once_t40, &__block_literal_global_14263);
  return (id)logCategory__hmf_once_v41;
}

void __34__HAPPairSetupSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v41;
  logCategory__hmf_once_v41 = v0;

}

@end
