@implementation _HMMediaSession

- (_HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 audioControl:(id)a8 mediaUniqueIdentifier:(id)a9 sleepWakeState:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  _HMMediaSession *v19;
  _HMMediaSession *v20;
  id v23;
  objc_super v24;

  v16 = a3;
  v17 = a4;
  v23 = a8;
  v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)_HMMediaSession;
  v19 = -[_HMMediaSession init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uuid, a3);
    objc_storeStrong((id *)&v20->_routeUID, a4);
    v20->_playbackState = a5;
    v20->_shuffleState = a6;
    v20->_repeatState = a7;
    objc_storeStrong((id *)&v20->_audioControl, a8);
    objc_storeStrong((id *)&v20->_mediaUniqueIdentifier, a9);
    v20->_sleepWakeState = a10;
  }

  return v20;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_HMMediaSession context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMMS.up"), self, sel__handleSessionPlaybackUpdated_);

  -[_HMMediaSession context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:selector:", CFSTR("HMMS.ur"), self, sel__handleSessionRouteUIDUpdated_);

}

- (void)setUuid:(id)a3
{
  NSUUID *v4;
  NSUUID *uuid;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  uuid = self->_uuid;
  self->_uuid = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (_HMContext)context
{
  os_unfair_lock_s *p_lock;
  _HMContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setContext:(id)a3
{
  _HMContext *v4;
  _HMContext *context;

  v4 = (_HMContext *)a3;
  os_unfair_lock_lock_with_options();
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
  -[_HMMediaSession _registerNotificationHandlers](self, "_registerNotificationHandlers");
}

- (void)setMessageTargetUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *messageTargetUUID;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  messageTargetUUID = self->_messageTargetUUID;
  self->_messageTargetUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)playbackState
{
  os_unfair_lock_s *p_lock;
  int64_t playbackState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  playbackState = self->_playbackState;
  os_unfair_lock_unlock(p_lock);
  return playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_playbackState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)shuffleState
{
  os_unfair_lock_s *p_lock;
  int64_t shuffleState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  shuffleState = self->_shuffleState;
  os_unfair_lock_unlock(p_lock);
  return shuffleState;
}

- (void)setShuffleState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_shuffleState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)repeatState
{
  os_unfair_lock_s *p_lock;
  int64_t repeatState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  repeatState = self->_repeatState;
  os_unfair_lock_unlock(p_lock);
  return repeatState;
}

- (void)setRepeatState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_repeatState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)mediaUniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaUniqueIdentifier:(id)a3
{
  NSString *v4;
  NSString *mediaUniqueIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  mediaUniqueIdentifier = self->_mediaUniqueIdentifier;
  self->_mediaUniqueIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)routeUID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_routeUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRouteUID:(id)a3
{
  NSString *v4;
  NSString *routeUID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  routeUID = self->_routeUID;
  self->_routeUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (unint64_t)sleepWakeState
{
  os_unfair_lock_s *p_lock;
  unint64_t sleepWakeState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  sleepWakeState = self->_sleepWakeState;
  os_unfair_lock_unlock(p_lock);
  return sleepWakeState;
}

- (void)setSleepWakeState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sleepWakeState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)messageTargetUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_messageTargetUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMMediaSession messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMMediaSession context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setPlaybackState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _HMMediaSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _HMMediaSession *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  int64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[_HMMediaSession context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMMediaSession setPlaybackState:completionHandler:]", CFSTR("completionHandler"));
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
    block[2] = __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C30;
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
      v28 = "-[_HMMediaSession setPlaybackState:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (void)refreshPlaybackStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMMediaSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _HMMediaSession *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMMediaSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMMediaSession refreshPlaybackStateWithCompletionHandler:]", CFSTR("completionHandler"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v21 = v4;
    v20 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2080;
      v25 = "-[_HMMediaSession refreshPlaybackStateWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)_notifyDelegateOfUpdatedPlaybackState:(int64_t)a3
{
  void *v5;
  void *v6;
  _HMMediaSession *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  _HMMediaSession *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _HMMediaSession *v20;
  int64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_HMMediaSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a3 - 1) > 5)
      v10 = CFSTR("Unknown");
    else
      v10 = off_1E3AAFAC0[a3 - 1];
    v11 = v10;
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notify client of did update playback state: %@ delegate: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[_HMMediaSession context](v7, "context");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString delegateCaller](v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57___HMMediaSession__notifyDelegateOfUpdatedPlaybackState___block_invoke;
      v18[3] = &unk_1E3AB5C80;
      v19 = v5;
      v20 = v7;
      v21 = a3;
      objc_msgSend(v13, "invokeBlock:", v18);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of did update playback state due to no delegate caller from context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_notifyDelegateOfUpdatedMediaState
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[_HMMediaSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_HMMediaSession delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMMediaSession context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___HMMediaSession__notifyDelegateOfUpdatedMediaState__block_invoke;
    v9[3] = &unk_1E3AB5ED8;
    v9[4] = self;
    v10 = v5;
    v8 = v5;
    objc_msgSend(v7, "invokeBlock:", v9);

  }
}

- (void)_handleSessionPlaybackUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_HMMediaSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeCompletionBlockForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HMMediaSession _updateMediaState:completion:](self, "_updateMediaState:completion:", v8, v7);
}

- (void)_updateMediaState:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  _HMMediaSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _HMMediaSession *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  _HMMediaSession *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[5];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v56 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("pb-state"));
  v7 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v7;
  if (v7
    && (v8 = (void *)v7,
        v9 = -[_HMMediaSession playbackState](self, "playbackState"),
        v10 = objc_msgSend(v8, "unsignedIntegerValue"),
        v9 != v10))
  {
    v12 = v10;
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v16;
      v60 = 2048;
      v61 = v9;
      v62 = 2048;
      v63 = v12;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState playback state changed from %tu to %tu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    -[_HMMediaSession setPlaybackState:](v14, "setPlaybackState:", v12);
    -[_HMMediaSession _notifyDelegateOfUpdatedPlaybackState:](v14, "_notifyDelegateOfUpdatedPlaybackState:", v12);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ms-shuffle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[_HMMediaSession shuffleState](self, "shuffleState");
    v19 = objc_msgSend(v17, "unsignedIntegerValue");
    if (v18 != v19)
    {
      -[_HMMediaSession setShuffleState:](self, "setShuffleState:", v19);
      v11 = 1;
    }
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ms-repeat"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = -[_HMMediaSession repeatState](self, "repeatState");
    v22 = objc_msgSend(v20, "unsignedIntegerValue");
    if (v21 != v22)
    {
      -[_HMMediaSession setRepeatState:](self, "setRepeatState:", v22);
      v11 = 1;
    }
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ms-volume"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[_HMMediaSession audioControl](self, "audioControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volume");
    v26 = v25;

    objc_msgSend(v23, "floatValue");
    if (vabds_f32(v26, v27) > 0.0001)
    {
      -[_HMMediaSession audioControl](self, "audioControl");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      objc_msgSend(v28, "setVolume:");

      v11 = 1;
    }
  }
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("ms-mediaid"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[_HMMediaSession mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqualToString:", v29) & 1) == 0)
    {
      -[_HMMediaSession setMediaUniqueIdentifier:](self, "setMediaUniqueIdentifier:", v29);
      v11 = 1;
    }

  }
  v54 = v17;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ms-muted"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[_HMMediaSession audioControl](self, "audioControl");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isMuted");

    if (v33 != objc_msgSend(v31, "BOOLValue"))
    {
      v34 = (void *)MEMORY[0x1A1AC1AAC]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = v20;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "BOOLValue");
        HMFBooleanToString();
        v53 = v34;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v37;
        v60 = 2112;
        v61 = (int64_t)v38;
        v62 = 2112;
        v63 = (uint64_t)v39;
        _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState muted changed from %@ to %@", buf, 0x20u);

        v34 = v53;
        v20 = v52;
      }

      objc_autoreleasePoolPop(v34);
      -[_HMMediaSession audioControl](v35, "audioControl");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setMuted:", objc_msgSend(v31, "BOOLValue"));

      -[_HMMediaSession audioControl](v35, "audioControl");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v31, "BOOLValue");
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __48___HMMediaSession__updateMediaState_completion___block_invoke;
      v57[3] = &unk_1E3AB5CA8;
      v57[4] = v35;
      objc_msgSend(v41, "updateMuted:completionHandler:", v42, v57);

      v11 = 1;
    }
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMMediaSessionSleepWakeStateMessageKey"), v52);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43
    && (v44 = -[_HMMediaSession sleepWakeState](self, "sleepWakeState"),
        v45 = objc_msgSend(v43, "unsignedIntegerValue"),
        v44 != v45))
  {
    -[_HMMediaSession setSleepWakeState:](self, "setSleepWakeState:", v45);
    if (!v56)
    {
LABEL_34:
      -[_HMMediaSession _notifyDelegateOfUpdatedMediaState](self, "_notifyDelegateOfUpdatedMediaState");
      goto LABEL_35;
    }
  }
  else if (!v56)
  {
    if (!v11)
      goto LABEL_35;
    goto LABEL_34;
  }
  v46 = (void *)MEMORY[0x1A1AC1AAC]();
  v47 = self;
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v49;
    v60 = 2112;
    v61 = (int64_t)v55;
    _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_INFO, "%{public}@_updateMediaState calling completion with state: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v46);
  -[_HMMediaSession context](v47, "context");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "delegateCaller");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "callCompletion:error:", v56, 0);

LABEL_35:
}

- (void)updatePlaybackState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMMediaSession *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _HMMediaSession *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMMediaSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39___HMMediaSession_updatePlaybackState___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v13 = v4;
    v14 = self;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2080;
      v18 = "-[_HMMediaSession updatePlaybackState:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)updateMediaState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMMediaSession *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_HMMediaSession context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36___HMMediaSession_updateMediaState___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[_HMMediaSession updateMediaState:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_notifyDelegateOfUpdatedRouteUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _HMMediaSession *v13;
  id v14;

  v4 = a3;
  -[_HMMediaSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_HMMediaSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMMediaSession context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52___HMMediaSession__notifyDelegateOfUpdatedRouteUID___block_invoke;
    v11[3] = &unk_1E3AB5CD0;
    v12 = v7;
    v13 = self;
    v14 = v4;
    v10 = v7;
    objc_msgSend(v9, "invokeBlock:", v11);

  }
}

- (void)_handleSessionRouteUIDUpdated:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "stringForKey:", CFSTR("route-uid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_HMMediaSession routeUID](self, "routeUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMFEqualObjects() & 1) == 0)
  {
    -[_HMMediaSession setRouteUID:](self, "setRouteUID:", v5);
    -[_HMMediaSession _notifyDelegateOfUpdatedRouteUID:](self, "_notifyDelegateOfUpdatedRouteUID:", v5);
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HMMediaSession uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _HMMediaSession *v4;
  _HMMediaSession *v5;
  _HMMediaSession *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_HMMediaSession *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[_HMMediaSession uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMMediaSession uuid](v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  unint64_t v27;
  char v28;
  char v29;
  void *v30;
  NSObject *v31;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD block[5];
  id v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[_HMMediaSession routeUID](self, "routeUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "routeUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    v10 = MEMORY[0x1E0C809B0];
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMMediaSession setRouteUID:](self, "setRouteUID:", v11);

      -[_HMMediaSession context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E3AB5ED8;
      block[4] = self;
      v36 = v6;
      dispatch_async(v13, block);

    }
    v14 = -[_HMMediaSession playbackState](self, "playbackState");
    v15 = objc_msgSend(v6, "playbackState");
    v16 = v14 != v15;
    if (v14 != v15)
    {
      -[_HMMediaSession setPlaybackState:](self, "setPlaybackState:", objc_msgSend(v6, "playbackState"));
      -[_HMMediaSession context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "queue");
      v18 = objc_claimAutoreleasedReturnValue();
      v34[0] = v10;
      v34[1] = 3221225472;
      v34[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke_2;
      v34[3] = &unk_1E3AB5E18;
      v34[4] = self;
      dispatch_async(v18, v34);

    }
    v19 = -[_HMMediaSession shuffleState](self, "shuffleState");
    if (v19 != objc_msgSend(v6, "shuffleState"))
    {
      -[_HMMediaSession setShuffleState:](self, "setShuffleState:", objc_msgSend(v6, "shuffleState"));
      v16 = 1;
    }
    v20 = v10;
    v21 = -[_HMMediaSession repeatState](self, "repeatState");
    if (v21 != objc_msgSend(v6, "repeatState"))
    {
      -[_HMMediaSession setRepeatState:](self, "setRepeatState:", objc_msgSend(v6, "repeatState"));
      v16 = 1;
    }
    -[_HMMediaSession mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaUniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = HMFEqualObjects();

    if ((v24 & 1) == 0)
    {
      objc_msgSend(v6, "mediaUniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMMediaSession setMediaUniqueIdentifier:](self, "setMediaUniqueIdentifier:", v25);

      v16 = 1;
    }
    v26 = v9 ^ 1;
    v27 = -[_HMMediaSession sleepWakeState](self, "sleepWakeState");
    if (v27 == objc_msgSend(v6, "sleepWakeState"))
    {
      if (!v16)
      {
        v28 = 0;
LABEL_21:
        v29 = v28 | v26;
        goto LABEL_22;
      }
    }
    else
    {
      -[_HMMediaSession setSleepWakeState:](self, "setSleepWakeState:", objc_msgSend(v6, "sleepWakeState"));
    }
    -[_HMMediaSession context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "queue");
    v31 = objc_claimAutoreleasedReturnValue();
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __38___HMMediaSession_mergeFromNewObject___block_invoke_3;
    v33[3] = &unk_1E3AB5E18;
    v33[4] = self;
    dispatch_async(v31, v33);

    v28 = 1;
    goto LABEL_21;
  }
  v29 = 0;
LABEL_22:

  return v29;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMAudioControl)audioControl
{
  return (HMAudioControl *)objc_getProperty(self, a2, 88, 1);
}

- (_HMMediaSessionDelegate)delegate
{
  return (_HMMediaSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
