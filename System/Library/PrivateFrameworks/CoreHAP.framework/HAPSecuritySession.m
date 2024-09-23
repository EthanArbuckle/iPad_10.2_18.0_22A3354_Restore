@implementation HAPSecuritySession

- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  HAPSecuritySession *v9;
  HAPSecuritySession *v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  HAPSecuritySessionEncryption *v15;
  HAPSecuritySessionEncryption *encryption;
  HAPSecuritySession *v17;
  HAPSecuritySession *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)HAPSecuritySession;
    v9 = -[HAPSecuritySession init](&v23, sel_init);
    v10 = v9;
    if (v9)
    {
      v11 = (const char *)HAPDispatchQueueName(v9, 0);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create(v11, v12);
      queue = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v13;

      objc_storeWeak((id *)&v10->_delegate, v8);
      v10->_role = a3;
      v15 = objc_alloc_init(HAPSecuritySessionEncryption);
      encryption = v10->_encryption;
      v10->_encryption = v15;

      -[HAPSecuritySession _initializeSetupSession:](v10, "_initializeSetupSession:", a4);
      v10->_state = 0;
    }
    v17 = v10;
    v18 = v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v17 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  HAPSecuritySession *v2;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v4;
  objc_super v5;

  v2 = self;
  pairingSession = v2->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    v2->_pairingSession = 0;
  }
  v4 = objc_alloc_init(HAPSecuritySessionEncryption);
  -[HAPSecuritySession setEncryption:](v2, "setEncryption:", v4);

  v2->_resumeSessionID = 0;
  v5.receiver = v2;
  v5.super_class = (Class)HAPSecuritySession;
  -[HAPSecuritySession dealloc](&v5, sel_dealloc);
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSData)broadcastKey
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_broadcastKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBroadcastKey:(id)a3
{
  NSData *v4;
  NSData *broadcastKey;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  broadcastKey = self->_broadcastKey;
  self->_broadcastKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)additionalDerivedKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_additionalDerivedKeys;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAdditionalDerivedKeys:(id)a3
{
  NSDictionary *v4;
  NSDictionary *additionalDerivedKeys;

  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  additionalDerivedKeys = self->_additionalDerivedKeys;
  self->_additionalDerivedKeys = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)resumeSessionID
{
  os_unfair_lock_s *p_lock;
  unint64_t resumeSessionID;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  resumeSessionID = self->_resumeSessionID;
  os_unfair_lock_unlock(p_lock);
  return resumeSessionID;
}

- (void)setResumeSessionID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_resumeSessionID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isOpen
{
  return -[HAPSecuritySession state](self, "state") == 2;
}

- (BOOL)isOpening
{
  return -[HAPSecuritySession state](self, "state") == 1;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[HAPSecuritySession role](self, "role");
  v6 = CFSTR("unknown");
  v7 = CFSTR("server");
  if (v5 != 1)
    v7 = CFSTR("unknown");
  if (!v5)
    v7 = CFSTR("client");
  v8 = v7;
  v9 = -[HAPSecuritySession state](self, "state");
  if (v9 <= 3)
    v6 = off_1E8949EB8[v9];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, Role = %@, State = %@>"), v4, self, v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[HAPSecuritySession role](self, "role");
  v6 = CFSTR("unknown");
  v7 = CFSTR("server");
  if (v5 != 1)
    v7 = CFSTR("unknown");
  if (!v5)
    v7 = CFSTR("client");
  v8 = v7;
  v9 = -[HAPSecuritySession state](self, "state");
  if (v9 <= 3)
    v6 = off_1E8949EB8[v9];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Role = %@, State = %@>"), v4, v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)_initializeSetupSession:(unint64_t)a3
{
  HAPSecuritySession *v4;
  PairingSessionPrivate **p_pairingSession;
  PairingSessionPrivate *pairingSession;
  int v7;
  int v8;
  void *v9;
  HAPSecuritySession *v10;
  NSObject *v11;
  void *v12;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v4 = self;
  v21 = *MEMORY[0x1E0C80C00];
  p_pairingSession = &self->_pairingSession;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    *p_pairingSession = 0;
  }
  if (a3)
  {
    -[HAPSecuritySession role](v4, "role");
    if (!PairingSessionCreate())
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      v4 = v4;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v16;
        v19 = 2048;
        v20 = a3;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Created pairing session with resumeSessionID: %llu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      PairingSessionSetResumeInfo();
      goto LABEL_12;
    }
  }
  -[HAPSecuritySession role](v4, "role");
  v7 = PairingSessionCreate();
  if (!v7)
  {
LABEL_12:
    -[HAPSecuritySession pairingSession](v4, "pairingSession");
    PairingSessionSetFlags();
    return 1;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = v4;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  return 0;
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  void *v5;
  HAPSecuritySession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HAPSecuritySession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HAPSecuritySession *v18;
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
  -[HAPSecuritySession delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v22 = 0;
    objc_msgSend(v9, "securitySession:didReceiveLocalPairingIdentityRequestWithError:", v6, &v22);
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
      -[HAPSecuritySession closeWithError:](v14, "closeWithError:", v12);
LABEL_14:
      v11 = 0;
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to get local pairing identity."), CFSTR("The delegate is missing."), 0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[HAPSecuritySession closeWithError:](v18, "closeWithError:", v12);
    if (!a3)
      goto LABEL_14;
    v11 = 0;
    *a3 = -6705;
  }

  return v11;
}

- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4
{
  id v6;
  void *v7;
  HAPSecuritySession *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HAPSecuritySession *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HAPSecuritySession *v20;
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
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Received request for peer pairing identity with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HAPSecuritySession delegate](v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v24 = 0;
    objc_msgSend(v11, "securitySession:didReceiveRequestForPeerPairingIdentityWithIdentifier:error:", v8, v6, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = v8;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retrieve the peer pairing identity with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      if (a4)
        *a4 = -6727;
      -[HAPSecuritySession closeWithError:](v16, "closeWithError:", v14);
LABEL_14:
      v13 = 0;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    v20 = v8;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer pairing identity, the delegate is missing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to get peer pairing identity."), CFSTR("The delegate is missing."), 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HAPSecuritySession closeWithError:](v20, "closeWithError:", v14);
    if (!a4)
      goto LABEL_14;
    v13 = 0;
    *a4 = -6705;
  }

  return v13;
}

- (void)_initiateClientSessionSetupExchange
{
  void *v3;
  HAPSecuritySession *v4;
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
  -[HAPSecuritySession _notifyOpening](v4, "_notifyOpening");
  -[HAPSecuritySession _processSetupExchangeData:error:](v4, "_processSetupExchangeData:error:", 0, 0);
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
  HAPSecuritySession *v14;

  v6 = a3;
  v7 = a4;
  -[HAPSecuritySession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HAPSecuritySession_receivedSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E894E120;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
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
  -[HAPSecuritySession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HAPSecuritySession__processSetupExchangeData_error___block_invoke;
  block[3] = &unk_1E894E120;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)_inputInfo
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;

  v2 = -[HAPSecuritySession role](self, "role");
  if (v2 == (void *)1)
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    v4 = "Control-Write-Encryption-Key";
    v5 = 28;
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    v4 = "Control-Read-Encryption-Key";
    v5 = 27;
LABEL_5:
    objc_msgSend(v3, "dataWithBytes:length:", v4, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_outputInfo
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;

  v2 = -[HAPSecuritySession role](self, "role");
  if (v2 == (void *)1)
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    v4 = "Control-Read-Encryption-Key";
    v5 = 27;
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    v4 = "Control-Write-Encryption-Key";
    v5 = 28;
LABEL_5:
    objc_msgSend(v3, "dataWithBytes:length:", v4, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_broadcastInfo
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "Broadcast-Encryption-Key", 24);
}

- (void)_handleSetupExchangeComplete
{
  void *v3;
  HAPSecuritySession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  HAPSecuritySession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  HAPSecuritySession *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HAPSecuritySession *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v40;
  void *v41;
  void *v42;
  HAPSecuritySessionEncryption *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  void *v49;
  int v50;
  uint8_t v51[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint8_t v55[4];
  void *v56;
  __int16 v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Deriving session keys", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HAPSecuritySession _inputInfo](v4, "_inputInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSecuritySession pairingSession](v4, "pairingSession");
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = PairingSessionDeriveKey();
  v50 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v55 = 138543618;
      v56 = v14;
      v57 = 2112;
      v58 = v10;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input key with error: %@", v55, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HAPSecuritySession _closeWithError:](v12, "_closeWithError:", v10);
  }
  else
  {
    -[HAPSecuritySession _outputInfo](v4, "_outputInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPSecuritySession pairingSession](v4, "pairingSession");
    v10 = objc_retainAutorelease(v15);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v16 = PairingSessionDeriveKey();
    v50 = v16;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1D17B7244]();
      v19 = v4;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v51 = 138543618;
        v52 = v21;
        v53 = 2112;
        v54 = v17;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create output key with error: %@", v51, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HAPSecuritySession _closeWithError:](v19, "_closeWithError:", v17);

    }
    else
    {
      v49 = 0;
      -[HAPSecuritySession pairingSession](v4, "pairingSession");
      if (!PairingSessionGetResumeInfo())
      {
        v22 = (void *)MEMORY[0x1D17B7244]();
        v23 = v4;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          v52 = v25;
          v53 = 2048;
          v54 = v49;
          _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@Got resumeSessionID: %llu", v51, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        -[HAPSecuritySession setResumeSessionID:](v23, "setResumeSessionID:", v49);
      }
      -[HAPSecuritySession _broadcastInfo](v4, "_broadcastInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPSecuritySession _handleLocalPairingIdentityRequestWithStatus:](v4, "_handleLocalPairingIdentityRequestWithStatus:", &v50);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0x1E0C99000;
      if (v50)
        goto LABEL_19;
      if (-[HAPSecuritySession pairingSession](v4, "pairingSession"))
      {
        -[HAPSecuritySession pairingSession](v4, "pairingSession");
        objc_msgSend(v27, "publicKey");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "data");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v45, "bytes");
        objc_msgSend(v27, "publicKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "length");
        v31 = objc_retainAutorelease(v26);
        objc_msgSend(v31, "bytes");
        objc_msgSend(v31, "length");
        v28 = 0x1E0C99000uLL;
        v50 = PairingSessionDeriveKey();

      }
      if (v50)
      {
LABEL_19:
        -[HAPSecuritySession setBroadcastKey:](v4, "setBroadcastKey:", 0);
      }
      else
      {
        objc_msgSend(*(id *)(v28 + 3408), "dataWithBytes:length:", v51, 32);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPSecuritySession setBroadcastKey:](v4, "setBroadcastKey:", v44);

      }
      -[HAPSecuritySession delegate](v4, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

      if ((v33 & 1) != 0)
      {
        -[HAPSecuritySession delegate](v4, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "securitySessionDidRequestAdditionalDerivedKeyTuples:", v4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v35, "count"));
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __50__HAPSecuritySession__handleSetupExchangeComplete__block_invoke;
        v47[3] = &unk_1E8949E78;
        v47[4] = v4;
        v48 = v36;
        v37 = v36;
        objc_msgSend(v35, "enumerateObjectsUsingBlock:", v47);
        v38 = (void *)objc_msgSend(v37, "copy");
        -[HAPSecuritySession setAdditionalDerivedKeys:](v4, "setAdditionalDerivedKeys:", v38);

      }
      pairingSession = v4->_pairingSession;
      if (pairingSession)
        CFRelease(pairingSession);
      v4->_pairingSession = 0;
      v40 = [HAPSecuritySessionEncryption alloc];
      objc_msgSend(*(id *)(v28 + 3408), "dataWithBytes:length:", buf, 32);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v28 + 3408), "dataWithBytes:length:", v55, 32);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[HAPSecuritySessionEncryption initWithInputKey:outputKey:](v40, "initWithInputKey:outputKey:", v41, v42);
      -[HAPSecuritySession setEncryption:](v4, "setEncryption:", v43);

      -[HAPSecuritySession setState:](v4, "setState:", 2);
      -[HAPSecuritySession _notifyOpened](v4, "_notifyOpened");

    }
  }

}

- (void)open
{
  void *v3;
  HAPSecuritySession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HAPSecuritySession state](self, "state"))
  {
    v3 = (void *)MEMORY[0x1D17B7244]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to open security session, a security session can only be opened once.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[HAPSecuritySession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HAPSecuritySession setState:](self, "setState:", 1);
      -[HAPSecuritySession reallyOpen](self, "reallyOpen");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[HAPSecuritySession closeWithError:](self, "closeWithError:");

    }
  }
}

- (void)reallyOpen
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPSecuritySession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HAPSecuritySession_reallyOpen__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyOpening
{
  void *v3;
  char v4;
  id v5;

  -[HAPSecuritySession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HAPSecuritySession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "securitySessionIsOpening:", self);

  }
}

- (void)_notifyOpened
{
  void *v3;
  char v4;
  id v5;

  -[HAPSecuritySession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HAPSecuritySession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "securitySessionDidOpen:", self);

  }
}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HAPSecuritySession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HAPSecuritySession_close__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAPSecuritySession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HAPSecuritySession_closeWithError___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_closeWithError:(id)a3
{
  BOOL v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  HAPSecuritySession *v7;
  PairingSessionPrivate *pairingSession;
  HAPSecuritySessionEncryption *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[HAPSecuritySession state](self, "state") == 3;
  v5 = v12;
  if (!v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v7 = self;
    pairingSession = v7->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      v7->_pairingSession = 0;
    }
    v9 = objc_alloc_init(HAPSecuritySessionEncryption);
    -[HAPSecuritySession setEncryption:](v7, "setEncryption:", v9);

    v7->_resumeSessionID = 0;
    os_unfair_lock_unlock(p_lock);
    -[HAPSecuritySession setState:](v7, "setState:", 3);
    -[HAPSecuritySession delegate](v7, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_opt_respondsToSelector();

    v5 = v12;
    if ((v9 & 1) != 0)
    {
      -[HAPSecuritySession delegate](v7, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "securitySession:didCloseWithError:", v7, v12);

      v5 = v12;
    }
  }

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
    v27 = __Block_byref_object_copy__2514;
    v28 = __Block_byref_object_dispose__2515;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__2514;
    v22 = __Block_byref_object_dispose__2515;
    v23 = 0;
    -[HAPSecuritySession queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HAPSecuritySession_encryptData_additionalAuthenticatedData_error___block_invoke;
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
  HAPSecuritySession *v11;
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
  v30 = __Block_byref_object_copy__2514;
  v31 = __Block_byref_object_dispose__2515;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2514;
  v27 = __Block_byref_object_dispose__2515;
  v28 = 0;
  -[HAPSecuritySession queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HAPSecuritySession_decryptData_additionalAuthenticatedData_error___block_invoke;
  block[3] = &unk_1E894BEA8;
  block[4] = self;
  v21 = &v23;
  v22 = buf;
  v19 = v8;
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

- (id)logIdentifier
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;

  -[HAPSecuritySession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  if ((v4 & 1) != 0)
  {
    -[HAPSecuritySession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = -[HAPSecuritySession state](self, "state");
    if (v10 > 3)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E8949EB8[v10];
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (HAPSecuritySessionDelegate)delegate
{
  return (HAPSecuritySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(PairingSessionPrivate *)a3
{
  self->_pairingSession = a3;
}

- (HAPSecuritySessionEncryption)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_encryption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDerivedKeys, 0);
  objc_storeStrong((id *)&self->_broadcastKey, 0);
}

void __68__HAPSecuritySession_decryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryption");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v5 + 40);
    objc_msgSend(v2, "decrypt:additionalAuthenticatedData:error:", v3, v4, &obj);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v5 + 40), obj);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6709, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __68__HAPSecuritySession_encryptData_additionalAuthenticatedData_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "encryption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encrypt:additionalAuthenticatedData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6709, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

uint64_t __37__HAPSecuritySession_closeWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __27__HAPSecuritySession_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

uint64_t __32__HAPSecuritySession_reallyOpen__block_invoke(uint64_t a1)
{
  uint64_t result;

  mach_absolute_time();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = UpTicksToMilliseconds();
  result = objc_msgSend(*(id *)(a1 + 32), "role");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_notifyOpening");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_initiateClientSessionSetupExchange");
  return result;
}

void __50__HAPSecuritySession__handleSetupExchangeComplete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[32];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pairingSession");
  objc_msgSend(v3, "saltData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "bytes");
  objc_msgSend(v3, "saltData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  objc_msgSend(v3, "infoData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "bytes");
  objc_msgSend(v3, "infoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "length");
  v8 = PairingSessionDeriveKey();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive additional key '%@' with error: %ld", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v3, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
}

void __54__HAPSecuritySession__processSetupExchangeData_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = 0;
  v30 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = (void *)MEMORY[0x1D17B7244]();
      v3 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v34 = v5;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%{public}@Closing security session due to setup exchange error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v2);
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", *(_QWORD *)(a1 + 40));
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "pairingSession");
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes");
    objc_msgSend(*(id *)(a1 + 48), "length");
    v13 = PairingSessionExchange();
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 == -6767)
      {
        v14 = (void *)MEMORY[0x1D17B7244]();
        v15 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v17;
          _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%{public}@Session lookup failed, reset resumeSessionID, and retrying", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(*(id *)(a1 + 32), "_initializeSetupSession:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
        objc_msgSend(*(id *)(a1 + 32), "open");
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (HAPIsHH2Enabled_onceToken != -1)
        dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
      if (HAPIsHH2Enabled_hh2Enabled == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_opt_respondsToSelector();

        if ((v21 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 48);
          v29 = v18;
          objc_msgSend(v22, "securitySessionWillCloseWithResponseData:error:", v23, &v29);
          v24 = v29;

          v18 = v24;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 2, CFSTR("Operation Cancelled."), CFSTR("Failed to get the pairing exchange data."), 0, v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1D17B7244]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v28;
        v35 = 2112;
        v36 = v19;
        _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to process exchange data with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v19);
    }
    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v32, v31);
      if (!objc_msgSend(v18, "length"))
      {
LABEL_28:

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString securitySession:didReceiveSetupExchangeData:](v19, "securitySession:didReceiveSetupExchangeData:", *(_QWORD *)(a1 + 32), v18);
    }

    goto LABEL_28;
  }
  v7 = (void *)MEMORY[0x1D17B7244]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "state");
    if (v11 > 3)
      v12 = CFSTR("unknown");
    else
      v12 = off_1E8949EB8[v11];
    *(_DWORD *)buf = 138543618;
    v34 = v10;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to handle setup exchange data in state '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
}

void __54__HAPSecuritySession_receivedSetupExchangeData_error___block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 48), "_processSetupExchangeData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalid setup exchange data: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6705, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_closeWithError:", v11);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34 != -1)
    dispatch_once(&logCategory__hmf_once_t34, &__block_literal_global_2572);
  return (id)logCategory__hmf_once_v35;
}

void __33__HAPSecuritySession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35;
  logCategory__hmf_once_v35 = v0;

}

@end
