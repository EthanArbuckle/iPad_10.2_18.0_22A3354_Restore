@implementation _HMAudioControl

- (_HMAudioControl)initWithMediaSession:(id)a3
{
  id v4;
  _HMAudioControl *v5;
  _HMAudioControl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_HMAudioControl;
  v5 = -[_HMAudioControl init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_muted = 0;
    v5->_volume = 0.0;
    objc_storeWeak((id *)&v5->_mediaSession, v4);
  }

  return v6;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  id v4;

  -[_HMAudioControl context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:selector:", CFSTR("HMAC.ua"), self, sel__handleAudioControlUpdated_);

}

- (void)__configureWithContext:(id)a3
{
  -[_HMAudioControl setContext:](self, "setContext:", a3);
  -[_HMAudioControl _registerNotificationHandlers](self, "_registerNotificationHandlers");
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMContext messageDispatcher](self->_context, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  _HMAudioControl *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring audioControl", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[_HMAudioControl _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  void *v5;
  id WeakRetained;
  void *v7;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v5 = (void *)MEMORY[0x1E0CB3A28];
    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSession);
    objc_msgSend(WeakRetained, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:", v7);
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v9 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v8;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v10 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (float)volume
{
  os_unfair_lock_s *p_lock;
  float volume;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  volume = self->_volume;
  os_unfair_lock_unlock(p_lock);
  return volume;
}

- (void)setVolume:(float)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_volume = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isMuted
{
  _HMAudioControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_muted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setMuted:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_muted = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[_HMAudioControl mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMAudioControl messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMAudioControl context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  double v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  char v20;
  _QWORD block[5];
  id v22;
  float v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[_HMAudioControl delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    v9 = v8;
    -[_HMAudioControl volume](self, "volume");
    v11 = *(float *)&v10 != v9;
    if (*(float *)&v10 != v9)
    {
      *(float *)&v10 = v9;
      -[_HMAudioControl setVolume:](self, "setVolume:", v10);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAudioControl context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queue");
        v13 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E3AAEC40;
        block[4] = self;
        v23 = v9;
        v22 = v7;
        dispatch_async(v13, block);

      }
    }
    v14 = objc_msgSend(v6, "isMuted");
    if ((_DWORD)v14 != -[_HMAudioControl isMuted](self, "isMuted"))
    {
      -[_HMAudioControl setMuted:](self, "setMuted:", v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_HMAudioControl context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "queue");
        v16 = objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __38___HMAudioControl_mergeFromNewObject___block_invoke_22;
        v18[3] = &unk_1E3AB57F8;
        v18[4] = self;
        v19 = v7;
        v20 = v14;
        dispatch_async(v16, v18);

      }
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateVolume:(float)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _HMAudioControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _HMAudioControl *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  float v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[_HMAudioControl context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAudioControl updateVolume:completionHandler:]", CFSTR("completionHandler"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___HMAudioControl_updateVolume_completionHandler___block_invoke;
    block[3] = &unk_1E3AAEC90;
    v24 = a3;
    block[4] = self;
    v23 = v6;
    v22 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2080;
      v28 = "-[_HMAudioControl updateVolume:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (void)updateMuted:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _HMAudioControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _HMAudioControl *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[_HMAudioControl context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMAudioControl updateMuted:completionHandler:]", CFSTR("completionHandler"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___HMAudioControl_updateMuted_completionHandler___block_invoke;
    block[3] = &unk_1E3AB19C0;
    v24 = a3;
    block[4] = self;
    v23 = v6;
    v22 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2080;
      v28 = "-[_HMAudioControl updateMuted:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (void)_handleAudioControlUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _HMAudioControl *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void *v34;
  _HMAudioControl *v35;
  char v36;
  _QWORD v37[4];
  id v38;
  _HMAudioControl *v39;
  float v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMAudioControl context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _Block_copy(v8);
    *(_DWORD *)buf = 138543874;
    v42 = v12;
    v43 = 2112;
    v44 = v4;
    v45 = 2112;
    v46 = v13;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that audio controls got updated : %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[_HMAudioControl delegate](v10, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("volume"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[_HMAudioControl volume](v10, "volume");
    v17 = v16;
    objc_msgSend(v15, "floatValue");
    v19 = v18;
    -[_HMAudioControl setVolume:](v10, "setVolume:");
    if (!v8 && v17 != v19 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_HMAudioControl delegate](v10, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAudioControl context](v10, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "delegateCaller");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __46___HMAudioControl__handleAudioControlUpdated___block_invoke;
      v37[3] = &unk_1E3AAEC40;
      v38 = v20;
      v39 = v10;
      v40 = v19;
      v23 = v20;
      objc_msgSend(v22, "invokeBlock:", v37);

    }
  }
  objc_msgSend(v4, "numberForKey:", CFSTR("muted"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24
    && (v26 = objc_msgSend(v24, "BOOLValue"),
        v27 = -[_HMAudioControl isMuted](v10, "isMuted"),
        -[_HMAudioControl setMuted:](v10, "setMuted:", v26),
        !v8)
    && v26 != v27)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_HMAudioControl delegate](v10, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMAudioControl context](v10, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "delegateCaller");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __46___HMAudioControl__handleAudioControlUpdated___block_invoke_2;
      v33[3] = &unk_1E3AB57F8;
      v34 = v28;
      v35 = v10;
      v36 = v26;
      v30 = v28;
      objc_msgSend(v29, "invokeBlock:", v33);

      v31 = v34;
LABEL_15:

    }
  }
  else if (v8)
  {
    -[_HMAudioControl context](v10, "context");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "delegateCaller");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "callCompletion:error:", v8, 0);
    goto LABEL_15;
  }

}

- (HMMediaSession)mediaSession
{
  return (HMMediaSession *)objc_loadWeakRetained((id *)&self->_mediaSession);
}

- (_HMAudioControlDelegate)delegate
{
  return (_HMAudioControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mediaSession);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
