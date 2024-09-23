@implementation VCMediaStreamManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_1 != -1)
    dispatch_once(&defaultManager_onceToken_1, &__block_literal_global_24);
  return (id)_vcStreamManagerManager;
}

void __38__VCMediaStreamManager_defaultManager__block_invoke()
{
  if (!_vcStreamManagerManager)
    _vcStreamManagerManager = objc_alloc_init(VCMediaStreamManager);
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  id v6;

  if (a3)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    if (objc_msgSend(a3, "domain"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), CFSTR("ERROR_DOMAIN"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code")), CFSTR("ERROR_CODE"));
    if (objc_msgSend(a3, "userInfo"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "userInfo"), CFSTR("ERROR_USERINFO"));
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v6, CFSTR("vcMediaStreamError"));

  }
}

- (VCMediaStreamManager)init
{
  VCMediaStreamManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamManager;
  v2 = -[VCMediaStreamManager init](&v5, sel_init);
  if (v2)
  {
    v2->streamArray = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v2->_vcMomentsCollectorDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->xpcQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaStreamManager.xpcQueue", 0, CustomRootQueue);
    pthread_mutex_init(&v2->stateLock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamManager deregisterBlocksForService](self, "deregisterBlocksForService");

  dispatch_release((dispatch_object_t)self->xpcQueue);
  pthread_mutex_destroy(&self->stateLock);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamManager;
  -[VCMediaStreamManager dealloc](&v3, sel_dealloc);
}

- (VCMediaStreamManager)allocWithZone:(_NSZone *)a3
{
  return (VCMediaStreamManager *)_vcStreamManagerManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)pauseStreams:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *global_queue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1DF088A10](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCMediaStreamManager pauseStreams:]";
      v15 = 1024;
      v16 = 125;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isPause[%d] begin", buf, 0x22u);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__VCMediaStreamManager_pauseStreams___block_invoke;
  v9[3] = &unk_1E9E521E8;
  v9[4] = self;
  v10 = v3;
  dispatch_async(global_queue, v9);
  objc_autoreleasePoolPop(v5);
}

void __37__VCMediaStreamManager_pauseStreams___block_invoke(uint64_t a1)
{
  id v2;
  size_t v3;
  NSObject *global_queue;
  _QWORD block[5];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_msgSend(v2, "count");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCMediaStreamManager_pauseStreams___block_invoke_2;
  block[3] = &unk_1E9E544C8;
  block[4] = v2;
  v6 = *(_BYTE *)(a1 + 40);
  dispatch_apply(v3, global_queue, block);
}

uint64_t __37__VCMediaStreamManager_pauseStreams___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2), "setPause:", *(unsigned __int8 *)(a1 + 40));
}

- (void)vcMediaStreamServerDidDie:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *xpcQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCMediaStreamManager vcMediaStreamServerDidDie:]";
      v13 = 1024;
      v14 = 150;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Server process died reported by stream=%p", buf, 0x26u);
    }
  }
  xpcQueue = self->xpcQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCMediaStreamManager_vcMediaStreamServerDidDie___block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

uint64_t __50__VCMediaStreamManager_vcMediaStreamServerDidDie___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidServerDie", 0, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)vcMediaStreamDidInterruptionBegin:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidInterruptionBegin", 0, a3);
}

- (void)vcMediaStreamDidInterruptionEnd:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidInterruptionEnd", 0, a3);
}

- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v4), CFSTR("vcMediaStreamDTMFDigitReceived"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDTMFDigitReceived", v7, a3);

}

- (void)vcMediaStream:(id)a3 didReceiveTTYCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4), CFSTR("vcMediaStreamTTYCharacterReceived"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamTTYCharacterReceived", v7, a3);

}

- (void)vcMediaStream:(id)a3 didReceiveText:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a4, CFSTR("vcMediaStreamTextReceived"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamTextReceived", v5, a3);

}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamRTPPacketTimeout", 0, a3);
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamRTCPPacketTimeout", 0, a3);
}

- (void)vcMediaStreamDidRecoverFromRTCPTimeOut:(id)a3
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidRecoverFromRTCPTimeout", 0, a3);
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("vcMediaStreamRTCPPackets"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamRTCPPacketsReceived", v5, a3);

}

- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("vcMediaStreamDownlinkQualityInfo"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDownlinkQualityDidChange", v5, a3);

}

- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("vcMediaStreamUplinkQualityInfo"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamUplinkQualityDidChange", v5, a3);

}

- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;

  v8 = a4;
  v10 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcMediaStreamDidUpdateVideoConfiguration"), 0);
  +[VCMediaStreamManager addNSError:toXPCArgumentDictionary:](VCMediaStreamManager, "addNSError:toXPCArgumentDictionary:", a5, v11);
  if (v8)
  {
    if (a6)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", a6, CFSTR("vcMediaStreamUpdatedVideoConfiguration"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamManager vcMediaStream:didUpdateVideoConfiguration:error:dictionary:].cold.1();
    }
  }
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidUpdateVideoConfiguration", v11, a3);

}

- (id)videoStreamWithSyncToken:(int64_t)a3
{
  NSMutableArray *streamArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  streamArray = self->streamArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v15;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v7)
      objc_enumerationMutation(streamArray);
    v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F01E66A8))
      {
        v10 = objc_msgSend((id)objc_msgSend(v9, "defaultStreamConfig"), "syncSource");
        if (v10)
        {
          v11 = (void *)v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "streamToken") == a3)
            return v9;
        }
      }
    }
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)cleanupStreamSyncSourceForVideoStream:(id)a3 andAudioStream:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "stopSynchronization");
    objc_msgSend((id)objc_msgSend(a3, "defaultStreamConfig"), "setSyncSource:", 0);
    objc_msgSend(a4, "setMomentsCollectorDelegate:", 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v8 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        else
          v8 = "<nil>";
        v9 = 136316162;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCMediaStreamManager cleanupStreamSyncSourceForVideoStream:andAudioStream:]";
        v13 = 1024;
        v14 = 278;
        v15 = 2080;
        v16 = v8;
        v17 = 2080;
        v18 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removed stream=%s as sync source for stream=%s delegates", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStreamManager cleanupStreamSyncSourceForVideoStream:andAudioStream:].cold.1();
  }
}

- (id)textStreamWithStreamToken:(int64_t)a3
{
  NSMutableArray *streamArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  streamArray = self->streamArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(streamArray);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "streamToken") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)addSyncSourceToVideoStreamConfig:(id)a3 sourceStreamToken:(int64_t)a4 error:(id *)a5
{
  VCMediaStreamManager *v8;
  NSMutableArray *streamArray;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const __CFString *v17;
  uint64_t v18;
  char IsOSFaultDisabled;
  NSObject *v20;
  VCMediaStreamManager *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCMediaStreamManager *v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v8 = self;
  v37 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  streamArray = self->streamArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v10)
  {
    v11 = v10;
    v21 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(streamArray);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v15, "conformsToProtocol:", &unk_1F01D5D00)
          && objc_msgSend(v15, "streamToken") == a4)
        {
          objc_msgSend(a3, "setSyncSource:", v15);
          v12 = 1;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamArray, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v11);
    v8 = v21;
    if ((v12 & 1) != 0)
      return 1;
  }
  if ((VCMediaStreamManager *)objc_opt_class() == v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:].cold.2();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCMediaStreamManager performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v20 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v18;
          v24 = 2080;
          v25 = "-[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]";
          v26 = 1024;
          v27 = 307;
          v28 = 2112;
          v29 = v17;
          v30 = 2048;
          v31 = v8;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed configure stream synchronization", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136316162;
        v23 = v18;
        v24 = 2080;
        v25 = "-[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]";
        v26 = 1024;
        v27 = 307;
        v28 = 2112;
        v29 = v17;
        v30 = 2048;
        v31 = v8;
        _os_log_fault_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Failed configure stream synchronization", buf, 0x30u);
      }
    }
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 311), CFSTR("Invalid synchronization source token"), CFSTR("Failed to set synchronization source"));
  return 0;
}

- (void)stopStream:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->xpcQueue);
  objc_msgSend(a3, "stop");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidStopConnection", 0, a3);
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke;
  v16[3] = &unk_1E9E53848;
  v16[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeAudio", v16, self->xpcQueue);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_148;
  v15[3] = &unk_1E9E544F0;
  v15[4] = v3;
  v15[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceInitialize", v15, self->xpcQueue);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151;
  v14[3] = &unk_1E9E544F0;
  v14[4] = v3;
  v14[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualRTTDeviceInitialize", v14, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceSendCharacter", &__block_literal_global_156, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceSendText", &__block_literal_global_158, self->xpcQueue);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3;
  v13[3] = &unk_1E9E53848;
  v13[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceTerminate", v13, self->xpcQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_4;
  v12[3] = &unk_1E9E53848;
  v12[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamTerminateAudio", v12, self->xpcQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166;
  v11[3] = &unk_1E9E544F0;
  v11[4] = v3;
  v11[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetSessionConfig", v11, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSendDTMFEvent", &__block_literal_global_189, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStopSendDTMFEvent", &__block_literal_global_192, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetVolume", &__block_literal_global_195, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStartConference", &__block_literal_global_200, self->xpcQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_205;
  v10[3] = &unk_1E9E53848;
  v10[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStopConference", v10, self->xpcQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_207;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStartSynchronization", v9, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetPause", &__block_literal_global_213, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamUpdateVideoConfig", &__block_literal_global_224, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetStreamDirection", &__block_literal_global_227, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetJitterBufferMode", &__block_literal_global_232, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPEnabled", &__block_literal_global_237, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTPTimeoutEnabled", &__block_literal_global_242, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPTimeoutEnabled", &__block_literal_global_247, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTPTimeoutInterval", &__block_literal_global_252, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPTimeoutInterval", &__block_literal_global_257, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPSendInterval", &__block_literal_global_262, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamGetInputFrequencyMeteringEnabled", &__block_literal_global_267, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetInputFrequencyMeteringEnabled", &__block_literal_global_272, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamGetOutputFrequencyMeteringEnabled", &__block_literal_global_275, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetOutputFrequencyMeteringEnabled", &__block_literal_global_280, self->xpcQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_282;
  v8[3] = &unk_1E9E53848;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeVideo", v8, self->xpcQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_285;
  v7[3] = &unk_1E9E53848;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamTerminateVideo", v7, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamRequestLastDecodedFrame", &__block_literal_global_288, self->xpcQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_290;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeText", v6, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __48__VCMediaStreamManager_registerBlocksForService__block_invoke_293, &unk_1E9E53848, self), "registerBlockForService:block:queue:", "vcMediaStreamTerminateText", &v5, self->xpcQueue);
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  VCAudioStream *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  VCAudioStream *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
  v8 = -[VCAudioStream initWithClientPid:]([VCAudioStream alloc], "initWithClientPid:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v8);
  -[VCMediaStream setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[VCMediaStream setDelegateFunctions:](v8, "setDelegateFunctions:", _VCMediaStreamManager_UpdateFrequencyLevel);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v9;
      v18 = 2080;
      v19 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v20 = 1024;
      v21 = 346;
      v22 = 2048;
      v23 = v8;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new VCAudioStream %p", buf, 0x26u);
    }
  }
  v11 = -[VCAudioStream setLocalParticipantInfo:networkSockets:withError:](v8, "setLocalParticipantInfo:networkSockets:withError:", v7, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")), a3);
  v6 = 0;
  if (v8)
  {
    v12 = v11;
    if (v11)
    {
      v15[0] = v8;
      v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStream streamToken](v8, "streamToken", CFSTR("CONTEXT"), CFSTR("vcMediaStreamToken")));
      v14[2] = CFSTR("vcMediaStreamTokenUplink");
      v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStream streamTokenUplink](v8, "streamTokenUplink"));
      v14[3] = CFSTR("vcMediaStreamTokenDownlink");
      v14[4] = CFSTR("vcMediaStreamStreamCapabilities");
      v15[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStream streamTokenDownlink](v8, "streamTokenDownlink"));
      v15[4] = v12;
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    }
  }

  return v6;
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  VCVirtualTTYDevice *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCVirtualTTYDevice *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (int)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")), "intValue");
  v7 = -[VCVirtualTTYDevice initWithMode:clientPid:]([VCVirtualTTYDevice alloc], "initWithMode:clientPid:", v6, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObject:", v7);
  -[VCVirtualTTYDevice setDelegate:](v7, "setDelegate:", v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v16 = 1024;
      v17 = 374;
      v18 = 2048;
      v19 = v7;
      v20 = 2048;
      v21 = v6;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new virtual TTY device %p with mode %ld", buf, 0x30u);
    }
  }
  if (v7)
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), 0);
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v5 = v10;

  return v5;
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  VCVirtualTextDevice *v8;
  VCVirtualTextDevice *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(v4, "textStreamWithStreamToken:", (int)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")), "intValue"));
    v12[0] = _VCMediaStreamManager_UpdateFrequencyLevel;
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]([VCVirtualTextDevice alloc], "initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:", v6, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"), v4, v12, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v7, "setReceiveDelegate:", v8);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObject:", v9);
        v10 = objc_alloc(MEMORY[0x1E0C99D80]);
        v5 = (id)objc_msgSend(v10, "initWithObjectsAndKeys:", v9, CFSTR("CONTEXT"), 0, v12[0]);
LABEL_13:

        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151_cold_2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151_cold_1();
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v9 = 0;
    goto LABEL_13;
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_155(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "sendCharacter:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")), "intValue"));
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "sendText:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")));
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "stop");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v6);
  }
  return v4;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_4";
        v17 = 1024;
        v18 = 470;
        v19 = 2048;
        v20 = v7;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream releasing old VCAudioStream[%p]", buf, 0x26u);
      }
    }
    v10 = objc_msgSend(*(id *)(a1 + 32), "videoStreamWithSyncToken:", objc_msgSend(v7, "streamToken"));
    if (v4)
      v11 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32039, 0, CFSTR("Client Died"));
    else
      v11 = 0;
    objc_msgSend(v7, "stopWithError:", v11);
    objc_msgSend(*(id *)(a1 + 32), "cleanupStreamSyncSourceForVideoStream:andAudioStream:", v10, v7);
    objc_msgSend(v7, "startDeallocTimer");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v7);
  }
  return v5;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  __objc2_class **v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  VCVideoStreamConfig *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char IsOSFaultDisabled;
  NSObject *v25;
  uint64_t v26;
  objc_class *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_class *v34;
  VCVideoStreamConfig *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *Name;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = off_1E9E4D5F0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = -[VCDefaults forceVideoStreamPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoStreamPayload");
        v11 = v10;
        if ((_DWORD)v10 == 123 || (_DWORD)v10 == 100)
        {
          v12 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v11)), CFSTR("vcMediaStreamTXCodecType"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v11)), CFSTR("vcMediaStreamRXCodecType"));
          v13 = -[VCVideoStreamConfig initWithClientDictionary:]([VCVideoStreamConfig alloc], "initWithClientDictionary:", v12);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v38 = v14;
              v39 = 2080;
              v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
              v41 = 1024;
              v42 = 503;
              v43 = 1024;
              LODWORD(v44) = v11;
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing video payload to %d", buf, 0x22u);
            }
          }

        }
        else
        {
          v13 = -[VCVideoStreamConfig initWithClientDictionary:]([VCVideoStreamConfig alloc], "initWithClientDictionary:", v7);
        }
        if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSyncStreamToken"))
          && objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSyncStreamToken")), "integerValue")&& (objc_msgSend(v8, "addSyncSourceToVideoStreamConfig:sourceStreamToken:error:", v13, objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSyncStreamToken")), "integerValue"), a3) & 1) == 0)
        {
          goto LABEL_16;
        }
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_class() == *(_QWORD *)(a1 + 40))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if ((VRTraceIsOSFaultDisabled() & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_3();
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            {
              __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_4();
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
          else
            v17 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
            v25 = *MEMORY[0x1E0CF2758];
            if ((IsOSFaultDisabled & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v26 = *(_QWORD *)(a1 + 40);
                v27 = (objc_class *)objc_opt_class();
                *(_DWORD *)buf = 136316418;
                v38 = v23;
                v39 = 2080;
                v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
                v41 = 1024;
                v42 = 522;
                v43 = 2112;
                v44 = v17;
                v45 = 2048;
                v46 = v26;
                v47 = 2080;
                Name = class_getName(v27);
                _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected stream type [%s]", buf, 0x3Au);
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            {
              v33 = *(_QWORD *)(a1 + 40);
              v34 = (objc_class *)objc_opt_class();
              *(_DWORD *)buf = 136316418;
              v38 = v23;
              v39 = 2080;
              v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
              v41 = 1024;
              v42 = 522;
              v43 = 2112;
              v44 = v17;
              v45 = 2048;
              v46 = v33;
              v47 = 2080;
              Name = class_getName(v34);
              _os_log_fault_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Unexpected stream type [%s]", buf, 0x3Au);
            }
          }
        }
        v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 526);
        v29 = CFSTR("Unexpected stream type");
        v30 = CFSTR("setStreamConfig called on an unsupported object");
        v31 = a3;
        v32 = 32016;
        goto LABEL_56;
      }
      v9 = off_1E9E4D668;
    }
    v13 = (VCVideoStreamConfig *)objc_msgSend(objc_alloc(*v9), "initWithClientDictionary:", v7);
LABEL_14:
    if (v13)
    {
      v36 = v13;
      objc_msgSend(v6, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1), a3);
LABEL_16:

      return 0;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_1();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_2();
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = VRTraceIsOSFaultDisabled();
        v20 = *MEMORY[0x1E0CF2758];
        if ((v19 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v21 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136316162;
            v38 = v18;
            v39 = 2080;
            v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
            v41 = 1024;
            v42 = 534;
            v43 = 2112;
            v44 = v16;
            v45 = 2048;
            v46 = v21;
            _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate stream config", buf, 0x30u);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          v22 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          v38 = v18;
          v39 = 2080;
          v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
          v41 = 1024;
          v42 = 534;
          v43 = 2112;
          v44 = v16;
          v45 = 2048;
          v46 = v22;
          _os_log_fault_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Failed to allocate stream config", buf, 0x30u);
        }
      }
    }
    v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 538);
    v29 = CFSTR("Stream config allocation failure");
    v30 = CFSTR("Failed to allocate the stream configuration");
    v31 = a3;
    v32 = 32015;
LABEL_56:
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v31, v32, 105, v28, v29, v30);
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_188(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "sendDTMFEvent:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")));
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_191(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "stopSendDTMFEvent");
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_194(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamVolume")), "floatValue");
      objc_msgSend(v3, "setVolume:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_194_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_199(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(v3, "start");
    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 == 0), CFSTR("vcMediaStreamConnectionStarted"), 0);
    +[VCMediaStreamManager addNSError:toXPCArgumentDictionary:](VCMediaStreamManager, "addNSError:toXPCArgumentDictionary:", v4, v6);
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidStartConnection", v6, v3);

  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_205(uint64_t a1, void *a2)
{
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F01D5D00))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "cleanupStreamSyncSourceForVideoStream:andAudioStream:", objc_msgSend(*(id *)(a1 + 32), "videoStreamWithSyncToken:", objc_msgSend(v4, "streamToken")), v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "stopStream:", v4);
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_207(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F01D5D00)
      && (v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")),
          v36 = 0u,
          v37 = 0u,
          v38 = 0u,
          v39 = 0u,
          v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72),
          (v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16)) != 0))
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F01E66A8))
          {
            v12 = objc_msgSend(v11, "streamToken");
            if (v12 == objc_msgSend(v5, "integerValue"))
              break;
          }
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "startSynchronization:", v4);
      objc_msgSend(v4, "setMomentsCollectorDelegate:", objc_msgSend(v11, "momentsCollectorDelegate"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7
        && (v14 = VRTraceErrorLogLevelToCSTR(),
            v15 = *MEMORY[0x1E0CF2758],
            os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
        *(_DWORD *)buf = 136316418;
        v24 = v14;
        v25 = 2080;
        v26 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_3";
        v27 = 1024;
        v28 = 638;
        v29 = 2048;
        v30 = (const char *)v4;
        v31 = 2048;
        v32 = v11;
        v33 = 2048;
        v34 = objc_msgSend(v11, "momentsCollectorDelegate");
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream setMomentsCollectorDelegate for audioStream=%p: videostream=%p, delegate=%p", buf, 0x3Au);
        if ((v13 & 1) == 0)
          goto LABEL_17;
      }
      else if (!v13)
      {
        goto LABEL_17;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (v4)
            v22 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
          else
            v22 = "<nil>";
          *(_DWORD *)buf = 136315906;
          v24 = v20;
          v25 = 2080;
          v26 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
          v27 = 1024;
          v28 = 645;
          v29 = 2080;
          v30 = v22;
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s startSynchronization succeeded", buf, 0x26u);
        }
      }
      v16 = 1;
    }
    else
    {
LABEL_17:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_207_cold_1();
      }
      v16 = 0;
    }
    v17 = objc_alloc(MEMORY[0x1E0C99E08]);
    v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16), CFSTR("vcMediaStreamSynchronizationStarted"), 0);
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidStartSynchronization", v18, v4);

  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_212(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  const char *v10;
  void *v11;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPauseState")), "BOOLValue");
      v6 = objc_msgSend(v3, "setPause:", v5);
      v7 = objc_alloc(MEMORY[0x1E0C99E08]);
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 == 0);
      v9 = CFSTR("vcMediaStreamResumed");
      if ((_DWORD)v5)
      {
        v9 = CFSTR("vcMediaStreamPaused");
        v10 = "vcMediaStreamDidPause";
      }
      else
      {
        v10 = "vcMediaStreamDidResume";
      }
      v11 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, 0);
      +[VCMediaStreamManager addNSError:toXPCArgumentDictionary:](VCMediaStreamManager, "addNSError:toXPCArgumentDictionary:", v6, v11);
      objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", v10, v11, v3);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_212_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_223(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "updateVideoConfig:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")));
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_226(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setStreamDirection:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDirection")), "integerValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_226_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_231(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setJitterBufferMode:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamJitterBufferMode")), "integerValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_231_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_236(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setRtcpEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPEnabled")), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_236_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_241(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setRtpTimeOutEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutEnabled")), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_241_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_246(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setRtcpTimeOutEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutEnabled")), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_246_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_251(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutInterval")), "doubleValue");
      objc_msgSend(v3, "setRtpTimeOutInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_251_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_256(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutInterval")), "doubleValue");
      objc_msgSend(v3, "setRtcpTimeOutInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_256_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_261(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPSendInterval")), "doubleValue");
      objc_msgSend(v3, "setRtcpSendInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_261_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_266(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isFrequencyMeteringEnabled:", 0));
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("vcMediaStreamInputFreqMeterEnabled"), 0);
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_271(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setFrequencyMeteringEnabled:meterType:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamInputFreqMeterEnabled")), "BOOLValue"), 0);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_271_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_274(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isFrequencyMeteringEnabled:", 1));
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("vcMediaStreamOutputFreqMeterEnabled"), 0);
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_279(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary"));
    if (v4)
    {
      objc_msgSend(v3, "setFrequencyMeteringEnabled:meterType:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcMediaStreamOutputFreqMeterEnabled")), "BOOLValue"), 1);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_279_cold_1();
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_282(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  VCVideoStream *v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v7 = objc_alloc_init(VCVideoStream);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v7);
  -[VCMediaStream setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[VCMediaStream setDelegateFunctions:](v7, "setDelegateFunctions:", _VCMediaStreamManager_UpdateFrequencyLevel);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v20 = v10;
      v21 = 2080;
      v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v23 = 1024;
      v24 = 879;
      v25 = 2048;
      v26 = (uint64_t)v7;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new VCVideoStream %p", buf, 0x26u);
    }
  }
  v12 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](v7, "setLocalParticipantInfo:networkSockets:withError:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")), objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")), a3);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStream streamToken](v7, "streamToken"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), v13, CFSTR("vcMediaStreamToken"), v12, CFSTR("vcMediaStreamStreamCapabilities"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[VCMediaStream streamToken](v7, "streamToken");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 136316162;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v23 = 1024;
      v24 = 894;
      v25 = 2048;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream created momentsCollector for video stream %ld. vcMomentsCollectorDictionary=%@", buf, 0x30u);
    }
  }

  return v6;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_285(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "streamToken")));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v7, "streamToken");
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
        *(_DWORD *)buf = 136316418;
        v15 = v8;
        v16 = 2080;
        v17 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
        v18 = 1024;
        v19 = 919;
        v20 = 2048;
        v21 = v7;
        v22 = 2048;
        v23 = v10;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream releasing old VCVideoStream %p. Removed momentsCollector for video stream %ld, vcMomentsCollectorDictionary=%@", buf, 0x3Au);
      }
    }
    if (v4)
      v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32039, 0, CFSTR("Client Died"));
    else
      v12 = 0;
    objc_msgSend(v7, "stopWithError:", v12);
    objc_msgSend(v7, "startDeallocTimer");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v7);
  }
  return v5;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_287(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "requestLastDecodedFrame");
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_290(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  VCTextStream *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  VCTextStream *v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *Name;
  __int16 v30;
  VCTextStream *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  VCTextStream *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v7 = objc_alloc_init(VCTextStream);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v7);
    -[VCMediaStream setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 32));
    -[VCMediaStream setDelegateFunctions:](v7, "setDelegateFunctions:", _VCMediaStreamManager_UpdateFrequencyLevel);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_14;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v11 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316162;
      v23 = v9;
      v24 = 2080;
      v25 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_2";
      v26 = 1024;
      v27 = 955;
      v28 = 2080;
      Name = class_getName(v11);
      v30 = 2048;
      v31 = v7;
      v12 = " [%s] %s:%d Allocated new %s(%p)";
      v13 = v10;
      v14 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_14;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v17 = *(VCTextStream **)(a1 + 32);
      v18 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316674;
      v23 = v15;
      v24 = 2080;
      v25 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v26 = 1024;
      v27 = 955;
      v28 = 2112;
      Name = (const char *)v8;
      v30 = 2048;
      v31 = v17;
      v32 = 2080;
      v33 = class_getName(v18);
      v34 = 2048;
      v35 = v7;
      v12 = " [%s] %s:%d %@(%p) Allocated new %s(%p)";
      v13 = v16;
      v14 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_14:
    v19 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](v7, "setLocalParticipantInfo:networkSockets:withError:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDictionary")), objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")), a3);
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStream streamToken](v7, "streamToken"));
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), v20, CFSTR("vcMediaStreamToken"), v19, CFSTR("vcMediaStreamStreamCapabilities"), 0);

    return v6;
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_293(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *Name;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_16;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v10 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316418;
      v20 = v8;
      v21 = 2080;
      v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v23 = 1024;
      v24 = 984;
      v25 = 2080;
      Name = class_getName(v10);
      v27 = 2048;
      v28 = v6;
      v29 = 2048;
      v30 = (const char *)objc_msgSend(v6, "streamToken");
      v11 = " [%s] %s:%d Releasing old %s(%p) stream:%ld ";
      v12 = v9;
      v13 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_16;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v16 = *(void **)(a1 + 32);
      v17 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316930;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      v23 = 1024;
      v24 = 984;
      v25 = 2112;
      Name = (const char *)v7;
      v27 = 2048;
      v28 = v16;
      v29 = 2080;
      v30 = class_getName(v17);
      v31 = 2048;
      v32 = v6;
      v33 = 2048;
      v34 = objc_msgSend(v6, "streamToken");
      v11 = " [%s] %s:%d %@(%p) Releasing old %s(%p) stream:%ld ";
      v12 = v15;
      v13 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_16:
    objc_msgSend(v6, "stop");
    objc_msgSend(v6, "startDeallocTimer");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", v6);
  }
  return v4;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetVolume");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamRequestLastDecodedFrame");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateVideo");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeVideo");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetOutputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamGetOutputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetInputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamGetInputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPSendInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTPTimeoutEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPTimeoutEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTPTimeoutInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPTimeoutInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetStreamDirection");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamUpdateVideoConfig");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetPause");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStartSynchronization");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStopConference");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStartConference");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStopSendDTMFEvent");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSendDTMFEvent");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetSessionConfig");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateAudio");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceTerminate");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceSendCharacter");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceSendText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualRTTDeviceInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeAudio");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetJitterBufferMode");
}

- (void)vcMediaStream:didUpdateVideoConfiguration:error:dictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream didUpdateVideoConfiguration configDict is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanupStreamSyncSourceForVideoStream:andAudioStream:.cold.1()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14_2();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "streamToken");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v5 = 270;
  v6 = 2048;
  v7 = v2;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, " [%s] %s:%d Unable to clean up video stream for audio sync token=%ld", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)addSyncSourceToVideoStreamConfig:sourceStreamToken:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed configure stream synchronization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addSyncSourceToVideoStreamConfig:sourceStreamToken:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed configure stream synchronization", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Couldn't find text stream for stream token %ld", v1);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_151_cold_2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Text device for stream token %ld", v1);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_3()
{
  NSObject *v0;
  objc_class *v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  v1 = (objc_class *)OUTLINED_FUNCTION_13_1(*MEMORY[0x1E0C80C00]);
  class_getName(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unexpected stream type [%s]", v3);
  OUTLINED_FUNCTION_3_0();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_166_cold_4()
{
  NSObject *v0;
  objc_class *v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_14_2();
  v1 = (objc_class *)OUTLINED_FUNCTION_13_1(*MEMORY[0x1E0C80C00]);
  class_getName(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_6();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unexpected stream type [%s]", v2, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_194_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set volume nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_207_cold_1()
{
  NSObject *v0;
  void *v1;
  __int16 v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14_2();
  v11 = *MEMORY[0x1E0C80C00];
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  v6 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
  v7 = 1024;
  v8 = 647;
  v9 = v2;
  v10 = v3;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v4, " [%s] %s:%d %s startSynchronization failed", v5);
  OUTLINED_FUNCTION_3_0();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_212_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set PAUSE state, nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_226_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set stream direction nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_231_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set stream jitter buffer mode nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_236_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpEnabled nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_241_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtpTimeOutEnabled nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_246_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpTimeOutEnabled nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_251_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtpTimeOutInterval nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_256_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpTimeOutInterval nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_261_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpSendInterval nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_271_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set 'input frequency meter enabled' nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_279_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaStream failed to set 'output frequency meter enabled' nil xpcDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
