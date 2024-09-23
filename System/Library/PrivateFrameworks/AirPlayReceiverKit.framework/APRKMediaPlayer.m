@implementation APRKMediaPlayer

- (APRKMediaPlayer)initWithP2PWiFiSupport:(BOOL)a3 isInterstitialPlayer:(BOOL)a4 playerSessionID:(int)a5
{
  APRKMediaPlayer *v8;
  APRKMediaPlayer *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *messageQueue;
  AVQueuePlayer *v12;
  AVQueuePlayer *player;
  NSString *previousItemUUID;
  NSString *currentItemUUID;
  APRKResourceLoaderHelper *v16;
  APRKResourceLoaderHelper *resourceLoaderHelper;
  APRKContentKeyHelper *v18;
  APRKContentKeyHelper *contentKeyHelper;
  uint64_t v20;
  NSMutableDictionary *pendingSenderSeekMessages;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)APRKMediaPlayer;
  v8 = -[APRKMediaPlayer init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_stallCount = 0;
    v10 = dispatch_queue_create("com.apple.APRKMediaPlayer.messageQueue", 0);
    messageQueue = v9->_messageQueue;
    v9->_messageQueue = (OS_dispatch_queue *)v10;

    v12 = (AVQueuePlayer *)objc_alloc_init(MEMORY[0x24BDB2670]);
    player = v9->_player;
    v9->_player = v12;

    -[AVQueuePlayer setAllowsExternalPlayback:](v9->_player, "setAllowsExternalPlayback:", 0);
    -[APRKMediaPlayer _registerNotificationHandlersForPlayer](v9, "_registerNotificationHandlersForPlayer");
    previousItemUUID = v9->_previousItemUUID;
    v9->_previousItemUUID = 0;

    currentItemUUID = v9->_currentItemUUID;
    v9->_currentItemUUID = 0;

    v16 = objc_alloc_init(APRKResourceLoaderHelper);
    resourceLoaderHelper = v9->_resourceLoaderHelper;
    v9->_resourceLoaderHelper = v16;

    -[APRKResourceLoaderHelper setDelegate:](v9->_resourceLoaderHelper, "setDelegate:", v9);
    v18 = objc_alloc_init(APRKContentKeyHelper);
    contentKeyHelper = v9->_contentKeyHelper;
    v9->_contentKeyHelper = v18;

    -[APRKContentKeyHelper setDelegate:](v9->_contentKeyHelper, "setDelegate:", v9);
    v9->_isP2PWiFiSession = a3;
    v9->_isInterstitialPlayer = a4;
    v9->_playerSessionID = a5;
    v9->_receiverNetworkClock = 0;
    *(_DWORD *)&v9->_isFirstSetRateReceived = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    pendingSenderSeekMessages = v9->_pendingSenderSeekMessages;
    v9->_pendingSenderSeekMessages = (NSMutableDictionary *)v20;

    v9->_fpHelper = 0;
  }
  return v9;
}

- (void)dealloc
{
  OpaqueAPReceiverFairPlayHelper *fpHelper;
  objc_super v4;

  if (self->_fpHelper)
  {
    APReceiverFairPlayHelperRemoveAllFPSessions();
    fpHelper = self->_fpHelper;
    if (fpHelper)
      CFRelease(fpHelper);
  }
  v4.receiver = self;
  v4.super_class = (Class)APRKMediaPlayer;
  -[APRKMediaPlayer dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *messageQueue;
  _QWORD v5[5];
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = MEMORY[0x24BDAC760];
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__APRKMediaPlayer_invalidate__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(messageQueue, block);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __29__APRKMediaPlayer_invalidate__block_invoke_2;
  v5[3] = &unk_24FA1BC70;
  v5[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

void __29__APRKMediaPlayer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 128);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 120);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  }
}

void __29__APRKMediaPlayer_invalidate__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 138) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_unregisterNotificationHandlersAndRemovePlayerItem:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "_unregisterNotificationHandlersForPlayer");

}

- (AVQueuePlayer)backingAVQueuePlayer
{
  return self->_player;
}

- (AVPlayerItem)currentItem
{
  return (AVPlayerItem *)-[AVQueuePlayer currentItem](self->_player, "currentItem");
}

- (void)stopWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *messageQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_sync(messageQueue, block);
  v7 = self->_messageQueue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_24FA1BC98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", 3, 1, 0);
}

void __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", 3, 1, 1);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 176);
    *(_QWORD *)(v4 + 176) = 0;

    objc_msgSend(v3, "setMessagingDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setInterstitialPlayer:", 0);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_3;
    v8[3] = &unk_24FA1BC98;
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v6, "stopWithCompletionBlock:", v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
}

uint64_t __43__APRKMediaPlayer_stopWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setMessagingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_messagingDelegate, a3);
}

- (APRKMediaPlayerMessagingDelegate)messagingDelegate
{
  return (APRKMediaPlayerMessagingDelegate *)objc_loadWeakRetained((id *)&self->_messagingDelegate);
}

- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3
{
  OpaqueAPSNetworkAddress *sessionReceiverAddr;

  sessionReceiverAddr = self->_sessionReceiverAddr;
  self->_sessionReceiverAddr = a3;
  if (a3)
    CFRetain(a3);
  if (sessionReceiverAddr)
    CFRelease(sessionReceiverAddr);
}

- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3
{
  OpaqueAPSNetworkClock *receiverNetworkClock;

  receiverNetworkClock = self->_receiverNetworkClock;
  self->_receiverNetworkClock = a3;
  if (a3)
    CFRetain(a3);
  if (receiverNetworkClock)
    CFRelease(receiverNetworkClock);
}

- (BOOL)shouldDelegateToInterstitialPlayerForMessageAndID:(id)a3 sessionID:(int)a4
{
  uint64_t v4;
  void *v6;
  int v7;

  if (self->_isInterstitialPlayer)
    return 0;
  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDC0FB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (!v7)
    return 0;
  if (!self->_interstitialPlayer)
    -[APRKMediaPlayer _ensureInterstitialPlayerFor:](self, "_ensureInterstitialPlayerFor:", v4);
  return 1;
}

- (void)_ensureInterstitialPlayerFor:(int)a3
{
  APRKMediaPlayer *v4;
  APRKMediaPlayer *interstitialPlayer;
  APRKMediaPlayer *v6;
  id WeakRetained;
  void *v8;
  NSArray *interstitialEvents;
  void *v10;
  AVQueuePlayer *v11;

  if (!self->_interstitialPlayer)
  {
    v4 = -[APRKMediaPlayer initWithP2PWiFiSupport:isInterstitialPlayer:playerSessionID:]([APRKMediaPlayer alloc], "initWithP2PWiFiSupport:isInterstitialPlayer:playerSessionID:", self->_isP2PWiFiSession, 1, *(_QWORD *)&a3);
    interstitialPlayer = self->_interstitialPlayer;
    self->_interstitialPlayer = v4;

    v6 = self->_interstitialPlayer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_messagingDelegate);
    -[APRKMediaPlayer setMessagingDelegate:](v6, "setMessagingDelegate:", WeakRetained);

    -[APRKMediaPlayer setSessionReceiverAddress:](self->_interstitialPlayer, "setSessionReceiverAddress:", self->_sessionReceiverAddr);
    v11 = self->_player;
    -[APRKMediaPlayer backingAVQueuePlayer](self->_interstitialPlayer, "backingAVQueuePlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && v8)
    {
      -[AVQueuePlayer _setInterstitialPlayer:](v11, "_setInterstitialPlayer:", v8);
      interstitialEvents = self->_interstitialEvents;
      if (interstitialEvents)
      {
        -[AVQueuePlayer currentItem](v11, "currentItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVQueuePlayer _noteRemoteInterstitialEvents:forItem:](v11, "_noteRemoteInterstitialEvents:forItem:", interstitialEvents, v10);

      }
      if (self->_currentInterstitialEventID)
        -[AVQueuePlayer _noteCurrentRemoteInterstitialEvent:](v11, "_noteCurrentRemoteInterstitialEvent:");
    }

  }
}

- (void)processMessageWithIDAndDictionaryAsync:(id)a3 messageSessionID:(int)a4
{
  id v6;
  void *v7;
  NSObject *messageQueue;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  v7 = v6;
  if (self->_playerSessionID == a4)
  {
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__APRKMediaPlayer_processMessageWithIDAndDictionaryAsync_messageSessionID___block_invoke;
    block[3] = &unk_24FA1BCC0;
    block[4] = self;
    v10 = v6;
    v11 = a4;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __75__APRKMediaPlayer_processMessageWithIDAndDictionaryAsync_messageSessionID___block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldDelegateToInterstitialPlayerForMessageAndID:sessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3[22], "processMessageWithIDAndDictionaryAsync:messageSessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v3, "_processMessageWithDictionaryInternal:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v4);
      v4 = v5;
    }

  }
}

- (id)processMessageWithIDAndDictionarySync:(id)a3 messageSessionID:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *messageQueue;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  if (self->_playerSessionID == a4)
  {
    messageQueue = self->_messageQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__APRKMediaPlayer_processMessageWithIDAndDictionarySync_messageSessionID___block_invoke;
    v12[3] = &unk_24FA1BCE8;
    v12[4] = self;
    v15 = a4;
    v13 = v6;
    v14 = &v16;
    dispatch_sync(messageQueue, v12);

    v8 = (void *)v17[5];
  }
  v10 = v8;
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __74__APRKMediaPlayer_processMessageWithIDAndDictionarySync_messageSessionID___block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldDelegateToInterstitialPlayerForMessageAndID:sessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  v3 = *(id **)(a1 + 32);
  if (v2)
    objc_msgSend(v3[22], "processMessageWithIDAndDictionarySync:messageSessionID:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  else
    objc_msgSend(v3, "_processMessageWithDictionaryInternal:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

- (id)_processMessageWithDictionaryInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_20:
    v8 = 0;
    v6 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("unhandledURL")))
  {
    -[APRKMediaPlayer _processUnhandledURLWithDictionary:](self, "_processUnhandledURLWithDictionary:", v5);
LABEL_35:
    v8 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("playbackInfo")))
  {
    -[APRKMediaPlayer _processPlaybackInfoRequestWithDictionary:](self, "_processPlaybackInfoRequestWithDictionary:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("setProperty")))
    {
      -[APRKMediaPlayer _setPropertyWithDictionary:](self, "_setPropertyWithDictionary:", v5);
      goto LABEL_35;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("property")))
    {
      -[APRKMediaPlayer _getPropertyWithDictionary:](self, "_getPropertyWithDictionary:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("insertPlayQueueItem")))
      {
        -[APRKMediaPlayer _insertPlayQueueItemWithDictionary:](self, "_insertPlayQueueItemWithDictionary:", v5);
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("removePlayQueueItem")))
      {
        -[APRKMediaPlayer _removePlayQueueItemWithDictionary:](self, "_removePlayQueueItemWithDictionary:", v5);
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("setRate")))
      {
        -[APRKMediaPlayer _setRateWithDictionary:](self, "_setRateWithDictionary:", v5);
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("seek")))
      {
        -[APRKMediaPlayer _seekWithDictionary:](self, "_seekWithDictionary:", v5);
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("streamingKey")))
      {
        -[APRKMediaPlayer _processStreamingKeyWithDictionary:](self, "_processStreamingKeyWithDictionary:", v5);
        goto LABEL_35;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("stop")))
      {
        -[APRKMediaPlayer _stopWithDictionary:](self, "_stopWithDictionary:", v5);
        goto LABEL_35;
      }
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("authorizeItem")))
        goto LABEL_35;
      -[APRKMediaPlayer _processAuthorizeItemWithDictionary:](self, "_processAuthorizeItemWithDictionary:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;
LABEL_36:

  return v8;
}

- (id)_serializeTimeRanges:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  id v18;
  id obj;
  CMTime time;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v3;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      v8 = *MEMORY[0x24BDC1140];
      v9 = *MEMORY[0x24BDC1138];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          memset(v22, 0, sizeof(v22));
          v21 = 0u;
          if (v11)
            objc_msgSend(v11, "CMTimeRangeValue");
          v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          *(_OWORD *)&time.value = v21;
          time.epoch = *(_QWORD *)&v22[0];
          v13 = CMTimeCopyAsDictionary(&time, 0);
          if (v13)
          {
            v14 = v13;
            objc_msgSend(v12, "setObject:forKey:", v13, v8);

          }
          time = *(CMTime *)((char *)v22 + 8);
          v15 = CMTimeCopyAsDictionary(&time, 0);
          if (v15)
          {
            v16 = v15;
            objc_msgSend(v12, "setObject:forKey:", v15, v9);

          }
          objc_msgSend(v4, "addObject:", v12, v18);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v3 = v18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_currentPlaybackInfoDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFAllocator *v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  APRKMediaPlayer *interstitialPlayer;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime time;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AVQueuePlayer currentItem](self->_player, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v42 = CFSTR("uuid");
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("item"));
    v8 = objc_msgSend(v5, "status");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8 == 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BDC10A0]);

    if (v8 != 1)
    {
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v5, "currentDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x24BDC1050]);
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x24BDC1048]);

    }
    objc_msgSend(v5, "duration");
    v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v14 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x24BDC1058]);

    if (!self->_isInTrickPlay)
    {
      objc_msgSend(v5, "currentTime");
      v15 = CMTimeCopyAsDictionary(&v38, v13);
      objc_msgSend(v3, "setObject:forKey:", v15, *MEMORY[0x24BDC1090]);

    }
    v16 = -[AVQueuePlayer timeControlStatus](self->_player, "timeControlStatus");
    LODWORD(v17) = 0;
    if (v16 == 2)
      -[AVQueuePlayer rate](self->_player, "rate", v17);
    if (!self->_isInTrickPlay)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, *MEMORY[0x24BDC1098]);

    }
    -[APRKMediaPlayer _pausePlayerIfNeededForState:](self, "_pausePlayerIfNeededForState:", self->_internalPlaybackState, v17);
    -[APRKMediaPlayer _figPlaybackStateStringFrom:](self, "_figPlaybackStateStringFrom:", self->_internalPlaybackState);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("playbackState"));
    if (self->_isWaitingToSetRateFromSenderAfterSeek)
      objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isWaitingToSetRateFromSenderAfterSeek"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isPlaybackLikelyToKeepUp"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, *MEMORY[0x24BDC1088]);

    objc_msgSend(v5, "currentEstimatedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v3, "setObject:forKey:", v21, *MEMORY[0x24BDC1060]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isPlaybackBufferFull"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x24BDC1080]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isPlaybackBufferEmpty"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, *MEMORY[0x24BDC1078]);

    objc_msgSend(v5, "seekableTimeRanges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _serializeTimeRanges:](self, "_serializeTimeRanges:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v3, "setObject:forKey:", v25, *MEMORY[0x24BDC10A8]);
    objc_msgSend(v5, "loadedTimeRanges");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _serializeTimeRanges:](self, "_serializeTimeRanges:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      objc_msgSend(v3, "setObject:forKey:", v27, *MEMORY[0x24BDC1070]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_stallCount);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, *MEMORY[0x24BDC10B0]);

    interstitialPlayer = self->_interstitialPlayer;
    if (interstitialPlayer)
    {
      -[APRKMediaPlayer _currentPlaybackInfoDictionary](interstitialPlayer, "_currentPlaybackInfoDictionary");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v30, *MEMORY[0x24BDC1068]);

    }
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "duration");
      CMTimeGetSeconds(&v37);
      objc_msgSend(v5, "currentTime");
      CMTimeGetSeconds(&v36);
      LogPrintF();

    }
LABEL_30:

    goto LABEL_31;
  }
  if (!self->_isInterstitialPlayer)
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD1100];
    v40 = *MEMORY[0x24BDD0FC8];
    v41 = CFSTR("Sender requested playbackInfo while AVPlayer on Receiver side did not have a current playerItem.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, -6707, v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[APRKUtilities dictionaryForError:](APRKUtilities, "dictionaryForError:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("error"));
    goto LABEL_30;
  }
LABEL_32:

  return v3;
}

- (id)_playerItemForUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AVQueuePlayer items](self->_player, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)_frontPlayerItem
{
  void *v2;
  void *v3;

  -[AVQueuePlayer items](self->_player, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)processTLSInfoDictionary:(id)a3
{
  NSDictionary *v4;
  NSDictionary *cachedSSLProperties;

  -[APRKMediaPlayer _SSLPropertiesforTLSInfo:](self, "_SSLPropertiesforTLSInfo:", a3);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cachedSSLProperties = self->_cachedSSLProperties;
  self->_cachedSSLProperties = v4;

}

- (id)_SSLPropertiesforTLSInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int16 v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "objectForKey:", CFSTR("tlsPSKClientIdentity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("tlsPSK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    if (v4 && v5)
    {
      v10 = 174;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x24BDB7808];
      v11[0] = *MEMORY[0x24BDB7800];
      v11[1] = v8;
      v12[0] = v4;
      v12[1] = v5;
      v11[2] = *MEMORY[0x24BDB77E8];
      v12[2] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_ensureFairPlayHelper
{
  OpaqueAPReceiverFairPlayHelper *v3;
  int v4;

  if (self->_fpHelper
    || (v3 = (OpaqueAPReceiverFairPlayHelper *)APReceiverFairPlayHelperCreate(), (self->_fpHelper = v3) != 0))
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (gLogCategory_AirPlayReceiverKit > 90)
    goto LABEL_8;
  if (gLogCategory_AirPlayReceiverKit != -1 || (v4 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF();
LABEL_8:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_updateAudioSessionMode:(id)a3
{
  id v5;
  void *v6;
  NSString **p_audioSessionMode;
  NSString *audioSessionMode;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  p_audioSessionMode = &self->_audioSessionMode;
  audioSessionMode = self->_audioSessionMode;
  if (audioSessionMode)
  {
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_audioSessionMode, (id)*MEMORY[0x24BDC0EF8]);
    if (!v6)
      goto LABEL_10;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *p_audioSessionMode) & 1) == 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v12 = *p_audioSessionMode;
      v14 = v6;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_audioSessionMode, a3);
    goto LABEL_21;
  }
LABEL_10:
  if (audioSessionMode)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_26;
  }
LABEL_21:
  v9 = *p_audioSessionMode;
  v15 = CFSTR("audioMode");
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v12, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v13 = v10;
    LogPrintF();
  }
  -[APRKMediaPlayer messagingDelegate](self, "messagingDelegate", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaPlayer:wantsToPostNotification:withPayload:", self, CFSTR("updateAudioMode"), v10);

LABEL_26:
}

- (void)_insertPlayQueueItemWithDictionary:(id)a3
{
  id v4;
  id v5;
  CMTimeEpoch v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  APRKPlayerItem *v37;
  uint64_t v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFDictionary *v44;
  const __CFDictionary *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *cachedSSLProperties;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  id v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  uint64_t v61;
  CMTime v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v56 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)&v62.value = *MEMORY[0x24BDC0D88];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v62.epoch = v6;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v49 = v4;
    LogPrintF();
  }
  v7 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v4, "objectForKey:", CFSTR("item"), v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *MEMORY[0x24BDC0FF0];
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC0FF0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDB26A8]);
      objc_msgSend(v9, "objectForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithSpecifiedName:", v13);

      if (v14)
        -[AVQueuePlayer setLoggingIdentifier:](self->_player, "setLoggingIdentifier:", v14);

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("IsTLSEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      -[APRKMediaPlayer messagingDelegate](self, "messagingDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaPlayerNeedsTLSInfo:", self);

      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        cachedSSLProperties = self->_cachedSSLProperties;
        LogPrintF();
      }
      v19 = self->_cachedSSLProperties;
      if (v19)
        objc_msgSend(v5, "setObject:forKey:", v19, *MEMORY[0x24BDB21E8]);
      if (self->_isP2PWiFiSession)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v20, *MEMORY[0x24BDB21F8]);

      }
      v21 = *MEMORY[0x24BDC0FA0];
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC0FA0], cachedSSLProperties);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      -[APRKMediaPlayer _fixedIPContentLocationFromURLString:error:](self, "_fixedIPContentLocationFromURLString:error:", v22, &v61);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v9, "setObject:forKey:", v23, v21);

    }
    else
    {
      v18 = self->_cachedSSLProperties;
      self->_cachedSSLProperties = 0;

    }
    objc_msgSend(v9, "objectForKey:", CFSTR("Play-Info"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = APReceiverFairPlayHelperProcessFPInfo();
      if ((_DWORD)v25)
      {
        v26 = (void *)v25;
        v27 = v24;
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          cachedSSLProperties = v26;
          LogPrintF();
        }
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BDD1100];
        v63 = *MEMORY[0x24BDD0FC8];
        v64[0] = CFSTR("Failed to process FP Info");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1, cachedSSLProperties);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, (int)v26, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[APRKMediaPlayer _sendUpstreamErrorMessageWithError:](self, "_sendUpstreamErrorMessageWithError:", v31);

        v24 = v27;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("fpSessionID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v33, "setObject:forKey:", v32, *MEMORY[0x24BDB1B98]);
      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(v33, "setObject:forKey:", v24, *MEMORY[0x24BDB1B90]);
      }
      else if (gLogCategory_AirPlayReceiverKit <= 30
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(v5, "setObject:forKey:", v33, *MEMORY[0x24BDB2100]);

    }
    v34 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC0F78]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryWithDictionary:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v5, "setObject:forKey:", v36, *MEMORY[0x24BDB2130]);
    }
    else if (gLogCategory_AirPlayReceiverKit <= 30
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v37 = -[APRKPlayerItem initWithDictionary:resourceLoaderHelper:contentKeyHelper:options:]([APRKPlayerItem alloc], "initWithDictionary:resourceLoaderHelper:contentKeyHelper:options:", v9, self->_resourceLoaderHelper, self->_contentKeyHelper, v5);
    if (!v37)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_78;
    }
    v53 = v36;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      -[APRKPlayerItem UUIDString](v37, "UUIDString");
      cachedSSLProperties = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v55 = v5;
    *(_OWORD *)&v62.value = v56;
    v62.epoch = v6;
    objc_msgSend(v9, "objectForKey:", CFSTR("Start-Date"), cachedSSLProperties);
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
      -[APRKPlayerItem setStartDate:](v37, "setStartDate:", v38);
    objc_msgSend(v9, "objectForKey:", CFSTR("Start-Position"));
    v39 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      CMTimeMakeFromDictionary(&v62, v39);
      v60 = v62;
      -[APRKPlayerItem setStartPosition:](v37, "setStartPosition:", &v60);
    }
    v52 = (void *)v38;
    v57 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("itemAfter"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      objc_msgSend(v41, "objectForKey:", CFSTR("uuid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", v43);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
LABEL_64:
        objc_msgSend(v9, "objectForKey:", CFSTR("timeToPauseBuffering"));
        v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&v60, 0, sizeof(v60));
        CMTimeMakeFromDictionary(&v60, v44);
        if ((v60.flags & 0x1D) == 1)
        {
          v59 = v60;
          -[APRKPlayerItem setTimeToPauseBuffering:](v37, "setTimeToPauseBuffering:", &v59);
        }
        objc_msgSend(v9, "objectForKey:", CFSTR("timeToPausePlayback"));
        v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&v59, 0, sizeof(v59));
        CMTimeMakeFromDictionary(&v59, v45);
        if ((v59.flags & 0x1D) == 1)
        {
          v58 = v59;
          -[APRKPlayerItem setTimeToPausePlayback:](v37, "setTimeToPausePlayback:", &v58);
        }
        v54 = v24;
        objc_msgSend(v9, "objectForKey:", CFSTR("snapTimeToPausePlayback"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
          -[APRKPlayerItem setSnapTimeToPausePlayback:](v37, "setSnapTimeToPausePlayback:", objc_msgSend(v46, "BOOLValue"));
        -[APRKPlayerItem setAutomaticallyHandlesInterstitialEvents:](v37, "setAutomaticallyHandlesInterstitialEvents:", 0);
        objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC10B8]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48
          && gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (self->_isInterestedInDateRange)
          -[APRKMediaPlayer addDateRangeCollectorToItem:](self, "addDateRangeCollectorToItem:", v37);
        -[APRKMediaPlayer _registerNotificationHandlersAndInsertPlayerItem:afterItem:](self, "_registerNotificationHandlersAndInsertPlayerItem:afterItem:", v37, v51);

        v5 = v55;
        v4 = v57;
        v36 = v53;
        v24 = v54;
LABEL_78:

        goto LABEL_79;
      }
    }
    else
    {
      v51 = 0;
    }
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v43 = 0;
    goto LABEL_64;
  }
LABEL_79:

}

- (void)_removePlayQueueItemWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  APRKMediaPlayer *v17;

  v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v13 = v4;
    LogPrintF();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("item"), v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v9, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[AVQueuePlayer items](self->_player, "items", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 == 1)
      {
        -[APRKResourceLoaderHelper forgetAllActiveResourceLoadingRequests](self->_resourceLoaderHelper, "forgetAllActiveResourceLoadingRequests");
        -[APRKContentKeyHelper forgetAllActiveContentKeyRequests](self->_contentKeyHelper, "forgetAllActiveContentKeyRequests");
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__APRKMediaPlayer__removePlayQueueItemWithDictionary___block_invoke;
      block[3] = &unk_24FA1BD10;
      v10 = v9;
      v16 = v10;
      v17 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = 0;
    }
  }
  else
  {
    v6 = 0;
    v10 = 0;
    v7 = 0;
  }

}

void __54__APRKMediaPlayer__removePlayQueueItemWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v3 = v4;
    objc_msgSend(v2, "unregisterAVURLAsset:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "unregisterAVURLAsset:", v3);

  }
  objc_msgSend(*(id *)(a1 + 40), "_unregisterNotificationHandlersAndRemovePlayerItem:", *(_QWORD *)(a1 + 32));

}

- (void)_setRateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int CMTimeIfPresent;
  NSDictionary *cachedSetRateAndAnchor;
  OpaqueAPSNetworkClock *receiverNetworkClock;
  unsigned int (*v11)(OpaqueAPSNetworkClock *, __int128 *, uint64_t *);
  id v12;
  _QWORD block[5];
  int v14;
  CMTime v15;
  CMTime v16;
  BOOL v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t hostTime;
  CMTime v23;
  CMTime v24;
  __int128 v25;
  uint64_t v26;

  v4 = a3;
  v24 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  v23 = v24;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v12 = v4;
    LogPrintF();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("rate"), v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  CMTimeIfPresent = FigCFDictionaryGetCMTimeIfPresent();
  cachedSetRateAndAnchor = self->_cachedSetRateAndAnchor;
  self->_cachedSetRateAndAnchor = 0;

  if (CFDictionaryGetValue((CFDictionaryRef)v4, CFSTR("networkClockTime")))
  {
    hostTime = 0;
    v20 = *MEMORY[0x24BE038C8];
    v21 = *(_QWORD *)(MEMORY[0x24BE038C8] + 16);
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    APSNetworkTimeMakeFromDictionary();
    receiverNetworkClock = self->_receiverNetworkClock;
    if (receiverNetworkClock)
    {
      v18 = v20;
      v19 = v21;
      v11 = *(unsigned int (**)(OpaqueAPSNetworkClock *, __int128 *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 24);
      if (v11)
      {
        v25 = v18;
        v26 = v19;
        if (!v11(receiverNetworkClock, &v25, &hostTime))
        {
          CMClockMakeHostTimeFromSystemUnits(&v24, hostTime);
          goto LABEL_23;
        }
      }
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 90
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
LABEL_18:
      LogPrintF();
    }
  }
LABEL_23:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__APRKMediaPlayer__setRateWithDictionary___block_invoke;
  block[3] = &unk_24FA1BD38;
  block[4] = self;
  v14 = v7;
  v17 = CMTimeIfPresent != 0;
  v15 = v23;
  v16 = v24;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

void __42__APRKMediaPlayer__setRateWithDictionary___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _OWORD *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  CMTime time;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 137))
  {
    *(_BYTE *)(v3 + 137) = 1;
    v3 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v3 + 140) = 0;
  if (*(float *)(a1 + 40) != 0.0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDefaultRate:");
  if (*(_BYTE *)(a1 + 92))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentItem");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = (_OWORD *)(a1 + 44);
    if ((*(_BYTE *)(a1 + 56) & 1) != 0 && v4)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(_QWORD *)(a1 + 60);
        CMTimeGetSeconds(&time);
        time = *(CMTime *)(a1 + 68);
        CMTimeGetSeconds(&time);
        LogPrintF();
      }
      v7 = objc_alloc_init(MEMORY[0x24BDB2668]);
      objc_msgSend(v7, "setPreferCoordinatedPlaybackBehavior:", 1);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "status") == 1)
      {
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        LODWORD(v8) = *(_DWORD *)(a1 + 40);
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(_QWORD *)(a1 + 60);
        v16 = *(_OWORD *)(a1 + 68);
        v17 = *(_QWORD *)(a1 + 84);
        objc_msgSend(v9, "setRate:time:atHostTime:options:", &time, &v16, v7, v8);
      }
      else
      {
        v19[0] = CFSTR("rate");
        LODWORD(v8) = *(_DWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v10;
        v19[1] = CFSTR("time");
        *(_OWORD *)&time.value = *v6;
        time.epoch = *(_QWORD *)(a1 + 60);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &time);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v11;
        v19[2] = CFSTR("hostTime");
        time = *(CMTime *)(a1 + 68);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &time);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[3] = CFSTR("options");
        v20[2] = v12;
        v20[3] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(v14 + 72);
        *(_QWORD *)(v14 + 72) = v13;

      }
    }
    else if (gLogCategory_AirPlayReceiverKit <= 90
           && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      *(_OWORD *)&time.value = *v6;
      time.epoch = *(_QWORD *)(a1 + 60);
      CMTimeGetSeconds(&time);
      time = *(CMTime *)(a1 + 68);
      CMTimeGetSeconds(&time);
      LogPrintF();
    }

  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(a2) = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRate:", a2);
  }
}

- (void)_addPendingSeekID:(int)a3 withMessage:(id)a4 forItem:(id)a5 ignoreSeekCompletion:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *pendingSenderSeekMessages;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id v21;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v21 = a4;
  v10 = a5;
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
    objc_msgSend(v10, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pendingSenderSeekMessages, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("ignoreSeekCompletion"));

    if (v21)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("message"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v13);
    v19 = self->_pendingSenderSeekMessages;
    objc_msgSend(v10, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v20);

    goto LABEL_7;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v10, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_7:

  }
}

- (void)_removePendingSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4;
  void *v6;
  NSMutableDictionary *pendingSenderSeekMessages;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  v14 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  objc_msgSend(v14, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pendingSenderSeekMessages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectForKey:", v6);
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    v12 = self->_pendingSenderSeekMessages;
    objc_msgSend(v14, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

  }
}

- (BOOL)_shouldIgnoreSeekCompletionForSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *pendingSenderSeekMessages;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](pendingSenderSeekMessages, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ignoreSeekCompletion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  return v14;
}

- (id)_seekRequestMessageForSeekID:(int)a3 forItem:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *pendingSenderSeekMessages;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pendingSenderSeekMessages = self->_pendingSenderSeekMessages;
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](pendingSenderSeekMessages, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("message"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_seekWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  Float64 Seconds;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  Float64 v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void *v27;
  _QWORD v28[5];
  void *v29;
  _QWORD aBlock[5];
  id v31;
  uint64_t *v32;
  CMTime v33;
  CMTime time;
  CMTime v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  _QWORD block[5];
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v4 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v22 = v4;
    LogPrintF();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("item"), v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[APRKPlayerItem UUIDFromItemDictionary:](APRKPlayerItem, "UUIDFromItemDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke;
    block[3] = &unk_24FA1BD60;
    v44 = &v45;
    block[4] = self;
    v43 = v6;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  if (v46[5])
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC10D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _frontPlayerItem](self, "_frontPlayerItem");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (self->_disableAutoResumeAfterSeek && v9 == v46[5])
      {
        self->_isWaitingToSetRateFromSenderAfterSeek = 1;
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_2;
        v39[3] = &unk_24FA1BD88;
        v39[4] = self;
        v41 = &v45;
        v40 = v8;
        dispatch_async(MEMORY[0x24BDAC9B8], v39);
        v11 = v40;
      }
      else
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_3;
        v36[3] = &unk_24FA1BDB0;
        v38 = &v45;
        v37 = v8;
        dispatch_async(MEMORY[0x24BDAC9B8], v36);
        v11 = v37;
      }

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("time"));
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      memset(&v35, 0, sizeof(v35));
      CMTimeMakeFromDictionary(&v35, v12);
      if ((v35.flags & 0x11) == 1)
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          time = v35;
          Seconds = CMTimeGetSeconds(&time);
          objc_msgSend((id)v46[5], "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = Seconds;
          LogPrintF();

        }
        v14 = (void *)v46[5];
        time = v35;
        objc_msgSend(v14, "setStartPosition:", &time, *(_QWORD *)&v23, v24);
        v15 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_4;
        aBlock[3] = &unk_24FA1BDD8;
        v32 = &v45;
        aBlock[4] = self;
        v16 = v4;
        v33 = v35;
        v31 = v16;
        v17 = _Block_copy(aBlock);
        v18 = v17;
        if (self->_disableAutoResumeAfterSeek && v10 == (void *)v46[5])
        {
          self->_isWaitingToSetRateFromSenderAfterSeek = 1;
          v28[0] = v15;
          v28[1] = 3221225472;
          v28[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_5;
          v28[3] = &unk_24FA1BC98;
          v28[4] = self;
          v29 = v17;
          v21 = v17;
          dispatch_async(MEMORY[0x24BDAC9B8], v28);
          v20 = v29;
        }
        else
        {
          v26[0] = v15;
          v26[1] = 3221225472;
          v26[2] = __39__APRKMediaPlayer__seekWithDictionary___block_invoke_6;
          v26[3] = &unk_24FA1BE00;
          v27 = v17;
          v19 = v17;
          dispatch_async(MEMORY[0x24BDAC9B8], v26);
          v20 = v27;
        }

      }
      else if (gLogCategory_AirPlayReceiverKit <= 90
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend((id)v46[5], "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }

  }
  _Block_object_dispose(&v45, 8);

}

void __39__APRKMediaPlayer__seekWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_playerItemForUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_2(_QWORD *a1)
{
  double v2;

  objc_msgSend(*(id *)(a1[4] + 8), "rate");
  if (*(float *)&v2 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v2) = 0;
    objc_msgSend(*(id *)(a1[4] + 8), "setRate:", v2);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "seekToDate:completionHandler:", a1[5], 0);
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "seekToDate:completionHandler:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "makeSeekID");
  objc_msgSend(*(id *)(a1 + 32), "_addPendingSeekID:withMessage:forItem:ignoreSeekCompletion:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  v7 = *MEMORY[0x24BDC0D88];
  v8 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v5 = v7;
  v6 = v8;
  return objc_msgSend(v3, "seekToTime:toleranceBefore:toleranceAfter:seekID:", &v9, &v7, &v5, v2);
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_5(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rate");
  if (*(float *)&v2 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v2) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRate:", v2);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__APRKMediaPlayer__seekWithDictionary___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSArray *lastReportedDateRanges;
  NSArray *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const __CFString *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[APRKMediaPlayer _frontPlayerItem](self, "_frontPlayerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaDataCollectors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "propertyList", (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v16);
    }

    lastReportedDateRanges = self->_lastReportedDateRanges;
    self->_lastReportedDateRanges = v13;
    v21 = v13;

    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v22, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
    objc_msgSend(v22, "setObject:forKey:", *MEMORY[0x24BDC0F30], CFSTR("name"));
    objc_msgSend(v22, "setObject:forKey:", v21, *MEMORY[0x24BDC0FA8]);
    v29 = CFSTR("uuid");
    objc_msgSend(v10, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("item"));
    -[APRKMediaPlayer _sendUpstreamMessageWithDictionary:](self, "_sendUpstreamMessageWithDictionary:", v22);

  }
}

- (void)addDateRangeCollectorToItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "mediaDataCollectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2628]), "initWithIdentifiers:classifyingLabels:", 0, 0);
    objc_msgSend(v6, "setDelegate:queue:", self, MEMORY[0x24BDAC9B8]);
    objc_msgSend(v7, "addMediaDataCollector:", v6);

  }
}

- (void)_setPropertyWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  APRKMetadata *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFDictionary *v31;
  NSArray *v32;
  NSArray *cachedSelectedMediaArray;
  NSString *v34;
  NSString *currentInterstitialEventID;
  NSArray *v36;
  NSArray *interstitialEvents;
  NSArray *v38;
  NSArray *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  Float64 Seconds;
  CMTime time;
  CMTime location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD block[4];
  id v56;
  char v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
LABEL_11:
    LogPrintF();
LABEL_32:
    v18 = 0;
    v19 = 0;
    v7 = 0;
    v20 = 0;
    goto LABEL_69;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("property"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
    goto LABEL_11;
  }
  v7 = (void *)v6;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v47 = v7;
    LogPrintF();
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1108], v47))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_initWeak((id *)&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__APRKMediaPlayer__setPropertyWithDictionary___block_invoke;
    block[3] = &unk_24FA1BE28;
    objc_copyWeak(&v56, (id *)&location);
    v57 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)&location);
    goto LABEL_35;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1100]))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isInterestedInDateRange = objc_msgSend(v10, "BOOLValue");

    if (!self->_isInterestedInDateRange)
      goto LABEL_35;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[AVQueuePlayer items](self->_player, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v11);
          -[APRKMediaPlayer addDateRangeCollectorToItem:](self, "addDateRangeCollectorToItem:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v13);
    }
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("metadata")))
      goto LABEL_35;
    objc_msgSend(v5, "objectForKey:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[APRKMediaPlayer currentItemMetadata](self, "currentItemMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[APRKMediaPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentItemMetadata"));
        -[APRKMediaPlayer currentItemMetadata](self, "currentItemMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "updateMedatataWithDictionary:", v11);

        -[APRKMediaPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentItemMetadata"));
      }
      else
      {
        v21 = -[APRKMetadata initWithDictionary:]([APRKMetadata alloc], "initWithDictionary:", v11);
        -[APRKMediaPlayer setCurrentItemMetadata:](self, "setCurrentItemMetadata:", v21);

      }
    }
  }

LABEL_35:
  -[APRKMediaPlayer _frontPlayerItem](self, "_frontPlayerItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("item"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[APRKPlayerItem UUIDFromItemDictionary:](APRKPlayerItem, "UUIDFromItemDictionary:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", v18);
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v22;
  }
  else
  {
    v18 = 0;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10C0]))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("value"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    -[AVQueuePlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", v24);
    goto LABEL_69;
  }
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10E8]))
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10F0]))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("value"));
      v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&location, 0, sizeof(location));
      CMTimeMakeFromDictionary(&location, v31);
      time = location;
      objc_msgSend(v19, "setForwardPlaybackEndTime:", &time);
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1120]))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("value"));
      v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&location, 0, sizeof(location));
      CMTimeMakeFromDictionary(&location, v31);
      if ((location.flags & 1) != 0)
      {
        time = location;
        objc_msgSend(v19, "setReversePlaybackEndTime:", &time);
      }
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1128]))
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("value"));
        v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
        cachedSelectedMediaArray = self->_cachedSelectedMediaArray;
        self->_cachedSelectedMediaArray = v32;

        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          Seconds = *(double *)&self->_cachedSelectedMediaArray;
          LogPrintF();
        }
        if (-[APRKMediaPlayer _attemptToSetSelectedMediaArray:](self, "_attemptToSetSelectedMediaArray:", self->_cachedSelectedMediaArray, *(_QWORD *)&Seconds))
        {
          v39 = self->_cachedSelectedMediaArray;
          self->_cachedSelectedMediaArray = 0;

        }
        goto LABEL_69;
      }
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1130]))
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("value"));
        v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextStyleRulesUsingArray:", v31);
      }
      else
      {
        if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10D0]))
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("value"));
          v34 = (NSString *)objc_claimAutoreleasedReturnValue();
          currentInterstitialEventID = self->_currentInterstitialEventID;
          self->_currentInterstitialEventID = v34;

          if (self->_currentInterstitialEventID)
            -[AVQueuePlayer _noteCurrentRemoteInterstitialEvent:](self->_player, "_noteCurrentRemoteInterstitialEvent:");
          goto LABEL_69;
        }
        if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10F8]))
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("value"));
          v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
          interstitialEvents = self->_interstitialEvents;
          self->_interstitialEvents = v36;

          v38 = self->_interstitialEvents;
          if (v38)
            -[AVQueuePlayer _noteRemoteInterstitialEvents:forItem:](self->_player, "_noteRemoteInterstitialEvents:forItem:", v38, v19);
          goto LABEL_69;
        }
        if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1028]))
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("value"));
          v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          memset(&location, 0, sizeof(location));
          CMTimeMakeFromDictionary(&location, v31);
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            time = location;
            Seconds = CMTimeGetSeconds(&time);
            LogPrintF();
          }
          time = location;
          objc_msgSend(v19, "setTimeToPauseBuffering:", &time, *(_QWORD *)&Seconds);
        }
        else
        {
          if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1030]))
          {
            if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC1010]))
            {
              objc_msgSend(v5, "objectForKey:", CFSTR("value"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "BOOLValue");

              objc_msgSend(v19, "setSnapTimeToPausePlayback:", v41);
              goto LABEL_69;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "audioMode");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v7, "isEqualToString:", v42);

            if (v43)
            {
              if (gLogCategory_AirPlayReceiverKit <= 30
                && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_48;
              }
            }
            else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC10E0]))
            {
              objc_msgSend(v5, "objectForKey:", CFSTR("value"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              self->_disableAutoResumeAfterSeek = objc_msgSend(v44, "BOOLValue");

            }
            else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC0FE8]))
            {
              objc_msgSend(v5, "objectForKey:", CFSTR("value"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "integerValue");

              if (gLogCategory_AirPlayReceiverKit <= 30
                && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
              {
                Seconds = *(double *)&v46;
                LogPrintF();
              }
              objc_msgSend(v19, "setRestrictions:", v46, *(_QWORD *)&Seconds);
            }
            goto LABEL_69;
          }
          objc_msgSend(v5, "objectForKey:", CFSTR("value"));
          v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          memset(&location, 0, sizeof(location));
          CMTimeMakeFromDictionary(&location, v31);
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            time = location;
            Seconds = CMTimeGetSeconds(&time);
            LogPrintF();
          }
          time = location;
          objc_msgSend(v19, "setTimeToPausePlayback:", &time, *(_QWORD *)&Seconds);
        }
      }
    }

    goto LABEL_69;
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("trackID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("trackID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "intValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("value"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v19, "setEnabledState:forTrackWithID:", v30, v28);
    goto LABEL_69;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
LABEL_48:
    LogPrintF();
  }
LABEL_69:

}

void __46__APRKMediaPlayer__setPropertyWithDictionary___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setMuted:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)_timedMetadataFromAVTimedMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  const __CFAllocator *allocator;
  uint64_t v20;
  id v21;
  CMTime time;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v20 = *(_QWORD *)v24;
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "keySpace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "locale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v7, "time");
        else
          memset(&time, 0, sizeof(time));
        v12 = CMTimeCopyAsDictionary(&time, allocator);
        objc_msgSend(v7, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "extraAttributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("key"));
        if (v10)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("keyspace"));
        objc_msgSend(v11, "localeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v11, "localeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("locale"));

        }
        if (v12)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("timestamp"));
          CFRelease(v12);
        }
        if (v13)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("value"));
        if (v14)
          objc_msgSend(v8, "addEntriesFromDictionary:", v14);
        objc_msgSend(v21, "addObject:", v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v21;
}

- (id)_getPropertyWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSArray *cachedSelectedMediaArray;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD block[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("property"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v13 = 0;
    v10 = 0;
    v16 = 0;
    v11 = 0;
    goto LABEL_29;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v30 = v5;
    LogPrintF();
  }
  -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", self->_currentItemUUID, v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("playbackErrorLog")))
  {
    objc_msgSend(v6, "playbackErrorLog");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    v11 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("playbackAccessLog")))
  {
    objc_msgSend(v6, "playbackAccessLog");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[APRKPlayerItem UUIDFromItemDictionary:](APRKPlayerItem, "UUIDFromItemDictionary:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v19;
  }
  if (!v6)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v31 = v5;
      LogPrintF();
    }
    +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4, v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v10 = 0;
LABEL_29:
    v6 = 0;
    goto LABEL_54;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC10E8]))
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("trackID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = (uint64_t)&unk_24FA21430;
      goto LABEL_16;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("trackID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "intValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "enabledStateForTrackWithID:", v23));
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC1118]))
  {
    objc_msgSend(v6, "playbackErrorLog");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v10 = v24;
    v13 = 0;
    goto LABEL_48;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC1110]))
  {
    objc_msgSend(v6, "playbackAccessLog");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC1070]))
  {
    objc_msgSend(v6, "loadedTimeRanges");
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_47:
    v13 = 0;
    v10 = v32;
    goto LABEL_48;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC10A8]))
  {
    objc_msgSend(v6, "seekableTimeRanges");
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC1128]))
  {
    cachedSelectedMediaArray = self->_cachedSelectedMediaArray;
    if (!cachedSelectedMediaArray)
    {
      -[APRKMediaPlayer selectedMediaArrayForItem:](self, "selectedMediaArrayForItem:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v40 = *MEMORY[0x24BDD0FC8];
        v41[0] = CFSTR("Sender requested selectedMediaArray while mediaSelection is still loading at the receiver.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6707, v29);
        v13 = objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
LABEL_16:
      v12 = 0;
      v13 = 0;
      v14 = v10 != 0;
      goto LABEL_17;
    }
LABEL_64:
    v10 = cachedSelectedMediaArray;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC0FA8]))
  {
    cachedSelectedMediaArray = self->_lastReportedDateRanges;
    if (!cachedSelectedMediaArray)
      cachedSelectedMediaArray = (NSArray *)MEMORY[0x24BDBD1A8];
    goto LABEL_64;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("timedMetadataArray")))
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy_;
    v38 = __Block_byref_object_dispose_;
    v39 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__APRKMediaPlayer__getPropertyWithDictionary___block_invoke;
    block[3] = &unk_24FA1BDB0;
    block[4] = self;
    block[5] = &v34;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    -[APRKMediaPlayer _timedMetadataFromAVTimedMetadata:](self, "_timedMetadataFromAVTimedMetadata:", v35[5]);
    v32 = objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v34, 8);

    goto LABEL_47;
  }
  v13 = 0;
LABEL_68:
  v10 = 0;
LABEL_48:
  v14 = v10 != 0;
  v12 = v13 != 0;
  if (v10 | v13)
  {
LABEL_17:
    +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "setObject:forKey:", v10, CFSTR("value"));
    }
    else if (v12)
    {
      +[APRKUtilities dictionaryForError:](APRKUtilities, "dictionaryForError:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("error"));

    }
    goto LABEL_50;
  }
  v10 = 0;
  v13 = 0;
  v16 = 0;
LABEL_50:
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_54:
  v25 = v16;

  return v25;
}

void __46__APRKMediaPlayer__getPropertyWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timedMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_processStreamingKeyWithDictionary:(id)a3
{
  id v4;
  APRKContentKeyHelper *contentKeyHelper;
  id v6;
  _QWORD v7[4];
  id v8;
  APRKMediaPlayer *v9;

  v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  contentKeyHelper = self->_contentKeyHelper;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__APRKMediaPlayer__processStreamingKeyWithDictionary___block_invoke;
  v7[3] = &unk_24FA1BE50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[APRKContentKeyHelper processStreamingKeyRequestWithDictionary:withCompletionBlock:](contentKeyHelper, "processStreamingKeyRequestWithDictionary:withCompletionBlock:", v6, v7);

}

void __54__APRKMediaPlayer__processStreamingKeyWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[APRKUtilities dictionaryForError:](APRKUtilities, "dictionaryForError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("error");
LABEL_5:
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

    goto LABEL_6;
  }
  if (v9)
  {
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("key");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "_sendUpstreamMessageWithDictionary:", v6);

}

- (void)_processUnhandledURLWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *contentKeyHelper;
  id *v9;
  uint64_t *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v12 = v4;
    LogPrintF();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("response"), v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC0E00]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[APRKContentKeyHelper isHandlingContentKeyRequestWithURLString:](self->_contentKeyHelper, "isHandlingContentKeyRequestWithURLString:", v7))
    {
      contentKeyHelper = self->_contentKeyHelper;
      v14 = 0;
      v9 = (id *)&v14;
      v10 = &v14;
    }
    else
    {
      contentKeyHelper = self->_resourceLoaderHelper;
      v13 = 0;
      v9 = (id *)&v13;
      v10 = &v13;
    }
    objc_msgSend(contentKeyHelper, "processUnhandledURLResponseWithDictionary:error:", v6, v10);
    v11 = *v9;
    if (v11
      && gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v11 = 0;
    v7 = 0;
  }

}

- (void)_stopWithDictionary:(id)a3
{
  id v4;
  _QWORD block[5];

  v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__APRKMediaPlayer__stopWithDictionary___block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __39__APRKMediaPlayer__stopWithDictionary___block_invoke(uint64_t a1, double a2)
{
  double v3;

  LODWORD(a2) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRate:", a2);
  LODWORD(v3) = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDefaultRate:", v3);
}

- (id)_processPlaybackInfoRequestWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[APRKMediaPlayer _currentPlaybackInfoDictionary](self, "_currentPlaybackInfoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("info"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_processAuthorizeItemWithDictionary:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  CFMutableDictionaryRef Mutable;

  v4 = (__CFString *)a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v10 = v4;
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (-[APRKMediaPlayer _ensureFairPlayHelper](self, "_ensureFairPlayHelper"))
  {
    -[__CFString objectForKey:](v4, "objectForKey:", CFSTR("item"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[APRKPlayerItem UUIDFromItemDictionary:](APRKPlayerItem, "UUIDFromItemDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (APReceiverFairPlayHelperCopyAuthorizeItemResponseIntoDictionary())
    {
      if (gLogCategory_AirPlayReceiverKit > 90
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit > 10
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
      v10 = (const __CFString *)Mutable;
    }
    LogPrintF();
LABEL_22:

    goto LABEL_23;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v10 = CFSTR("authorizeItem");
    LogPrintF();
  }
LABEL_23:
  +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v4, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKey:](v4, "objectForKey:", CFSTR("item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("item"));

  objc_msgSend(v7, "addEntriesFromDictionary:", Mutable);
  return v7;
}

- (void)_sendUpstreamMessageWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *messageQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  APRKMediaPlayer *v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (self->_isInterstitialPlayer)
    {
      v6 = v4;
      objc_opt_class();
      v5 = v6;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = (void *)objc_msgSend(v6, "mutableCopy");

      }
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC0F00]);

    }
    messageQueue = self->_messageQueue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__APRKMediaPlayer__sendUpstreamMessageWithDictionary___block_invoke;
    v9[3] = &unk_24FA1BD10;
    v10 = v5;
    v11 = self;
    v8 = v5;
    dispatch_async(messageQueue, v9);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __54__APRKMediaPlayer__sendUpstreamMessageWithDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("type"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 40), "messagingDelegate", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayer:wantsToSendUpstreamMessageWithDictionary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_sendUpstreamErrorMessageWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    +[APRKUtilities baseDictionaryForUpstreamMessageWithType:](APRKUtilities, "baseDictionaryForUpstreamMessageWithType:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[APRKUtilities dictionaryForError:](APRKUtilities, "dictionaryForError:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("error"));

    -[APRKMediaPlayer _sendUpstreamMessageWithDictionary:](self, "_sendUpstreamMessageWithDictionary:", v6);
LABEL_3:
    v5 = v9;
    goto LABEL_8;
  }
  if (gLogCategory_AirPlayReceiverKit <= 50)
  {
    v9 = 0;
    if (gLogCategory_AirPlayReceiverKit != -1 || (v8 = _LogCategory_Initialize(), v5 = 0, v8))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:

}

- (void)_sendUpstreamPlaybackStateMessageWithPlaybackStateString:(id)a3 stoppedBecauseInterrupted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int64_t internalPlaybackState;
  NSString *currentItemUUID;
  NSString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a4;
    v6 = a3;
    +[APRKUtilities baseDictionaryForUpstreamMessageWithType:](APRKUtilities, "baseDictionaryForUpstreamMessageWithType:", CFSTR("playbackState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("name"));

    internalPlaybackState = self->_internalPlaybackState;
    if (internalPlaybackState == 3)
    {
      if (v4)
        v11 = CFSTR("interrupted");
      else
        v11 = (const __CFString *)*MEMORY[0x24BDC1148];
      objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x24BDC0F08]);
    }
    else if (internalPlaybackState == 2)
    {
      currentItemUUID = self->_currentItemUUID;
      if (currentItemUUID)
      {
        v10 = currentItemUUID;
      }
      else
      {
        -[AVQueuePlayer currentItem](self->_player, "currentItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          goto LABEL_13;
        }
      }
      v15 = CFSTR("uuid");
      v16[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("item"));
      -[APRKMediaPlayer _currentPlaybackInfoDictionary](self, "_currentPlaybackInfoDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("params"));

    }
    -[APRKMediaPlayer _sendUpstreamMessageWithDictionary:](self, "_sendUpstreamMessageWithDictionary:", v7);
LABEL_13:

  }
}

- (BOOL)_attemptToSetSelectedMediaArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
LABEL_22:
    LogPrintF();
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
  -[AVQueuePlayer currentItem](self->_player, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if (v6 != 1)
  {
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  -[AVQueuePlayer currentItem](self->_player, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = v4;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23 = 0;
        objc_msgSend(v8, "mediaSelectionGroupForPropertyList:mediaSelectionOption:", v14, &v23, v20, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v23;
        if (gLogCategory_AirPlayReceiverKit <= 50
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          v20 = v16;
          v21 = v15;
          LogPrintF();
        }
        if (v15)
        {
          -[AVQueuePlayer currentItem](self->_player, "currentItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "selectMediaOption:inMediaSelectionGroup:", v16, v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v18 = 1;
  v4 = v22;
LABEL_27:

  return v18;
}

- (id)selectedMediaArrayForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), 0) == 2)
  {
    objc_msgSend(v5, "availableMediaCharacteristicsWithMediaSelectionOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v18, "currentMediaSelection");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "selectedMediaOptionInMediaSelectionGroup:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "propertyList");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v4, "addObject:", v14);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
    v15 = v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadValuesAsynchronouslyForKeys:completionHandler:", v16, &__block_literal_global_0);

    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v15 = 0;
  }

  return v15;
}

- (void)_pausePlayerIfNeededForState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[7];

  if (a3 == 2)
  {
    block[5] = v3;
    block[6] = v4;
    if (self->_isWaitingToSetRateFromSenderAfterSeek)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__APRKMediaPlayer__pausePlayerIfNeededForState___block_invoke;
      block[3] = &unk_24FA1BC70;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __48__APRKMediaPlayer__pausePlayerIfNeededForState___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rate");
  if (*(float *)&v3 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v3) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRate:", v3);
  }
  return result;
}

- (id)_figPlaybackStateStringFrom:(int64_t)a3
{
  int64_t v3;
  unint64_t v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v3 = a3;
  else
    v3 = 1;
  if (self->_isWaitingToSetRateFromSenderAfterSeek)
    v4 = v3;
  else
    v4 = a3;
  if (v4 > 3)
    return 0;
  else
    return **((id **)&unk_24FA1BF08 + v4);
}

- (void)_updatePlaybackStateWithState:(int64_t)a3 stoppedBecauseInterrupted:(BOOL)a4 shouldSendUpstreamMessage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v9;
  void *v11;

  v5 = a5;
  v6 = a4;
  -[APRKMediaPlayer _pausePlayerIfNeededForState:](self, "_pausePlayerIfNeededForState:");
  -[APRKMediaPlayer _figPlaybackStateStringFrom:](self, "_figPlaybackStateStringFrom:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_internalPlaybackState = a3;
  if (self->_isFirstSetRateReceived && v5)
  {
    v11 = v9;
    -[APRKMediaPlayer _sendUpstreamPlaybackStateMessageWithPlaybackStateString:stoppedBecauseInterrupted:](self, "_sendUpstreamPlaybackStateMessageWithPlaybackStateString:stoppedBecauseInterrupted:", v9, v6);
    v9 = v11;
  }

}

- (id)_fixedIPContentLocationFromURLString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "cStringUsingEncoding:", 4);
    v9 = StringToSockAddr();
    if (v9)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], v9, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_AirPlayReceiverKit > 10)
          goto LABEL_8;
        if (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize())
          LogPrintF();
      }
    }
    else
    {
      APSNetworkAddressGetSocketAddr();
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v6 = 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_8:

  return v7;
}

- (void)_registerNotificationHandlersForPlayer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__APRKMediaPlayer__registerNotificationHandlersForPlayer__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__APRKMediaPlayer__registerNotificationHandlersForPlayer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleCurrentItemChangedNotification_, *MEMORY[0x24BDB1F98], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleCurrentItemPlaybackStalledNotification_, *MEMORY[0x24BDB2010], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("timeControlStatus"), 1, APRKMediaPlayerObservationContextPlayerTimeControlStatus);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("rate"), 3, APRKMediaPlayerObservationContextPlayerRate);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("status"), 1, APRKMediaPlayerObservationContextPlayerStatus);
}

- (void)_unregisterNotificationHandlersForPlayer
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__APRKMediaPlayer__unregisterNotificationHandlersForPlayer__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__APRKMediaPlayer__unregisterNotificationHandlersForPlayer__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDB2010], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDB1F98], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("timeControlStatus"), APRKMediaPlayerObservationContextPlayerTimeControlStatus);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("rate"), APRKMediaPlayerObservationContextPlayerRate);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("status"), APRKMediaPlayerObservationContextPlayerStatus);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pause");
}

- (void)_registerNotificationHandlersAndInsertPlayerItem:(id)a3 afterItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  APRKMediaPlayer *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__APRKMediaPlayer__registerNotificationHandlersAndInsertPlayerItem_afterItem___block_invoke;
  block[3] = &unk_24FA1BE98;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

uint64_t __78__APRKMediaPlayer__registerNotificationHandlersAndInsertPlayerItem_afterItem___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v1 = result;
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      v17 = *(_QWORD *)(v1 + 32);
      result = LogPrintF();
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(v1 + 40) + 138))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleTimeJumpedNotification_, *MEMORY[0x24BDB2038], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentItemPlayedToEndNotification_, *MEMORY[0x24BDB1FA8], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentItemFailedToPlayToEndNotification_, *MEMORY[0x24BDB1FB8], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification_, *MEMORY[0x24BDB2018], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification_, *MEMORY[0x24BDB2020], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentPlayerItemMediaSelectionDidChangeNotification_, *MEMORY[0x24BDB1FE8], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleCurrentPlayerItemNewAccessLogEntryNotification_, *MEMORY[0x24BDB1FF0], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleSeekDidCompleteNotification_, *MEMORY[0x24BDB2030], *(_QWORD *)(v1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(v1 + 40), sel__handleSeekDidCompleteNotification_, *MEMORY[0x24BDB2028], *(_QWORD *)(v1 + 32));

    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("timedMetadata"), 1, APRKMediaPlayerObservationContextTimedMetadata);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("playbackBufferEmpty"), 1, APRKMediaPlayerObservationContextPlaybackBufferEmpty);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("playbackBufferFull"), 1, APRKMediaPlayerObservationContextPlaybackBufferFull);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("playbackLikelyToKeepUp"), 1, APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("status"), 1, APRKMediaPlayerObservationContextCurrentItemStatus);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("loadedTimeRanges"), 1, APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges);
    objc_msgSend(*(id *)(v1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(v1 + 40), CFSTR("seekableTimeRanges"), 1, APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges);
    objc_msgSend(*(id *)(v1 + 32), "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(void **)(v1 + 32);
      objc_msgSend(v12, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setInitialDate:", v13);

    }
    else
    {
      v26 = 0uLL;
      v27 = 0;
      v14 = *(void **)(v1 + 32);
      if (v14 && (objc_msgSend(v14, "startPosition"), (BYTE12(v26) & 0x11) == 1))
      {
        v15 = objc_msgSend(*(id *)(v1 + 32), "makeSeekID");
        objc_msgSend(*(id *)(v1 + 40), "_addPendingSeekID:withMessage:forItem:ignoreSeekCompletion:", v15, 0, *(_QWORD *)(v1 + 32), 1);
        v16 = *(void **)(v1 + 32);
        v24 = v26;
        v25 = v27;
        v22 = *MEMORY[0x24BDC0D88];
        v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        v20 = v22;
        v21 = v23;
        objc_msgSend(v16, "seekToTime:toleranceBefore:toleranceAfter:seekID:", &v24, &v22, &v20, v15);
      }
      else if (gLogCategory_AirPlayReceiverKit <= 30
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(v1 + 32), "UUIDString", v17);
        v18 = (~HIDWORD(v26) & 0x11) == 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (BYTE12(v26) & 1) == 0;
        LogPrintF();

      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 8), "insertItem:afterItem:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 48), v17, v18, v19);
  }
  return result;
}

- (void)_unregisterNotificationHandlersAndRemovePlayerItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  APRKMediaPlayer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__APRKMediaPlayer__unregisterNotificationHandlersAndRemovePlayerItem___block_invoke;
  v6[3] = &unk_24FA1BD10;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __70__APRKMediaPlayer__unregisterNotificationHandlersAndRemovePlayerItem___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v13 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "items", v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB2038], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB1FA8], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB1FB8], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB2018], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB2020], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB1FE8], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB1FF0], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB2030], *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDB2028], *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("timedMetadata"), APRKMediaPlayerObservationContextTimedMetadata);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("playbackBufferEmpty"), APRKMediaPlayerObservationContextPlaybackBufferEmpty);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("playbackBufferFull"), APRKMediaPlayerObservationContextPlaybackBufferFull);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("playbackLikelyToKeepUp"), APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("status"), APRKMediaPlayerObservationContextCurrentItemStatus);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("loadedTimeRanges"), APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges);
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 40), CFSTR("seekableTimeRanges"), APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeItem:", *(_QWORD *)(a1 + 32));
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleTimeJumpedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[5];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__APRKMediaPlayer__handleTimeJumpedNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    block[4] = self;
    v9 = v5;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __49__APRKMediaPlayer__handleTimeJumpedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMTime v11;
  CMTime time;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176))
    goto LABEL_9;
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v2, "timeToPausePlayback");
  else
    memset(&time, 0, sizeof(time));
  v3 = floor(CMTimeGetSeconds(&time));
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "currentTime");
  else
    memset(&v11, 0, sizeof(v11));
  if (v3 != floor(CMTimeGetSeconds(&v11)))
  {
LABEL_9:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v5, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDC0F58], CFSTR("name"));
    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v6, "currentTime");
    else
      memset(&v10, 0, sizeof(v10));
    v7 = CMTimeCopyAsDictionary(&v10, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BDC1090]);

    v13 = CFSTR("uuid");
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("item"));
    objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v5);

  }
}

- (void)_handleCurrentItemChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  -[AVQueuePlayer currentItem](self->_player, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__APRKMediaPlayer__handleCurrentItemChangedNotification___block_invoke;
  block[3] = &unk_24FA1BE98;
  block[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(messageQueue, block);

}

void __57__APRKMediaPlayer__handleCurrentItemChangedNotification___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)a1[4] + 5) = 0;
  objc_msgSend(a1[4], "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", 1, 0, 1);
  objc_storeStrong((id *)a1[4] + 2, *((id *)a1[4] + 3));
  objc_msgSend(a1[5], "UUIDString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[3];
  v3[3] = v2;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDC0F28], CFSTR("name"));
  v6 = a1[4];
  v7 = *((_QWORD *)v6 + 2);
  if (v7)
  {
    v15 = CFSTR("uuid");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("itemBefore"));

    v6 = a1[4];
  }
  v9 = *((_QWORD *)v6 + 3);
  if (v9)
  {
    v13 = CFSTR("uuid");
    v14 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("itemCurrent"));

    v6 = a1[4];
  }
  objc_msgSend(*((id *)v6 + 12), "setForwardsFPSSecureStopData:", objc_msgSend(a1[5], "expectsSecureStop"));
  objc_msgSend(a1[6], "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDB1FA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("reason"));
  objc_msgSend(a1[4], "_sendUpstreamMessageWithDictionary:", v5);

}

- (void)_handleCurrentItemPlayedToEndNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[4];
  id v9;
  APRKMediaPlayer *v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__APRKMediaPlayer__handleCurrentItemPlayedToEndNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    v9 = v5;
    v10 = self;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __61__APRKMediaPlayer__handleCurrentItemPlayedToEndNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x24BDC0F38], CFSTR("name"));
  v5 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("uuid"));
  objc_msgSend(*(id *)(a1 + 40), "_sendUpstreamMessageWithDictionary:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", 3, 0, 1);

}

- (void)_handleCurrentItemFailedToPlayToEndNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[4];
  id v9;
  APRKMediaPlayer *v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__APRKMediaPlayer__handleCurrentItemFailedToPlayToEndNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    v9 = v4;
    v10 = self;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __67__APRKMediaPlayer__handleCurrentItemFailedToPlayToEndNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDB1FB0]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 40);
  v4 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v9, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "code");
  objc_msgSend(v9, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendUpstreamErrorMessageWithError:", v8);

  objc_msgSend(*(id *)(a1 + 40), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", 3, 0, 1);
}

- (void)_handleCurrentItemPlaybackStalledNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", self->_currentItemUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__APRKMediaPlayer__handleCurrentItemPlaybackStalledNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    block[4] = self;
    v9 = v5;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __65__APRKMediaPlayer__handleCurrentItemPlaybackStalledNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("stallCountChanged"), CFSTR("name"));
  v6 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("uuid"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("value"));

  objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v2);
}

- (void)_handleCurrentPlayerItemReachedTimeToPauseBufferingNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[5];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    block[4] = self;
    v9 = v5;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __83__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPauseBufferingNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  +[APRKUtilities baseDictionaryForUpstreamMessageWithType:](APRKUtilities, "baseDictionaryForUpstreamMessageWithType:", CFSTR("notification"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("loadedTimeRangesChanged"), CFSTR("name"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "loadedTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_serializeTimeRanges:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x24BDC1070]);
  v9 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("item"));
  objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v2);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDC0F40], CFSTR("name"));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("item"));
  objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v8);

}

- (void)_handleCurrentPlayerItemReachedTimeToPausePlaybackNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[4];
  id v9;
  id v10;
  APRKMediaPlayer *v11;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification___block_invoke;
    block[3] = &unk_24FA1BE98;
    v9 = v5;
    v10 = v4;
    v11 = self;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __82__APRKMediaPlayer__handleCurrentPlayerItemReachedTimeToPausePlaybackNotification___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CFAllocatorRef *v7;
  id v8;
  id v9;
  CFDictionaryRef v10;
  void *v11;
  CMTime v12;
  CMTime time;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x24BDC0F48], CFSTR("name"));
  v14 = CFSTR("uuid");
  objc_msgSend(a1[4], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("item"));
  objc_msgSend(a1[5], "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDDCF68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!v6)
  {
    v8 = a1[4];
    if (v8)
      objc_msgSend(v8, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    v6 = CMTimeCopyAsDictionary(&time, *v7);
  }
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("timeToPausePlayback"));
  v9 = a1[4];
  if (v9)
    objc_msgSend(v9, "timeToPausePlayback");
  else
    memset(&v12, 0, sizeof(v12));
  v10 = CMTimeCopyAsDictionary(&v12, *v7);
  if (v10)
    objc_msgSend(v2, "setObject:forKey:", v10, *MEMORY[0x24BDC0FF8]);
  objc_msgSend(a1[4], "currentDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v2, "setObject:forKey:", v11, *MEMORY[0x24BDC1050]);
  objc_msgSend(a1[6], "_sendUpstreamMessageWithDictionary:", v2);

}

- (void)_handleSeekDidCompleteNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[4];
  id v9;
  APRKMediaPlayer *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke;
    block[3] = &unk_24FA1BE98;
    v9 = v4;
    v10 = self;
    v11 = v5;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  _BYTE *v8;
  BOOL v9;
  void *v11;
  id v12;
  id v13;
  CFDictionaryRef v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  CFDictionaryRef v19;
  double v20;
  void *v21;
  CMTime v22;
  CMTime time;
  _QWORD block[5];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AVPlayerItemSeekIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (!objc_msgSend(a1[5], "_shouldIgnoreSeekCompletionForSeekID:forItem:", v4, a1[6]))
  {
    objc_msgSend(a1[5], "_seekRequestMessageForSeekID:forItem:", v4, a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB2030]);

    v8 = a1[5];
    if (v8[139])
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9 && v5 == 0)
    {
      v8[140] = 1;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke_2;
      block[3] = &unk_24FA1BC70;
      block[4] = a1[5];
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else if (v5)
    {
      +[APRKUtilities baseDictionaryForResponseToRequestWithDictionary:](APRKUtilities, "baseDictionaryForResponseToRequestWithDictionary:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[6];
      if (v12)
        objc_msgSend(v12, "currentTime");
      else
        memset(&v22, 0, sizeof(v22));
      v19 = CMTimeCopyAsDictionary(&v22, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
      objc_msgSend(v11, "setObject:forKey:", v19, *MEMORY[0x24BDC1090]);

      LODWORD(v20) = *((_DWORD *)a1[5] + 38);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v21, *MEMORY[0x24BDC1098]);

      objc_msgSend(a1[5], "_sendUpstreamMessageWithDictionary:", v11);
      goto LABEL_25;
    }
    if (!v7)
    {
LABEL_26:
      objc_msgSend(a1[5], "_removePendingSeekID:forItem:", v4, a1[6]);

      return;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v11, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
    objc_msgSend(v11, "setObject:forKey:", CFSTR("didSeek"), CFSTR("name"));
    v13 = a1[6];
    if (v13)
      objc_msgSend(v13, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    v14 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    objc_msgSend(v11, "setObject:forKey:", v14, *MEMORY[0x24BDC1090]);

    LODWORD(v15) = *((_DWORD *)a1[5] + 38);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v16, *MEMORY[0x24BDC1098]);

    v25 = CFSTR("uuid");
    objc_msgSend(a1[6], "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("item"));
    objc_msgSend(a1[5], "_sendUpstreamMessageWithDictionary:", v11);

LABEL_25:
    goto LABEL_26;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(a1[5], "_removePendingSeekID:forItem:", v4, a1[6]);
}

uint64_t __54__APRKMediaPlayer__handleSeekDidCompleteNotification___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rate");
  if (*(float *)&v3 != 0.0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v3) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setRate:", v3);
  }
  return result;
}

- (void)_handleCurrentPlayerItemMediaSelectionDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  _QWORD block[4];
  id v9;
  APRKMediaPlayer *v10;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    messageQueue = self->_messageQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__APRKMediaPlayer__handleCurrentPlayerItemMediaSelectionDidChangeNotification___block_invoke;
    block[3] = &unk_24FA1BD10;
    v9 = v5;
    v10 = self;
    dispatch_async(messageQueue, block);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __79__APRKMediaPlayer__handleCurrentPlayerItemMediaSelectionDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x24BDC0F50], CFSTR("name"));
  v5 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("item"));
  objc_msgSend(*(id *)(a1 + 40), "_sendUpstreamMessageWithDictionary:", v2);

}

- (void)_handleCurrentPlayerItemNewAccessLogEntryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *messageQueue;
  id v8;
  _QWORD block[4];
  id v10;
  APRKMediaPlayer *v11;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__APRKMediaPlayer__handleCurrentPlayerItemNewAccessLogEntryNotification___block_invoke;
  block[3] = &unk_24FA1BD10;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(messageQueue, block);

}

void __73__APRKMediaPlayer__handleCurrentPlayerItemNewAccessLogEntryNotification___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
  objc_msgSend(v2, "setObject:forKey:", *MEMORY[0x24BDC0F20], CFSTR("name"));
  v5 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("item"));
  objc_msgSend(*(id *)(a1 + 40), "_sendUpstreamMessageWithDictionary:", v2);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *messageQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[APRKMediaPlayer _playerItemForUUID:](self, "_playerItemForUUID:", self->_currentItemUUID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_24FA1BEE8;
  block[4] = self;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v10;
  v24 = a6;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(messageQueue, block);

}

void __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  const __CFString **v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  CFDictionaryRef v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  uint64_t v52;
  double v53;
  objc_super v54;
  objc_super v55;
  _QWORD block[5];
  CMTime time;
  _QWORD v58[5];
  float v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) != 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = *(_QWORD *)(a1 + 72);
      if (v2 == APRKMediaPlayerObservationContextPlayerTimeControlStatus)
      {
        *(double *)&v14 = COERCE_DOUBLE(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "timeControlStatus"));
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          v50 = *(double *)&v14;
          LogPrintF();
        }
        if (v14 >= 3)
          v31 = 3;
        else
          v31 = v14;
        objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackStateWithState:stoppedBecauseInterrupted:shouldSendUpstreamMessage:", v31, 0, 1, *(_QWORD *)&v50);
      }
      else if (v2 == APRKMediaPlayerObservationContextPlayerRate)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BDD0E80]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *MEMORY[0x24BDD0E70]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v53 = *(float *)(v21 + 152);
          v52 = *(unsigned __int8 *)(v21 + 156);
          v50 = v17;
          v51 = v20;
          LogPrintF();
        }
        if (v20 != 0.0)
          *(float *)(*(_QWORD *)(a1 + 32) + 152) = v20;
        v5 = 0;
        v32 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(v32 + 139) || v17 == v20)
          goto LABEL_44;
        if (*(_BYTE *)(v32 + 156))
        {
          if (v20 == *(float *)(v32 + 160))
          {
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              v50 = v20;
              LogPrintF();
            }
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 156) = 0;
            *(_DWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 140) = 1;
            v58[0] = MEMORY[0x24BDAC760];
            v58[1] = 3221225472;
            v58[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
            v58[3] = &unk_24FA1BEC0;
            v59 = v20;
            v58[4] = *(_QWORD *)(a1 + 32);
            dispatch_async(MEMORY[0x24BDAC9B8], v58);
            v42 = COERCE_DOUBLE(objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3));
            objc_msgSend(*(id *)&v42, "setObject:forKey:", CFSTR("notification"), CFSTR("type"));
            objc_msgSend(*(id *)&v42, "setObject:forKey:", CFSTR("didSeek"), CFSTR("name"));
            v43 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
            if (v43)
              objc_msgSend(v43, "currentTime");
            else
              memset(&time, 0, sizeof(time));
            v44 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
            objc_msgSend(*(id *)&v42, "setObject:forKey:", v44, *MEMORY[0x24BDC1090]);

            *(float *)&v45 = v20;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)&v42, "setObject:forKey:", v46, *MEMORY[0x24BDC1098]);

            v74 = CFSTR("uuid");
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentItem");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "UUIDString");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v75[0] = v48;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)&v42, "setObject:forKey:", v49, CFSTR("item"));
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              v50 = v42;
              LogPrintF();
            }
            objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", *(_QWORD *)&v42, *(_QWORD *)&v50, *(_QWORD *)&v51, v52, *(_QWORD *)&v53);

          }
        }
        else if (v20 >= 2.0 || v20 <= -1.0)
        {
          if (gLogCategory_AirPlayReceiverKit <= 30
            && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v5 = 0;
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 156) = 1;
          *(float *)(*(_QWORD *)(a1 + 32) + 160) = v17;
          goto LABEL_44;
        }
      }
      else if (v2 == APRKMediaPlayerObservationContextPlayerStatus)
      {
        v3 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v3 + 72))
        {
          if (objc_msgSend(*(id *)(v3 + 8), "status") == 1)
          {
            if (gLogCategory_AirPlayReceiverKit <= 30
              && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
            block[3] = &unk_24FA1BC70;
            block[4] = *(_QWORD *)(a1 + 32);
            dispatch_sync(MEMORY[0x24BDAC9B8], block);
            v40 = *(_QWORD *)(a1 + 32);
            v41 = *(void **)(v40 + 72);
            *(_QWORD *)(v40 + 72) = 0;

          }
        }
      }
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        +[APRKUtilities baseDictionaryForUpstreamMessageWithType:](APRKUtilities, "baseDictionaryForUpstreamMessageWithType:", CFSTR("notification"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = *(_QWORD *)(a1 + 72);
        if (v6 == APRKMediaPlayerObservationContextTimedMetadata)
        {
          v72 = CFSTR("uuid");
          objc_msgSend(*(id *)(a1 + 56), "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v22;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("item"));
          v24 = (void *)*MEMORY[0x24BDC0F60];
          v25 = CFSTR("name");
          v26 = v5;
        }
        else
        {
          if (v6 == APRKMediaPlayerObservationContextPlaybackBufferEmpty)
          {
            objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDC1078], CFSTR("name"));
            v70 = CFSTR("uuid");
            objc_msgSend(*(id *)(a1 + 56), "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v27;
            v28 = (void *)MEMORY[0x24BDBCE70];
            v29 = &v71;
            v30 = &v70;
          }
          else if (v6 == APRKMediaPlayerObservationContextPlaybackBufferFull)
          {
            objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDC1080], CFSTR("name"));
            v68 = CFSTR("uuid");
            objc_msgSend(*(id *)(a1 + 56), "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v27;
            v28 = (void *)MEMORY[0x24BDBCE70];
            v29 = &v69;
            v30 = &v68;
          }
          else if (v6 == APRKMediaPlayerObservationContextPlaybackBufferLikelyToKeepUp)
          {
            objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDC1088], CFSTR("name"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "isPlaybackLikelyToKeepUp"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("value"));

            v66 = CFSTR("uuid");
            objc_msgSend(*(id *)(a1 + 56), "UUIDString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v27;
            v28 = (void *)MEMORY[0x24BDBCE70];
            v29 = &v67;
            v30 = &v66;
          }
          else
          {
            if (v6 == APRKMediaPlayerObservationContextCurrentItemStatus)
            {
              if (objc_msgSend(*(id *)(a1 + 56), "status") != 1)
                goto LABEL_44;
              objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x24BDC10A0], CFSTR("name"));
              v64 = CFSTR("uuid");
              objc_msgSend(*(id *)(a1 + 56), "UUIDString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v35;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("item"));
              v37 = *(_QWORD **)(a1 + 32);
              if (v37[8] && objc_msgSend(v37, "_attemptToSetSelectedMediaArray:"))
              {
                v38 = *(_QWORD *)(a1 + 32);
                v39 = *(void **)(v38 + 64);
                *(_QWORD *)(v38 + 64) = 0;

              }
LABEL_87:
              if (v5)
                objc_msgSend(*(id *)(a1 + 32), "_sendUpstreamMessageWithDictionary:", v5);
              goto LABEL_44;
            }
            if (v6 == APRKMediaPlayerObservationContextCurrentItemLoadableTimeRanges)
            {
              objc_msgSend(v4, "setObject:forKey:", CFSTR("loadedTimeRangesChanged"), CFSTR("name"));
              v62 = CFSTR("uuid");
              objc_msgSend(*(id *)(a1 + 56), "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v27;
              v28 = (void *)MEMORY[0x24BDBCE70];
              v29 = &v63;
              v30 = &v62;
            }
            else
            {
              if (v6 != APRKMediaPlayerObservationContextCurrentItemSeekableTimeRanges)
              {
                v7 = *(_QWORD *)(a1 + 64);
                v8 = *(_QWORD *)(a1 + 40);
                v9 = *(_QWORD *)(a1 + 48);
                v55.receiver = *(id *)(a1 + 32);
                v55.super_class = (Class)APRKMediaPlayer;
                objc_msgSendSuper2(&v55, sel_observeValueForKeyPath_ofObject_change_context_, v7, v8, v9);
                goto LABEL_87;
              }
              objc_msgSend(v4, "setObject:forKey:", CFSTR("seekableTimeRangesChanged"), CFSTR("name"));
              v60 = CFSTR("uuid");
              objc_msgSend(*(id *)(a1 + 56), "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = v27;
              v28 = (void *)MEMORY[0x24BDBCE70];
              v29 = &v61;
              v30 = &v60;
            }
          }
          objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = CFSTR("item");
          v26 = v5;
          v24 = v23;
        }
        objc_msgSend(v26, "setObject:forKey:", v24, v25);

        goto LABEL_87;
      }
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 72);
      v54.receiver = *(id *)(a1 + 32);
      v54.super_class = (Class)APRKMediaPlayer;
      objc_msgSendSuper2(&v54, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, v13);
    }
LABEL_43:
    v5 = 0;
LABEL_44:

    return;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result, double a2)
{
  uint64_t v2;

  if (*(float *)(result + 40) != 0.0)
  {
    v2 = result;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(a2) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 8), "setRate:", a2);
  }
  return result;
}

void __66__APRKMediaPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  objc_msgSend(*(id *)(v2 + 72), "objectForKeyedSubscript:", CFSTR("rate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", CFSTR("time"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "CMTimeValue");
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", CFSTR("hostTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "CMTimeValue");
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", CFSTR("options"), v13, v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v6;
  objc_msgSend(v3, "setRate:time:atHostTime:options:", &v16, &v13, v11, v12);

}

- (void)contentKeyHelper:(id)a3 wantsToPerformContentKeyRequestWithDictionary:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("type");
  v8[1] = CFSTR("kind");
  v9[0] = CFSTR("unhandledURL");
  v9[1] = CFSTR("request");
  v8[2] = *MEMORY[0x24BDC1150];
  v9[2] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[APRKMediaPlayer _sendUpstreamMessageWithDictionary:](self, "_sendUpstreamMessageWithDictionary:", v7);
}

- (void)contentKeyHelper:(id)a3 didGenerateSecureStopRecordPayload:(id)a4
{
  APRKMediaPlayerMessagingDelegate **p_messagingDelegate;
  id v6;
  id WeakRetained;

  p_messagingDelegate = &self->_messagingDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_messagingDelegate);
  objc_msgSend(WeakRetained, "mediaPlayer:didGenerateFPSSecureStopRecordPayload:", self, v6);

}

- (void)resourceLoaderHelper:(id)a3 wantsToPerformUnhandledURLRequestWithDictionary:(id)a4 forRequestID:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("unhandledURL");
  v12[1] = CFSTR("request");
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(a5, "integerValue"), CFSTR("type"), CFSTR("kind"), CFSTR("messageID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = *MEMORY[0x24BDC1150];
  v12[2] = v9;
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[APRKMediaPlayer _sendUpstreamMessageWithDictionary:](self, "_sendUpstreamMessageWithDictionary:", v10);
}

- (APRKMetadata)currentItemMetadata
{
  return self->_currentItemMetadata;
}

- (void)setCurrentItemMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_currentItemMetadata, a3);
}

- (BOOL)isInterstitialPlayer
{
  return self->_isInterstitialPlayer;
}

- (int)playerSessionID
{
  return self->_playerSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItemMetadata, 0);
  objc_storeStrong((id *)&self->_audioSessionMode, 0);
  objc_storeStrong((id *)&self->_lastReportedDateRanges, 0);
  objc_storeStrong((id *)&self->_currentInterstitialEventID, 0);
  objc_storeStrong((id *)&self->_interstitialEvents, 0);
  objc_storeStrong((id *)&self->_interstitialPlayer, 0);
  objc_storeStrong((id *)&self->_pendingSenderSeekMessages, 0);
  objc_storeStrong((id *)&self->_contentKeyHelper, 0);
  objc_storeStrong((id *)&self->_resourceLoaderHelper, 0);
  objc_storeStrong((id *)&self->_cachedSSLProperties, 0);
  objc_storeStrong((id *)&self->_cachedSetRateAndAnchor, 0);
  objc_storeStrong((id *)&self->_cachedSelectedMediaArray, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_destroyWeak((id *)&self->_messagingDelegate);
  objc_storeStrong((id *)&self->_currentItemUUID, 0);
  objc_storeStrong((id *)&self->_previousItemUUID, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
