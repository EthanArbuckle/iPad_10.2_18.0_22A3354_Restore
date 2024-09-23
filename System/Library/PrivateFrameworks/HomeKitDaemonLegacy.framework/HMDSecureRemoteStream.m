@implementation HMDSecureRemoteStream

- (HMDSecureRemoteStream)initWithCurrentDevice:(id)a3 peerDevice:(id)a4 clientMode:(BOOL)a5 sessionID:(id)a6 accountRegistry:(id)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDSecureRemoteStream *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  uint64_t v23;
  uint64_t v24;
  NSDate *lastActivity;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  objc_super v32;

  v9 = a5;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)HMDSecureRemoteStream;
  v17 = -[HMDSecureRemoteStream init](&v32, sel_init);
  if (v17)
  {
    v30 = v14;
    v31 = v13;
    HMDispatchQueueNameString();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v17->_currentDevice, a3);
    objc_storeStrong((id *)&v17->_peerDevice, a4);
    if (v9)
      v23 = 1;
    else
      v23 = 2;
    v17->_role = v23;
    objc_storeStrong((id *)&v17->_sessionID, a6);
    v17->_idle = 1;
    v17->_qualityOfService = 9;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v24 = objc_claimAutoreleasedReturnValue();
    lastActivity = v17->_lastActivity;
    v17->_lastActivity = (NSDate *)v24;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel___handleAccountRemovedFromRegistry_, CFSTR("HMDAccountRegistryRemovedAccountNotification"), v16);

    -[HMDDevice account](v17->_peerDevice, "account");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:selector:name:object:", v17, sel___handleDeviceRemovedFromAccount_, CFSTR("HMDAccountRemovedDeviceNotification"), v27);

    }
    v14 = v30;
    v13 = v31;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[HMDSecureRemoteStreamInternal stop](self->_remoteSession, "stop");
  v3.receiver = self;
  v3.super_class = (Class)HMDSecureRemoteStream;
  -[HMDSecureRemoteStream dealloc](&v3, sel_dealloc);
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteStream sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSecureRemoteStream sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDSecureRemoteStream role](self, "role");
  v6 = CFSTR("unknown");
  if (v5 == 2)
    v6 = CFSTR("server");
  if (v5 == 1)
    v6 = CFSTR("client");
  v7 = v6;
  -[HMDSecureRemoteStream qualityOfService](self, "qualityOfService");
  HMFQualityOfServiceToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteStream isIdle](self, "isIdle");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSecureRemoteStream lastActivity](self, "lastActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Identifier = %@, Role = %@, QoS = %@, Idle = %@, Last Activity = %@"), v4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (HMDDevice)peerDevice
{
  os_unfair_lock_s *p_lock;
  HMDDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_peerDevice;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPeerDevice:(id)a3
{
  HMDDevice *peerDevice;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDDevice *v10;

  v10 = (HMDDevice *)a3;
  os_unfair_lock_lock_with_options();
  peerDevice = self->_peerDevice;
  if (peerDevice != v10)
  {
    -[HMDDevice account](peerDevice, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("HMDAccountRemovedDeviceNotification"), v6);

    }
    objc_storeStrong((id *)&self->_peerDevice, a3);
    -[HMDDevice account](self->_peerDevice, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel___handleDeviceRemovedFromAccount_, CFSTR("HMDAccountRemovedDeviceNotification"), v8);

    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (int64_t)qualityOfService
{
  os_unfair_lock_s *p_lock;
  int64_t qualityOfService;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  qualityOfService = self->_qualityOfService;
  os_unfair_lock_unlock(p_lock);
  return qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_qualityOfService = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSNumber)maximumRemoteStreams
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_maximumRemoteStreams;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMaximumRemoteStreams:(id)a3
{
  NSNumber *v4;
  NSNumber *maximumRemoteStreams;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maximumRemoteStreams = self->_maximumRemoteStreams;
  self->_maximumRemoteStreams = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isOpen
{
  HMDSecureRemoteStream *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_open;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOpen:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_open = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAuthenticated
{
  HMDSecureRemoteStream *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_authenticated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAuthenticated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_authenticated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isIdle
{
  HMDSecureRemoteStream *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_idle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIdle:(BOOL)a3
{
  int v3;
  int idle;
  void *v6;
  void *v7;
  id v8;
  id obj;

  v3 = a3;
  if (a3)
  {
    obj = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    obj = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock_with_options();
  idle = self->_idle;
  if (idle != v3)
    self->_idle = v3;
  if (obj)
    objc_storeStrong((id *)&self->_lastActivity, obj);
  os_unfair_lock_unlock(&self->_lock);
  if (idle != v3)
  {
    -[HMFMessageTransport delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFAB9940))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "secureRemoteStreamIsIdle:", self);

  }
}

- (NSDate)lastActivity
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_lastActivity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)startAndInvokeOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDSecureRemoteStream_startAndInvokeOnQueue_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_configureWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  HMDSecureRemoteStreamInternal *v10;
  int64_t v11;
  HMDSecureRemoteStreamInternal *v12;
  OS_dispatch_queue *queue;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  HMDSecureRemoteStream *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _BYTE location[12];
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v8, "getLocalPairingIdentity:", &v49);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v49;

  if (v9)
  {
    v10 = [HMDSecureRemoteStreamInternal alloc];
    v11 = -[HMDSecureRemoteStream role](self, "role");
    v12 = -[HMDSecureRemoteStreamInternal initWithType:commitTimeout:clientIdleTimeout:serverIdleTimeout:sendInternalTimeout:sendUserTimeout:](v10, "initWithType:commitTimeout:clientIdleTimeout:serverIdleTimeout:sendInternalTimeout:sendUserTimeout:", v11, hrsCommitTimeoutNanoseconds, hrsIdleClientTimeoutNanoseconds, hrsIdleServertTimeoutNanoseconds, hrsSendInternalRequestTimeoutNanoseconds, hrsSendUserRequestTimeoutNanoseconds);
    -[HMDSecureRemoteStream setRemoteSession:](self, "setRemoteSession:", v12);

    queue = self->_queue;
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDispatchQueue:", queue);

    objc_initWeak((id *)location, self);
    v15 = -[HMDSecureRemoteStream role](self, "role");
    v16 = MEMORY[0x1E0C809B0];
    if (v15 == 1)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2;
      v42[3] = &unk_1E89C0650;
      objc_copyWeak(&v45, (id *)location);
      v43 = v6;
      v44 = v7;
      -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setStartedHandler:", v42);

      objc_destroyWeak(&v45);
    }
    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_4;
    v40[3] = &unk_1E89C0678;
    objc_copyWeak(&v41, (id *)location);
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStoppedHandler:", v40);

    v38[0] = v16;
    v38[1] = 3221225472;
    v38[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_299;
    v38[3] = &unk_1E89C06A0;
    objc_copyWeak(&v39, (id *)location);
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGetLocalIdentityHandler:", v38);

    v36[0] = v16;
    v36[1] = 3221225472;
    v36[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_303;
    v36[3] = &unk_1E89C06C8;
    objc_copyWeak(&v37, (id *)location);
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFindPeerHandler:", v36);

    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_311;
    v34[3] = &unk_1E89C0718;
    objc_copyWeak(&v35, (id *)location);
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRequestHandler:", v34);

    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3_321;
    v32[3] = &unk_1E89C0740;
    objc_copyWeak(&v33, (id *)location);
    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTransportSendMessage:", v32);

    -[HMDSecureRemoteStream remoteSession](self, "remoteSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "start");

    v24 = -[HMDSecureRemoteStream role](self, "role");
    if (v7 && v6 && v24 == 2)
    {
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_323;
      block[3] = &unk_1E89C0870;
      v31 = v7;
      dispatch_async(v6, block);

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v28;
      v51 = 2112;
      v52 = v29;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot open stream, failed to get local pairing identity with error: %@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    if (v6 && v7)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke;
      v46[3] = &unk_1E89C1D68;
      v47 = v29;
      v48 = v7;
      dispatch_async(v6, v46);

    }
  }

}

- (void)closedWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HMDSecureRemoteStream_closedWithError___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_closeWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[HMDSecureRemoteStream setOpen:](self, "setOpen:", 0);
  -[HMDSecureRemoteStream setAuthenticated:](self, "setAuthenticated:", 0);
  -[HMFMessageTransport delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFAB9940))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "secureRemoteStream:didCloseWithError:", self, v7);

}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMDSecureRemoteStream_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HMDSecureRemoteStream *v14;
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke;
  v12[3] = &unk_1E89C23F0;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v16 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, v12);

}

- (void)handleCompletedMessage:(id)a3 options:(id)a4 responsePayload:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HMDSecureRemoteStream *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__HMDSecureRemoteStream_handleCompletedMessage_options_responsePayload_error_completionHandler___block_invoke;
  v23[3] = &unk_1E89C0790;
  v24 = v14;
  v25 = self;
  v26 = v12;
  v27 = v15;
  v28 = v13;
  v29 = v16;
  v18 = v16;
  v19 = v13;
  v20 = v15;
  v21 = v12;
  v22 = v14;
  dispatch_async(queue, v23);

}

- (void)handleSecureMessage:(id)a3 fromDevice:(id)a4 fromTransport:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__HMDSecureRemoteStream_handleSecureMessage_fromDevice_fromTransport___block_invoke;
  v15[3] = &unk_1E89C07B8;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)__handleRemovedIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSecureRemoteStream *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HMDSecureRemoteStream___handleRemovedIdentity___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)__handleAccountRemovedFromRegistry:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSecureRemoteStream *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDSecureRemoteStream___handleAccountRemovedFromRegistry___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)__handleDeviceRemovedFromAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSecureRemoteStream *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDSecureRemoteStream___handleDeviceRemovedFromAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSecureRemoteStream sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)role
{
  return self->_role;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (HMDUser)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (HMFPairingIdentity)peerIdentity
{
  return self->_peerIdentity;
}

- (void)setPeerIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_peerIdentity, a3);
}

- (HMDSecureRemoteStreamInternal)remoteSession
{
  return self->_remoteSession;
}

- (void)setRemoteSession:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSession, a3);
}

- (HMDDevice)currentDevice
{
  return self->_currentDevice;
}

- (BOOL)supportsSharedIdentities
{
  return self->_supportsSharedIdentities;
}

- (void)setSupportsSharedIdentities:(BOOL)a3
{
  self->_supportsSharedIdentities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_remoteSession, 0);
  objc_storeStrong((id *)&self->_peerIdentity, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_maximumRemoteStreams, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__HMDSecureRemoteStream___handleDeviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "peerDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification device was removed from account", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Device was removed from account."), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v12);

    }
  }

}

void __60__HMDSecureRemoteStream___handleAccountRemovedFromRegistry___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "peerDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed from registry", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Account was removed from registry."), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v13);

    }
  }

}

void __49__HMDSecureRemoteStream___handleRemovedIdentity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMDIdentityNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "peerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HMFEqualObjects();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDAccountNotificationKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "peerDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "account");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = HMFEqualObjects();

        if (v14)
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543362;
            v21 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Received notification peer identity was removed", (uint8_t *)&v20, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 17, 0, CFSTR("Identity was removed."), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_closeWithError:", v19);

        }
      }

    }
  }

}

void __70__HMDSecureRemoteStream_handleSecureMessage_fromDevice_fromTransport___block_invoke(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("kIDSMessageSourceIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secureDescriptionWithBlacklistKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v5;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Received encrypted secure message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsSharedIdentities") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setSupportsSharedIdentities:", objc_msgSend(*(id *)(a1 + 40), "hmf_BOOLForKey:", CFSTR("supportsSharedIdentities")));
  objc_msgSend(*(id *)(a1 + 32), "maximumRemoteStreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", CFSTR("max"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "setMaximumRemoteStreams:", v10);

  }
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = objc_msgSend(v11, "transportType");
    v13 = objc_msgSend((id)objc_opt_class(), "restriction");
    if (v13 == 2)
      v14 = 3;
    else
      v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = -1;
  }
  objc_msgSend(*(id *)(a1 + 56), "productInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "productClass");
  HMFProductClassToString();
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Unable to map productClass for device %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = CFSTR("Unknown");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14, CFSTR("kRemoteMessageRestrictionKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = CFSTR("kRemoteMessageTransportAttributionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v22;
  v27[2] = v16;
  v26[2] = CFSTR("kRemoteMessagePeerInformationKey");
  v26[3] = CFSTR("HMDRemoteMessageReceivedTransportRestrictionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "restriction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "remoteSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "transportReceivedMessage:options:", *(_QWORD *)(a1 + 40), v24);

}

void __96__HMDSecureRemoteStream_handleCompletedMessage_options_responsePayload_error_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v3, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v4, v2, &v33);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v33;

    if (!v5)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v10;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize error with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Generic error."), CFSTR("Failed to deserialize remote error."), 0, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544898;
    v35 = v14;
    v36 = 2114;
    v37 = v15;
    v38 = 2114;
    v39 = v16;
    v40 = 2114;
    v41 = v18;
    v42 = 2114;
    v43 = v19;
    v44 = 2114;
    v45 = v5;
    v46 = 2114;
    v47 = v20;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received response %{public}@ to secure message: %{public}@ and identifier %{public}@, with transport error: %{public}@, error: %{public}@, options: %{public}@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "markWithReason:", CFSTR("Calling response handler"));

  v22 = *(void **)(a1 + 56);
  if (!v22)
    v22 = v5;
  v23 = v22;
  v24 = *(_QWORD *)(a1 + 72);
  if (v24)
    (*(void (**)(uint64_t, id))(v24 + 16))(v24, v23);
  objc_msgSend(*(id *)(a1 + 48), "responseHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("kRemoteMessageTransportAttributionKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("kRemoteMessageTransportAttributionKey"));

    objc_msgSend(*(id *)(a1 + 48), "responseHandler");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v28)[2](v28, v23, v26);

  }
  v29 = (void *)MEMORY[0x1D17BA0A0]();
  v30 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v32;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@The session is now idle", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v29);
  objc_msgSend(*(id *)(a1 + 40), "setIdle:", 1);

}

void __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[3];
  _QWORD v39[3];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessage secureMessageWithName:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:destination:messagePayload:", v5, v6, v7);
    v2 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIdentifier:", v8);

    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setResponseHandler:", v9);

  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v41 = v13;
    v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sending message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 40), "setIdle:", 0);
  v15 = *(_QWORD *)(a1 + 32);
  v37 = 0;
  +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v15, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  if (!v16)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v21;
      v42 = 2112;
      v43 = v17;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Message serialization failed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  v38[0] = CFSTR("kRemoteMessageRestrictionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "restriction"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v22;
  v38[1] = CFSTR("kIDSMessageRequestTransactionIDKey");
  objc_msgSend(v2, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v24;
  v38[2] = CFSTR("kRemoteMessageAttributedMessageNameKey");
  objc_msgSend(v2, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v27 = objc_alloc(MEMORY[0x1E0D28540]);
  MEMORY[0x1D17B8D08](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v27, "initWithName:", v28);

  objc_msgSend(*(id *)(a1 + 40), "remoteSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke_326;
  v31[3] = &unk_1E89C0768;
  v32 = v36;
  objc_copyWeak(&v35, (id *)buf);
  v30 = v2;
  v33 = v30;
  v34 = *(id *)(a1 + 48);
  objc_msgSend(v29, "sendRequest:options:responseHandler:", v16, v26, v31);

  objc_destroyWeak(&v35);
  __HMFActivityScopeLeave();

  objc_destroyWeak((id *)buf);
}

void __55__HMDSecureRemoteStream_sendMessage_completionHandler___block_invoke_326(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v15 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleCompletedMessage:options:responsePayload:error:completionHandler:", *(_QWORD *)(a1 + 40), v8, v7, v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Calling response handler"));
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v9);
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "responseHandler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id))v14)[2](v14, v9, v7);

    }
  }

  __HMFActivityScopeLeave();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __29__HMDSecureRemoteStream_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isOpen"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setOpen:", 0);
    objc_msgSend(*(id *)(a1 + 32), "remoteSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "remoteSession");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stop");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 20, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:");
    }

  }
}

uint64_t __41__HMDSecureRemoteStream_closedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", *(_QWORD *)(a1 + 40));
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 48, CFSTR("Not supported"), CFSTR("Cannot send messages without a valid pairing identity"), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_closeWithError:", v3);
  else
    objc_msgSend(WeakRetained, "setOpen:", 1);
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3;
      v8[3] = &unk_1E89C1D68;
      v10 = v7;
      v9 = v3;
      dispatch_async(v6, v8);

    }
  }

}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification that remote session has stopped due to error: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "_closeWithError:", v3);
  }

}

id __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_299(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalPairingIdentity:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v5)
  {
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isRemoteGatewayCapable") & 1) != 0)
    {
      v8 = objc_msgSend(WeakRetained, "supportsSharedIdentities");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "currentDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "account");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v5);

        if (v12)
        {
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = WeakRetained;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138543362;
            v26 = v16;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Swapping out the local pairing identifier for legacy remote sessions", (uint8_t *)&v25, 0xCu);

          }
          objc_autoreleasePoolPop(v13);
          v17 = objc_alloc(MEMORY[0x1E0D28650]);
          objc_msgSend(v14, "currentDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "publicKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "privateKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v17, "initWithIdentifier:publicKey:privateKey:", v20, v21, v22);

          v5 = (void *)v23;
        }
      }
    }
    else
    {

    }
  }

  return v5;
}

id __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_303(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDUser *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityForIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "setPeerIdentity:", v8);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", WeakRetained, sel___handleRemovedIdentity_, CFSTR("HMDIdentityRegistryRemovedIdentity"), v10);

      objc_msgSend(WeakRetained, "peerDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceForDevice:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && v11 != v13)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = WeakRetained;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = a3;
          v17 = v5;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v75 = v18;
          v76 = 2112;
          v77 = v11;
          v78 = 2112;
          v79 = v13;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Peer device resolved from the registry -- tracked: %@, resolved: %@", buf, 0x20u);

          v5 = v17;
          a3 = v67;
        }

        objc_autoreleasePoolPop(v14);
        v19 = v13;

        objc_msgSend(v15, "setPeerDevice:", v19);
        v11 = v19;
      }

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accountsForIdentity:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v71;
LABEL_10:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v71 != v24)
            objc_enumerationMutation(v21);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v25), "isAuthenticated") & 1) != 0)
            break;
          if (v23 == ++v25)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
            if (v23)
              goto LABEL_10;
            goto LABEL_16;
          }
        }

        objc_msgSend(v11, "identities");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsObject:", v8);

        if ((v32 & 1) != 0)
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = WeakRetained;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v75 = v36;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Successfully authenticated peer identity", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v33);
          objc_msgSend(v34, "setAuthenticated:", 1);
          goto LABEL_25;
        }
        objc_msgSend(v11, "account");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1D17BA0A0]();
        v46 = WeakRetained;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = v45;
          v48 = v5;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "shortDescription");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v75 = v49;
          v76 = 2112;
          v77 = v50;
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate peer identity for device: %@", buf, 0x16u);

          v5 = v48;
          v45 = v68;
        }

        objc_autoreleasePoolPop(v45);
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = v46;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v69 = v38;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "shortDescription");
          v66 = v51;
          v56 = v5;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v75 = v54;
          v76 = 2112;
          v77 = v55;
          v78 = 2112;
          v79 = v57;
          v80 = 2112;
          v81 = v69;
          _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@The provided pairing identity, %@, for peer, %@, is not registered to account: %@", buf, 0x2Au);

          v5 = v56;
          v51 = v66;

          v38 = v69;
        }

        objc_autoreleasePoolPop(v51);
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 55);
          v30 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
      }
      else
      {
LABEL_16:

        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = WeakRetained;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v75 = v29;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping account authentication check as the peer account is not authenticated", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v26);
LABEL_25:
        objc_msgSend(v11, "remoteDestinationString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v39 = -[HMDUser initWithAccountHandle:home:pairingIdentity:privilege:]([HMDUser alloc], "initWithAccountHandle:home:pairingIdentity:privilege:", v38, 0, v8, 2);
          objc_msgSend(WeakRetained, "setPeer:", v39);

        }
        else
        {
          v58 = (void *)MEMORY[0x1D17BA0A0]();
          v59 = WeakRetained;
          HMFGetOSLogHandle();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "remoteDestinationString");
            v62 = v5;
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v75 = v61;
            v76 = 2112;
            v77 = v63;
            _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDSecureSession] Unable to get the 'userID' from destination '%@'", buf, 0x16u);

            v5 = v62;
          }

          objc_autoreleasePoolPop(v58);
        }
        objc_msgSend(v8, "publicKey");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1D17BA0A0]();
      v41 = WeakRetained;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "peerDevice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v75 = v43;
        v76 = 2112;
        v77 = v5;
        v78 = 2112;
        v79 = v44;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find identity, %@, for peer: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v40);
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 2, 0);
        v30 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 20, 0);
    v30 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_311(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  HMDRemoteDeviceMessageDestination *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  NSObject *queue;
  _QWORD v62[5];
  id v63;
  NSObject *v64;
  id v65;
  id v66;
  _QWORD block[4];
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  queue = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v69 = 0;
    +[HMDRemoteMessageSerialization remoteMessageWithDictionary:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:error:", v9, &v69);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v69;
    objc_msgSend(v13, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("kRemoteAccessReverseConnectionRequestKey"));

    if (v16)
    {
      v59 = v14;
      v17 = v11;
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = WeakRetained;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v71 = v21;
        v72 = 2112;
        v73 = v23;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Received request to setup reverse secure connection: %@", buf, 0x16u);

        v10 = v22;
      }

      objc_autoreleasePoolPop(v18);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_313;
      block[3] = &unk_1E89C0870;
      v11 = v17;
      v68 = v17;
      dispatch_async(queue, block);
      v24 = v68;
      v14 = v59;
    }
    else
    {
      v60 = v11;
      objc_msgSend(v10, "hmf_numberForKey:", CFSTR("HMDRemoteMessageReceivedTransportRestrictionKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");

      objc_msgSend(v13, "setRestriction:", v26);
      objc_msgSend(v13, "messagePayload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v27, "mutableCopy");

      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(WeakRetained, "peerDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "remoteDestinationString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("kIDSMessageSourceIDKey"));

      objc_msgSend(v13, "setMessagePayload:", v24);
      objc_msgSend(v13, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      objc_msgSend(WeakRetained, "peerDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "remoteDestinationString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("kIDSMessageSourceIDKey"));

      objc_msgSend(WeakRetained, "peer");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("kIDSMessageSourceUserKey"));
      v57 = (void *)v34;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kRemoteMessageTransportAttributionKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("kRemoteMessageTransportAttributionKey"));

      objc_msgSend(v13, "internal");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v31;
      objc_msgSend(v36, "setUserInfo:", v31);

      v37 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(v13, "destination");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "target");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "peerDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v37, "initWithTarget:device:", v39, v40);

      v56 = (void *)v41;
      objc_msgSend(v13, "setDestination:", v41);
      v42 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v13, "setSecure:", 1));
      v43 = WeakRetained;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = v42;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "messagePayload");
        v55 = v9;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("kIDSMessageSourceIDKey"));
        v47 = v14;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "secureDescriptionWithBlacklistKeys:", v48);
        v54 = v10;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v71 = v45;
        v72 = 2112;
        v73 = v13;
        v74 = 2112;
        v75 = v49;
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Received decrypted secure message, %@, with payload: %@", buf, 0x20u);

        v14 = v47;
        v9 = v55;

        v10 = v54;
        v42 = v53;
      }

      objc_autoreleasePoolPop(v42);
      objc_msgSend(v13, "name");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_316;
      v62[3] = &unk_1E89C06F0;
      v62[4] = v43;
      v63 = v50;
      v64 = queue;
      v11 = v60;
      v66 = v60;
      v65 = v10;
      v51 = v50;
      objc_msgSend(v13, "setInternalResponseHandler:", v62);
      objc_msgSend(v43, "delegate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "messageTransport:didReceiveMessage:", v43, v13);

    }
  }

}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3_321(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDRemoteDeviceMessageDestination *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  HMDRemoteMessage *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kIDSSecureSessionIDKey"));

    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("op"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("pv"));

    if ((_DWORD)v10)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("supportsSharedIdentities"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", maximumSecureRemoteStreams);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("max"));

      v12 = objc_msgSend(WeakRetained, "role");
      if (v12 == 2)
        v12 = objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("op"));
    }
    v14 = (void *)MEMORY[0x1D17BA0A0](v12);
    v15 = WeakRetained;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "peerDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138544130;
      v43 = v17;
      v44 = 2112;
      v45 = v18;
      v46 = 2112;
      v47 = v19;
      v48 = 2112;
      v49 = v6;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending encrypted secure message %@ to %@ with options:\n%@", (uint8_t *)&v42, 0x2Au);

    }
    objc_autoreleasePoolPop(v14);
    v20 = [HMDRemoteDeviceMessageDestination alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "peerDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v20, "initWithTarget:device:", v21, v22);

    objc_msgSend(v15, "remoteSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requestTimeout");
    v26 = v25;

    v27 = 0.0;
    if (v26 > 0.0)
    {
      objc_msgSend(v15, "remoteSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "requestTimeout");
      v27 = v29;

    }
    v30 = objc_msgSend(v15, "role");
    v31 = CFSTR("kSecureServerIDSMessageRequestKey");
    if (v30 == 1)
      v31 = CFSTR("kSecureClientIDSMessageRequestKey");
    v32 = v31;
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kRemoteMessageRestrictionKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33 || (v35 = objc_msgSend(v33, "unsignedIntegerValue"), v35 == -1))
      v36 = 19;
    else
      v36 = v35 | 0x10;
    v37 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:restriction:", v32, v23, v8, 3, 0, v36, v27);
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kRemoteMessageAttributedMessageNameKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDRemoteMessage setAttributedMessageName:](v37, "setAttributedMessageName:", v38);
    objc_msgSend(v15, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "conformsToProtocol:", &unk_1EFAB9940))
      v40 = v39;
    else
      v40 = 0;
    v41 = v40;

    if (v41)
      objc_msgSend(v41, "secureRemoteStream:receivedRequestToSendMessage:", v15, v37);

  }
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_323(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_313(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_316(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to decrypted secure message: %{public}@, payload %@ with error: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    v26 = CFSTR("kIDSMessageResponseErrorDataKey");
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_317;
    block[3] = &unk_1E89C1B48;
    v25 = *(id *)(a1 + 64);
    v23 = v14;
    v24 = *(id *)(a1 + 56);
    v16 = v14;
    dispatch_async(v15, block);

  }
  else
  {
    v17 = *(NSObject **)(a1 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2_318;
    v18[3] = &unk_1E89C1B48;
    v21 = *(id *)(a1 + 64);
    v19 = v6;
    v20 = *(id *)(a1 + 56);
    dispatch_async(v17, v18);

    v16 = v21;
  }

}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_317(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_2_318(_QWORD *a1)
{
  uint64_t v1;

  if (a1[4])
    v1 = a1[4];
  else
    v1 = MEMORY[0x1E0C9AA70];
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], v1, a1[5], 0);
}

uint64_t __73__HMDSecureRemoteStream__configureWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__HMDSecureRemoteStream_startAndInvokeOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "role");
    v7 = CFSTR("server");
    if (v6 == 1)
      v7 = CFSTR("client");
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting secure session in %@ mode", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_configureWithCompletionQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t98_177196 != -1)
    dispatch_once(&logCategory__hmf_once_t98_177196, &__block_literal_global_344_177197);
  return (id)logCategory__hmf_once_v99_177198;
}

void __36__HMDSecureRemoteStream_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v99_177198;
  logCategory__hmf_once_v99_177198 = v0;

}

@end
