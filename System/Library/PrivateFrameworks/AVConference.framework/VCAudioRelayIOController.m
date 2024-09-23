@implementation VCAudioRelayIOController

+ (void)initializeStateStrings
{
  if (!_stateStrings)
    _stateStrings = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("NOT SET"), CFSTR("IDLE"), CFSTR("PREPARE"), CFSTR("STARTING"), CFSTR("RUNNING"), 0);
}

+ (id)sharedInstanceRemoteFacing
{
  id result;
  void *v3;

  result = (id)sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing;
  if (!sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing)
    {
      sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing = -[VCAudioRelayIOController initWithRelayType:relayIOType:]([VCAudioRelayIOController alloc], "initWithRelayType:relayIOType:", 0, 1);
      +[VCAudioRelayIOController initializeStateStrings](VCAudioRelayIOController, "initializeStateStrings");
    }
    objc_sync_exit(v3);
    return (id)sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing;
  }
  return result;
}

+ (id)sharedInstanceClientFacing
{
  if (sharedInstanceClientFacing_onceToken != -1)
    dispatch_once(&sharedInstanceClientFacing_onceToken, &__block_literal_global_52);
  return (id)sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing;
}

void __54__VCAudioRelayIOController_sharedInstanceClientFacing__block_invoke()
{
  if (!sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing)
  {
    sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing = -[VCAudioRelayIOController initWithRelayType:relayIOType:]([VCAudioRelayIOController alloc], "initWithRelayType:relayIOType:", 0, 0);
    +[VCAudioRelayIOController initializeStateStrings](VCAudioRelayIOController, "initializeStateStrings");
  }
}

+ (id)sharedInstanceSafeViewRemoteFacing
{
  if (sharedInstanceSafeViewRemoteFacing_onceToken != -1)
    dispatch_once(&sharedInstanceSafeViewRemoteFacing_onceToken, &__block_literal_global_14_0);
  return (id)sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing;
}

void __62__VCAudioRelayIOController_sharedInstanceSafeViewRemoteFacing__block_invoke()
{
  if (!sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing)
  {
    sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing = -[VCAudioRelayIOController initWithRelayType:relayIOType:]([VCAudioRelayIOController alloc], "initWithRelayType:relayIOType:", 1, 1);
    +[VCAudioRelayIOController initializeStateStrings](VCAudioRelayIOController, "initializeStateStrings");
  }
}

+ (id)sharedInstanceSafeViewClientFacing
{
  if (sharedInstanceSafeViewClientFacing_onceToken != -1)
    dispatch_once(&sharedInstanceSafeViewClientFacing_onceToken, &__block_literal_global_15);
  return (id)sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing;
}

void __62__VCAudioRelayIOController_sharedInstanceSafeViewClientFacing__block_invoke()
{
  if (!sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing)
  {
    sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing = -[VCAudioRelayIOController initWithRelayType:relayIOType:]([VCAudioRelayIOController alloc], "initWithRelayType:relayIOType:", 1, 0);
    +[VCAudioRelayIOController initializeStateStrings](VCAudioRelayIOController, "initializeStateStrings");
  }
}

- (VCAudioRelayIOController)initWithRelayType:(unsigned int)a3 relayIOType:(unsigned int)a4
{
  VCAudioRelayIOController *v6;
  VCAudioRelayIOController *v7;
  NSObject *CustomRootQueue;
  const __CFAllocator *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCAudioRelayIOController;
  v6 = -[VCAudioRelayIOController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_relayType = a3;
    v6->_relayIOType = a4;
    v6->_startingIOClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_allClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v7->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AudioIORelayControllerQueue", 0, CustomRootQueue);
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100, &v7->_sourceData.eventQueue);
    CMSimpleQueueCreate(v9, 100, &v7->_sinkData.eventQueue);
    VCSingleLinkedListInitialize((uint64_t)&v7->_sourceData.clientIOList, (uint64_t)_VCAudioRelayIOController_CompareControllerEntries);
    VCSingleLinkedListInitialize((uint64_t)&v7->_sinkData.clientIOList, (uint64_t)_VCAudioRelayIOController_CompareControllerEntries);
    v7->_state = 1;
  }
  return v7;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  const char *v5;
  const char *v6;
  uint64_t relayType;
  uint64_t relayIOType;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VCAudioRelayIOController;
  v4 = -[VCAudioRelayIOController description](&v10, sel_description);
  v5 = "Unknown";
  v6 = "Safeview";
  relayType = self->_relayType;
  relayIOType = self->_relayIOType;
  if ((_DWORD)relayType != 1)
    v6 = "Unknown";
  if (!(_DWORD)relayType)
    v6 = "FaceTime";
  if ((_DWORD)relayIOType == 1)
    v5 = "RemoteFacing";
  if (!(_DWORD)relayIOType)
    v5 = "ClientFacing";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ relayType=%s(%u) relayIOType=%s(%u) }"), v4, v6, relayType, v5, relayIOType);
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  opaqueCMSimpleQueue *eventQueue;
  opaqueCMSimpleQueue *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  eventQueue = self->_sourceData.eventQueue;
  if (eventQueue)
    CFRelease(eventQueue);
  v4 = self->_sinkData.eventQueue;
  if (v4)
    CFRelease(v4);

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelayIOController;
  -[VCAudioRelayIOController dealloc](&v5, sel_dealloc);
}

- (void)loadRelay
{
  void *v3;
  id *v4;
  VCAudioRelay *Weak;
  VCAudioRelay *v6;
  VCAudioRelay *v7;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (self->_relayType == 1)
    v4 = (id *)&_relaySafeView;
  else
    v4 = (id *)&_relayFaceTime;
  Weak = (VCAudioRelay *)objc_loadWeak(v4);
  self->_relay = Weak;
  if (Weak)
  {
    v6 = Weak;
  }
  else
  {
    v7 = objc_alloc_init(VCAudioRelay);
    self->_relay = v7;
    objc_storeWeak(v4, v7);
  }
  objc_sync_exit(v3);
}

- (void)unloadRelay
{

  self->_relay = 0;
}

- (_VCAudioIOControllerIOState)sinkIO
{
  return &self->_sinkData;
}

- (_VCAudioIOControllerIOState)sourceIO
{
  return &self->_sourceData;
}

- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3
{
  uint64_t *p_clientIOList;
  uint64_t *v4;

  p_clientIOList = (uint64_t *)&a3->clientIOList;
  while (1)
  {
    v4 = VCSingleLinkedListPop(p_clientIOList);
    if (!v4)
      break;
    free(v4);
  }
}

- (BOOL)addClient:(id)a3
{
  char v5;

  v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if ((v5 & 1) == 0)
    -[NSMutableArray addObject:](self->_allClients, "addObject:", a3);
  return v5 ^ 1;
}

- (BOOL)removeClient:(id)a3
{
  int v5;

  v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if (v5)
  {
    -[VCAudioRelayIOController unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", objc_msgSend(a3, "sinkIO"), &self->_sinkData);
    -[VCAudioRelayIOController unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", objc_msgSend(a3, "sourceIO"), &self->_sourceData);
    -[NSMutableArray removeObject:](self->_allClients, "removeObject:", a3);
    -[NSMutableArray removeObject:](self->_startingIOClients, "removeObject:", a3);
  }
  return v5;
}

- (void)_cleanupDeadClients
{
  void *v3;
  NSMutableArray *allClients;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCAudioRelayIOController *v30;
  __int16 v31;
  __CFString *v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  allClients = self->_allClients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v35;
    *(_QWORD *)&v6 = 136315906;
    v20 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(allClients);
        v10 = *(__CFString **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        if (!-[__CFString delegate](v10, "delegate", v20))
        {
          if ((VCAudioRelayIOController *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                v22 = v17;
                v23 = 2080;
                v24 = "-[VCAudioRelayIOController _cleanupDeadClients]";
                v25 = 1024;
                v26 = 385;
                v27 = 2048;
                v28 = v10;
                v14 = v18;
                v15 = " [%s] %s:%d Removing dead client (%p)!";
                v16 = 38;
LABEL_19:
                _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
              }
            }
          }
          else
          {
            v11 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v11 = (const __CFString *)-[VCAudioRelayIOController performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                v22 = v12;
                v23 = 2080;
                v24 = "-[VCAudioRelayIOController _cleanupDeadClients]";
                v25 = 1024;
                v26 = 385;
                v27 = 2112;
                v28 = v11;
                v29 = 2048;
                v30 = self;
                v31 = 2048;
                v32 = v10;
                v14 = v13;
                v15 = " [%s] %s:%d %@(%p) Removing dead client (%p)!";
                v16 = 58;
                goto LABEL_19;
              }
            }
          }
          objc_msgSend(v3, "setObject:atIndexedSubscript:", v10, objc_msgSend(v3, "count"));
        }
        ++v9;
      }
      while (v7 != v9);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      v7 = v19;
    }
    while (v19);
  }
  -[NSMutableArray removeObjectsInArray:](self->_allClients, "removeObjectsInArray:", v3);
}

- (unsigned)channelsPerFrame
{
  NSMutableArray *allClients;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t i;
  unsigned int v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  allClients = self->_allClients;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v3)
    return 1;
  v4 = v3;
  v5 = *(_QWORD *)v12;
  v6 = 1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(allClients);
      v8 = *(_DWORD *)(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "clientFormat") + 28);
      if (v8 > v6)
        v6 = v8;
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  }
  while (v4);
  return v6;
}

- (unsigned)computeSamplePerFrameWithControllerSampleRate:(unsigned int)a3
{
  NSMutableArray *allClients;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  unsigned int v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  allClients = self->_allClients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v5)
    return -1;
  v6 = v5;
  v7 = *(_QWORD *)v17;
  v8 = (double)a3;
  v9 = -1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(allClients);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "clientFormat");
      LODWORD(v12) = *(_DWORD *)(v11 + 40);
      v13 = vcvtad_u64_f64(v8 * (double)v12 / *(double *)v11);
      if (v9 >= v13)
        v9 = v13;
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  }
  while (v6);
  return v9;
}

- (id)newControllerSettingsWithNewClient:(id)a3
{
  id v5;
  double *v6;
  double v7;
  uint64_t v8;
  __int128 v10;
  _QWORD v11[2];
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a3)
    v5 = (id)-[NSMutableArray lastObject](self->_allClients, "lastObject");
  v6 = (double *)objc_msgSend(v5, "clientFormat");
  v18 = 0;
  v10 = xmmword_1D910D780;
  v17 = 0;
  v11[1] = 0x296C70636DLL;
  if (v6)
    v7 = *v6;
  else
    v7 = 24000.0;
  *(double *)v11 = v7;
  v15 = -[VCAudioRelayIOController channelsPerFrame](self, "channelsPerFrame", v10);
  v16 = 32;
  v13 = 1;
  v14 = 4 * (v15 & 0x7FFFFFF);
  v12 = v14;
  LODWORD(v18) = -[VCAudioRelayIOController computeSamplePerFrameWithControllerSampleRate:](self, "computeSamplePerFrameWithControllerSampleRate:", v7);
  if (v5)
  {
    LODWORD(v10) = objc_msgSend(a3, "remoteCodecType");
    objc_msgSend(a3, "remoteCodecSampleRate", (_QWORD)v10);
    *((_QWORD *)&v10 + 1) = v8;
  }
  return -[VCAudioRelayIOControllerSettings initWithAudioFormat:remoteCodecInfo:]([VCAudioRelayIOControllerSettings alloc], "initWithAudioFormat:remoteCodecInfo:", v11, &v10);
}

- (BOOL)startRelayIO:(id)a3
{
  unsigned int relayIOType;
  VCAudioRelay *relay;
  uint64_t v6;
  NSObject *global_queue;
  VCAudioRelay *v8;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  relayIOType = self->_relayIOType;
  relay = self->_relay;
  if (relayIOType == 1)
    -[VCAudioRelay setRemoteIO:withError:](relay, "setRemoteIO:withError:", a3, v11);
  else
    -[VCAudioRelay setClientIO:withError:](relay, "setClientIO:withError:", a3, v11);
  v6 = v11[0];
  if (v11[0])
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__VCAudioRelayIOController_startRelayIO___block_invoke;
    v10[3] = &unk_1E9E52238;
    v10[4] = self;
    v10[5] = v6;
    dispatch_async(global_queue, v10);
  }
  v8 = self->_relay;
  if (self->_relayIOType == 1)
    -[VCAudioRelay startRemoteIO](v8, "startRemoteIO");
  else
    -[VCAudioRelay startClientIO](v8, "startClientIO");
  return v11[0] == 0;
}

uint64_t __41__VCAudioRelayIOController_startRelayIO___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (*(_DWORD *)(v2 + 12) == 1)
  {
    result = objc_msgSend((id)objc_msgSend(v3, "clientIO"), "startCompletionHandler");
    if (!result)
      return result;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clientIO");
  }
  else
  {
    result = objc_msgSend((id)objc_msgSend(v3, "remoteIO"), "startCompletionHandler");
    if (!result)
      return result;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remoteIO");
  }
  v6 = objc_msgSend(v5, "startCompletionHandler");
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, *(_QWORD *)(a1 + 40));
}

- (id)newRelayIOWithCompletionHandler:(id)a3
{
  VCAudioRelayIO *v5;

  v5 = objc_alloc_init(VCAudioRelayIO);
  -[VCAudioRelayIO setClientFormat:](v5, "setClientFormat:", -[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat"));
  -[VCAudioRelayIO setMicCallback:](v5, "setMicCallback:", VCAudioRelayIOController_PushAudioSamples);
  -[VCAudioRelayIO setMicCallbackContext:](v5, "setMicCallbackContext:", &self->_sinkData);
  -[VCAudioRelayIO setSpeakerCallback:](v5, "setSpeakerCallback:", VCAudioRelayIOController_PullAudioSamples);
  -[VCAudioRelayIO setSpeakerCallbackContext:](v5, "setSpeakerCallbackContext:", &self->_sourceData);
  -[VCAudioRelayIO setUsePacketThread:](v5, "setUsePacketThread:", 1);
  -[VCAudioRelayIO setStartCompletionHandler:](v5, "setStartCompletionHandler:", a3);
  -[VCAudioRelayIO setUpdateRemoteCodecInfoContext:](v5, "setUpdateRemoteCodecInfoContext:", self);
  -[VCAudioRelayIO setUpdateRemoteCodecInfoCallback:](v5, "setUpdateRemoteCodecInfoCallback:", VCAudioRelayIOController_UpdateRemoteCodecInfo);
  return v5;
}

- (void)resetAudioTimestamps
{
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sinkData.timestampInitialized);
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sourceData.timestampInitialized);
}

- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  _DWORD *v7;

  v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
  v7[4] = 0;
  *((_QWORD *)v7 + 1) = a3;
  if (self->_state == 4)
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioRelayIOController registerClientIO:controllerIO:].cold.1();
      }
      free(v7);
    }
  }
  else
  {
    _VCAudioRelayIOController_RegisterClientIO((uint64_t)a4, v7);
  }
}

- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  _DWORD *v7;

  v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
  v7[4] = 1;
  *((_QWORD *)v7 + 1) = a3;
  if (self->_state == 4)
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioRelayIOController unregisterClientIO:controllerIO:].cold.1();
      }
      free(v7);
    }
  }
  else
  {
    _VCAudioRelayIOController_UnregisterClientIO((uint64_t)a4, v7);
  }
}

- (BOOL)stateIdleWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  *a5 = 1;
  if (-[NSMutableArray count](self->_allClients, "count", a3, a4))
  {
    -[VCAudioRelayIOController loadRelay](self, "loadRelay");
    *a5 = 2;
  }
  else
  {
    -[VCAudioRelayIOController resetAudioTimestamps](self, "resetAudioTimestamps");
  }
  return 1;
}

- (BOOL)handleTransitionPrepareToStarting
{
  tagVCAudioFrameFormat *v3;
  int samplesPerFrame;
  __int128 v5;
  __int128 v6;
  NSMutableArray *allClients;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  opaqueVCAudioLimiter *v12;
  id v13;
  _QWORD v15[5];
  __int128 v16[2];
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat");
  samplesPerFrame = v3->samplesPerFrame;
  v5 = *(_OWORD *)&v3->format.mSampleRate;
  v6 = *(_OWORD *)&v3->format.mBytesPerPacket;
  v17 = *(_QWORD *)&v3->format.mBitsPerChannel;
  v16[0] = v5;
  v16[1] = v6;
  if ((VCAudioBufferList_Allocate(v16, samplesPerFrame, &self->_sourceData.secondarySampleBuffer) & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    allClients = self->_allClients;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(allClients);
          -[VCAudioRelayIOController addStartingClient:controllerSettings:](self, "addStartingClient:controllerSettings:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), self->_currentSettings);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v9);
    }
    v12 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((__int128 *)v3);
    self->_sourceData.audioLimiter = v12;
    if (v12)
    {
      if ((VCAudioLimiter_Start((uint64_t)v12) & 1) != 0)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke;
        v15[3] = &unk_1E9E53C48;
        v15[4] = self;
        v13 = -[VCAudioRelayIOController newRelayIOWithCompletionHandler:](self, "newRelayIOWithCompletionHandler:", v15);
        if (v13)
        {
          if (self->_relayIOType == 1)
            objc_msgSend(v13, "setRemoteCodecInfo:", -[VCAudioRelayIOControllerSettings remoteCodecInfo](self->_currentSettings, "remoteCodecInfo"));
          if (-[VCAudioRelayIOController startRelayIO:](self, "startRelayIO:", v13))
          {

            return 1;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.3();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.2();
        }

        VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.5();
  }
  VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  return 0;
}

void __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke_2;
  v5[3] = &unk_1E9E52210;
  v6 = a2;
  v5[4] = v3;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

uint64_t __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 4;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "delegate"), "didStart:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      }
      while (v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "flushEventQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
    objc_msgSend(*(id *)(a1 + 32), "flushEventQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(*(id *)(a1 + 32), "removeAllClientsForIO:", *(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 32), "removeAllClientsForIO:", *(_QWORD *)(a1 + 32) + 256);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateStateWithClient:", 0);
}

- (BOOL)statePrepareWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  unsigned int v8;

  if (!-[NSMutableArray count](self->_allClients, "count", a3, a4))
  {
    -[VCAudioRelayIOController unloadRelay](self, "unloadRelay");
    v8 = 1;
    goto LABEL_5;
  }

  self->_currentSettings = (VCAudioRelayIOControllerSettings *)a3;
  if (-[VCAudioRelayIOController handleTransitionPrepareToStarting](self, "handleTransitionPrepareToStarting"))
  {
    v8 = 3;
LABEL_5:
    *a5 = v8;
    return 1;
  }
  return 0;
}

- (void)addStartingClient:(id)a3 controllerSettings:(id)a4
{
  if (a3 && (-[NSMutableArray containsObject:](self->_startingIOClients, "containsObject:") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "delegate"), "controllerFormatChanged:", objc_msgSend(a4, "audioFormat"));
    if ((objc_msgSend(a3, "direction") & 1) != 0)
      -[VCAudioRelayIOController registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(a3, "sourceIO"), &self->_sourceData);
    if ((objc_msgSend(a3, "direction") & 2) != 0)
      -[VCAudioRelayIOController registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(a3, "sinkIO"), &self->_sinkData);
    -[NSMutableArray addObject:](self->_startingIOClients, "addObject:", a3);
  }
  if (self->_relayIOType == 1)
    -[VCAudioRelayIO setRemoteCodecInfo:](-[VCAudioRelay remoteIO](self->_relay, "remoteIO"), "setRemoteCodecInfo:", -[VCAudioRelayIOControllerSettings remoteCodecInfo](self->_currentSettings, "remoteCodecInfo"));
}

- (BOOL)stateStartingWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  VCAudioRelay *relay;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *a5 = 3;
  if (!memcmp(-[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat"), (const void *)objc_msgSend(a3, "audioFormat"), 0x28uLL)&& -[NSMutableArray count](self->_allClients, "count"))
  {
    -[VCAudioRelayIOController addStartingClient:controllerSettings:](self, "addStartingClient:controllerSettings:", a4, a3);
  }
  else
  {
    relay = self->_relay;
    if (self->_relayIOType == 1)
      -[VCAudioRelay stopRemoteIO](relay, "stopRemoteIO");
    else
      -[VCAudioRelay stopClientIO](relay, "stopClientIO");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_relayIOType == 0;
        v14 = 136315906;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCAudioRelayIOController stateStartingWithControllerSettings:client:newState:]";
        v18 = 1024;
        v19 = 667;
        v20 = 1024;
        v21 = v12;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client facing:%d relay stopped", (uint8_t *)&v14, 0x22u);
      }
    }
    -[VCAudioRelayIOController flushEventQueue:](self, "flushEventQueue:", self->_sourceData.eventQueue);
    -[VCAudioRelayIOController flushEventQueue:](self, "flushEventQueue:", self->_sinkData.eventQueue);
    -[VCAudioRelayIOController removeAllClientsForIO:](self, "removeAllClientsForIO:", &self->_sinkData);
    -[VCAudioRelayIOController removeAllClientsForIO:](self, "removeAllClientsForIO:", &self->_sourceData);
    -[NSMutableArray removeAllObjects](self->_startingIOClients, "removeAllObjects");
    VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
    VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    *a5 = 2;
  }
  return 1;
}

- (BOOL)stateRunningWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  NSMutableArray *startingIOClients;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *a5 = 4;
  if (!memcmp(-[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat"), (const void *)objc_msgSend(a3, "audioFormat"), 0x28uLL)&& -[NSMutableArray count](self->_allClients, "count"))
  {
    -[VCAudioRelayIOController addStartingClient:controllerSettings:](self, "addStartingClient:controllerSettings:", a4, a3);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    startingIOClients = self->_startingIOClients;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](startingIOClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(startingIOClients);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "delegate"), "didStart:error:", 1, 0);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](startingIOClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v11);
    }
    -[NSMutableArray removeAllObjects](self->_startingIOClients, "removeAllObjects");
  }
  else
  {
    *a5 = 3;
  }
  return 1;
}

- (BOOL)updateStateWithClient:(id)a3
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int state;
  BOOL v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  id v39;
  id v40;
  unsigned int v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  VCAudioRelayIOController *v49;
  __int16 v50;
  VCAudioRelayIOController *v51;
  __int16 v52;
  _BYTE v53[20];
  unsigned int v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  unsigned int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  -[VCAudioRelayIOController _cleanupDeadClients](self, "_cleanupDeadClients");
  v40 = a3;
  v5 = -[VCAudioRelayIOController newControllerSettingsWithNewClient:](self, "newControllerSettingsWithNewClient:", a3);
  v39 = v5;
  do
  {
    if ((VCAudioRelayIOController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", self->_state);
          state = self->_state;
          *(_DWORD *)buf = 136316418;
          v43 = v14;
          v44 = 2080;
          v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
          v46 = 1024;
          v47 = 720;
          v48 = 2112;
          v49 = self;
          v50 = 2112;
          v51 = (VCAudioRelayIOController *)v16;
          v52 = 1024;
          *(_DWORD *)v53 = state;
          v11 = v15;
          v12 = " [%s] %s:%d %@ Process state: %@ (%d)";
          v13 = 54;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v6 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioRelayIOController performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", self->_state);
          v10 = self->_state;
          *(_DWORD *)buf = 136316930;
          v43 = v7;
          v44 = 2080;
          v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
          v46 = 1024;
          v47 = 720;
          v48 = 2112;
          v49 = (VCAudioRelayIOController *)v6;
          v50 = 2048;
          v51 = self;
          v52 = 2112;
          *(_QWORD *)v53 = self;
          *(_WORD *)&v53[8] = 2112;
          *(_QWORD *)&v53[10] = v9;
          *(_WORD *)&v53[18] = 1024;
          v54 = v10;
          v11 = v8;
          v12 = " [%s] %s:%d %@(%p) %@ Process state: %@ (%d)";
          v13 = 74;
LABEL_11:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
        }
      }
    }
    switch(self->_state)
    {
      case 1u:
        v18 = -[VCAudioRelayIOController stateIdleWithControllerSettings:client:newState:](self, "stateIdleWithControllerSettings:client:newState:", v5, v40, &v41);
        goto LABEL_17;
      case 2u:
        v18 = -[VCAudioRelayIOController statePrepareWithControllerSettings:client:newState:](self, "statePrepareWithControllerSettings:client:newState:", v5, v40, &v41);
        goto LABEL_17;
      case 3u:
        v18 = -[VCAudioRelayIOController stateStartingWithControllerSettings:client:newState:](self, "stateStartingWithControllerSettings:client:newState:", v5, v40, &v41);
        goto LABEL_17;
      case 4u:
        v18 = -[VCAudioRelayIOController stateRunningWithControllerSettings:client:newState:](self, "stateRunningWithControllerSettings:client:newState:", v5, v40, &v41);
LABEL_17:
        v19 = v18;
        break;
      default:
        v19 = 1;
        break;
    }
    v20 = v41;
    v21 = self->_state;
    v22 = v41;
    if (v41 != v21)
    {
      if ((VCAudioRelayIOController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", self->_state);
            v38 = self->_state;
            v33 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", v41);
            *(_DWORD *)buf = 136316930;
            v43 = v30;
            v44 = 2080;
            v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
            v46 = 1024;
            v47 = 739;
            v48 = 2112;
            v49 = self;
            v50 = 2112;
            v51 = (VCAudioRelayIOController *)v32;
            v52 = 1024;
            *(_DWORD *)v53 = v38;
            v5 = v39;
            *(_WORD *)&v53[4] = 2112;
            *(_QWORD *)&v53[6] = v33;
            *(_WORD *)&v53[14] = 1024;
            *(_DWORD *)&v53[16] = v41;
            v27 = v31;
            v28 = " [%s] %s:%d %@ State change: %@ (%d) -> %@ (%d)";
            v29 = 70;
LABEL_29:
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
          }
        }
      }
      else
      {
        v23 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v23 = (const __CFString *)-[VCAudioRelayIOController performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v36 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", self->_state);
            v37 = self->_state;
            v26 = objc_msgSend((id)_stateStrings, "objectAtIndexedSubscript:", v41);
            *(_DWORD *)buf = 136317442;
            v43 = v24;
            v44 = 2080;
            v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
            v46 = 1024;
            v47 = 739;
            v48 = 2112;
            v49 = (VCAudioRelayIOController *)v23;
            v50 = 2048;
            v51 = self;
            v52 = 2112;
            *(_QWORD *)v53 = self;
            *(_WORD *)&v53[8] = 2112;
            *(_QWORD *)&v53[10] = v36;
            v5 = v39;
            *(_WORD *)&v53[18] = 1024;
            v54 = v37;
            v55 = 2112;
            v56 = v26;
            v57 = 1024;
            v58 = v41;
            v27 = v25;
            v28 = " [%s] %s:%d %@(%p) %@ State change: %@ (%d) -> %@ (%d)";
            v29 = 90;
            goto LABEL_29;
          }
        }
      }
      v22 = v41;
    }
    self->_state = v22;
  }
  while (v20 != v21 && v19);

  return v19;
}

- (void)processEventQueue:(AudioEventQueue_t *)a3 clientList:(id)a4
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = 0;
  v6 = 0.0;
  if (VRTraceIsInternalOSInstalled())
    v6 = micro();
  v7 = VCAudioEventQueue_Dequeue((int *)a3, (uint64_t)&v17);
  for (i = 0; (_DWORD)v7; ++i)
  {
    v16 = v18;
    if (v18)
    {
      if ((_DWORD)v17 == 2)
      {
        objc_msgSend(a4, "removeObject:", v18);
        goto LABEL_9;
      }
      if ((_DWORD)v17 == 1)
      {
        objc_msgSend(a4, "addObject:", v18);
LABEL_9:

      }
    }
    LODWORD(v17) = 0;
    v18 = 0;
    v7 = VCAudioEventQueue_Dequeue((int *)a3, (uint64_t)&v17);
  }
  LogProfileTimeOverLimit(v6, v7, v8, v9, v10, v11, v12, v13, v14, (char)"-[VCAudioRelayIOController processEventQueue:clientList:]");
}

- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3
{
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int i;

  v4 = 0.0;
  if (VRTraceIsInternalOSInstalled())
    v4 = micro();
  v5 = (void *)CMSimpleQueueDequeue(a3);
  for (i = 0; v5; v5 = (void *)CMSimpleQueueDequeue(a3))
  {
    ++i;
    free(v5);
  }
  LogProfileTimeOverLimit(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, (char)"-[VCAudioRelayIOController flushEventQueue:]");
}

- (void)startClient:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__VCAudioRelayIOController_startClient___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __40__VCAudioRelayIOController_startClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "addClient:", *(_QWORD *)(a1 + 40)))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "updateStateWithClient:", *(_QWORD *)(a1 + 40));
    if ((result & 1) != 0)
      return result;
    objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "updateStateWithClient:", 0);
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStart:error:", 0, 0);
}

- (void)stopClient:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__VCAudioRelayIOController_stopClient___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __39__VCAudioRelayIOController_stopClient___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", 0, 0);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", objc_msgSend(*(id *)(a1 + 32), "updateStateWithClient:", 0), 0);
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  objc_msgSend(a3, "setDirection:", a4->var0);
  objc_msgSend(a3, "setSpatialAudioDisabled:", a4->var1);
  objc_msgSend(a3, "setIsVoiceActivityEnabled:", a4->var2);
  objc_msgSend(a3, "setIsMediaPriorityEnabled:", a4->var3);
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  _VCRemoteCodecInfo v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VCAudioRelayIOController_didUpdateBasebandCodec___block_invoke;
  v4[3] = &unk_1E9E52910;
  v4[4] = self;
  v5 = *a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __51__VCAudioRelayIOController_didUpdateBasebandCodec___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    v6 = a1 + 40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "delegate"), "didUpdateBasebandCodec:", v6);
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerClientIO:controllerIO:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterClientIO:controllerIO:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)handleTransitionPrepareToStarting
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioRelayIOController.m:%d: Failed to allocate secondary buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
