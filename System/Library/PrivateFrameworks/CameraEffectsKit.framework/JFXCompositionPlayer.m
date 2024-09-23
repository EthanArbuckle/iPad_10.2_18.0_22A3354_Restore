@implementation JFXCompositionPlayer

- (JFXCompositionPlayer)initWithClipsDataSource:(id)a3 seekPosition:(int)a4 audioMuted:(BOOL)a5
{
  id v9;
  JFXCompositionPlayer *v10;
  JFXCompositionPlayer *v11;
  NSMutableArray *v12;
  NSMutableArray *requestQueue;
  void *v14;
  uint64_t v15;
  $95D729B680665BEAEFA1D6FCA8238556 v17;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXCompositionPlayer;
  v10 = -[JFXCompositionPlayer init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clipsDataSource, a3);
    v11->_playbackTimeChangedObserverInterval.epoch = 0;
    *(_OWORD *)&v11->_playbackTimeChangedObserverInterval.value = kDefaultPlaybackTimeObserverInterval;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    requestQueue = v11->_requestQueue;
    v11->_requestQueue = v12;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel_warnTooManyLiveCompositors_, *MEMORY[0x24BE796F8], 0);

    CMTimeFromFrameTime(a4, -[JFXCompositionPlayableElementsDataSource frameRate](v11->_clipsDataSource, "frameRate"), (CMTime *)&v17);
    v11->_wasCurrentTime = v17;
    v15 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v11->_cachedCurrentTimeForCompositionUpdate.value = *MEMORY[0x24BDC0D88];
    v11->_cachedCurrentTimeForCompositionUpdate.epoch = *(_QWORD *)(v15 + 16);
    v11->_wasAudioMuted = a5;
    v11->_wasPlaying = 0;
    v11->_parentCode = -1;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[JFXCompositionPlayer teardownSetPlaceHolder:](self, "teardownSetPlaceHolder:", 0);
  v4.receiver = self;
  v4.super_class = (Class)JFXCompositionPlayer;
  -[JFXCompositionPlayer dealloc](&v4, sel_dealloc);
}

- (void)teardownSetPlaceHolder:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  JFXLog_DebugPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayer displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "Player %{public}@ Tear Down", (uint8_t *)&v13, 0xCu);

  }
  -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackReadyForDisplayChanged:isReady:setPlaceHolder:", self, 0, v3);

  }
  -[JFXCompositionPlayer clearQueuedRequests](self, "clearQueuedRequests");
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer executeRequestCompletionBlock:success:wasCancelled:error:](self, "executeRequestCompletionBlock:success:wasCancelled:error:", v11, 0, 1, 0);

    -[JFXCompositionPlayer setPendingRequest:](self, "setPendingRequest:", 0);
  }
  -[JFXCompositionPlayer destroyPlayer](self, "destroyPlayer");
  -[JFXCompositionPlayer playerView](self, "playerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlayer:", 0);

}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

+ (Class)compositionClass
{
  return (Class)objc_opt_class();
}

- (id)requestWithBlock:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  JFXCompositionPlayerRequest *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[JFXCompositionPlayerRequest initWithBlock:ofType:]([JFXCompositionPlayerRequest alloc], "initWithBlock:ofType:", v9, a4);

  -[JFXCompositionPlayerRequest setPlayer:](v10, "setPlayer:", self);
  -[JFXCompositionPlayerRequest setCompletionBlock:](v10, "setCompletionBlock:", v8);

  return v10;
}

- (BOOL)isRequestOfTypePendingOrQueued:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  return v6 == a3 || -[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", a3);
}

- (id)firstQueuedRequestOfType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)checkPendingRequestForTimeOut
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pendingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2048;
  v10 = a3;
  OUTLINED_FUNCTION_2_3(&dword_2269A9000, a2, v6, "Request %{public}@ Timed Out because it had not completed executing in %f sec", (uint8_t *)&v7);

}

- (id)removeRequestOfType:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "type") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectsInArray:", v5);

  }
  return v5;
}

- (id)removeAllRequests
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[JFXCompositionPlayer requestQueue](self, "requestQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

  }
  return v3;
}

- (void)appendRequests:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (BOOL)isRequestOfTypeQueued:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)clearQueuedRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[JFXCompositionPlayer executeRequestCompletionBlock:success:wasCancelled:error:](self, "executeRequestCompletionBlock:success:wasCancelled:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0, 1, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[JFXCompositionPlayer requestQueue](self, "requestQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)cancelQueuedRequestOfType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "type") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11)
      return;
    -[JFXCompositionPlayer executeRequestCompletionBlock:success:wasCancelled:error:](self, "executeRequestCompletionBlock:success:wasCancelled:error:", v11, 0, 1, 0);
    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectIdenticalTo:", v11);

    v5 = v11;
  }
LABEL_12:

}

- (void)cancelQueuedCompositionUpdateRequestFromClip:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
  {
LABEL_11:
    v11 = v5;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = *(_QWORD *)v17;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
    if (objc_msgSend(v10, "type") != 5)
      goto LABEL_9;
    v11 = v10;
    objc_msgSend(v11, "clipUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      break;

LABEL_9:
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        goto LABEL_3;
      goto LABEL_11;
    }
  }

  if (!v11)
    goto LABEL_15;
  -[JFXCompositionPlayer executeRequestCompletionBlock:success:wasCancelled:error:](self, "executeRequestCompletionBlock:success:wasCancelled:error:", v11, 0, 1, 0);
  -[JFXCompositionPlayer requestQueue](self, "requestQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectIdenticalTo:", v11);

LABEL_14:
LABEL_15:

}

- (void)enqueueRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[JFXCompositionPlayer requestQueue](self, "requestQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(v4, "didEnqueue");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setStartTime:");
  JFXLog_DebugPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    JFXLog_DebugPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[JFXCompositionPlayer enqueueRequest:].cold.1((uint64_t)v4, v8);

  }
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[JFXCompositionPlayer requestQueue](self, "requestQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
      -[JFXCompositionPlayer executeNextRequest](self, "executeNextRequest");
  }

}

- (void)executeNextRequest
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD block[5];
  id v9;
  id location;

  -[JFXCompositionPlayer setPendingRequest:](self, "setPendingRequest:", 0);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__JFXCompositionPlayer_executeNextRequest__block_invoke;
  block[3] = &unk_24EE5AE28;
  block[4] = self;
  objc_copyWeak(&v9, &location);
  v4 = MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v5 = dispatch_time(0, 5000000000);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __42__JFXCompositionPlayer_executeNextRequest__block_invoke_132;
  v6[3] = &unk_24EE59648;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__JFXCompositionPlayer_executeNextRequest__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pendingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "requestQueue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeObjectAtIndex:", 0);

        objc_msgSend(*(id *)(a1 + 32), "setPendingRequest:", v5);
        JFXLog_DebugPlayback();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "pendingRequest");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543362;
          v12 = v8;
          _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ started", (uint8_t *)&v11, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        objc_msgSend(v5, "setStartTime:");
        objc_msgSend(v5, "didBegin");
        objc_msgSend(v5, "block");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v9)[2](v9, v10);

      }
    }

  }
}

void __42__JFXCompositionPlayer_executeNextRequest__block_invoke_132(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkPendingRequestForTimeOut");

}

- (void)completePendingRequest:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayer executeRequestCompletionBlock:success:wasCancelled:error:](self, "executeRequestCompletionBlock:success:wasCancelled:error:", v9, v6, v5, v8);

  -[JFXCompositionPlayer executeNextRequest](self, "executeNextRequest");
}

- (void)completeRequest:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__JFXCompositionPlayer_completeRequest_success_wasCancelled_error___block_invoke;
  v14[3] = &unk_24EE5AE50;
  v14[4] = self;
  v15 = v10;
  v17 = a4;
  v18 = a5;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __67__JFXCompositionPlayer_completeRequest_success_wasCancelled_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pendingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "completePendingRequest:wasCancelled:error:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "requestQueue", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v10, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if ((v12 & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_14;
        }
      }
      v13 = v10;

      if (!v13)
        return;
      objc_msgSend(*(id *)(a1 + 32), "executeRequestCompletionBlock:success:wasCancelled:error:", v13, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "requestQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectIdenticalTo:", v13);

      v5 = v13;
    }
LABEL_14:

  }
}

- (void)executeRequestCompletionBlock:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  BOOL v26;
  BOOL v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  JFXLog_DebugPlayback();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    if (v13)
    {
      JFXLog_DebugPlayback();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v10;
        _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "Request %{public}@ was throttled", buf, 0xCu);
      }

    }
    objc_msgSend(v10, "didCancel");
  }
  else
  {
    if (v13)
    {
      JFXLog_DebugPlayback();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v17 = v16;
        -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startTime");
        *(_DWORD *)buf = 138543618;
        v29 = v10;
        v30 = 2048;
        v31 = v17 - v19;
        _os_log_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ completed in %f sec", buf, 0x16u);

      }
    }
    objc_msgSend(v10, "didComplete");
  }
  objc_msgSend(v10, "completionBlock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__JFXCompositionPlayer_executeRequestCompletionBlock_success_wasCancelled_error___block_invoke;
  block[3] = &unk_24EE5AE78;
  v26 = a4;
  v27 = v7;
  v24 = v11;
  v25 = v20;
  v21 = v11;
  v22 = v20;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __81__JFXCompositionPlayer_executeRequestCompletionBlock_success_wasCancelled_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)throttleRequestWithCompletionBlock:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  JFXLog_DebugPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[JFXCompositionPlayerRequest stringFromRequestType:](JFXCompositionPlayerRequest, "stringFromRequestType:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "Request type %{public}@ for player %{public}@ throttled because already pending", buf, 0x16u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__JFXCompositionPlayer_throttleRequestWithCompletionBlock_ofType___block_invoke;
  block[3] = &unk_24EE580C8;
  v12 = v6;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__JFXCompositionPlayer_throttleRequestWithCompletionBlock_ofType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, 0, 1, 0);
  return result;
}

- (void)dispatchBlockWhenDone:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __46__JFXCompositionPlayer_dispatchBlockWhenDone___block_invoke;
  v9 = &unk_24EE5AEA0;
  objc_copyWeak(&v10, &location);
  -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", &v6, 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __46__JFXCompositionPlayer_dispatchBlockWhenDone___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "completeRequest:success:wasCancelled:error:", v3, 1, 0, 0);

}

- (BOOL)play:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = -[JFXCompositionPlayer isRequestOfTypePendingOrQueued:](self, "isRequestOfTypePendingOrQueued:", 2);
  if (v5)
  {
    -[JFXCompositionPlayer throttleRequestWithCompletionBlock:ofType:](self, "throttleRequestWithCompletionBlock:ofType:", v4, 2);
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __29__JFXCompositionPlayer_play___block_invoke;
    v12 = &unk_24EE5AEA0;
    objc_copyWeak(&v13, &location);
    v6 = (void *)MEMORY[0x2276A1F6C](&v9);
    -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", v6, 2, v4, v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v7);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __29__JFXCompositionPlayer_play___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "timeControlStatus");

    if (v6 == 2)
      objc_msgSend(v4, "completeRequest:success:wasCancelled:error:", v7, 1, 0, 0);
    else
      objc_msgSend(v4, "doPlay");
  }

}

- (void)setPlaybackTimeChangedObserverInterval:(id *)a3
{
  __int128 v5;
  CMTime v6;
  CMTime time1;

  if ((a3->var2 & 1) != 0)
  {
    time1 = *(CMTime *)a3;
    v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    if (CMTimeCompare(&time1, &v6))
    {
      v5 = *(_OWORD *)&a3->var0;
      self->_playbackTimeChangedObserverInterval.epoch = a3->var3;
      *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = v5;
      -[JFXCompositionPlayer setupPlaybackTimeChangedObserver](self, "setupPlaybackTimeChangedObserver");
    }
  }
}

- (void)resetPlaybackTimeChangedObserverInterval
{
  __int128 v2;
  uint64_t v3;

  v3 = 0;
  v2 = kDefaultPlaybackTimeObserverInterval;
  -[JFXCompositionPlayer setPlaybackTimeChangedObserverInterval:](self, "setPlaybackTimeChangedObserverInterval:", &v2);
}

- (void)handlePlaybackBegan
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;

  -[JFXCompositionPlayer removeCompositorCompletionBlock](self, "removeCompositorCompletionBlock");
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", 1, 0, 0);
  -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackDidStart:", self);

  }
}

- (BOOL)pause:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  v5 = -[JFXCompositionPlayer isRequestOfTypePendingOrQueued:](self, "isRequestOfTypePendingOrQueued:", 3);
  if (v5)
  {
    -[JFXCompositionPlayer throttleRequestWithCompletionBlock:ofType:](self, "throttleRequestWithCompletionBlock:ofType:", v4, 3);
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __30__JFXCompositionPlayer_pause___block_invoke;
    v12 = &unk_24EE5AEA0;
    objc_copyWeak(&v13, &location);
    v6 = (void *)MEMORY[0x2276A1F6C](&v9);
    -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", v6, 3, v4, v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v7);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __30__JFXCompositionPlayer_pause___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "player");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "player"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "timeControlStatus"),
          v7,
          v6,
          v8))
    {
      objc_msgSend(v4, "doPause");
    }
    else
    {
      objc_msgSend(v4, "completeRequest:success:wasCancelled:error:", v9, 1, 0, 0);
    }
  }

}

- (void)handlePlaybackPaused
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int32_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  -[JFXCompositionPlayer configureCompositorCompletionBlock](self, "configureCompositorCompletionBlock");
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 3)
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", 1, 0, 0);
  v19 = 0uLL;
  v20 = 0;
  -[JFXCompositionPlayer player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentTime");
  }
  else
  {
    v19 = 0uLL;
    v20 = 0;
  }

  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "frameRate");
  v17 = v19;
  v18 = v20;
  v9 = FrameTimeFromCMTime(&v17, v8);

  -[JFXCompositionPlayer player](self, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentItem");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "customVideoCompositor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v13) = DWORD1(v19);
  v17 = v19;
  v18 = v20;
  LODWORD(v13) = 0;
  objc_msgSend(v12, "signalScheduling:playerRate:", &v17, v13);

  -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playbackDidStop:currentTime:", self, v9);

  }
  -[JFXCompositionPlayer composition](self, "composition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v19;
  v18 = v20;
  objc_msgSend(v16, "notifyPlaybackDidStopAtTime:", &v17);

}

- (void)seek:(int)a3 cancelQueuedRequest:(BOOL)a4 tolerance:(int)a5 completion:(id)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  void *v11;
  JFXCompositionSeekRequest *v12;
  JFXCompositionSeekRequest *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  JFXCompositionPlayer *v18;
  id v19;
  int v20;
  int v21;
  id location;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  if (v7)
    -[JFXCompositionPlayer cancelQueuedRequestOfType:](self, "cancelQueuedRequestOfType:", 4);
  objc_initWeak(&location, self);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke;
  v17 = &unk_24EE5AF18;
  objc_copyWeak(&v19, &location);
  v20 = v8;
  v21 = a5;
  v18 = self;
  v11 = (void *)MEMORY[0x2276A1F6C](&v14);
  v12 = [JFXCompositionSeekRequest alloc];
  v13 = -[JFXCompositionSeekRequest initWithBlock:withSeekTime:](v12, "initWithBlock:withSeekTime:", v11, v8, v14, v15, v16, v17);
  -[JFXCompositionPlayerRequest setPlayer:](v13, "setPlayer:", self);
  -[JFXCompositionPlayerRequest setCompletionBlock:](v13, "setCompletionBlock:", v10);
  -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int32_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CMTime v15;
  CMTime v16;
  _QWORD v17[6];
  CMTime v18;
  CMTime time1;
  CMTime time2;
  CMTime v21;
  CMTime v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "clipsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "frameRate");

    memset(v22, 0, 24);
    CMTimeFromFrameTime(*(_DWORD *)(a1 + 48), v7, v22);
    memset(&v21, 0, sizeof(v21));
    CMTimeFromFrameTime(*(_DWORD *)(a1 + 52), v7, &v21);
    objc_msgSend(v5, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = v22[0];
    v10 = CMTimeCompare(&time1, &time2) > 0;

    if (v10)
    {
      objc_msgSend(v5, "composition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "duration");
      else
        memset(&time1, 0, sizeof(time1));
      v22[0] = time1;

    }
    objc_msgSend(v5, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_2;
    v17[3] = &unk_24EE5AEF0;
    v18 = v22[0];
    v14 = *(_QWORD *)(a1 + 32);
    v17[4] = v5;
    v17[5] = v14;
    time1 = v22[0];
    v16 = v21;
    v15 = v21;
    objc_msgSend(v13, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &time1, &v16, &v15, v17);

  }
}

__n128 __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_2(uint64_t a1, char a2)
{
  __int128 v2;
  __n128 result;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  char v8;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_3;
  v4[3] = &unk_24EE5AEC8;
  v7 = *(_QWORD *)(a1 + 64);
  v2 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = v2;
  v8 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  return result;
}

uint64_t __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus");

  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customVideoCompositor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signalSchedulingResetSearch");

    objc_msgSend(*(id *)(a1 + 32), "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customVideoCompositor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rate");
    v13 = *(_OWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v9, "signalScheduling:playerRate:", &v13);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isRequestOfTypeQueued:", 4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "composition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_OWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v11, "notifyNeedsEffectPropertiesUpdatedForPlaybackTime:", &v13);

  }
  return objc_msgSend(*(id *)(a1 + 32), "handleSeekCompleted:", *(unsigned __int8 *)(a1 + 72));
}

- (void)seek:(int)a3 tolerance:(int)a4 completion:(id)a5
{
  -[JFXCompositionPlayer seek:cancelQueuedRequest:tolerance:completion:](self, "seek:cancelQueuedRequest:tolerance:completion:", *(_QWORD *)&a3, 1, *(_QWORD *)&a4, a5);
}

- (void)handleSeekCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", v3, 0, 0);
}

- (BOOL)setAudioMuted:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  -[JFXCompositionPlayer cancelQueuedRequestOfType:](self, "cancelQueuedRequestOfType:", 7);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__JFXCompositionPlayer_setAudioMuted_completionBlock___block_invoke;
  v10[3] = &unk_24EE5AF40;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v7 = (void *)MEMORY[0x2276A1F6C](v10);
  -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", v7, 7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 1;
}

void __54__JFXCompositionPlayer_setAudioMuted_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  int v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMuted");
    v7 = *(unsigned __int8 *)(a1 + 40);

    if (v7 == v6)
    {
      objc_msgSend(v4, "completeRequest:success:wasCancelled:error:", v8, 1, 0, 0);
    }
    else
    {
      objc_msgSend(v4, "doMuteAudio:", *(unsigned __int8 *)(a1 + 40));
      objc_msgSend(v4, "handleChangeAudioMutedCompleted");
    }
  }

}

- (void)handleChangeAudioMutedCompleted
{
  void *v3;
  uint64_t v4;

  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 7)
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", 1, 0, 0);
}

- (void)setPlayerView:(id)a3 completionBlock:(id)a4
{
  JFXAVPlayerViewer *v7;
  id v8;
  JFXAVPlayerViewer *v9;

  v7 = (JFXAVPlayerViewer *)a3;
  if (self->_playerView != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_playerView, a3);
    v8 = a4;
    -[JFXCompositionPlayer updateComposition:](self, "updateComposition:", v8);

    v7 = v9;
  }

}

- (void)notifyPlayerViewSizeChanged
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v15;

  -[JFXCompositionPlayer playerView](self, "playerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displaySize");
  v5 = v4;
  v7 = v6;

  -[JFXCompositionPlayer composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewSize");
  v10 = v9;
  v12 = v11;

  if ((v5 != v10 || v7 != v12) && (v5 != *MEMORY[0x24BDBF148] || v7 != *(double *)(MEMORY[0x24BDBF148] + 8)))
  {
    -[JFXCompositionPlayer composition](self, "composition");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setViewSize:", v5, v7);

  }
}

- (BOOL)updateComposition:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  JFXCompositionUpdateRequest *v7;
  JFXCompositionUpdateRequest *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = -[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", 1);
  if (v5)
  {
    -[JFXCompositionPlayer throttleRequestWithCompletionBlock:ofType:](self, "throttleRequestWithCompletionBlock:ofType:", v4, 1);
  }
  else
  {
    if (-[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", 5))
    {
      do
        -[JFXCompositionPlayer cancelQueuedRequestOfType:](self, "cancelQueuedRequestOfType:", 5);
      while (-[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", 5));
    }
    objc_initWeak(&location, self);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __42__JFXCompositionPlayer_updateComposition___block_invoke;
    v13 = &unk_24EE5AEA0;
    objc_copyWeak(&v14, &location);
    v6 = (void *)MEMORY[0x2276A1F6C](&v10);
    v7 = [JFXCompositionUpdateRequest alloc];
    v8 = -[JFXCompositionUpdateRequest initWithBlock:](v7, "initWithBlock:", v6, v10, v11, v12, v13);
    -[JFXCompositionPlayerRequest setCompletionBlock:](v8, "setCompletionBlock:", v4);
    -[JFXCompositionPlayerRequest setPlayer:](v8, "setPlayer:", self);
    -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v8);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __42__JFXCompositionPlayer_updateComposition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "doUpdateComposition");

}

- (void)doUpdateComposition
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  dispatch_time_t v56;
  int32_t v57;
  _QWORD v58[4];
  id v59;
  CMTime time2;
  CMTime location;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  _QWORD block[4];
  id v71;
  CMTime buf;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 1)
  {
LABEL_6:
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "playbackReadyForDisplayChanged:isReady:setPlaceHolder:", self, 0, 1);

    }
    -[JFXCompositionPlayer composition](self, "composition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[JFXCompositionPlayer player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayer setWasPlaying:](self, "setWasPlaying:", objc_msgSend(v12, "timeControlStatus") == 2);

      -[JFXCompositionPlayer player](self, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "currentTime");
      }
      else
      {
        v68 = 0uLL;
        v69 = 0;
      }
      v66 = v68;
      v67 = v69;
      -[JFXCompositionPlayer setWasCurrentTime:](self, "setWasCurrentTime:", &v66);

      -[JFXCompositionPlayer player](self, "player");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayer setWasAudioMuted:](self, "setWasAudioMuted:", objc_msgSend(v23, "isMuted"));

    }
    else
    {
      v15 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "compositionClass"));
      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithClipsDataSource:", v16);
      -[JFXCompositionPlayer setComposition:](self, "setComposition:", v17);

      if (-[JFXCompositionPlayer parentCode](self, "parentCode") != -1)
      {
        v18 = -[JFXCompositionPlayer parentCode](self, "parentCode");
        -[JFXCompositionPlayer composition](self, "composition");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setParentCode:", v18);

      }
    }
    -[JFXCompositionPlayer wasCurrentTime](self, "wasCurrentTime");
    v62 = v64;
    v63 = v65;
    -[JFXCompositionPlayer setCachedCurrentTimeForCompositionUpdate:](self, "setCachedCurrentTimeForCompositionUpdate:", &v62);
    -[JFXCompositionPlayer playerView](self, "playerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displaySize");
    v26 = v25;
    v28 = v27;

    if (v26 != *MEMORY[0x24BDBF148] || v28 != *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[JFXCompositionPlayer composition](self, "composition");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setViewSize:", v26, v28);

    }
    -[JFXCompositionPlayer composition](self, "composition");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "markDirty");

    -[JFXCompositionPlayer composition](self, "composition");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "playerItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXCompositionPlayer createPlayer](self, "createPlayer");
    -[JFXCompositionPlayer player](self, "player");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "replaceCurrentItemWithPlayerItem:", v32);

    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) == 0)
      goto LABEL_23;
    v36 = (void *)MEMORY[0x24BE78FF8];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "jfx_displayColorSpace");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "colorSpace");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "jfx_compareAndChooseLesserColorSpace:right:", v38, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[JFXCompositionPlayer playerView](self, "playerView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "configureDisplayAttributesForColorSpace:", v41);

    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_opt_respondsToSelector();

    if ((v44 & 1) != 0)
    {
      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "playerAllowsExternalPlayback");
      -[JFXCompositionPlayer player](self, "player");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAllowsExternalPlayback:", v46);

    }
    -[JFXCompositionPlayer player](self, "player");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer playerView](self, "playerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setPlayer:", v48);

    -[JFXCompositionPlayer composition](self, "composition");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "applyPlayerItemProperties");

    objc_msgSend(v32, "customVideoCompositor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setCancelsPendingRequests:", 0);
    -[JFXCompositionPlayer configureCompositorCompletionBlock](self, "configureCompositorCompletionBlock");
    memset(&buf, 0, sizeof(buf));
    -[JFXCompositionPlayer composition](self, "composition");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
      objc_msgSend(v52, "duration");
    else
      memset(&buf, 0, sizeof(buf));

    -[JFXCompositionPlayer composition](self, "composition");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54 && (buf.flags & 1) != 0)
    {
      location = buf;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
      v57 = CMTimeCompare(&location, &time2);

      if (v57)
        goto LABEL_33;
    }
    else
    {

    }
    objc_initWeak((id *)&location, self);
    v56 = dispatch_time(0, 30000000);
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __43__JFXCompositionPlayer_doUpdateComposition__block_invoke_2;
    v58[3] = &unk_24EE59648;
    objc_copyWeak(&v59, (id *)&location);
    dispatch_after(v56, MEMORY[0x24BDAC9B8], v58);
    objc_destroyWeak(&v59);
    objc_destroyWeak((id *)&location);
LABEL_33:

    return;
  }
  v5 = 0;
  while (1)
  {
    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playableElementAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isAssetUnavailable") & 1) == 0 && (objc_msgSend(v7, "isAssetLoaded") & 1) == 0)
      break;

    if (v4 == ++v5)
      goto LABEL_6;
  }
  JFXLog_DebugPlayback();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayer displayName](self, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138543618;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v21;
    LOWORD(buf.flags) = 2114;
    *(_QWORD *)((char *)&buf.flags + 2) = v7;
    _os_log_impl(&dword_2269A9000, v20, OS_LOG_TYPE_DEFAULT, "player %{public}@ doUpdateComposition %{public}@ clip not loaded, will try again in 10 mecs", (uint8_t *)&buf, 0x16u);

  }
  objc_initWeak((id *)&buf, self);
  v22 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__JFXCompositionPlayer_doUpdateComposition__block_invoke;
  block[3] = &unk_24EE59648;
  objc_copyWeak(&v71, (id *)&buf);
  dispatch_after(v22, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v71);
  objc_destroyWeak((id *)&buf);
}

void __43__JFXCompositionPlayer_doUpdateComposition__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "doUpdateComposition");

}

void __43__JFXCompositionPlayer_doUpdateComposition__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pendingRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "type");

  if (v2 == 1)
    objc_msgSend(WeakRetained, "completePendingRequest:wasCancelled:error:", 1, 0, 0);

}

- (void)handleUpdateCompositionCompleted:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int32_t v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  CMTime v31;
  CMTime v32;
  CMTime time2;
  CMTime time1;
  CMTime v35;
  CMTime buf;
  uint64_t v37;

  v5 = a4;
  v6 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  JFXLog_DebugPlayback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[JFXCompositionPlayer displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
    _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ composition update completed", (uint8_t *)&buf, 0xCu);

  }
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type") == 1;

  if (v12)
  {
    if (-[JFXCompositionPlayer wasAudioMuted](self, "wasAudioMuted")
      && !-[JFXCompositionPlayer isRequestOfTypePendingOrQueued:](self, "isRequestOfTypePendingOrQueued:", 7))
    {
      -[JFXCompositionPlayer setAudioMuted:completionBlock:](self, "setAudioMuted:completionBlock:", -[JFXCompositionPlayer wasAudioMuted](self, "wasAudioMuted"), 0);
    }
    -[JFXCompositionPlayer removeRequestOfType:](self, "removeRequestOfType:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", 4))
    {
      -[JFXCompositionPlayer firstQueuedRequestOfType:](self, "firstQueuedRequestOfType:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "seekTime"))
      {
        -[JFXCompositionPlayer removeRequestOfType:](self, "removeRequestOfType:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayer seek:tolerance:completion:](self, "seek:tolerance:completion:", 1, 0, 0);
        -[JFXCompositionPlayer appendRequests:](self, "appendRequests:", v16);

      }
      objc_initWeak((id *)&buf, self);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke_2;
      v27[3] = &unk_24EE5AF68;
      objc_copyWeak(&v28, (id *)&buf);
      v27[4] = self;
      -[JFXCompositionPlayer dispatchBlockWhenDone:](self, "dispatchBlockWhenDone:", v27);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)&buf);

    }
    else
    {
      -[JFXCompositionPlayer setRestoringPlayerStateAfterCompositionUpdate:](self, "setRestoringPlayerStateAfterCompositionUpdate:", 1);
      memset(&buf, 0, sizeof(buf));
      memset(&v35, 0, sizeof(v35));
      -[JFXCompositionPlayer composition](self, "composition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        objc_msgSend(v17, "duration");
      else
        memset(&v35, 0, sizeof(v35));

      -[JFXCompositionPlayer wasCurrentTime](self, "wasCurrentTime");
      time2 = v35;
      CMTimeMinimum(&buf, &time1, &time2);
      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v32, 0, objc_msgSend(v19, "timeScale"));
      v31 = buf;
      CMTimeMaximum(&time2, &v31, &v32);
      buf = time2;

      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "timeScale");
      time2 = buf;
      v22 = FrameTimeFromCMTime(&time2, v21);

      v23 = -[JFXCompositionPlayer isRequestOfTypePendingOrQueued:](self, "isRequestOfTypePendingOrQueued:", 3);
      -[JFXCompositionPlayer removeAllRequests](self, "removeAllRequests");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(_DWORD)v22)
        -[JFXCompositionPlayer seek:cancelQueuedRequest:tolerance:completion:](self, "seek:cancelQueuedRequest:tolerance:completion:", 1, 0, 0, 0);
      objc_initWeak((id *)&time2, self);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke;
      v29[3] = &unk_24EE5AF68;
      objc_copyWeak(&v30, (id *)&time2);
      v29[4] = self;
      -[JFXCompositionPlayer seek:cancelQueuedRequest:tolerance:completion:](self, "seek:cancelQueuedRequest:tolerance:completion:", v22, 0, 0, v29);
      if (-[JFXCompositionPlayer wasPlaying](self, "wasPlaying") && !v23)
        -[JFXCompositionPlayer play:](self, "play:", 0);
      -[JFXCompositionPlayer appendRequests:](self, "appendRequests:", v24);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)&time2);

    }
    -[JFXCompositionPlayer appendRequests:](self, "appendRequests:", v13);
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    -[JFXCompositionPlayer setWasCurrentTime:](self, "setWasCurrentTime:", &v25);
    -[JFXCompositionPlayer setWasPlaying:](self, "setWasPlaying:", 0);
    -[JFXCompositionPlayer setWasAudioMuted:](self, "setWasAudioMuted:", 0);
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", v6, v5, v8);

  }
}

void __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[3];
  __int128 v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = *MEMORY[0x24BDC0D88];
    v12 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(WeakRetained, "setCachedCurrentTimeForCompositionUpdate:", &v11);
    objc_msgSend(v3, "setRestoringPlayerStateAfterCompositionUpdate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(v10, 0, sizeof(v10));
    objc_msgSend(v4, "notifyPlaybackDidStopAtTime:", v10);

    objc_msgSend(v3, "playbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "playbackDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playbackReadyForDisplayChanged:isReady:setPlaceHolder:", *(_QWORD *)(a1 + 32), 1, 1);

    }
  }

}

void __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[3];
  __int128 v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = *MEMORY[0x24BDC0D88];
    v12 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(WeakRetained, "setCachedCurrentTimeForCompositionUpdate:", &v11);
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(v10, 0, sizeof(v10));
    objc_msgSend(v4, "notifyPlaybackDidStopAtTime:", v10);

    objc_msgSend(v3, "playbackDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "playbackDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playbackReadyForDisplayChanged:isReady:setPlaceHolder:", *(_QWORD *)(a1 + 32), 1, 1);

    }
  }

}

- (BOOL)updateCompositionForClip:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  JFXCompositionPlayableElementUpdateRequest *v11;
  JFXCompositionPlayableElementUpdateRequest *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  JFXCompositionPlayer *v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[JFXCompositionPlayer isRequestOfTypeQueued:](self, "isRequestOfTypeQueued:", 1);
  if (v8)
  {
    -[JFXCompositionPlayer throttleRequestWithCompletionBlock:ofType:](self, "throttleRequestWithCompletionBlock:ofType:", v7, 5);
  }
  else
  {
    -[JFXCompositionPlayer cancelQueuedCompositionUpdateRequestFromClip:](self, "cancelQueuedCompositionUpdateRequestFromClip:", v6);
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __60__JFXCompositionPlayer_updateCompositionForClip_completion___block_invoke;
    v17 = &unk_24EE5AF90;
    objc_copyWeak(&v20, &location);
    v18 = self;
    v9 = v6;
    v19 = v9;
    v10 = (void *)MEMORY[0x2276A1F6C](&v14);
    v11 = [JFXCompositionPlayableElementUpdateRequest alloc];
    v12 = -[JFXCompositionPlayableElementUpdateRequest initWithBlock:withClip:](v11, "initWithBlock:withClip:", v10, v9, v14, v15, v16, v17, v18);
    -[JFXCompositionPlayerRequest setPlayer:](v12, "setPlayer:", self);
    -[JFXCompositionPlayerRequest setCompletionBlock:](v12, "setCompletionBlock:", v7);
    -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v12);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return !v8;
}

void __60__JFXCompositionPlayer_updateCompositionForClip_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          objc_msgSend(*(id *)(a1 + 32), "player"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      objc_msgSend(WeakRetained, "doClipCompositionUpdate:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(WeakRetained, "completeRequest:success:wasCancelled:error:", v7, 0, 1, 0);
      objc_msgSend(*(id *)(a1 + 32), "updateComposition:", 0);
    }
  }

}

- (void)doClipCompositionUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD block[4];
  id v16;
  id location;

  v4 = a3;
  -[JFXCompositionPlayer composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteEffectChangeForClip:", v4);

  -[JFXCompositionPlayer player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customVideoCompositor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "refreshCompletionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_initWeak(&location, self);
    v10 = dispatch_time(0, 30000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__JFXCompositionPlayer_doClipCompositionUpdate___block_invoke;
    block[3] = &unk_24EE59648;
    objc_copyWeak(&v16, &location);
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  -[JFXCompositionPlayer player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "currentTime");
  else
    memset(v14, 0, sizeof(v14));
  -[JFXCompositionPlayer player](self, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rate");
  objc_msgSend(v8, "signalScheduling:playerRate:", v14);

}

void __48__JFXCompositionPlayer_doClipCompositionUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleUpdateCompositionForClipCompleted:", 1);

}

- (void)handleUpdateCompositionForClipCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 5)
    -[JFXCompositionPlayer completePendingRequest:wasCancelled:error:](self, "completePendingRequest:wasCancelled:error:", v3, 0, 0);
}

- (void)configureCompositorCompletionBlock
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, char);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[JFXCompositionPlayer player](self, "player");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customVideoCompositor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v5, "refreshCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 == 0;

  if ((v3 & 1) != 0)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke;
    v12 = &unk_24EE5AFE0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v5, "setRefreshCompletionBlock:", &v9);
    JFXLog_DebugPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayer displayName](self, "displayName", v9, v10, v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ Installed compositor refresh completion block", buf, 0xCu);

    }
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);

}

void __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke_2;
  v3[3] = &unk_24EE5AFB8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
}

void __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleCompositionRefreshCompleted:", *(unsigned __int8 *)(a1 + 40));

}

- (void)handleCompositionRefreshCompleted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v3 = a3;
  -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1)
  {
    -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRefreshCompletedReceived");
      if (objc_msgSend(v9, "hasCompleted"))
        -[JFXCompositionPlayer handleUpdateCompositionCompleted:wasCancelled:error:](self, "handleUpdateCompositionCompleted:wasCancelled:error:", 1, 0, 0);

    }
  }
  else
  {
    -[JFXCompositionPlayer handleUpdateCompositionForClipCompleted:](self, "handleUpdateCompositionForClipCompleted:", v3);
  }
}

- (void)handleClipCompositionUpdateTimedOut
{
  OUTLINED_FUNCTION_0(&dword_2269A9000, a1, a3, "composition update timed out", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)removeCompositorCompletionBlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customVideoCompositor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "refreshCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "setRefreshCompletionBlock:", 0);
    JFXLog_DebugPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[JFXCompositionPlayer displayName](self, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "Player %{public}@ removed compositor refresh completion block", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)doPlay
{
  void *v3;
  id v4;

  -[JFXCompositionPlayer removeCompositorCompletionBlock](self, "removeCompositorCompletionBlock");
  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "play");

  -[JFXCompositionPlayer composition](self, "composition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyPlaybackWillBegin");

}

- (void)doPause
{
  id v2;

  -[JFXCompositionPlayer player](self, "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (BOOL)isPlaying
{
  void *v2;
  BOOL v3;

  -[JFXCompositionPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus") == 2;

  return v3;
}

- (void)doMuteAudio:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[JFXCompositionPlayer player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMuted:", v3);

}

- (BOOL)isAudioMuted
{
  void *v2;
  char v3;

  -[JFXCompositionPlayer player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (CGSize)renderSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGSize result;

  -[JFXCompositionPlayer composition](self, "composition");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[JFXCompositionPlayer composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[JFXCompositionPlayer composition](self, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoComposition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "renderSize");
    v10 = v9;
    v12 = v11;

    -[JFXCompositionPlayer composition](self, "composition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoComposition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "renderScale");
    v16 = v15;

    v17 = v10 * v16;
    v18 = v12 * v16;
  }
  else
  {
LABEL_4:
    -[JFXCompositionPlayer playerView](self, "playerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displaySize");
    v21 = v20;
    v23 = v22;
    v17 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);

    if (v21 != v17 || v23 != v18)
    {
      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "renderSize");
      v27 = v26;
      v29 = v28;

      -[JFXCompositionPlayer playerView](self, "playerView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displaySize");
      v32 = v31;
      v34 = v33;

      -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageScale");
      v37 = v36;

      v38 = v32 * v37 / v27;
      if (v38 >= v34 * v37 / v29)
        v38 = v34 * v37 / v29;
      v39 = 1.0;
      if (v38 <= 1.0)
        v39 = v38;
      v17 = CGSizeIntegral(v27 * v39);
      v18 = v40;
    }
  }
  v41 = v17;
  v42 = v18;
  result.height = v42;
  result.width = v41;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;
  int32_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  CMTimeFlags v13;
  _QWORD v14[3];
  CMTime time1;
  CMTime time2;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[JFXCompositionPlayer player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
  if ((_DWORD)result)
  {
    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "timeScale");

    time2 = (CMTime)*retstr;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FrameTimeFromCMTime(&time2, v9);
    if (result <= 1)
    {
      v10 = (int)result;
      JFXLog_DebugPlayback();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[JFXCompositionPlayer displayName](self, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
        v13 = FrameTimeFromCMTime(v14, v9);
        LODWORD(time2.value) = 138412802;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v12;
        LOWORD(time2.flags) = 1024;
        *(CMTimeFlags *)((char *)&time2.flags + 2) = v13;
        WORD1(time2.epoch) = 1024;
        HIDWORD(time2.epoch) = v10;
        _os_log_debug_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEBUG, "player %@ using cached current time at %d and player time is %d", (uint8_t *)&time2, 0x18u);

      }
      result = -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
      *(CMTime *)retstr = time2;
    }
  }
  return result;
}

- (int)currentTime
{
  void *v3;
  void *v4;
  void *v5;
  int32_t v6;
  unsigned int v7;
  NSObject *v8;
  void *v10;
  CMTimeFlags v11;
  _QWORD v12[3];
  _QWORD v13[3];
  CMTime time1;
  CMTime v15;
  CMTime time2;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(&v15, 0, sizeof(v15));
  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(&v15, 0, sizeof(v15));

  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "timeScale");

  time2 = v15;
  v7 = FrameTimeFromCMTime(&time2, v6);
  -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  if (CMTimeCompare(&time1, &time2) && v7 <= 1)
  {
    JFXLog_DebugPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[JFXCompositionPlayer displayName](self, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
      v11 = FrameTimeFromCMTime(v13, v6);
      LODWORD(time2.value) = 138412802;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v10;
      LOWORD(time2.flags) = 1024;
      *(CMTimeFlags *)((char *)&time2.flags + 2) = v11;
      WORD1(time2.epoch) = 1024;
      HIDWORD(time2.epoch) = v7;
      _os_log_debug_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEBUG, "player %@ using cached current time at %d and player time is %d", (uint8_t *)&time2, 0x18u);

    }
    -[JFXCompositionPlayer cachedCurrentTimeForCompositionUpdate](self, "cachedCurrentTimeForCompositionUpdate");
    return FrameTimeFromCMTime(v12, v6);
  }
  return v7;
}

- (int)duration
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD v8[3];

  -[JFXCompositionPlayer composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "duration");
  else
    memset(v8, 0, sizeof(v8));
  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FrameTimeFromCMTime(v8, objc_msgSend(v5, "frameRate"));

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id *v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  char v30;
  uint64_t v31;
  id v32;
  int v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD block[4];
  id v38;
  char v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 != &sJFXCompositionPlayerContext)
  {
    v36.receiver = self;
    v36.super_class = (Class)JFXCompositionPlayer;
    -[JFXCompositionPlayer observeValueForKeyPath:ofObject:change:context:](&v36, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_30;
  }
  -[JFXCompositionPlayer player](self, "player");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[JFXCompositionPlayer player](self, "player");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 != v11)
    {

      goto LABEL_13;
    }
    v16 = objc_msgSend(v10, "isEqualToString:", CFSTR("timeControlStatus"));

    if (v16)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v17 && v18 && (objc_msgSend(v17, "isEqual:", v18) & 1) != 0)
        goto LABEL_28;
      -[JFXCompositionPlayer player](self, "player");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "timeControlStatus");

      if (v21)
      {
        if (v21 != 2)
        {
LABEL_28:

          goto LABEL_29;
        }
        objc_initWeak(&location, self);
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v42[3] = &unk_24EE59648;
        v22 = &v43;
        objc_copyWeak(&v43, &location);
        v23 = MEMORY[0x24BDAC9B8];
        v24 = v42;
      }
      else
      {
        objc_initWeak(&location, self);
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v40[3] = &unk_24EE59648;
        v22 = &v41;
        objc_copyWeak(&v41, &location);
        v23 = MEMORY[0x24BDAC9B8];
        v24 = v40;
      }
      dispatch_async(v23, v24);
      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
      goto LABEL_28;
    }
  }
LABEL_13:
  -[JFXCompositionPlayer playerView](self, "playerView");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[JFXCompositionPlayer playerView](self, "playerView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27 == v11)
    {
      v28 = objc_msgSend(v10, "isEqualToString:", CFSTR("readyForDisplay"));

      if (v28)
      {
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "BOOLValue");

        objc_initWeak(&location, self);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
        block[3] = &unk_24EE5AFB8;
        objc_copyWeak(&v38, &location);
        v39 = v30;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
        goto LABEL_30;
      }
    }
    else
    {

    }
  }
  -[JFXCompositionPlayer player](self, "player");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_30;
  v17 = (void *)v31;
  -[JFXCompositionPlayer player](self, "player");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v32 != v11)
  {

LABEL_29:
    goto LABEL_30;
  }
  v33 = objc_msgSend(v10, "isEqualToString:", CFSTR("status"));

  if (v33)
  {
    -[JFXCompositionPlayer player](self, "player");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "error");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 && objc_msgSend(v35, "code") == -11819)
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_49);

  }
LABEL_30:

}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handlePlaybackBegan");

}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handlePlaybackPaused");

}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleReadyForDisplay:", *(unsigned __int8 *)(a1 + 40));

}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("mediaserverdCrashed"), 0);

}

- (void)handleReadyForDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  dispatch_time_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD block[4];
  id v30;
  id location;

  v3 = a3;
  if (a3
    && (-[JFXCompositionPlayer pendingRequest](self, "pendingRequest"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "type"),
        v5,
        v6 == 1))
  {
    -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
    -[JFXCompositionPlayer pendingRequest](self, "pendingRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReadyForDisplayReceived");
    -[JFXCompositionPlayer player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customVideoCompositor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "refreshCompletionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v9, "hasCompleted"))
        -[JFXCompositionPlayer handleUpdateCompositionCompleted:wasCancelled:error:](self, "handleUpdateCompositionCompleted:wasCancelled:error:", 1, 0, 0);
    }
    else
    {
      -[JFXCompositionPlayer player](self, "player");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "timeControlStatus");

      if (v17 == 2)
      {
        JFXLog_playback();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[JFXCompositionPlayer handleReadyForDisplay:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

      }
      objc_initWeak(&location, self);
      v26 = dispatch_time(0, 30000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__JFXCompositionPlayer_handleReadyForDisplay___block_invoke;
      block[3] = &unk_24EE59648;
      objc_copyWeak(&v30, &location);
      dispatch_after(v26, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0)
      return;
    if (v3)
    {
      v27 = *MEMORY[0x24BDC0D88];
      v28 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      -[JFXCompositionPlayer setCachedCurrentTimeForCompositionUpdate:](self, "setCachedCurrentTimeForCompositionUpdate:", &v27);
    }
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackReadyForDisplayChanged:isReady:setPlaceHolder:", self, v3, 1);
  }

}

void __46__JFXCompositionPlayer_handleReadyForDisplay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleUpdateCompositionCompleted:wasCancelled:error:", 1, 0, 0);

}

- (void)createPlayer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  CMTime v18;
  id location;

  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDB2610]);
    -[JFXCompositionPlayer composition](self, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithPlayerItem:", v6);
    -[JFXCompositionPlayer setPlayer:](self, "setPlayer:", v7);

    -[JFXCompositionPlayer player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 3, &sJFXCompositionPlayerContext);

    -[JFXCompositionPlayer player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActionAtItemEnd:", 1);

    objc_initWeak(&location, self);
    -[JFXCompositionPlayer player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v18, 1, 3);
    v11 = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __36__JFXCompositionPlayer_createPlayer__block_invoke;
    v16[3] = &unk_24EE58000;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v18, v11, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer setPlayerProVideoPeriodicObserver:](self, "setPlayerProVideoPeriodicObserver:", v13);

    -[JFXCompositionPlayer setupPlaybackTimeChangedObserver](self, "setupPlaybackTimeChangedObserver");
    -[JFXCompositionPlayer playerView](self, "playerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 1, &sJFXCompositionPlayerContext);

    -[JFXCompositionPlayer player](self, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, &sJFXCompositionPlayerContext);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __36__JFXCompositionPlayer_createPlayer__block_invoke(uint64_t a1, __int128 *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customVideoCompositor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rate");
  v10 = *a2;
  v11 = *((_QWORD *)a2 + 2);
  objc_msgSend(v7, "signalScheduling:playerRate:", &v10);

}

- (void)setupPlaybackTimeChangedObserver
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  AVPlayer *player;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, __int128 *);
  void *v17;
  id v18;
  int v19;
  _BYTE v20[24];
  id location;

  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXCompositionPlayer playerPlaybackTimePeriodicObserver](self, "playerPlaybackTimePeriodicObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[JFXCompositionPlayer player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXCompositionPlayer playerPlaybackTimePeriodicObserver](self, "playerPlaybackTimePeriodicObserver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeTimeObserver:", v6);

    }
    v7 = objc_initWeak(&location, self);
    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "frameRate");

    player = self->_player;
    -[JFXCompositionPlayer playbackTimeChangedObserverInterval](self, "playbackTimeChangedObserverInterval");
    v11 = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __56__JFXCompositionPlayer_setupPlaybackTimeChangedObserver__block_invoke;
    v17 = &unk_24EE5B030;
    v19 = v9;
    objc_copyWeak(&v18, &location);
    -[AVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](player, "addPeriodicTimeObserverForInterval:queue:usingBlock:", v20, v11, &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer setPlayerPlaybackTimePeriodicObserver:](self, "setPlayerPlaybackTimePeriodicObserver:", v13, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __56__JFXCompositionPlayer_setupPlaybackTimeChangedObserver__block_invoke(uint64_t a1, __int128 *a2)
{
  int32_t v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v3 = *(_DWORD *)(a1 + 40);
  v14 = *a2;
  v15 = *((_QWORD *)a2 + 2);
  v4 = FrameTimeFromCMTime(&v14, v3);
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "pendingRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "type") == 1)
    goto LABEL_5;
  v8 = objc_loadWeakRetained(v5);
  v9 = objc_msgSend(v8, "restoringPlayerStateAfterCompositionUpdate");

  if ((v9 & 1) == 0)
  {
    v10 = objc_loadWeakRetained(v5);
    objc_msgSend(v10, "playbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained(v5);
      objc_msgSend(WeakRetained, "playbackDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained(v5);
      objc_msgSend(v7, "playbackTimeDidChange:currentTime:", v13, v4);

LABEL_5:
    }
  }
}

- (void)destroyPlayer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  -[JFXCompositionPlayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(v25, 0, sizeof(v25));
  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FrameTimeFromCMTime(v25, objc_msgSend(v5, "frameRate"));

  -[JFXCompositionPlayer player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "timeControlStatus");

  if (v8 == 2)
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playbackDidStop:currentTime:", self, v6);

    }
  }
  -[JFXCompositionPlayer player](self, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[JFXCompositionPlayer playbackDelegate](self, "playbackDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playerWillBeDestroyed:", self);

    }
    -[JFXCompositionPlayer player](self, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), &sJFXCompositionPlayerContext);

    -[JFXCompositionPlayer playerView](self, "playerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &sJFXCompositionPlayerContext);

    -[JFXCompositionPlayer player](self, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &sJFXCompositionPlayerContext);

    -[JFXCompositionPlayer player](self, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "replaceCurrentItemWithPlayerItem:", 0);

    -[JFXCompositionPlayer player](self, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer playerProVideoPeriodicObserver](self, "playerProVideoPeriodicObserver");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeTimeObserver:", v21);

    -[JFXCompositionPlayer setPlayerProVideoPeriodicObserver:](self, "setPlayerProVideoPeriodicObserver:", 0);
    -[JFXCompositionPlayer player](self, "player");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXCompositionPlayer playerPlaybackTimePeriodicObserver](self, "playerPlaybackTimePeriodicObserver");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeTimeObserver:", v23);

    -[JFXCompositionPlayer setPlayerPlaybackTimePeriodicObserver:](self, "setPlayerPlaybackTimePeriodicObserver:", 0);
    -[JFXCompositionPlayer playerView](self, "playerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPlayer:", 0);

  }
  -[JFXCompositionPlayer setPlayer:](self, "setPlayer:", 0);
}

- (void)warnTooManyLiveCompositors:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  JFXLog_playback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[JFXCompositionPlayer warnTooManyLiveCompositors:].cold.1(v4, self, v5);

}

- (BOOL)JFX_clipDataSourceHasClip:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 1)
  {
    v9 = 0;
  }
  else
  {
    -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "playableElementAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = objc_msgSend(v8, "isEqual:", v4);
    if ((v7 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v10 = 1;
      do
      {
        v11 = v10;
        if (v6 == v10)
          break;
        -[JFXCompositionPlayer clipsDataSource](self, "clipsDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "playableElementAtIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v12) = objc_msgSend(v13, "isEqual:", v4);
        v10 = v11 + 1;
      }
      while (!(_DWORD)v12);
      v9 = v11 < v6;
    }
  }

  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (JFXCompositionPlayerDelegate)playbackDelegate
{
  return (JFXCompositionPlayerDelegate *)objc_loadWeakRetained((id *)&self->_playbackDelegate);
}

- (void)setPlaybackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_playbackDelegate, a3);
}

- (JFXAVPlayerViewer)playerView
{
  return self->_playerView;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setClipsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_clipsDataSource, a3);
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (id)playerProVideoPeriodicObserver
{
  return self->_playerProVideoPeriodicObserver;
}

- (void)setPlayerProVideoPeriodicObserver:(id)a3
{
  objc_storeStrong(&self->_playerProVideoPeriodicObserver, a3);
}

- (id)playerPlaybackTimePeriodicObserver
{
  return self->_playerPlaybackTimePeriodicObserver;
}

- (void)setPlayerPlaybackTimePeriodicObserver:(id)a3
{
  objc_storeStrong(&self->_playerPlaybackTimePeriodicObserver, a3);
}

- (JFXCompositionPlayerRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequest, a3);
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)wasCurrentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setWasCurrentTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_wasCurrentTime.epoch = a3->var3;
  *(_OWORD *)&self->_wasCurrentTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedCurrentTimeForCompositionUpdate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setCachedCurrentTimeForCompositionUpdate:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_cachedCurrentTimeForCompositionUpdate.epoch = a3->var3;
  *(_OWORD *)&self->_cachedCurrentTimeForCompositionUpdate.value = v3;
}

- (BOOL)wasAudioMuted
{
  return self->_wasAudioMuted;
}

- (void)setWasAudioMuted:(BOOL)a3
{
  self->_wasAudioMuted = a3;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (BOOL)restoringPlayerStateAfterCompositionUpdate
{
  return self->_restoringPlayerStateAfterCompositionUpdate;
}

- (void)setRestoringPlayerStateAfterCompositionUpdate:(BOOL)a3
{
  self->_restoringPlayerStateAfterCompositionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong(&self->_playerPlaybackTimePeriodicObserver, 0);
  objc_storeStrong(&self->_playerProVideoPeriodicObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_destroyWeak((id *)&self->_playbackDelegate);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)enqueueRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "Request %{public}@ queued", (uint8_t *)&v2, 0xCu);
}

void __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_3(&dword_2269A9000, a4, a3, "player %{public}@ seek request exception %{public}@", (uint8_t *)a3);

}

- (void)handleReadyForDisplay:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2269A9000, a1, a3, "compositor completion handler should be installed when paused", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)warnTooManyLiveCompositors:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE79700]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE79708]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v7;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_debug_impl(&dword_2269A9000, a3, OS_LOG_TYPE_DEBUG, "Warning! Too many compositors alive (%@)! Exceeded max of %@ player %@", (uint8_t *)&v11, 0x20u);

}

@end
