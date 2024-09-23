@implementation HMMediaSession

void __38___HMMediaSession_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "routeUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_notifyDelegateOfUpdatedRouteUID:", v2);

}

uint64_t __38___HMMediaSession_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedPlaybackState:", objc_msgSend(*(id *)(a1 + 32), "playbackState"));
}

uint64_t __38___HMMediaSession_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedMediaState");
}

uint64_t __52___HMMediaSession__notifyDelegateOfUpdatedRouteUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSession:didUpdateRouteUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __36___HMMediaSession_updateMediaState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMediaState:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __39___HMMediaSession_updatePlaybackState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v4 = CFSTR("pb-state");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_updateMediaState:completion:", v3, 0);

}

void __48___HMMediaSession__updateMediaState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Set muted returned error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __53___HMMediaSession__notifyDelegateOfUpdatedMediaState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "playbackState");
    v8 = objc_msgSend(*(id *)(a1 + 32), "shuffleState");
    v9 = objc_msgSend(*(id *)(a1 + 32), "repeatState");
    objc_msgSend(*(id *)(a1 + 32), "audioControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "volume");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "mediaUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 32), "sleepWakeState");
    *(_DWORD *)buf = 138545154;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2048;
    v32 = v14;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling delegate didUpdateMediaState %@ with state: p:%tu s:%tu r:%tu v:%f m:%@ sw:%tu", buf, 0x52u);

    v2 = v16;
  }

  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "mediaSessionDidUpdate:", *(_QWORD *)(a1 + 32));
}

uint64_t __57___HMMediaSession__notifyDelegateOfUpdatedPlaybackState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSession:didUpdatePlaybackState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("pb-state");
  v20[1] = CFSTR("ms-shuffle");
  v20[2] = CFSTR("ms-repeat");
  v20[3] = CFSTR("ms-volume");
  v20[4] = CFSTR("ms-mediaid");
  v20[5] = CFSTR("ms-muted");
  v20[6] = CFSTR("HMMediaSessionSleepWakeStateMessageKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("property-list");
  v19 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:destination:payload:", CFSTR("HMMS.rp"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v8, "addCompletionBlock:forIdentifier:", v10, v9);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E3AB5C08;
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = v8;
  objc_msgSend(v6, "setResponseHandler:", v14);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:completionHandler:", v6, 0);

}

void __61___HMMediaSession_refreshPlaybackStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:obj:error:", v7, 0, v5);

  }
}

void __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21 = CFSTR("pb-state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageWithName:destination:payload:", CFSTR("HMMS.sp"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v8, "addCompletionBlock:forIdentifier:", v10, v9);

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke_2;
  v17 = &unk_1E3AB5C08;
  v18 = v8;
  v19 = v9;
  v20 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = v8;
  objc_msgSend(v6, "setResponseHandler:", &v14);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:completionHandler:", v6, 0);

}

void __54___HMMediaSession_setPlaybackState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", v7, v5);

}

- (HMMediaSession)initWithUUID:(id)a3 routeUID:(id)a4 playbackState:(int64_t)a5 shuffleState:(int64_t)a6 repeatState:(int64_t)a7 mediaUniqueIdentifier:(id)a8 sleepWakeState:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  HMMediaSession *v18;
  NSUUID *v19;
  NSUUID *uuid;
  HMAudioControl *v21;
  HMAudioControl *audioControl;
  _HMMediaSession *v23;
  _HMMediaSession *mediaSession;
  objc_super v26;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMMediaSession;
  v18 = -[HMMediaSession init](&v26, sel_init);
  if (v18)
  {
    if (v15)
    {
      v19 = (NSUUID *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    uuid = v18->_uuid;
    v18->_uuid = v19;

    v21 = -[HMAudioControl initWithMediaSession:]([HMAudioControl alloc], "initWithMediaSession:", v18);
    audioControl = v18->_audioControl;
    v18->_audioControl = v21;

    v23 = -[_HMMediaSession initWithUUID:routeUID:playbackState:shuffleState:repeatState:audioControl:mediaUniqueIdentifier:sleepWakeState:]([_HMMediaSession alloc], "initWithUUID:routeUID:playbackState:shuffleState:repeatState:audioControl:mediaUniqueIdentifier:sleepWakeState:", v15, v16, a5, a6, a7, v18->_audioControl, v17, a9);
    mediaSession = v18->_mediaSession;
    v18->_mediaSession = v23;

    -[_HMMediaSession setDelegate:](v18->_mediaSession, "setDelegate:", v18);
  }

  return v18;
}

- (void)configure:(id)a3 messageTargetUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMediaSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  HMMediaSession *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media session: %@ message target uuid: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMediaSession mediaSession](v9, "mediaSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMessageTargetUUID:", v7);

  -[HMMediaSession mediaSession](v9, "mediaSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContext:", v6);

  -[HMMediaSession audioControl](v9, "audioControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "__configureWithContext:", v6);

}

- (void)_unconfigure
{
  void *v3;
  void *v4;
  void *v5;
  HMMediaSession *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMMediaSession mediaSession](self, "mediaSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring mediaSession", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMMediaSession audioControl](v6, "audioControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_unconfigure");

    -[HMMediaSession mediaSession](v6, "mediaSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContext:", 0);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)updatePlaybackState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePlaybackState:", v4);

}

- (id)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uuid
{
  void *v2;
  void *v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)setUuid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v4);

}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (int64_t)playbackState
{
  void *v2;
  int64_t v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState");

  return v3;
}

- (int64_t)shuffleState
{
  void *v2;
  int64_t v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shuffleState");

  return v3;
}

- (int64_t)repeatState
{
  void *v2;
  int64_t v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "repeatState");

  return v3;
}

- (NSString)mediaUniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)sleepWakeState
{
  void *v2;
  unint64_t v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepWakeState");

  return v3;
}

- (void)updateMediaState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMediaState:", v4);

}

- (NSString)routeUID
{
  void *v2;
  void *v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)playbackStateDescription
{
  int64_t v2;

  v2 = -[HMMediaSession playbackState](self, "playbackState");
  if ((unint64_t)(v2 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E3AAFAC0[v2 - 1];
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackState:completionHandler:", 1, v4);

}

- (void)pauseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackState:completionHandler:", 2, v4);

}

- (void)refreshPlaybackStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshPlaybackStateWithCompletionHandler:", v4);

}

- (void)updatePlaybackState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HMMediaSession mediaSession](self, "mediaSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackState:completionHandler:", a3, v6);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSession routeUID](self, "routeUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaSession playbackState](self, "playbackState");
  -[HMMediaSession playbackStateDescription](self, "playbackStateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMediaSession shuffleState](self, "shuffleState");
  v10 = -[HMMediaSession repeatState](self, "repeatState");
  -[HMMediaSession mediaUniqueIdentifier](self, "mediaUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<RouteUID %@ Playback State %lu (%@) Shuffle %lu Repeat %lu MediaUniqueIdentifier %@>"), v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HMMediaSession *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  HMMediaSession *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMMediaSession *v23;
  int64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMMediaSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a4 - 1) > 5)
      v12 = CFSTR("Unknown");
    else
      v12 = off_1E3AAFAC0[a4 - 1];
    v13 = v12;
    *(_DWORD *)buf = 138543874;
    v26 = v11;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notify client of did update playback state: %@ delegate: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMediaSession mediaSession](v9, "mediaSession");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString context](v14, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__HMMediaSession_mediaSession_didUpdatePlaybackState___block_invoke;
      v21[3] = &unk_1E3AB5C80;
      v22 = v7;
      v23 = v9;
      v24 = a4;
      objc_msgSend(v16, "invokeBlock:", v21);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of did update playback state due to no delegate caller from media session: %@ context: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)mediaSessionDidUpdate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HMMediaSession *v13;

  -[HMMediaSession delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HMMediaSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSession mediaSession](self, "mediaSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__HMMediaSession_mediaSessionDidUpdate___block_invoke;
    v11[3] = &unk_1E3AB5ED8;
    v12 = v6;
    v13 = self;
    v10 = v6;
    objc_msgSend(v9, "invokeBlock:", v11);

  }
}

- (void)mediaSession:(id)a3 didUpdateRouteUID:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HMMediaSession *v17;
  id v18;

  v5 = a4;
  -[HMMediaSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HMMediaSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE45A958))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    -[HMMediaSession mediaSession](self, "mediaSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__HMMediaSession_mediaSession_didUpdateRouteUID___block_invoke;
    v15[3] = &unk_1E3AB5CD0;
    v16 = v10;
    v17 = self;
    v18 = v5;
    v14 = v10;
    objc_msgSend(v13, "invokeBlock:", v15);

  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMMediaSession mediaSession](self, "mediaSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "mergeFromNewObject:", v8);

    -[HMMediaSession audioControl](self, "audioControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "mergeFromNewObject:", v11) | v9;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaSession mediaSession](self, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaSession *v4;
  HMMediaSession *v5;
  HMMediaSession *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMMediaSession *)a3;
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
      -[HMMediaSession mediaSession](self, "mediaSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSession mediaSession](v6, "mediaSession");
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

- (HMMediaSession)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMediaSession *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ms.pb-state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v5 = 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ms.shuffle-state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v8 = 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ms.repeat-state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
  else
    v11 = 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ms.muid-state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ms.route-uid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMMediaSessionSleepWakeStateCodingKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v14 = (void *)objc_msgSend(v14, "unsignedIntegerValue");
  v16 = -[HMMediaSession initWithUUID:routeUID:playbackState:shuffleState:repeatState:mediaUniqueIdentifier:sleepWakeState:](self, "initWithUUID:routeUID:playbackState:shuffleState:repeatState:mediaUniqueIdentifier:sleepWakeState:", 0, v13, v5, v8, v11, v12, v14);
  if (v16)
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ac.volume"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[HMMediaSession audioControl](v16, "audioControl");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      objc_msgSend(v18, "setVolume:");

    }
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ac.muted"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[HMMediaSession audioControl](v16, "audioControl");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMuted:", objc_msgSend(v19, "BOOLValue"));

    }
  }

  return v16;
}

- (HMAudioControl)audioControl
{
  return (HMAudioControl *)objc_getProperty(self, a2, 16, 1);
}

- (HMMediaSessionDelegate)delegate
{
  return (HMMediaSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_HMMediaSession)mediaSession
{
  return self->_mediaSession;
}

- (void)setMediaSession:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSession, a3);
}

- (HMMediaProfile)mediaProfile
{
  return (HMMediaProfile *)objc_loadWeakRetained((id *)&self->_mediaProfile);
}

- (void)setMediaProfile:(id)a3
{
  objc_storeWeak((id *)&self->_mediaProfile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaProfile);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_mediaUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

uint64_t __49__HMMediaSession_mediaSession_didUpdateRouteUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSession:didUpdateRouteUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __40__HMMediaSession_mediaSessionDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSessionDidUpdate:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__HMMediaSession_mediaSession_didUpdatePlaybackState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaSession:didUpdatePlaybackState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
