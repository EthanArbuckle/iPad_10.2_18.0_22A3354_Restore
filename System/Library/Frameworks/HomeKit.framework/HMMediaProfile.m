@implementation HMMediaProfile

void __56___HMMediaProfile__notifyDelegateOfUpdatedMediaSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfile:didUpdateMediaSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (HMMediaProfile)init
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

- (HMMediaProfile)initWithMediaProfile:(id)a3
{
  id v4;
  HMMediaProfile *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMMediaProfile;
  v5 = -[HMAccessoryProfile initWithAccessoryProfile:](&v7, sel_initWithAccessoryProfile_, v4);
  if (v5)
    objc_msgSend(v4, "setDelegate:", v5);

  return v5;
}

- (HMAccessorySettings)settings
{
  void *v2;
  void *v3;

  -[HMAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessorySettings *)v3;
}

- (HMMediaSession)mediaSession
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaSession *)v5;
}

- (NSString)routeUID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "routeUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)capability
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "capability");
  return v5;
}

- (void)setCapability:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "setCapability:", a3);
}

- (HMHome)containerHome
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "containerHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v6;
}

- (NSUUID)containerUUID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v6;
}

- (void)mediaProfile:(id)a3 didUpdateMediaSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMMediaProfile *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMMediaProfile *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  HMMediaProfile *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  HMMediaProfile *v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMMediaProfile delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) != 0)
  {
    -[HMMediaProfile delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v15;
      v53 = 2112;
      v54 = v7;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media session: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMAccessoryProfile accessoryProfile](v13, "accessoryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v10;
    v46[1] = 3221225472;
    v46[2] = __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke;
    v46[3] = &unk_1E3AB5CD0;
    v47 = v11;
    v48 = v13;
    v49 = v7;
    v19 = v11;
    objc_msgSend(v18, "invokeBlock:", v46);

  }
  -[HMMediaProfile delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE452DD0))
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v26;
      v53 = 2112;
      v54 = v7;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Notifying media object of updated media session: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMAccessoryProfile accessoryProfile](v24, "accessoryProfile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    v42[1] = 3221225472;
    v42[2] = __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke_61;
    v42[3] = &unk_1E3AB5CD0;
    v43 = v22;
    v44 = v24;
    v45 = v7;
    objc_msgSend(v29, "invokeBlock:", v42);

  }
  -[HMAccessoryProfile accessory](self, "accessory");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "home");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "mediaSystems");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v39;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v37++), "updateMediaSession:forMediaProfile:", v7, self, (_QWORD)v38);
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v35);
  }

}

- (void)fetchAccessorySleepWakeStateWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMMediaProfile *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMMediaProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMMediaProfile *v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  HMMediaProfile *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMMediaProfile fetchAccessorySleepWakeStateWithCompletion:]", CFSTR("completion"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v33;
      v41 = 2112;
      v42 = v29;
      _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v29, 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  -[HMAccessoryProfile accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMAccessoryProfile accessoryProfile](self, "accessoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "categoryType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"));

      if ((v12 & 1) != 0)
      {
        v13 = objc_alloc(MEMORY[0x1E0D285D8]);
        objc_msgSend(v6, "messageTargetUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMFetchAppleMediaAccessorySleepWakeStateMessage"), v15, 0);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke;
        v35[3] = &unk_1E3AB60C8;
        v36 = v8;
        v37 = self;
        v38 = v5;
        objc_msgSend(v16, "setResponseHandler:", v35);
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v9, "sendMessage:", v17);

LABEL_14:
        goto LABEL_15;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = 3;
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
        *(_DWORD *)buf = 138543618;
        v40 = v25;
        v41 = 2112;
        v42 = (uint64_t)v8;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch sleep wake state due to no message dispatcher given by context: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = 21;
    }
    objc_msgSend(v26, "hmErrorWithCode:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v28);

    goto LABEL_14;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v21;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch sleep wake state due to no accessory on media profile", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v8);
LABEL_15:

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "mediaSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaProfile mediaSession](self, "mediaSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mergeFromNewObject:", v8);

    v11 = -[HMMediaProfile capability](self, "capability");
    if (v11 != objc_msgSend(v7, "capability"))
    {
      -[HMMediaProfile setCapability:](self, "setCapability:", objc_msgSend(v7, "capability"));
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  HMMediaProfile *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMMediaProfile *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@nil completion handler", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  -[HMMediaProfile mediaSession](self, "mediaSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "refreshPlaybackStateWithCompletionHandler:", v5);
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
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine media session", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v12);

  }
}

- (HMMediaProfileDelegate)delegate
{
  return (HMMediaProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeUID, 0);
}

void __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke_2;
  v12[3] = &unk_1E3AB4D20;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "invokeBlock:", v12);

}

void __61__HMMediaProfile_fetchAccessorySleepWakeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 32);
      v18 = 138543618;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Fetch accessory SleepWake state request message responded with error: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "hmf_numberForKey:", CFSTR("HMFetchAppleMediaAccessorySleepWakeStateKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v11;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch accessory SleepWake state request message responded with result: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = v7;
      v15 = v14;
      if (v13)
      {
        if (objc_msgSend(v14, "unsignedIntValue") == 2)
          v13 = 2;
        else
          v13 = objc_msgSend(v15, "unsignedIntValue") == 1;
      }

      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, v13, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
  }
}

uint64_t __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaProfile:didUpdateMediaSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53__HMMediaProfile_mediaProfile_didUpdateMediaSession___block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaObject:didUpdateMediaSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
