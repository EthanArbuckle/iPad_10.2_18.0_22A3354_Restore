@implementation HMMediaPlaybackAction

- (HMMediaPlaybackAction)init
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

- (HMMediaPlaybackAction)initWithUUID:(id)a3
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

- (HMMediaPlaybackAction)initWithMediaProfiles:(id)a3 playbackState:(int64_t)a4 volume:(id)a5 playbackArchive:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMMediaPlaybackAction *v13;
  HMMediaPlaybackAction *result;
  HMMediaPlaybackAction *v15;
  SEL v16;
  id v17;
  id v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    if (a4 || v11 || v12)
    {
      v13 = (HMMediaPlaybackAction *)-[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:](self, v10, a4, v11, v12, 0);

      return v13;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v15 = (HMMediaPlaybackAction *)_HMFPreconditionFailure();
  -[HMMediaPlaybackAction __configureWithContext:actionSet:](v15, v16, v17, v18);
  return result;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSSet *v9;
  NSSet *mediaProfiles;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMediaPlaybackAction;
  -[HMAction __configureWithContext:actionSet:](&v11, sel___configureWithContext_actionSet_, v6, v7);
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  resolveProfiles(self->_mediaProfiles, v8);
  v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  mediaProfiles = self->_mediaProfiles;
  self->_mediaProfiles = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)type
{
  return 1;
}

- (NSSet)mediaProfiles
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mediaProfiles;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (NSNumber)volume
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_volume;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (MPPlaybackArchive)playbackArchive
{
  os_unfair_lock_s *p_lock;
  MPPlaybackArchive *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_playbackArchive;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)encodeAsProtoBuf
{
  HMPBMediaPlaybackAction *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *mediaProfiles;
  NSMutableArray *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSData *volume;
  NSData *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSData *playbackArchive;
  NSData *v30;
  HMPBActionContainer *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  HMMediaPlaybackAction *v37;
  NSObject *v38;
  void *v39;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HMPBMediaPlaybackAction);
  -[HMAction uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_convertToData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_storeStrong((id *)&v3->_actionUUID, v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
    objc_storeStrong((id *)&v3->_mediaProfiles, v6);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[HMMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v11), "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hm_convertToData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
          mediaProfiles = v3->_mediaProfiles;
        else
          mediaProfiles = 0;
        v15 = mediaProfiles;
        -[NSMutableArray addObject:](v15, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      v9 = v16;
    }
    while (v16);
  }

  v17 = -[HMMediaPlaybackAction state](self, "state");
  if (v3)
  {
    *(_BYTE *)&v3->_has |= 1u;
    v3->_mediaPlaybackState = v17;
  }
  -[HMMediaPlaybackAction volume](self, "volume");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB36F8];
    -[HMMediaPlaybackAction volume](self, "volume");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v19, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_volume, v21);

      volume = v3->_volume;
    }
    else
    {

      volume = 0;
    }
    v24 = volume;

    if (!v24)
    {
      v32 = MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v34;
        v49 = 2112;
        v50 = v22;
        _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode volume: %@", buf, 0x16u);

      }
      v35 = (void *)v32;
      goto LABEL_35;
    }

  }
  -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB36F8];
    -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v26, "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, &v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v41;
    if (v3)
    {
      objc_storeStrong((id *)&v3->_playbackArchive, v28);

      playbackArchive = v3->_playbackArchive;
    }
    else
    {

      playbackArchive = 0;
    }
    v30 = playbackArchive;

    if (v30)
    {

      goto LABEL_28;
    }
    v36 = MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v39;
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);

    }
    v35 = (void *)v36;
LABEL_35:
    objc_autoreleasePoolPop(v35);

    v31 = 0;
    goto LABEL_36;
  }
LABEL_28:
  v31 = objc_alloc_init(HMPBActionContainer);
  -[HMPBActionContainer setType:](v31, "setType:", 2);
  -[HMPBActionContainer setMediaPlaybackAction:](v31, "setMediaPlaybackAction:", v3);
LABEL_36:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMediaPlaybackAction alloc], self->_mediaProfiles, self->_state, self->_volume, self->_playbackArchive, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMutableMediaPlaybackAction alloc], self->_mediaProfiles, self->_state, self->_volume, self->_playbackArchive, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (HMMediaPlaybackAction)initWithCoder:(id)a3
{
  id v4;
  HMMediaPlaybackAction *v5;
  HMMediaPlaybackAction *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSSet *mediaProfiles;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSNumber *volume;
  uint64_t v20;
  MPPlaybackArchive *playbackArchive;
  void *v22;
  HMMediaPlaybackAction *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  HMMediaPlaybackAction *v27;
  _QWORD v29[4];
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HMMediaPlaybackAction;
  v5 = -[HMAction initWithCoder:](&v31, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  -[HMAction actionSet](v5, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HMMPA.profiles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __39__HMMediaPlaybackAction_initWithCoder___block_invoke;
  v29[3] = &unk_1E3AAFBC0;
  v13 = v8;
  v30 = v13;
  objc_msgSend(v12, "na_map:", v29);
  v14 = objc_claimAutoreleasedReturnValue();
  mediaProfiles = v6->_mediaProfiles;
  v6->_mediaProfiles = (NSSet *)v14;

  v16 = -[NSSet count](v6->_mediaProfiles, "count");
  if (v16)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMPA.state"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_state = objc_msgSend(v17, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMPA.volume"));
    v18 = objc_claimAutoreleasedReturnValue();
    volume = v6->_volume;
    v6->_volume = (NSNumber *)v18;

    getMPPlaybackArchiveClass();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMPA.archive"));
    v20 = objc_claimAutoreleasedReturnValue();
    playbackArchive = v6->_playbackArchive;
    v6->_playbackArchive = (MPPlaybackArchive *)v20;

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = v6;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, no media profiles", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
  }

  if (!v16)
    v27 = 0;
  else
LABEL_8:
    v27 = v6;

  return v27;
}

- (void)updateWithAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMediaPlaybackAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  uint64_t v24;
  void *v25;
  HMMediaPlaybackAction *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMMediaPlaybackAction updateWithAction:completionHandler:]", CFSTR("action"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
LABEL_18:
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v28;
    v32 = 2112;
    v33 = (const char *)v24;
    _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_19:
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v8 = (void (**)(_QWORD, _QWORD))v7;
  -[HMAction context](self, "context");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMMediaPlaybackAction updateWithAction:completionHandler:]", CFSTR("completion"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_18;
  }
  v10 = (void *)v9;
  if (v9)
  {
    -[HMAction actionSet](self, "actionSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "_serializeForAdd");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAction uuid](self, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "_updateAction:changes:completionHandler:", self, v13, v8);
LABEL_13:

        goto LABEL_14;
      }
      -[HMMediaPlaybackAction _updateWithSerializedAction:home:](self, "_updateWithSerializedAction:home:", v13, v12);
      objc_msgSend(v10, "delegateCaller");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v21;
      v22 = v8;
      v23 = 0;
    }
    else
    {
      objc_msgSend(v10, "delegateCaller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v13;
      v22 = v8;
      v23 = v20;
    }
    objc_msgSend(v21, "callCompletion:error:", v22, v23);

    goto LABEL_13;
  }
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v18;
    v32 = 2080;
    v33 = "-[HMMediaPlaybackAction updateWithAction:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v8)[2](v8, v19);

LABEL_14:
}

- (HMMediaPlaybackAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMMediaPlaybackAction *v8;
  HMMediaPlaybackAction *v9;
  HMMediaPlaybackAction *v10;
  void *v11;
  HMMediaPlaybackAction *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMMediaPlaybackAction;
  v8 = -[HMAction initWithDictionary:home:](&v17, sel_initWithDictionary_home_, v6, v7);
  v9 = v8;
  if (v8
    && !-[HMMediaPlaybackAction _updateWithSerializedAction:home:](v8, "_updateWithSerializedAction:home:", v6, v7))
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = v9;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  HMMediaPlaybackAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (!-[HMAction isValid](self, "isValid"))
    return 0;
  v25.receiver = self;
  v25.super_class = (Class)HMMediaPlaybackAction;
  -[HMAction _serializeForAdd](&v25, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v30 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMediaPlaybackAction state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  -[HMMediaPlaybackAction volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMMediaPlaybackAction volume](self, "volume");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("volume"));

  }
  -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB36F8];
    -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;

    if (v12)
    {
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("playbackArchive"));
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  -[HMMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  objc_msgSend(v20, "na_map:", &__block_literal_global_16782);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("profiles"));

  v23 = (void *)objc_msgSend(v4, "copy");
  return v23;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;

  -[HMMediaPlaybackAction mediaProfiles](self, "mediaProfiles", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0;
  if (-[HMMediaPlaybackAction state](self, "state"))
    return 1;
  -[HMMediaPlaybackAction volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6 = 1;
  }
  else
  {
    -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;
  }

  return v6;
}

- (BOOL)isAffectedByEndEvents
{
  return -[HMMediaPlaybackAction state](self, "state") == 1;
}

- (BOOL)_updateWithSerializedAction:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  HMMediaPlaybackAction *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  HMMediaPlaybackAction *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMMediaPlaybackAction *v32;
  NSObject *v33;
  void *v34;
  void *v36;
  void *context;
  void *contexta;
  id v39;
  id obj;
  id obja;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kActionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = 0;
  if (v8 && v9 == 1)
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("volume"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("playbackArchive"));
    v14 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v14;
    if (v14)
    {
      v15 = v14;
      v16 = (void *)MEMORY[0x1E0CB3710];
      getMPPlaybackArchiveClass();
      v45 = 0;
      objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, &v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v45;
      if (!v17)
      {
        obj = v13;
        context = (void *)MEMORY[0x1A1AC1AAC]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          v48 = 2112;
          v49 = v18;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v13 = obj;
      }

    }
    else
    {
      v17 = 0;
    }
    if (v12)
      v21 = v11 == 0;
    else
      v21 = 1;
    if (!v21 || v13 || v17)
    {
      obja = v13;
      objc_msgSend(v6, "hmf_arrayForKey:", CFSTR("profiles"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v7;
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E0C99E60];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __58__HMMediaPlaybackAction__updateWithSerializedAction_home___block_invoke;
        v43[3] = &unk_1E3AAFC28;
        v44 = v7;
        objc_msgSend(v26, "na_map:", v43);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setWithArray:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = 0;
      }
      v30 = objc_msgSend(v29, "count");
      v10 = v30 != 0;
      if (v30)
      {
        os_unfair_lock_lock_with_options();
        self->_state = v12;
        objc_storeStrong((id *)&self->_volume, obja);
        objc_storeStrong((id *)&self->_playbackArchive, v17);
        objc_storeStrong((id *)&self->_mediaProfiles, v29);
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        v31 = (void *)MEMORY[0x1A1AC1AAC]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          contexta = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v34;
          _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@_updateWithSerializedAction no media profiles in action", buf, 0xCu);

          v31 = contexta;
        }

        objc_autoreleasePoolPop(v31);
      }

      v7 = v39;
      v13 = obja;
    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@_updateWithSerializedAction no state, volume, or queue contained in action", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMAction actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMMediaPlaybackAction _updateWithSerializedAction:home:](self, "_updateWithSerializedAction:home:", v4, v6);

  return (char)self;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t state;
  BOOL v14;
  NSSet *v15;
  NSSet *mediaProfiles;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMAction actionSet](self, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v6, "state");
    objc_msgSend(v6, "volume");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaProfiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    state = self->_state;
    v14 = state != v9;
    if (state != v9)
      self->_state = v9;
    if ((HMFEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_volume, v10);
      v14 = 1;
    }
    if ((HMFEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_playbackArchive, v11);
      v14 = 1;
    }
    if ((HMFEqualObjects() & 1) == 0)
    {
      resolveProfiles(v12, v8);
      v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
      mediaProfiles = self->_mediaProfiles;
      self->_mediaProfiles = v15;

      v14 = 1;
    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaPlaybackAction *v4;
  HMMediaPlaybackAction *v5;
  HMMediaPlaybackAction *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (HMMediaPlaybackAction *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_10;
    -[HMMediaPlaybackAction mediaProfiles](self, "mediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaPlaybackAction mediaProfiles](v6, "mediaProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToSet:", v8);

    if (!v9)
      goto LABEL_10;
    -[HMMediaPlaybackAction playbackArchive](self, "playbackArchive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaPlaybackAction playbackArchive](v6, "playbackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if (!v12)
      goto LABEL_10;
    v13 = -[HMMediaPlaybackAction state](self, "state");
    if (v13 == -[HMMediaPlaybackAction state](v6, "state"))
    {
      -[HMMediaPlaybackAction volume](self, "volume");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaPlaybackAction volume](v6, "volume");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = HMFEqualObjects();

    }
    else
    {
LABEL_10:
      v16 = 0;
    }

  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

id __58__HMMediaPlaybackAction__updateWithSerializedAction_home___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend(*(id *)(a1 + 32), "mediaProfileWithProfileUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __41__HMMediaPlaybackAction__serializeForAdd__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "profileUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __39__HMMediaPlaybackAction_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfileWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)initWithMediaProfiles:(uint64_t)a3 playbackState:(void *)a4 volume:(void *)a5 playbackArchive:(uint64_t)a6 uuid:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HMMediaPlaybackAction;
    v14 = objc_msgSendSuper2(&v20, sel_initWithUUID_, a6);
    if (v14)
    {
      v15 = objc_msgSend(v11, "copy");
      v16 = (void *)*((_QWORD *)v14 + 7);
      *((_QWORD *)v14 + 7) = v15;

      *((_QWORD *)v14 + 8) = a3;
      v17 = objc_msgSend(v12, "copy");
      v18 = (void *)*((_QWORD *)v14 + 9);
      *((_QWORD *)v14 + 9) = v17;

      objc_storeStrong((id *)v14 + 10, a5);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)actionWithProtoBuf:(id)a3 home:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  void *contexta;
  void *context;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3A28];
    v11 = v6[1];
    objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v51 = a1;
      v53 = v12;
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v14 = v6[3];
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v57;
        while (2)
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v57 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_UUIDWithBytesAsData:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v18));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "mediaProfileWithUUID:", v19);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              v34 = (void *)MEMORY[0x1A1AC1AAC]();
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v62 = (uint64_t)v36;
                v63 = 2112;
                v64 = v19;
                _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find mediaProfile: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v34);
              v9 = 0;
              v12 = v53;
              goto LABEL_33;
            }
            v21 = (void *)v20;
            objc_msgSend(v13, "addObject:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (v16)
            continue;
          break;
        }
      }

      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
      v50 = *((int *)v6 + 4);
      v22 = 0x1E0CB3000uLL;
      if (v6[5])
      {
        v23 = (void *)MEMORY[0x1E0C99E60];
        v60 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithArray:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0CB3710];
        v27 = v6[5];
        v55 = 0;
        objc_msgSend(v26, "unarchivedObjectOfClasses:fromData:error:", v25, v27, &v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v55;

        if (!v19)
        {
          v29 = (void *)MEMORY[0x1A1AC1AAC]();
          v30 = v51;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v32;
            contexta = v29;
            v33 = (void *)v32;
            v63 = 2112;
            v64 = v28;
            _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive volume from volume data: %@", buf, 0x16u);

            v29 = contexta;
          }

          objc_autoreleasePoolPop(v29);
        }

        v22 = 0x1E0CB3000;
      }
      else
      {
        v19 = 0;
      }
      if (v6[4])
      {
        v40 = *(void **)(v22 + 1808);
        getMPPlaybackArchiveClass();
        v41 = objc_opt_class();
        v42 = v6[4];
        v54 = 0;
        objc_msgSend(v40, "unarchivedObjectOfClass:fromData:error:", v41, v42, &v54);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v54;

        v12 = v53;
        if (!v43)
        {
          context = (void *)MEMORY[0x1A1AC1AAC]();
          v45 = v51;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = (uint64_t)v52;
            v63 = 2112;
            v64 = v44;
            _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Can't decode playbackArchive from protobuf: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
        }

      }
      else
      {
        v43 = 0;
        v12 = v53;
      }
      v9 = -[HMMediaPlaybackAction initWithMediaProfiles:playbackState:volume:playbackArchive:uuid:]([HMMediaPlaybackAction alloc], v14, v50, v19, v43, (uint64_t)v12);

LABEL_33:
    }
    else
    {
      v37 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = (uint64_t)v39;
        _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode uuid for action", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      v9 = 0;
    }

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
