@implementation AirPlayReceiverMediaRemoteHelper

- (void)setDelegate:(id)a3
{
  NSObject *dataTransferQueueInternal;
  _QWORD block[6];

  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dataTransferQueueInternal = self->_dataTransferQueueInternal;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AirPlayReceiverMediaRemoteHelper_setDelegate___block_invoke;
  block[3] = &unk_24E21FD40;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(dataTransferQueueInternal, block);
}

- (void)setIsNowPlaying:(unsigned __int8)a3
{
  objc_msgSend((id)objc_opt_class(), "setIsNowPlayingApplication:", a3);
}

- (void)startNowPlayingSession
{
  uint64_t v3;
  NSOperationQueue *dataTransferQueue;
  AirPlayReceiverMediaRemoteHelper *v5;
  _QWORD v6[6];

  if (APSMultiPrimariesEnabled())
  {
    -[NSOperationQueue cancelAllOperations](self->_dataTransferQueue, "cancelAllOperations");
    v3 = mach_absolute_time();
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      v5 = self;
      LogPrintF();
    }
    dataTransferQueue = self->_dataTransferQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke;
    v6[3] = &unk_24E21FD90;
    v6[4] = self;
    v6[5] = v3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v6, v5);
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_dataTransferQueue, "waitUntilAllOperationsAreFinished");
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)stopNowPlayingSession
{
  NSOperationQueue *dataTransferQueue;
  AirPlayReceiverMediaRemoteHelper *v4;
  _QWORD v5[5];

  if (APSMultiPrimariesEnabled())
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      v4 = self;
      LogPrintF();
    }
    -[NSOperationQueue cancelAllOperations](self->_dataTransferQueue, "cancelAllOperations", v4);
    dataTransferQueue = self->_dataTransferQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__AirPlayReceiverMediaRemoteHelper_stopNowPlayingSession__block_invoke;
    v5[3] = &unk_24E21FC00;
    v5[4] = self;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v5);
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_dataTransferQueue, "waitUntilAllOperationsAreFinished");
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)associateNowPlayingSessionWithAudioSession:(unsigned int)a3
{
  NSOperationQueue *dataTransferQueue;
  AirPlayReceiverMediaRemoteHelper *v6;
  _QWORD v7[5];
  unsigned int v8;

  if (APSMultiPrimariesEnabled())
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      v6 = self;
      LogPrintF();
    }
    dataTransferQueue = self->_dataTransferQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke;
    v7[3] = &unk_24E21E6B0;
    v7[4] = self;
    v8 = a3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v7, v6);
    -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_dataTransferQueue, "waitUntilAllOperationsAreFinished");
  }
}

- (void)broadcastPauseCommand
{
  __CFDictionary *Mutable;
  const void *v3;
  uint64_t v4;
  dispatch_queue_global_t global_queue;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = (const void *)getkMRMediaRemoteOptionRemoteControlInterfaceIdentifier[0]();
  CFDictionarySetValue(Mutable, v3, CFSTR("com.apple.airplay.mrhelper"));
  v4 = softLinkMRMediaRemoteGetLocalOrigin[0]();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  global_queue = dispatch_get_global_queue(2, 0);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteBroadcastCommand[0])(1, (uint64_t)Mutable, v4, 0, (uint64_t)global_queue, (uint64_t)&__block_literal_global_101);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)setMRNowPlayingInfo:(__CFDictionary *)a3 withMergePolicy:(unsigned __int8)a4
{
  NSOperationQueue *dataTransferQueue;
  _QWORD v8[6];
  unsigned __int8 v9;

  if (a3)
  {
    CFRetain(a3);
    dataTransferQueue = self->_dataTransferQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingInfo_withMergePolicy___block_invoke;
    v8[3] = &unk_24E21DD30;
    v9 = a4;
    v8[4] = self;
    v8[5] = a3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v8);
  }
}

- (void)setMRPlaybackState:(unsigned int)a3
{
  NSOperationQueue *dataTransferQueue;
  _QWORD v4[5];
  unsigned int v5;

  dataTransferQueue = self->_dataTransferQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AirPlayReceiverMediaRemoteHelper_setMRPlaybackState___block_invoke;
  v4[3] = &unk_24E21E6B0;
  v4[4] = self;
  v5 = a3;
  -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v4);
}

- (unsigned)handleMediaRemoteCommand:(unsigned int)a3 withOptions:(__CFDictionary *)a4
{
  const void *v7;
  __CFString *Value;
  NSObject *dataTransferQueueInternal;
  uint64_t v10;
  const void *v11;
  NSObject *notificationQueue;
  const void *v13;
  _QWORD v15[6];
  unsigned int v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a4
    && ((v7 = (const void *)getkMRMediaRemoteOptionRemoteControlInterfaceIdentifier[0](),
         Value = (__CFString *)CFDictionaryGetValue(a4, v7),
         Value == CFSTR("com.apple.airplay.mrhelper"))
     || Value && CFEqual(Value, CFSTR("com.apple.airplay.mrhelper"))))
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    dataTransferQueueInternal = self->_dataTransferQueueInternal;
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke;
    block[3] = &unk_24E21FCC8;
    block[4] = self;
    block[5] = &v18;
    dispatch_sync(dataTransferQueueInternal, block);
    v11 = (const void *)v19[3];
    if (v11)
    {
      CFRetain(v11);
      if (a4)
        CFRetain(a4);
      notificationQueue = self->_notificationQueue;
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke_2;
      v15[3] = &unk_24E21E8E0;
      v16 = a3;
      v15[4] = &v18;
      v15[5] = a4;
      dispatch_async(notificationQueue, v15);
    }
    else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 60
           && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v13 = (const void *)v19[3];
  if (v13)
    CFRelease(v13);
  _Block_object_dispose(&v18, 8);
  return 0;
}

- (void)registerCommandHandler
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__AirPlayReceiverMediaRemoteHelper_registerCommandHandler__block_invoke;
  v3[3] = &unk_24E21DD58;
  objc_copyWeak(&v4, &location);
  if (self->_state.commandHandlerToken)
    -[AirPlayReceiverMediaRemoteHelper unregisterCommandHandler](self, "unregisterCommandHandler");
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_state.commandHandlerToken = (void *)((uint64_t (*)(uint64_t, uint64_t))softLinkMRMediaRemoteAddCommandHandlerBlockForPlayer[0])((uint64_t)self->_state.playerPath, (uint64_t)v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)unregisterCommandHandler
{
  if (self->_state.commandHandlerToken)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    ((void (*)(uint64_t, uint64_t))softLinkMRMediaRemoteRemoveCommandHandlerBlockForPlayer[0])((uint64_t)self->_state.playerPath, (uint64_t)self->_state.commandHandlerToken);
    self->_state.commandHandlerToken = 0;
  }
}

- (void)setMRSupportedCommands:(__CFArray *)a3
{
  NSOperationQueue *dataTransferQueue;
  _QWORD v6[6];

  if (a3)
  {
    CFRetain(a3);
    dataTransferQueue = self->_dataTransferQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__AirPlayReceiverMediaRemoteHelper_setMRSupportedCommands___block_invoke;
    v6[3] = &unk_24E21FD90;
    v6[4] = self;
    v6[5] = a3;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v6);
  }
  else
  {
    APSLogErrorAt();
  }
}

- (void)setMRSupportedCommandsFromSerializedArray:(__CFArray *)a3
{
  uint64_t Count;
  uint64_t v6;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v10;
  const void *v11;
  AirPlayReceiverMediaRemoteHelper *v12;

  Count = CFArrayGetCount(a3);
  v6 = *MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        v10 = (const void *)((uint64_t (*)(uint64_t, uint64_t))softLinkMRMediaRemoteCommandInfoCreateFromExternalRepresentation[0])(v6, (uint64_t)ValueAtIndex);
        CFArrayAppendValue(Mutable, v10);
        CFRelease(v10);
      }
    }
    if (CFArrayGetCount(Mutable))
    {
      -[AirPlayReceiverMediaRemoteHelper setMRSupportedCommands:](self, "setMRSupportedCommands:", Mutable);
      CFRelease(Mutable);
      return;
    }
  }
  else
  {
    APSLogErrorAt();
  }
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v12 = self;
    LogPrintF();
  }
  if (_getDefaultMRSupportedCommandInfos_s_onceToken != -1)
    dispatch_once(&_getDefaultMRSupportedCommandInfos_s_onceToken, &__block_literal_global_136);
  v11 = (const void *)_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos;
  if (_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos)
    CFRetain((CFTypeRef)_getDefaultMRSupportedCommandInfos_s_defaultCommandInfos);
  if (Mutable)
    CFRelease(Mutable);
  -[AirPlayReceiverMediaRemoteHelper setMRSupportedCommands:](self, "setMRSupportedCommands:", v11, v12);
  if (v11)
    CFRelease(v11);
}

- (void)makeNowPlayingPlayer
{
  NSOperationQueue *dataTransferQueue;
  _QWORD v3[5];

  dataTransferQueue = self->_dataTransferQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__AirPlayReceiverMediaRemoteHelper_makeNowPlayingPlayer__block_invoke;
  v3[3] = &unk_24E21FC00;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v3);
}

- (void)removeNowPlayingArtwork
{
  NSOperationQueue *dataTransferQueue;
  const void *v4;
  AirPlayReceiverMediaRemoteHelper *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dataTransferQueue = self->_dataTransferQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke;
  v6[3] = &unk_24E21FCC8;
  v6[4] = self;
  v6[5] = &v7;
  -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v6);
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->_dataTransferQueue, "waitUntilAllOperationsAreFinished");
  if (v8[3])
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      v5 = self;
      LogPrintF();
    }
    -[AirPlayReceiverMediaRemoteHelper setMRNowPlayingInfo:withMergePolicy:](self, "setMRNowPlayingInfo:withMergePolicy:", v8[3], 1, v5);
    v4 = (const void *)v8[3];
    if (v4)
      CFRelease(v4);
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setAPNowPlayingInfo:(__CFDictionary *)a3
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  const void *v6;
  const void *v7;
  const void *v8;

  CFDictionaryGetValue(a3, CFSTR("artworkData"));
  if (FigCFEqual())
    -[AirPlayReceiverMediaRemoteHelper removeNowPlayingArtwork](self, "removeNowPlayingArtwork");
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v5 = Mutable;
    CFDictionaryApplyBlock();
    v6 = (const void *)getkMRMediaRemoteNowPlayingInfoUniqueIdentifier[0]();
    if (CFDictionaryContainsKey(v5, v6))
    {
      v7 = (const void *)getkMRMediaRemoteNowPlayingInfoMediaType[0]();
      v8 = (const void *)getkMRMediaRemoteMediaTypeMusic[0]();
      CFDictionaryAddValue(v5, v7, v8);
    }
    -[AirPlayReceiverMediaRemoteHelper setMRNowPlayingInfo:withMergePolicy:](self, "setMRNowPlayingInfo:withMergePolicy:", v5, 0);
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
    APSLogErrorAt();
  }
}

- (void)setMRNowPlayingClient:(__CFData *)a3
{
  const void *v4;
  const void *v5;
  NSOperationQueue *dataTransferQueue;
  _QWORD v7[6];

  v4 = (const void *)((uint64_t (*)(uint64_t))softLinkMRNowPlayingClientCreateFromExternalRepresentation[0])((uint64_t)a3);
  if (v4)
  {
    v5 = v4;
    CFRetain(v4);
    dataTransferQueue = self->_dataTransferQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingClient___block_invoke;
    v7[3] = &unk_24E21FD90;
    v7[4] = self;
    v7[5] = v5;
    -[NSOperationQueue addOperationWithBlock:](dataTransferQueue, "addOperationWithBlock:", v7);
    CFRelease(v5);
  }
  else
  {
    APSLogErrorAt();
  }
}

- (void)handlePlaybackStateDidChange:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  AirPlayReceiverMediaRemoteHelper *v11;
  id v12;
  NSObject *notificationQueue;
  AirPlayReceiverMediaRemoteHelper *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[6];
  int v20;

  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", getkMRNowPlayingPlayerPathUserInfoKey[0]());
  v7 = (void *)objc_msgSend(a3, "userInfo");
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", getkMRMediaRemotePlaybackStateUserInfoKey[0]()), "intValue");
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v9 = objc_msgSend((id)objc_msgSend(v6, "origin"), "isLocal");
    v10 = objc_msgSend((id)objc_msgSend(v6, "client"), "displayName");
    v17 = objc_msgSend((id)objc_msgSend(v6, "client"), "processIdentifier");
    v18 = v8;
    v15 = v9;
    v16 = v10;
    v14 = self;
    LogPrintF();
  }
  if (objc_msgSend((id)objc_msgSend(v6, "origin", v14, v15, v16, v17, v18), "isLocal"))
  {
    if (objc_msgSend((id)objc_msgSend(v6, "client"), "processIdentifier"))
    {
      v11 = self;
      v12 = v6;
      notificationQueue = self->_notificationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__AirPlayReceiverMediaRemoteHelper_handlePlaybackStateDidChange___block_invoke;
      block[3] = &unk_24E21E688;
      block[4] = self;
      block[5] = v6;
      v20 = v8;
      dispatch_async(notificationQueue, block);
    }
  }
}

- (void)handleSilentPrimaryStateDidChange:(id)a3
{
  softLinkMRNowPlayingSessionManagerIsSilentPrimary[0]();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFObjectSetProperty();
}

- (void)handleLocalDeviceRoutingContextIDDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = softLinkMRNowPlayingSessionManagerLocalDeviceRoutingContextID[0]();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  APReceiverSystemInfoSetProperty((uint64_t)self->_systemInfo, v4, (uint64_t)CFSTR("RoutingContextID"), v5, v6);
}

- (void)handleActiveSessionWillBeHijacked:(id)a3
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFObjectControlAsync();
}

- (AirPlayReceiverMediaRemoteHelper)initWithPlayerID:(__CFString *)a3 withSystemInfo:(OpaqueAPReceiverSystemInfo *)a4 withReceiverServer:(AirPlayReceiverServerPrivate *)a5
{
  AirPlayReceiverMediaRemoteHelper *v8;
  AirPlayReceiverMediaRemoteHelper *v9;
  NSOperationQueue *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AirPlayReceiverMediaRemoteHelper *v17;
  AirPlayReceiverMediaRemoteHelper *v18;
  objc_super v19;
  char label[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)AirPlayReceiverMediaRemoteHelper;
  v8 = -[AirPlayReceiverMediaRemoteHelper init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    *(_OWORD *)label = 0u;
    v17 = v8;
    SNPrintF();
    v9->_dataTransferQueueInternal = (OS_dispatch_queue *)dispatch_queue_create(label, 0);
    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v9->_dataTransferQueue = v10;
    -[NSOperationQueue setUnderlyingQueue:](v10, "setUnderlyingQueue:", v9->_dataTransferQueueInternal, v17);
    v18 = v9;
    SNPrintF();
    v9->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create(label, 0);
    if (a3)
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)getMRPlayerClass[0]()), "initWithIdentifier:displayName:", a3, a3, v9);
      v9->_state.playerPath = (MRPlayerPath *)objc_msgSend(objc_alloc((Class)getMRPlayerPathClass[0]()), "initWithOrigin:client:player:", 0, 0, v11);
    }
    else
    {
      v11 = 0;
    }
    v9->_systemInfo = (OpaqueAPReceiverSystemInfo *)CFRetain(a4);
    v9->_server = (AirPlayReceiverServerPrivate *)CFRetain(a5);
    v12 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_handlePlaybackStateDidChange_, getkMRMediaRemotePlayerPlaybackStateDidChangeNotification[0](), 0);
    ((void (*)(uint64_t))softLinkMRMediaRemoteSetWantsNowPlayingNotifications[0])(1);
    if (APSMultiPrimariesEnabled() && APSNowPlayingSessionDataSourceEnabled())
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel_handleSilentPrimaryStateDidChange_, getMRNowPlayingSessionManagerIsSilentPrimaryDidChange[0](), 0);
      v14 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v14, "addObserver:selector:name:object:", v9, sel_handleLocalDeviceRoutingContextIDDidChange_, getMRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange[0](), 0);
      v15 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel_handleActiveSessionWillBeHijacked_, getMRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback[0](), 0);
      -[AirPlayReceiverMediaRemoteHelper handleSilentPrimaryStateDidChange:](v9, "handleSilentPrimaryStateDidChange:", 0);
      -[AirPlayReceiverMediaRemoteHelper handleLocalDeviceRoutingContextIDDidChange:](v9, "handleLocalDeviceRoutingContextIDDidChange:", 0);
    }
    if (_getDefaultMRSupportedCommandInfos_s_onceToken != -1)
      dispatch_once(&_getDefaultMRSupportedCommandInfos_s_onceToken, &__block_literal_global_136);
    -[AirPlayReceiverMediaRemoteHelper setMRSupportedCommands:](v9, "setMRSupportedCommands:", _getDefaultMRSupportedCommandInfos_s_defaultCommandInfos, v18);
  }
  else
  {
    v11 = 0;
  }
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  OpaqueFigCFWeakReferenceHolder *weakDelegate;
  OpaqueAPReceiverSystemInfo *systemInfo;
  AirPlayReceiverServerPrivate *server;
  NSObject *dataTransferQueueInternal;
  NSObject *notificationQueue;
  AirPlayReceiverMediaRemoteHelper *v11;
  objc_super v12;

  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    LogPrintF();
  }
  -[AirPlayReceiverMediaRemoteHelper unregisterCommandHandler](self, "unregisterCommandHandler", v11);
  ((void (*)(uint64_t))softLinkMRMediaRemoteSetWantsNowPlayingNotifications[0])(0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  if (APSMultiPrimariesEnabled() && APSNowPlayingSessionDataSourceEnabled())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "removeObserver:name:object:", self, getMRNowPlayingSessionManagerIsSilentPrimaryDidChange[0](), 0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "removeObserver:name:object:", self, getMRNowPlayingSessionManagerLocalDeviceRoutingContextIDDidChange[0](), 0);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "removeObserver:name:object:", self, getMRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback[0](), 0);
  }
  -[NSOperationQueue cancelAllOperations](self->_dataTransferQueue, "cancelAllOperations");
  softLinkMRMediaRemoteRemovePlayer((uint64_t)self->_state.playerPath, 0, 0);

  self->_state.playerPath = 0;
  weakDelegate = self->_state.weakDelegate;
  if (weakDelegate)
  {
    CFRelease(weakDelegate);
    self->_state.weakDelegate = 0;
  }
  systemInfo = self->_systemInfo;
  if (systemInfo)
  {
    CFRelease(systemInfo);
    self->_systemInfo = 0;
  }
  server = self->_server;
  if (server)
  {
    CFRelease(server);
    self->_server = 0;
  }

  self->_dataTransferQueue = 0;
  dataTransferQueueInternal = self->_dataTransferQueueInternal;
  if (dataTransferQueueInternal)
  {
    dispatch_release(dataTransferQueueInternal);
    self->_dataTransferQueueInternal = 0;
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
  {
    dispatch_release(notificationQueue);
    self->_notificationQueue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AirPlayReceiverMediaRemoteHelper;
  -[AirPlayReceiverMediaRemoteHelper dealloc](&v12, sel_dealloc);
}

void __65__AirPlayReceiverMediaRemoteHelper_handlePlaybackStateDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client", v3, v4), "processIdentifier")), CFSTR("APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessIdentifier"));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client"), "displayName"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "client"), "displayName"), CFSTR("kAPReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessDisplayName"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_DWORD *)(a1 + 48) == 1), CFSTR("APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppIsPlaying"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("APReceiverMediaRemoteHelperNowPlayingAppStartedPlayingNotification"), *(_QWORD *)(a1 + 32), v2);

}

void __58__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "client", v5, v6);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "origin");
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSyncClientProperties[0])(v2, v3, v4, 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_queue_global_t global_queue;
  uint64_t v5;
  _QWORD v6[6];

  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke_2;
  v6[3] = &unk_24E21DD80;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = v2;
  v6[5] = v5;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteGetNowPlayingInfoForPlayer[0])(v3, 0, (uint64_t)global_queue, (uint64_t)v6);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

intptr_t __59__AirPlayReceiverMediaRemoteHelper_removeNowPlayingArtwork__block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  if (cf)
    v3 = CFRetain(cf);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __56__AirPlayReceiverMediaRemoteHelper_makeNowPlayingPlayer__block_invoke(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetNowPlayingPlayer[0])(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, 0);
}

void __59__AirPlayReceiverMediaRemoteHelper_setMRSupportedCommands___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    LogPrintF();
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetSupportedCommandsForPlayer[0])(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

CFArrayRef __58__AirPlayReceiverMediaRemoteHelper_registerCommandHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v3;
  CFArrayRef v4;
  void *values;

  objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "handleMediaRemoteCommand:withOptions:", a2, a3);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = (void *)FigCFNumberCreateUInt32();
  v4 = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  CFRelease(values);
  return v4;
}

uint64_t __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
  {
    result = FigCFWeakReferenceHolderCopyReferencedObject();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __73__AirPlayReceiverMediaRemoteHelper_handleMediaRemoteCommand_withOptions___block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "handleMRCommand:translatedAPCommand:withOptions:");
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

uint64_t __55__AirPlayReceiverMediaRemoteHelper_setMRPlaybackState___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetPlaybackStateForPlayer[0])(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(unsigned int *)(a1 + 40), 0, 0);
}

void __72__AirPlayReceiverMediaRemoteHelper_setMRNowPlayingInfo_withMergePolicy___block_invoke(uint64_t a1)
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetNowPlayingInfoForPlayer[0])(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __57__AirPlayReceiverMediaRemoteHelper_broadcastPauseCommand__block_invoke()
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_queue_global_t global_queue;
  _QWORD v7[6];

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 48);
  v5 = *(unsigned int *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke_2;
  v7[3] = &unk_24E21DCC8;
  v7[4] = v3;
  v7[5] = v2;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkMRMediaRemoteSetAVAudioSessionOpaqueSessionIDForPlayer[0])(v4, v5, (uint64_t)global_queue, (uint64_t)v7);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

intptr_t __79__AirPlayReceiverMediaRemoteHelper_associateNowPlayingSessionWithAudioSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 90
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
         && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__AirPlayReceiverMediaRemoteHelper_stopNowPlayingSession__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unregisterCommandHandler");
  softLinkMRMediaRemoteSetCanBeNowPlayingForPlayer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0);
  softLinkMRNowPlayingSessionManagerStopSession[0]();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_global_t global_queue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v2 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke_21;
  v10[3] = &unk_24E21DCA0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10[6] = &v11;
  v10[7] = v5;
  v10[4] = v4;
  v10[5] = v2;
  ((void (*)(uint64_t, uint64_t))softLinkMRNowPlayingSessionManagerStartSession[0])((uint64_t)global_queue, (uint64_t)v10);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  v8 = (void *)v12[5];
  v9 = v8;
  *(_QWORD *)(v6 + 48) = v8;

  softLinkMRMediaRemoteSetCanBeNowPlayingForPlayer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 1);
  _Block_object_dispose(&v11, 8);
}

intptr_t __58__AirPlayReceiverMediaRemoteHelper_startNowPlayingSession__block_invoke_21(uint64_t a1, void *a2)
{
  mach_absolute_time();
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    UpTicksToMilliseconds();
    LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __48__AirPlayReceiverMediaRemoteHelper_setDelegate___block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "unregisterCommandHandler");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  return objc_msgSend(*(id *)(a1 + 32), "registerCommandHandler");
}

+ (void)becomeNowPlayingApplication
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  ((void (*)(uint64_t))softLinkMRMediaRemoteSetCanBeNowPlayingApplication[0])(1);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ((void (*)(uint64_t))softLinkMRMediaRemoteSetNowPlayingApplicationOverrideEnabled[0])(1);
}

+ (void)resignAsNowPlayingApplication
{
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 50)
  {
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
      && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  ((void (*)(uint64_t))softLinkMRMediaRemoteSetNowPlayingApplicationOverrideEnabled[0])(0);
  if (gLogCategory_AirPlayReceiverMediaRemoteHelper <= 30
    && (gLogCategory_AirPlayReceiverMediaRemoteHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  ((void (*)(uint64_t))softLinkMRMediaRemoteSetCanBeNowPlayingApplication[0])(0);
}

+ (void)setIsNowPlayingApplication:(unsigned __int8)a3
{
  int v3;

  v3 = a3;
  if (APSMultiPrimariesEnabled())
  {
    APSLogErrorAt();
  }
  else if (v3)
  {
    objc_msgSend(a1, "becomeNowPlayingApplication");
  }
  else
  {
    objc_msgSend(a1, "resignAsNowPlayingApplication");
  }
}

@end
