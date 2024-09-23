@implementation _HMMediaProfile

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _HMMediaProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v14.receiver = v9;
  v14.super_class = (Class)_HMMediaProfile;
  -[_HMAccessoryProfile __configureWithContext:accessory:](&v14, sel___configureWithContext_accessory_, v6, v7);
  -[_HMMediaProfile mediaSession](v9, "mediaSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMAccessoryProfile messageTargetUUID](v9, "messageTargetUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configure:messageTargetUUID:", v6, v13);

}

- (HMMediaSession)mediaSession
{
  os_unfair_lock_s *p_lock;
  HMMediaSession *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaSession:(id)a3
{
  id v5;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaSession, a3);
    -[_HMMediaProfile _notifyDelegateOfUpdatedMediaSession:](self, "_notifyDelegateOfUpdatedMediaSession:", v5);
  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)_notifyDelegateOfUpdatedMediaSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _HMMediaProfile *v9;
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
  -[_HMAccessoryProfile context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56___HMMediaProfile__notifyDelegateOfUpdatedMediaSession___block_invoke;
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
      v17 = "-[_HMMediaProfile _notifyDelegateOfUpdatedMediaSession:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (NSString)routeUID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
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

  os_unfair_lock_unlock(&self->super._lock);
}

- (unint64_t)capability
{
  os_unfair_lock_s *p_lock;
  unint64_t capability;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  capability = self->_capability;
  os_unfair_lock_unlock(p_lock);
  return capability;
}

- (void)setCapability:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_capability = a3;
  os_unfair_lock_unlock(p_lock);
}

- (_HMMediaProfile)initWithCoder:(id)a3
{
  id v4;
  _HMMediaProfile *v5;
  uint64_t v6;
  NSString *routeUID;
  void *v8;
  void *v9;
  uint64_t v10;
  HMMediaSession *mediaSession;
  HMMediaSession *v12;
  HMMediaSession *v13;
  HMMediaSession *v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HMMediaProfile;
  v5 = -[_HMAccessoryProfile initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMP.route-uid"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeUID = v5->_routeUID;
    v5->_routeUID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMP.sessionUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMP.session"));
    v10 = objc_claimAutoreleasedReturnValue();
    mediaSession = v5->_mediaSession;
    v5->_mediaSession = (HMMediaSession *)v10;

    v12 = v5->_mediaSession;
    if (v12)
    {
      -[HMMediaSession setUuid:](v12, "setUuid:", v9);
    }
    else
    {
      v13 = -[HMMediaSession initWithUUID:routeUID:playbackState:shuffleState:repeatState:mediaUniqueIdentifier:sleepWakeState:]([HMMediaSession alloc], "initWithUUID:routeUID:playbackState:shuffleState:repeatState:mediaUniqueIdentifier:sleepWakeState:", v9, 0, 0, 0, 0, 0, 0);
      v14 = v5->_mediaSession;
      v5->_mediaSession = v13;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HMMP.capabilities")))
      v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMMP.capabilities"));
    else
      v15 = 0;
    v5->_capability = v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)handleRuntimeStateUpdate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMMediaProfile;
  v4 = a3;
  -[_HMAccessoryProfile handleRuntimeStateUpdate:](&v6, sel_handleRuntimeStateUpdate_, v4);
  -[_HMMediaProfile mediaSession](self, "mediaSession", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMediaState:", v4);

}

- (_HMMediaProfileDelegate)delegate
{
  return (_HMMediaProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
