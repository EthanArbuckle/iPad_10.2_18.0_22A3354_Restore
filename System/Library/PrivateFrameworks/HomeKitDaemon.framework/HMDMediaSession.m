@implementation HMDMediaSession

- (id)_initWithEndpoint:(id)a3 mediaProfiles:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDMediaSession *v13;
  uint64_t v14;
  NSMutableSet *mediaProfiles;
  uint64_t v16;
  NSString *sessionIdentifier;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSUUID *uuid;
  void *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  NSString *logID;
  uint64_t v28;
  NSMutableArray *setPlaybackStateCompletionHandlers;
  id v30;
  const char *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *workQueue;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
    _HMFPreconditionFailure();
  v12 = v11;
  v36.receiver = self;
  v36.super_class = (Class)HMDMediaSession;
  v13 = -[HMDMediaSession init](&v36, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    mediaProfiles = v13->_mediaProfiles;
    v13->_mediaProfiles = (NSMutableSet *)v14;

    objc_storeStrong((id *)&v13->_state, a5);
    objc_msgSend(v12, "sessionIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v13->_sessionIdentifier;
    v13->_sessionIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x24BDD1880];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
    v37[0] = v13->_sessionIdentifier;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:withSalts:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v21;

    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = v13->_sessionIdentifier;
    -[NSUUID UUIDString](v13->_uuid, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@"), v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    logID = v13->_logID;
    v13->_logID = (NSString *)v26;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    setPlaybackStateCompletionHandlers = v13->_setPlaybackStateCompletionHandlers;
    v13->_setPlaybackStateCompletionHandlers = (NSMutableArray *)v28;

    HMDispatchQueueNameString();
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = (const char *)objc_msgSend(v30, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create(v31, v32);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v33;

    objc_storeStrong((id *)&v13->_endpoint, a3);
  }

  return v13;
}

- (id)_initWithMediaProfiles:(id)a3 state:(id)a4
{
  return -[HMDMediaSession _initWithEndpoint:mediaProfiles:state:](self, "_initWithEndpoint:mediaProfiles:state:", 0, a3, a4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDMediaSession setSetPlaybackStateTimer:](self, "setSetPlaybackStateTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaSession;
  -[HMDMediaSession dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDMediaSession uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaSession *v4;
  HMDMediaSession *v5;
  HMDMediaSession *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDMediaSession *)a3;
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
      -[HMDMediaSession uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaSession uuid](v6, "uuid");
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

- (id)dumpState
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDMediaSession uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSession sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSession state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackState");
  playbackStateAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSession endpoint](self, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MediaSession uuid: %@, sessionIdentifier: %@, playbackState: %@, endpoint: %@"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BE3EB68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_getPlaybackStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  HMDMediaSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke;
  aBlock[3] = &unk_24E785CF0;
  objc_copyWeak(&v28, &location);
  v6 = v4;
  v27 = v6;
  v7 = _Block_copy(aBlock);
  if (-[HMDMediaSession isCurrentAccessorySession](self, "isCurrentAccessorySession"))
  {
    v8 = MRMediaRemoteGetLocalOrigin() == 0;
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    if (v8)
    {
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up local origin for currentAccessory to get playback state", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2005);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("Cannot lookup origin"), CFSTR("Cannot lookup origin"), 0, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v18, 0);

      }
    }
    else
    {
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Attempting to locally read the playback state from media remote", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDMediaSession workQueue](v10, "workQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
      v22 = 3221225472;
      v23 = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_31;
      v24 = &unk_24E785D18;
      v25 = v7;
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

    }
  }
  else
  {
    -[HMDMediaSession endpoint](self, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_2;
    v19[3] = &unk_24E785D68;
    v19[4] = self;
    v20 = v7;
    objc_msgSend(v14, "getPlaybackStateWithCompletionHandler:", v19);

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)_handleGetPlaybackState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__HMDMediaSession__handleGetPlaybackState___block_invoke;
  v6[3] = &unk_24E785D90;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HMDMediaSession _getPlaybackStateWithCompletion:](self, "_getPlaybackStateWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)handleRefreshPlayback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDMediaSession_handleRefreshPlayback___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleMediaPlaybackStateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_registerForSessionUpdates:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (!-[HMDMediaSession isCurrentAccessorySession](self, "isCurrentAccessorySession"))
  {
    -[HMDMediaSession endpoint](self, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForNowPlayingUpdates:", v3);

  }
  if (v3)
    -[HMDMediaSession _handleGetPlaybackState:](self, "_handleGetPlaybackState:", 0);
}

- (void)_postNotificationOfMediaStateUpdate
{
  -[HMDMediaSession _postNotificationOfMediaStateUpdateWithPayload:](self, "_postNotificationOfMediaStateUpdateWithPayload:", 0);
}

- (void)_postNotificationOfMediaStateUpdateWithRequestMessageInformation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = *MEMORY[0x24BDD6710];
    v8[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[HMDMediaSession _postNotificationOfMediaStateUpdateWithPayload:](self, "_postNotificationOfMediaStateUpdateWithPayload:", v6);

}

- (void)_postNotificationOfMediaStateUpdateWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDMediaSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v24[0] = *MEMORY[0x24BDD66E0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDMediaSession state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "playbackState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v24[1] = *MEMORY[0x24BDD6750];
  -[HMDMediaSession uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v4)
    v12 = objc_msgSend(v11, "addEntriesFromDictionary:", v4);
  v13 = (void *)MEMORY[0x227676638](v12);
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v16;
    v20 = 2112;
    v21 = CFSTR("HMDMediaSessionDidUpdatePlaybackStateNotification");
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending internal notification %@ with payload %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("HMDMediaSessionDidUpdatePlaybackStateNotification"), v14, v11);

}

- (void)updateWithResponses:(id)a3 requestMessageInformation:(id)a4
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
  -[HMDMediaSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDMediaSession_updateWithResponses_requestMessageInformation___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_invokePendingSetPlaybackStateBlocksOfError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "suspend");

    -[HMDMediaSession setSetPlaybackStateTimer:](self, "setSetPlaybackStateTimer:", 0);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDMediaSession setPlaybackStateCompletionHandlers](self, "setPlaybackStateCompletionHandlers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[HMDMediaSession setPlaybackStateCompletionHandlers](self, "setPlaybackStateCompletionHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (void)_queueSetPlaybackStateCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *aBlock;

  v4 = a3;
  if (v4)
  {
    aBlock = v4;
    -[HMDMediaSession setPlaybackStateCompletionHandlers](self, "setPlaybackStateCompletionHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(aBlock);
    objc_msgSend(v5, "addObject:", v6);

    -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = aBlock;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferenceForKey:", CFSTR("playbackStateTimeout"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (double)objc_msgSend(v10, "unsignedIntValue");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, v11);
      -[HMDMediaSession setSetPlaybackStateTimer:](self, "setSetPlaybackStateTimer:", v12);

      -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      -[HMDMediaSession setPlaybackStateTimer](self, "setPlaybackStateTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resume");

      v4 = aBlock;
    }
  }

}

- (void)_setPlaybackState:(int64_t)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  HMDMediaSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  HMDMediaSession *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  id v36;
  _QWORD aBlock[4];
  id v38[2];
  id location;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (a3 == 1)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v8 = 1;
LABEL_5:
    -[HMDMediaSession _queueSetPlaybackStateCompletion:](self, "_queueSetPlaybackStateCompletion:", v6);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke;
    aBlock[3] = &unk_24E785DE0;
    objc_copyWeak(v38, &location);
    v38[1] = (id)a3;
    v10 = _Block_copy(aBlock);
    if (-[HMDMediaSession isCurrentAccessorySession](self, "isCurrentAccessorySession"))
    {
      v11 = MRMediaRemoteGetLocalOrigin() == 0;
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      if (v11)
      {
        HMFGetOSLogHandle();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v27;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up local origin for currentAccessory to set playback state", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2005);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("Cannot lookup origin"), CFSTR("Cannot lookup origin"), 0, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v7)[2](v7, v29);

        }
      }
      else
      {
        HMFGetOSLogHandle();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v15;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to set the playback state command with mediaRemote to local origin", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v12);
        -[HMDMediaSession workQueue](v13, "workQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        v33 = 3221225472;
        v34 = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_44;
        v35 = &unk_24E785E08;
        v36 = v10;
        v17 = MRMediaRemoteSendCommandForOriginWithReply() == 0;

        if (v17)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v13;
          HMFGetOSLogHandle();
          v20 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v41 = v21;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Sending the command to mediaremote failed for mediaSession", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2005);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 74, CFSTR("Media remote command send failure "), CFSTR("Media remote command send failure"), 0, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaSession _invokePendingSetPlaybackStateBlocksOfError:](v19, "_invokePendingSetPlaybackStateBlocksOfError:", v23);

        }
      }
    }
    else
    {
      -[HMDMediaSession endpoint](self, "endpoint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v9;
      v30[1] = 3221225472;
      v30[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_50;
      v30[3] = &unk_24E785E30;
      v30[4] = self;
      v31 = v10;
      objc_msgSend(v25, "setPlaybackState:completionHandler:", v8, v30);

    }
    objc_destroyWeak(v38);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v24);

  }
LABEL_18:

}

- (void)_handleSetPlayback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD66E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__HMDMediaSession__handleSetPlayback___block_invoke;
    v9[3] = &unk_24E798300;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    -[HMDMediaSession _setPlaybackState:completion:](self, "_setPlaybackState:completion:", v7, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);

  }
}

- (void)handleSetPlayback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__HMDMediaSession_handleSetPlayback___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_notifyClientsOfUpdatedVolume:(id)a3 muted:(id)a4 inResponseToMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMediaSessionRequestMessageInformation *v16;
  void *v17;
  void *v18;
  HMDMediaSession *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCED8];
  v28 = *MEMORY[0x24BDD6750];
  -[HMDMediaSession uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = -[HMDMediaSessionRequestMessageInformation initWithMessage:]([HMDMediaSessionRequestMessageInformation alloc], "initWithMessage:", v10);
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDD6710]);

  }
  if (v8)
    objc_msgSend(v15, "setObject:forKey:", v8, *MEMORY[0x24BDD66B0]);
  if (v9)
    objc_msgSend(v15, "setObject:forKey:", v9, *MEMORY[0x24BDD6698]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("HMDMediaSessionDidUpdateAudioControlNotification"), self, v15);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v21;
    v24 = 2112;
    v25 = CFSTR("HMDMediaSessionDidUpdateAudioControlNotification");
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Sending internal notification %@ with payload %@", (uint8_t *)&v22, 0x20u);

  }
  objc_autoreleasePoolPop(v18);

}

- (void)handleMediaSessionSetAudioControl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMDMediaSession_handleMediaSessionSetAudioControl___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleMediaSessionSetAudioControl:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "messagePayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD66B0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD66B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDMediaSession _handleMediaUpdateVolume:](self, "_handleMediaUpdateVolume:", v10);
  }
  else
  {
    objc_msgSend(v10, "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HMDMediaSession _handleMediaUpdateMuted:](self, "_handleMediaUpdateMuted:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v9);

    }
  }

}

- (void)_handleMediaUpdateVolume:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "numberForKey:", *MEMORY[0x24BDD66B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = (void *)MEMORY[0x24BDD1540];
    if (v5 >= 0.0 && v5 <= 1.0)
      v8 = 48;
    else
      v8 = 3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v8 = 20;
  }
  objc_msgSend(v6, "hmErrorWithCode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "respondWithError:", v9);

}

- (void)_handleMediaUpdateMuted:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x24BDD6698];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v5 = 48;
  else
    v5 = 20;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v6);

}

- (void)registerForSessionUpdates:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__HMDMediaSession_registerForSessionUpdates___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (HMDMediaEndpoint)endpoint
{
  os_unfair_lock_s *p_lock;
  HMDMediaEndpoint *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateEndpoint:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  HMDMediaEndpoint **p_endpoint;
  HMDMediaEndpoint *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  HMDMediaEndpoint *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_endpoint = &self->_endpoint;
  v8 = self->_endpoint;
  -[HMDMediaEndpoint sessionIdentifier](v8, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_storeStrong((id *)p_endpoint, a3);
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@MediaSession endpoint %@ changed to %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)mediaProfiles
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_mediaProfiles, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)readProperties:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDMediaSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDMediaSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HMDMediaSession_readProperties_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)writeProperties:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDMediaSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDMediaSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke;
  block[3] = &unk_24E79B440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)isConnected
{
  void *v2;
  char v3;

  -[HMDMediaSession endpoint](self, "endpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (HMDMediaSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[HMDMediaSession state](self, "state");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "playbackState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD66D8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "shuffleState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6730]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "repeatState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD6700]);

  objc_msgSend(v13, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, *MEMORY[0x24BDD66A8]);

  objc_msgSend(v13, "muted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x24BDD6690]);

  objc_msgSend(v13, "mediaUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, *MEMORY[0x24BDD66C0]);

  -[HMDMediaSession sessionIdentifier](self, "sessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, *MEMORY[0x24BDD6718]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "sleepWakeState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x24BDD6740]);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDMediaSession *v9;

  v4 = a3;
  -[HMDMediaSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__HMDMediaSession_timerDidFire___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (HMDMediaSessionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isCurrentAccessorySession
{
  return self->_currentAccessorySession;
}

- (void)setCurrentAccessorySession:(BOOL)a3
{
  self->_currentAccessorySession = a3;
}

- (NSString)logID
{
  return self->_logID;
}

- (void)setLogID:(id)a3
{
  objc_storeStrong((id *)&self->_logID, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSMutableArray)setPlaybackStateCompletionHandlers
{
  return self->_setPlaybackStateCompletionHandlers;
}

- (void)setSetPlaybackStateCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_setPlaybackStateCompletionHandlers, a3);
}

- (HMFTimer)setPlaybackStateTimer
{
  return self->_setPlaybackStateTimer;
}

- (void)setSetPlaybackStateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_setPlaybackStateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPlaybackStateTimer, 0);
  objc_storeStrong((id *)&self->_setPlaybackStateCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

void __32__HMDMediaSession_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setPlaybackStateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "setSetPlaybackStateTimer:", 0));
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Timed out waiting for media playback state notification - reading the state explicitly...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    v8 = (id *)(a1 + 40);
    objc_msgSend(v9, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "playbackState");

    objc_initWeak((id *)buf, *v8);
    v12 = *v8;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __32__HMDMediaSession_timerDidFire___block_invoke_60;
    v13[3] = &unk_24E785DB8;
    objc_copyWeak(v14, (id *)buf);
    v14[1] = v11;
    objc_msgSend(v12, "_getPlaybackStateWithCompletion:", v13);
    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
}

void __32__HMDMediaSession_timerDidFire___block_invoke_60(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_invokePendingSetPlaybackStateBlocksOfError:", v6);

  if (!v6 && *(_QWORD *)(a1 + 40) != a3)
    objc_msgSend(WeakRetained, "_postNotificationOfMediaStateUpdate");

}

void __46__HMDMediaSession_writeProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
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
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  __int128 v22;
  void *v23;
  id obj;
  uint64_t v25;
  NSObject *group;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  id v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  group = dispatch_group_create();
  v27 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v2)
  {
    v25 = *(_QWORD *)v36;
    v4 = *MEMORY[0x24BDD66E0];
    *(_QWORD *)&v3 = 138543618;
    v22 = v3;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v6, "property", v22);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", v4);

        if (v8)
        {
          v9 = (void *)MEMORY[0x227676638]();
          v10 = *(id *)(v27 + 40);
          HMFGetOSLogHandle();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v40 = v12;
            v41 = 2112;
            v42 = v13;
            _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting playback state received from remote %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v9);
          objc_msgSend(*(id *)(v27 + 40), "state");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v14, "playbackState");

          objc_msgSend(v6, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedIntegerValue");

          dispatch_group_enter(group);
          objc_initWeak((id *)buf, *(id *)(v27 + 40));
          v18 = *(void **)(v27 + 40);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_55;
          v31[3] = &unk_24E785E80;
          objc_copyWeak(v34, (id *)buf);
          v31[4] = v6;
          v34[1] = v15;
          v32 = v23;
          v33 = group;
          objc_msgSend(v18, "_setPlaybackState:completion:", v17, v31);

          objc_destroyWeak(v34);
          objc_destroyWeak((id *)buf);
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v2);
  }

  objc_msgSend(*(id *)(v27 + 40), "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_56;
  block[3] = &unk_24E79C2B8;
  v20 = *(id *)(v27 + 48);
  v29 = v23;
  v30 = v20;
  v21 = v23;
  dispatch_group_notify(group, v19, block);

}

void __46__HMDMediaSession_writeProperties_completion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__HMDMediaSession_writeProperties_completion___block_invoke_2;
    v11[3] = &unk_24E7959E0;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v12 = v7;
    v13 = v8;
    v10 = *(_QWORD *)(a1 + 64);
    v14 = v5;
    v17 = v10;
    v15 = v9;
    v16 = *(id *)(a1 + 48);
    dispatch_async(v6, v11);

  }
}

uint64_t __46__HMDMediaSession_writeProperties_completion___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __46__HMDMediaSession_writeProperties_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "playbackState");

    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@responding to set playback with state %ld", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v9, v10, v11);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 72) != v4)
      objc_msgSend(*(id *)(a1 + 48), "_postNotificationOfMediaStateUpdate");
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __45__HMDMediaSession_readProperties_completion___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void (**v10)(void *, _QWORD, void *);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  void *v53;
  void *v54;
  uint64_t v55;
  NSObject *group;
  _QWORD block[4];
  id v58;
  id v59;
  _QWORD aBlock[4];
  NSObject *v61;
  void *v62;
  id v63;
  id v64;
  id v65[2];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id location;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  group = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1[5]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = a1[4];
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v2)
  {
    v55 = *(_QWORD *)v67;
    v3 = *MEMORY[0x24BDD66E0];
    v51 = *MEMORY[0x24BDD6738];
    v50 = *MEMORY[0x24BDD6708];
    v49 = *MEMORY[0x24BDD6758];
    v48 = *MEMORY[0x24BDD66C8];
    v47 = *MEMORY[0x24BDD6748];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v67 != v55)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v4);
        objc_msgSend(v5, "property", v47);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqual:", v3);

        if (v7)
        {
          objc_msgSend(a1[5], "state");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v8, "playbackState");

          dispatch_group_enter(group);
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __45__HMDMediaSession_readProperties_completion___block_invoke_2;
          aBlock[3] = &unk_24E785E58;
          objc_copyWeak(v65, &location);
          v61 = group;
          v62 = v5;
          v63 = v54;
          v65[1] = v9;
          v64 = v53;
          v10 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
          if (objc_msgSend(a1[5], "isCurrentAccessorySession"))
            objc_msgSend(a1[5], "_getPlaybackStateWithCompletion:", v10);
          else
            v10[2](v10, 0, v9);

          objc_destroyWeak(v65);
        }
        else
        {
          objc_msgSend(v5, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v51);

          if (v12)
          {
            v13 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(a1[5], "state");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "shuffleState"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v5, v15, v54);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v53, "addObject:", v16);
          }
          else
          {
            objc_msgSend(v5, "property");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v50);

            if (v18)
            {
              v19 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(a1[5], "state");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "repeatState"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v5, v21, v54);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "addObject:", v22);
            }
            else
            {
              objc_msgSend(v5, "property");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqual:", v49);

              if (v24)
              {
                objc_msgSend(a1[5], "state");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "volume");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  objc_msgSend(a1[5], "state");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "volume");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v5, v28, v54);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v53, "addObject:", v29);
                }
              }
              else
              {
                objc_msgSend(v5, "property");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqual:", v48);

                if (v31)
                {
                  objc_msgSend(a1[5], "state");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "mediaUniqueIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    objc_msgSend(a1[5], "state");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "mediaUniqueIdentifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v5, v35, v54);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v53, "addObject:", v36);
                  }
                }
                else
                {
                  objc_msgSend(v5, "property");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqual:", v47);

                  if (v38)
                  {
                    v39 = (void *)MEMORY[0x24BDD16E0];
                    objc_msgSend(a1[5], "state");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v40, "sleepWakeState"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v5, v41, v54);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v53, "addObject:", v42);
                  }
                }
              }
            }
          }
        }
        ++v4;
      }
      while (v2 != v4);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      v2 = v43;
    }
    while (v43);
  }

  objc_msgSend(a1[5], "workQueue");
  v44 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__HMDMediaSession_readProperties_completion___block_invoke_3;
  block[3] = &unk_24E79C2B8;
  v45 = a1[6];
  v58 = v53;
  v59 = v45;
  v46 = v53;
  dispatch_group_notify(group, v44, block);

  objc_destroyWeak(&location);
}

void __45__HMDMediaSession_readProperties_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMediaPropertyResponse responseWithRequest:value:updatedTime:](HMDMediaPropertyResponse, "responseWithRequest:value:updatedTime:", v6, v8, *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(a1 + 72) != a3)
        objc_msgSend(WeakRetained, "_postNotificationOfMediaStateUpdate");
    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

uint64_t __45__HMDMediaSession_readProperties_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __45__HMDMediaSession_registerForSessionUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForSessionUpdates:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __53__HMDMediaSession_handleMediaSessionSetAudioControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMediaSessionSetAudioControl:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__HMDMediaSession_handleSetPlayback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetPlayback:", *(_QWORD *)(a1 + 40));
}

void __38__HMDMediaSession__handleSetPlayback___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  uint64_t v5;
  void *v6;
  HMDMediaSessionRequestMessageInformation *v7;
  id v8;
  id v9;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = *(void **)(a1 + 32);
  v9 = v4;
  if (v4)
  {
    objc_msgSend(v6, "respondWithError:", v4);
  }
  else
  {
    if (v6)
      v7 = -[HMDMediaSessionRequestMessageInformation initWithMessage:]([HMDMediaSessionRequestMessageInformation alloc], "initWithMessage:", *(_QWORD *)(a1 + 32));
    else
      v7 = 0;
    objc_msgSend(WeakRetained, "_postNotificationOfMediaStateUpdateWithRequestMessageInformation:", v7);
    objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");

  }
}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke(uint64_t a1, void *a2, const __CFArray *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  CFIndex Count;
  __int128 v10;
  CFIndex v11;
  CFIndex v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = v5;
  v8 = v7;
  v31 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v29 = a1;
  v30 = v7;
  if (!a3 || v8)
  {
LABEL_15:
    if (v8)
      goto LABEL_19;
    goto LABEL_16;
  }
  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v11 = Count;
    v8 = 0;
    v12 = 0;
    *(_QWORD *)&v10 = 138543618;
    v28 = v10;
    do
    {
      CFArrayGetValueAtIndex(a3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      v15 = v14;
      if (v14 && v14 != 3)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = v31;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v28;
          v33 = v19;
          v34 = 2048;
          v35 = v15;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Locally setting playback state failed with status: %ld", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2005);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 74, CFSTR("Media remote command failure "), CFSTR("Media remote command failure"), 0, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v21;
      }

      if (v15 != 3 && v15)
        break;
      ++v12;
    }
    while (v11 != v12);
    goto LABEL_15;
  }
LABEL_16:
  v22 = (void *)MEMORY[0x227676638]();
  v23 = v31;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(v29 + 40);
    *(_DWORD *)buf = 138543618;
    v33 = v25;
    v34 = 2048;
    v35 = v26;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Set plaback state to %ld on successfully sending mediaremote command", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  objc_msgSend(v23, "state");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPlaybackState:", *(_QWORD *)(v29 + 40));

  v8 = 0;
LABEL_19:
  objc_msgSend(v31, "_invokePendingSetPlaybackStateBlocksOfError:", v8, v28);

}

uint64_t __48__HMDMediaSession__setPlaybackState_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke_50(uint64_t a1, void *a2, const void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  const void *v12;

  v5 = a2;
  if (a3)
    CFRetain(a3);
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDMediaSession__setPlaybackState_completion___block_invoke_2;
  block[3] = &unk_24E7980F8;
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a3;
  v8 = v5;
  dispatch_async(v6, block);

}

void __48__HMDMediaSession__setPlaybackState_completion___block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __65__HMDMediaSession_updateWithResponses_requestMessageInformation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  BOOL v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  BOOL v65;
  int v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v82 = v5;
    v83 = 2112;
    v84 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating media session with responses %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v7 = *(id *)(a1 + 40);
  v75 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v75)
  {
    v8 = 0;
    v74 = *(_QWORD *)v77;
    v73 = *MEMORY[0x24BDD66E0];
    v72 = *MEMORY[0x24BDD6738];
    v71 = *MEMORY[0x24BDD6708];
    v70 = *MEMORY[0x24BDD6758];
    v69 = *MEMORY[0x24BDD66C8];
    obj = v7;
    v68 = *MEMORY[0x24BDD6748];
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v77 != v74)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend(v10, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "property");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", v73))
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "playbackState");

            v18 = objc_msgSend(v15, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1 + 32), "state");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setPlaybackState:", v18);

            objc_msgSend(*(id *)(a1 + 32), "_invokePendingSetPlaybackStateBlocksOfError:", 0);
            objc_msgSend(v10, "error");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              v21 = 1;
            else
              v21 = v17 == v18;
            v22 = !v21;

            v8 |= v22;
          }

        }
        if (objc_msgSend(v12, "isEqual:", v72))
        {
          objc_msgSend(v10, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
          v25 = v24;

          if (v25)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "shuffleState");

            v28 = objc_msgSend(v25, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1 + 32), "state");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setShuffleState:", v28);

            objc_msgSend(v10, "error");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              v31 = 1;
            else
              v31 = v27 == v28;
            v32 = !v31;

            v8 |= v32;
          }

        }
        if (objc_msgSend(v12, "isEqual:", v71))
        {
          objc_msgSend(v10, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v34 = v33;
          else
            v34 = 0;
          v35 = v34;

          if (v35)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "repeatState");

            v38 = objc_msgSend(v35, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1 + 32), "state");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setRepeatState:", v38);

            objc_msgSend(v10, "error");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
              v41 = 1;
            else
              v41 = v37 == v38;
            v42 = !v41;

            v8 |= v42;
          }

        }
        if (objc_msgSend(v12, "isEqual:", v70))
        {
          objc_msgSend(v10, "value");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v44 = v43;
          else
            v44 = 0;
          v45 = v44;

          if (v45)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "volume");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "state");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setVolume:", v45);

            objc_msgSend(v10, "error");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)

            else
              v8 |= HMFEqualObjects() ^ 1;

          }
        }
        if (objc_msgSend(v12, "isEqual:", v69))
        {
          objc_msgSend(v10, "value");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v51 = v50;
          else
            v51 = 0;
          v52 = v51;

          if (v52)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "mediaUniqueIdentifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 32), "state");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setMediaUniqueIdentifier:", v52);

            objc_msgSend(v10, "error");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)

            else
              v8 |= HMFEqualObjects() ^ 1;

          }
        }
        if (objc_msgSend(v12, "isEqual:", v68))
        {
          objc_msgSend(v10, "value");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v58 = v57;
          else
            v58 = 0;
          v59 = v58;

          if (v59)
          {
            objc_msgSend(*(id *)(a1 + 32), "state");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "sleepWakeState");

            v62 = objc_msgSend(v59, "unsignedIntegerValue");
            objc_msgSend(*(id *)(a1 + 32), "state");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setSleepWakeState:", v62);

            objc_msgSend(v10, "error");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64)
              v65 = 1;
            else
              v65 = v61 == v62;
            v66 = !v65;

            v8 |= v66;
          }

        }
      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v75);

    if ((v8 & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_postNotificationOfMediaStateUpdateWithRequestMessageInformation:", *(_QWORD *)(a1 + 48));
  }
  else
  {

  }
}

void __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  id location;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "playbackState");

  objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", *MEMORY[0x24BE65A20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntValue");
    if (v6 > 5)
      v7 = 3;
    else
      v7 = qword_2226A11E0[v6];
    objc_msgSend(*(id *)(a1 + 32), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackState:", v7);

    objc_msgSend(*(id *)(a1 + 32), "_invokePendingSetPlaybackStateBlocksOfError:", 0);
    if (v3 != (void *)v7)
    {
      v10 = *(void **)(a1 + 32);
      v15 = CFSTR("force-notify");
      v16[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_postNotificationOfMediaStateUpdateWithPayload:", v11);

    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke_2;
    v12[3] = &unk_24E785DB8;
    objc_copyWeak(v13, &location);
    v13[1] = v3;
    objc_msgSend(v8, "_getPlaybackStateWithCompletion:", v12);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }

}

void __56__HMDMediaSession_handleMediaPlaybackStateNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_invokePendingSetPlaybackStateBlocksOfError:", v6);

  if (!v6 && *(_QWORD *)(a1 + 40) != a3)
    objc_msgSend(WeakRetained, "_postNotificationOfMediaStateUpdate");

}

uint64_t __41__HMDMediaSession_handleRefreshPlayback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetPlaybackState:", *(_QWORD *)(a1 + 40));
}

void __43__HMDMediaSession__handleGetPlaybackState___block_invoke(uint64_t a1, void *a2)
{
  HMDMediaSessionRequestMessageInformation *v3;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v3)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v3);
    goto LABEL_10;
  }
  if (v3)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
  v3 = (HMDMediaSessionRequestMessageInformation *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_7;
LABEL_3:
  if (*(_QWORD *)(a1 + 32))
    v3 = -[HMDMediaSessionRequestMessageInformation initWithMessage:]([HMDMediaSessionRequestMessageInformation alloc], "initWithMessage:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;
  objc_msgSend(WeakRetained, "_postNotificationOfMediaStateUpdateWithRequestMessageInformation:", v3);
  objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
LABEL_10:

}

void __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    if (a3 > 5)
      v8 = 3;
    else
      v8 = qword_2226A11E0[a3];
    objc_msgSend(WeakRetained, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackState:", v8);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Locally read the playback state as: %tu", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v5, v8);

}

uint64_t __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int v12;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_3;
  block[3] = &unk_24E785D40;
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a3;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __51__HMDMediaSession__getPlaybackStateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

+ (id)sessionForCurrentAccessoryWithSessionIdentifier:(id)a3 mediaProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__HMDMediaSession_sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile___block_invoke;
  v15[3] = &unk_24E79C268;
  v16 = v5;
  v17 = v6;
  v7 = sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__onceToken;
  v8 = v6;
  v9 = v5;
  v10 = v9;
  if (v7 == -1)
  {
    v11 = v9;
    v12 = v8;
  }
  else
  {
    dispatch_once(&sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__onceToken, v15);
    v11 = v16;
    v12 = v17;
  }
  v13 = (id)sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory;

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_121093 != -1)
    dispatch_once(&logCategory__hmf_once_t1_121093, &__block_literal_global_121094);
  return (id)logCategory__hmf_once_v2_121095;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (NSArray)mediaPropertyMessageKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD6738];
  v6[0] = *MEMORY[0x24BDD66E0];
  v6[1] = v2;
  v3 = *MEMORY[0x24BDD6758];
  v6[2] = *MEMORY[0x24BDD6708];
  v6[3] = v3;
  v4 = *MEMORY[0x24BDD6748];
  v6[4] = *MEMORY[0x24BDD66C8];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (Class)mediaPropertyValueTypeWithMessageKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD66E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6738]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6708]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6758]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD6748]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD66C8]))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__HMDMediaSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_121095;
  logCategory__hmf_once_v2_121095 = v0;

}

void __80__HMDMediaSession_sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile___block_invoke(uint64_t a1)
{
  HMDMediaSessionState *v2;
  HMDMediaSession *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[HMDMediaSessionState initWithSessionIdentifier:]([HMDMediaSessionState alloc], "initWithSessionIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = [HMDMediaSession alloc];
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDMediaSession _initWithMediaProfiles:state:](v3, "_initWithMediaProfiles:state:", v4, v2);
  v6 = (void *)sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory;
  sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory = v5;

  *(_BYTE *)(sessionForCurrentAccessoryWithSessionIdentifier_mediaProfile__sessionForCurrentAccessory + 25) = 1;
}

@end
