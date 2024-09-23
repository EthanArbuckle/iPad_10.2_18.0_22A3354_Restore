@implementation VCAudioClientManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_85);
  return (id)sharedInstance__vcAudioClientManager;
}

void __38__VCAudioClientManager_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcAudioClientManager)
    sharedInstance__vcAudioClientManager = objc_alloc_init(VCAudioClientManager);
}

- (VCAudioClientManager)init
{
  VCAudioClientManager *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioClientManager;
  v2 = -[VCAudioClientManager init](&v5, sel_init);
  if (v2)
  {
    v2->_clientList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioClientManager.XPCCommandQueue", 0, CustomRootQueue);
    -[VCAudioClientManager registerForMutedTalkerNotfications](v2, "registerForMutedTalkerNotfications");
    -[VCAudioClientManager registerMuteStateChangedHandler](v2, "registerMuteStateChangedHandler");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCAudioClientManager unregisterMuteStateChangedHandler](self, "unregisterMuteStateChangedHandler");
  -[VCAudioClientManager unregisterFromMutedTalkerNotfications](self, "unregisterFromMutedTalkerNotfications");
  -[VCAudioClientManager unregisterBlocksForService](self, "unregisterBlocksForService");
  dispatch_release((dispatch_object_t)self->_xpcCommandQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioClientManager;
  -[VCAudioClientManager dealloc](&v3, sel_dealloc);
}

- (id)getAudioClientWithProcessId:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  BOOL v7;
  VCAudioClient *v8;
  VCAudioClient *v9;

  if (a3)
  {
    v4 = a4;
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_clientList, "objectForKeyedSubscript:"))
      v7 = 1;
    else
      v7 = !v4;
    if (v7)
      return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clientList, "objectForKeyedSubscript:", a3);
    v8 = -[VCAudioClient initWithProcessId:]([VCAudioClient alloc], "initWithProcessId:", objc_msgSend(a3, "intValue"));
    if (v8)
    {
      v9 = v8;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientList, "setObject:forKeyedSubscript:", v8, a3);

      return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clientList, "objectForKeyedSubscript:", a3);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioClientManager getAudioClientWithProcessId:create:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioClientManager getAudioClientWithProcessId:create:].cold.1();
  }
  return 0;
}

- (id)handleRegisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "setIsMutedTalkerNotificationRegistered:", 1, a4);
  }
  else if (a4)
  {
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("Audio client not registered"));
  }
  return 0;
}

- (id)handleUnregisterMutedTalkerNotificationForAudioClient:(id)a3 error:(id *)a4
{
  if (a3)
  {
    objc_msgSend(a3, "setIsMutedTalkerNotificationRegistered:", 0, a4);
  }
  else if (a4)
  {
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("Audio client not registered"));
  }
  return 0;
}

- (void)handleMutedTalkerNotification:(unsigned int)a3
{
  NSObject *xpcCommandQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCAudioClientManager_handleMutedTalkerNotification___block_invoke;
  block[3] = &unk_1E9E52300;
  v5 = a3;
  block[4] = self;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __54__VCAudioClientManager_handleMutedTalkerNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("mutedTalkerNotificationType");
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isMutedTalkerNotificationRegistered"))
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "mutedTalkerNotification", v2, v8);
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerForMutedTalkerNotfications
{
  uint64_t v2;
  id v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v3 = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__VCAudioClientManager_registerForMutedTalkerNotfications__block_invoke;
  v4[3] = &unk_1E9E52260;
  v4[4] = v2;
  objc_msgSend(v3, "registerForMutedTalkerNotification:", v4);
}

uint64_t __58__VCAudioClientManager_registerForMutedTalkerNotfications__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleMutedTalkerNotification:", a2);
}

- (void)unregisterFromMutedTalkerNotfications
{
  objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "unregisterFromMutedTalkerNotification");
}

- (BOOL)dispatchedHandleMuteStateChangedHandlerForAudioClient:(id)a3 enabled:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  BOOL result;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  if (a3)
  {
    if (objc_msgSend(a3, "isMutedStateChangeHandlerRegistered") != v6)
    {
      objc_msgSend(a3, "setIsMutedStateChangeHandlerRegistered:", v6);
      return 1;
    }
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = "NO";
      if (v6)
        v13 = "YES";
      v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Audio client isMutedStateChangeHandlerRegistered already is enabled=%s"), v13);
      v9 = v12;
      v11 = 32000;
      goto LABEL_10;
    }
  }
  else if (a5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = CFSTR("Audio client not registered");
    v11 = 32016;
LABEL_10:
    v14 = (void *)objc_msgSend(v9, "AVConferenceServiceError:detailCode:description:", v11, 0, v10);
    result = 0;
    *a5 = v14;
    return result;
  }
  return 0;
}

- (void)dispatchedHandleMuteStateChanged:(BOOL)a3 reason:(unsigned __int8)a4
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a4;
  v5 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcCommandQueue);
  v19[0] = CFSTR("muteStateChangedMuteState");
  v19[1] = CFSTR("muteStateChangedReason");
  v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)-[NSMutableDictionary allValues](self->_clientList, "allValues");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "isMutedStateChangeHandlerRegistered"))
          objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "muteStateChangedEvent", v7, v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v10);
  }
}

- (void)registerMuteStateChangedHandler
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (VCFeatureFlagManager_UseAvconferenced())
  {
    v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    objc_msgSend(+[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance", MEMORY[0x1E0C809B0], 3221225472, __55__VCAudioClientManager_registerMuteStateChangedHandler__block_invoke, &unk_1E9E57B40, v3, v5), "setMuteStateChangedHandler:delegateQueue:", &v4, self->_xpcCommandQueue);
  }
}

uint64_t __55__VCAudioClientManager_registerMuteStateChangedHandler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "dispatchedHandleMuteStateChanged:reason:", a2, a3);
}

- (void)unregisterMuteStateChangedHandler
{
  if (VCFeatureFlagManager_UseAvconferenced())
    objc_msgSend(+[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance"), "setMuteStateChangedHandler:delegateQueue:", 0, 0);
}

- (id)handleNewClientWithXPCArguments:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  id result;
  id v18;
  uint64_t v19;
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (v8)
  {
    v14 = CFSTR("Audio client is already registered");
    if (a4)
      goto LABEL_8;
    goto LABEL_11;
  }
  v9 = -[VCAudioClientManager getAudioClientWithProcessId:create:](self, "getAudioClientWithProcessId:create:", v7, 1);
  if (!v9)
  {
    v14 = CFSTR("Failed to allocate client");
    if (a4)
    {
LABEL_8:
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32029, 0, v14);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = *a4;
          *(_DWORD *)buf = 136316162;
          v22 = v15;
          v23 = 2080;
          v24 = "-[VCAudioClientManager handleNewClientWithXPCArguments:error:]";
          v25 = 1024;
          v26 = 243;
          v27 = 2112;
          v28 = v7;
          v29 = 2112;
          v30 = v18;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection setup failed for processId=%@ error=%@", buf, 0x30u);
        }
      }
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v10 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = v11;
      v23 = 2080;
      v24 = "-[VCAudioClientManager handleNewClientWithXPCArguments:error:]";
      v25 = 1024;
      v26 = 246;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection setup succeeded for processId=%@", buf, 0x26u);
    }
  }
  v13 = 1;
  v8 = v10;
LABEL_12:
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isMixingVoiceWithMediaEnabled", CFSTR("CONTEXT"), CFSTR("audioClientAudioSessionMixingVoiceWithMedia"), v8));
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 2);
  if (!v13)
    return 0;
  return result;
}

- (id)handleDisconnectWithXPCArguments:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  _BYTE buf[12];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioClientManager handleDisconnectWithXPCArguments:].cold.1();
    }
    return 0;
  }
  v6 = (void *)v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v7;
      v13 = 2080;
      v14 = "-[VCAudioClientManager handleDisconnectWithXPCArguments:]";
      v15 = 1024;
      v16 = 265;
      v17 = 1024;
      v18 = objc_msgSend(v6, "processId");
      v19 = 2112;
      v20 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification that client died, tearing down the audio session (client PID=%d), arguments=%@", buf, 0x2Cu);
    }
  }
  *(_QWORD *)buf = 0;
  objc_msgSend(v6, "stopWithError:", buf);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientList, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "processId")));
  v11 = objc_msgSend(MEMORY[0x1E0C99E38], "null", CFSTR("CONTEXT"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke;
  v9[3] = &unk_1E9E53848;
  v9[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "newClient", v9, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSession", &__block_literal_global_47, self->_xpcCommandQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_79;
  v8[3] = &unk_1E9E53848;
  v8[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "mutedTalkerRegister", v8, self->_xpcCommandQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_81;
  v7[3] = &unk_1E9E53848;
  v7[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "mutedTalkerUnregister", v7, self->_xpcCommandQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __48__VCAudioClientManager_registerBlocksForService__block_invoke_83;
  v6[3] = &unk_1E9E53848;
  v6[4] = v3;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "muteStateChangedHandler", v6, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionVoiceMixing", &__block_literal_global_88, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionFollowSystemInput", &__block_literal_global_92, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "audioSessionFollowSystemOutput", &__block_literal_global_99, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", v4, 3221225472, __48__VCAudioClientManager_registerBlocksForService__block_invoke_103, &unk_1E9E53848, v3), "registerBlockForService:block:queue:", "audioSessionClientDisconnect", &v5, self->_xpcCommandQueue);
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleNewClientWithXPCArguments:error:", a2, a3);
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t *v16;
  const __CFString **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  int ErrorLogLevelForModule;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  _BYTE v66[18];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!v6)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCAudioClientManager_registerBlocksForService__block_invoke_2_cold_1();
    }
    return 0;
  }
  v7 = (void *)v6;
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("setMute")))
  {
    v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientAudioSessionMute")), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = "unmute";
        *(_DWORD *)buf = 136316162;
        v60 = v9;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v61 = 2080;
        if ((_DWORD)v8)
          v11 = "mute";
        v63 = 1024;
        v64 = 303;
        v65 = 2080;
        *(_QWORD *)v66 = v11;
        *(_WORD *)&v66[8] = 2048;
        *(_QWORD *)&v66[10] = v7;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s for client [%p]", buf, 0x30u);
      }
    }
    objc_msgSend(v7, "setIsMuted:", v8);
    goto LABEL_11;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("getMute")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v60 = v13;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 306;
        v65 = 2048;
        *(_QWORD *)v66 = v7;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to GetMute for client[%p]", buf, 0x26u);
      }
    }
    v57 = CFSTR("audioClientAudioSessionMute");
    v58 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isMuted"));
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v58;
    v17 = &v57;
LABEL_49:
    v12 = (void *)objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v53, v54, v55, v56);
    return v12;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("getCurrentAudioInputDevice")))
  {
    if (objc_msgSend(v7, "inputDevice"))
      v18 = objc_msgSend((id)objc_msgSend(v7, "inputDevice"), "UID");
    else
      v18 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v20;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 310;
        v65 = 2112;
        *(_QWORD *)v66 = v18;
        *(_WORD *)&v66[8] = 2048;
        *(_QWORD *)&v66[10] = v7;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to getCurrentAudioInputDevice %@ for client [%p]", buf, 0x30u);
      }
    }
    v55 = CFSTR("audioClientAudioDevice");
    if (!v18)
      v18 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v56 = v18;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v56;
    v17 = &v55;
    goto LABEL_49;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("getCurrentAudioOutputDevice")))
  {
    if (objc_msgSend(v7, "outputDevice"))
      v19 = objc_msgSend((id)objc_msgSend(v7, "outputDevice"), "UID");
    else
      v19 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v30;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 314;
        v65 = 2112;
        *(_QWORD *)v66 = v19;
        *(_WORD *)&v66[8] = 2048;
        *(_QWORD *)&v66[10] = v7;
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to getCurrentAudioOutputDevice %@ for client [%p]", buf, 0x30u);
      }
    }
    v53 = CFSTR("audioClientAudioDevice");
    if (!v19)
      v19 = objc_msgSend(MEMORY[0x1E0C99E38], "null", v53);
    v54 = v19;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v54;
    v17 = &v53;
    goto LABEL_49;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("setCurrentAudioInputDevice")))
  {
    v22 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v23;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 318;
        v65 = 2112;
        *(_QWORD *)v66 = v22;
        *(_WORD *)&v66[8] = 2048;
        *(_QWORD *)&v66[10] = v7;
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to setCurrentAudioInputDevice %@ on client [%p]", buf, 0x30u);
      }
    }
    v25 = +[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", v22);
    objc_msgSend(v7, "setInputDevice:", v25);

    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_11;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v28 = objc_msgSend(v7, "inputDevice");
    if (v28)
      v28 = objc_msgSend((id)objc_msgSend(v7, "inputDevice"), "deviceName");
    *(_DWORD *)buf = 136316162;
    v60 = v26;
    v61 = 2080;
    v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
    v63 = 1024;
    v64 = 322;
    v65 = 2112;
    *(_QWORD *)v66 = v28;
    *(_WORD *)&v66[8] = 2048;
    *(_QWORD *)&v66[10] = v7;
    v29 = " [%s] %s:%d Setting Input Device to [%@] on client [%p]";
    goto LABEL_60;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("setCurrentAudioOutputDevice")))
  {
    v32 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientAudioDevice"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v60 = v33;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 325;
        v65 = 2112;
        *(_QWORD *)v66 = v32;
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to setCurrentAudioOutputDevice %@", buf, 0x26u);
      }
    }
    v35 = +[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", v32);
    objc_msgSend(v7, "setOutputDevice:", v35);

    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_11;
    v36 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v37 = objc_msgSend(v7, "outputDevice");
    if (v37)
      v37 = objc_msgSend((id)objc_msgSend(v7, "outputDevice"), "deviceName");
    *(_DWORD *)buf = 136316162;
    v60 = v36;
    v61 = 2080;
    v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
    v63 = 1024;
    v64 = 329;
    v65 = 2112;
    *(_QWORD *)v66 = v37;
    *(_WORD *)&v66[8] = 2048;
    *(_QWORD *)&v66[10] = v7;
    v29 = " [%s] %s:%d Setting Output Device to [%@] on client[%p]";
LABEL_60:
    v38 = v27;
    v39 = 48;
LABEL_61:
    _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, v29, buf, v39);
    goto LABEL_11;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("setAudioSessionProperties")))
  {
    v40 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientAudioSessionParams"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v41;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 332;
        v65 = 2112;
        *(_QWORD *)v66 = v40;
        *(_WORD *)&v66[8] = 2048;
        *(_QWORD *)&v66[10] = v7;
        _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification for setAudioSessionProperties %@ on client [%p]", buf, 0x30u);
      }
    }
    objc_msgSend(v7, "setAudioSessionProperties:", v40);
    goto LABEL_11;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("resetAudioSessionOutputPortOverride")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v60 = v43;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 336;
        v65 = 2048;
        *(_QWORD *)v66 = v7;
        _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to resetAudioSessionOutputPortOverride for client [%p]", buf, 0x26u);
      }
    }
    objc_msgSend(v7, "resetAudioSessionOutputPortOverride:", a3);
    goto LABEL_11;
  }
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("startAudioSession")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v45;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 339;
        v65 = 1024;
        *(_DWORD *)v66 = objc_msgSend(v7, "processId");
        *(_WORD *)&v66[4] = 2048;
        *(_QWORD *)&v66[6] = v7;
        _os_log_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to startAudioSession (client PID=%d) for client [%p]", buf, 0x2Cu);
      }
    }
    objc_msgSend(v7, "startWithError:", a3);
    goto LABEL_11;
  }
  v47 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("stopAudioSession"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v47)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v60 = v49;
        v61 = 2080;
        v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v63 = 1024;
        v64 = 342;
        v65 = 1024;
        *(_DWORD *)v66 = objc_msgSend(v7, "processId");
        *(_WORD *)&v66[4] = 2048;
        *(_QWORD *)&v66[6] = v7;
        _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to stopAudioSession (client PID=%d) for client [%p]", buf, 0x2Cu);
      }
    }
    objc_msgSend(v7, "stopWithError:", a3);
    goto LABEL_11;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    v51 = VRTraceErrorLogLevelToCSTR();
    v52 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v60 = v51;
      v61 = 2080;
      v62 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      v63 = 1024;
      v64 = 346;
      v65 = 2112;
      *(_QWORD *)v66 = a2;
      v29 = " [%s] %s:%d AVConferenceXPCServer for API_AUDIOSESSION_KEY got bad dictionary=%@";
      v38 = v52;
      v39 = 38;
      goto LABEL_61;
    }
  }
LABEL_11:
  v12 = 0;
  return v12;
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_79(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      v13 = 1024;
      v14 = 354;
      v15 = 2112;
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
      v17 = 2112;
      v18 = a2;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to registerMutedTalkerNotificationBlock for processId=%@ args=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleRegisterMutedTalkerNotificationForAudioClient:error:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), a3);
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_81(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
      v13 = 1024;
      v14 = 365;
      v15 = 2112;
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
      v17 = 2112;
      v18 = a2;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to unregisterMutedTalkerNotificationBlock for processId=%@ args=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleUnregisterMutedTalkerNotificationForAudioClient:error:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), a3);
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_83(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("muteStateChangedEnableHandler")), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 378;
        v16 = 2112;
        v17 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
        v18 = 1024;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got notification to enableMuteStateChangedHandler for processId=%@ handlerEnabled=%{BOOL}d", (uint8_t *)&v10, 0x2Cu);
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "dispatchedHandleMuteStateChangedHandlerForAudioClient:enabled:error:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), v6, a3);
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientAudioSessionMixingVoiceWithMedia")), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v6;
          v14 = 2080;
          v15 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          v16 = 1024;
          v17 = 397;
          v18 = 1024;
          *(_DWORD *)v19 = v5;
          v19[2] = 2048;
          *(_QWORD *)&v19[3] = v4;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to set mixingVoiceWithMediaEnabled to %d for client [%p]", (uint8_t *)&v12, 0x2Cu);
        }
      }
      objc_msgSend(v4, "setMixingVoiceWithMediaEnabled:", v5);
      -[VCSessionManager setSharingEnabled:](+[VCSessionManager sharedInstance](VCSessionManager, "sharedInstance"), "setSharingEnabled:", v5);
    }
    else
    {
      v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v9;
          v14 = 2080;
          v15 = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          v16 = 1024;
          v17 = 393;
          v18 = 2112;
          *(_QWORD *)v19 = v8;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BYTE v13[24];
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientFollowSystemInput")), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = "disable";
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v6;
          *(_QWORD *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[12] = 2080;
          if ((_DWORD)v5)
            v8 = "enable";
          *(_WORD *)&v13[22] = 1024;
          v14 = 414;
          v15 = 2080;
          v16 = (uint64_t)v8;
          v17 = 2048;
          v18 = v4;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s follow system input for client [%p]", v13, 0x30u);
        }
      }
      objc_msgSend(v4, "setFollowSystemInput:", v5, *(_OWORD *)v13, *(_QWORD *)&v13[16]);
    }
    else
    {
      v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 136315906;
          *(_QWORD *)&v13[4] = v10;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          v14 = 410;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", v13, 0x26u);
        }
      }
    }
  }
  return 0;
}

uint64_t __48__VCAudioClientManager_registerBlocksForService__block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BYTE v13[24];
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("audioClientFollowSystemOutput")), "BOOLValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = "disable";
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v6;
          *(_QWORD *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[12] = 2080;
          if ((_DWORD)v5)
            v8 = "enable";
          *(_WORD *)&v13[22] = 1024;
          v14 = 430;
          v15 = 2080;
          v16 = (uint64_t)v8;
          v17 = 2048;
          v18 = v4;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got Notification to %s follow system output for client [%p]", v13, 0x30u);
        }
      }
      objc_msgSend(v4, "setFollowSystemOutput:", v5, *(_OWORD *)v13, *(_QWORD *)&v13[16]);
    }
    else
    {
      v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 136315906;
          *(_QWORD *)&v13[4] = v10;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[VCAudioClientManager registerBlocksForService]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          v14 = 426;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Connection is not properly setup for processId=%@", v13, 0x26u);
        }
      }
    }
  }
  return 0;
}

id __48__VCAudioClientManager_registerBlocksForService__block_invoke_103(uint64_t a1, void *a2)
{
  id result;

  result = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED"));
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleDisconnectWithXPCArguments:", a2);
  return result;
}

- (void)unregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSession");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "mutedTalkerRegister");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "mutedTalkerUnregister");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "muteStateChangedHandler");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionVoiceMixing");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionFollowSystemInput");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionFollowSystemOutput");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "audioSessionClientDisconnect");
}

- (void)secureMicrophoneEngagedNotification
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:", "vcSecureMicNotification", 0);
}

- (void)getAudioClientWithProcessId:create:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to retrieve VCAudioClient. Process id was not specified.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)getAudioClientWithProcessId:create:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate VCAudioClient.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)handleDisconnectWithXPCArguments:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No client specified. argument=%@");
  OUTLINED_FUNCTION_3();
}

void __48__VCAudioClientManager_registerBlocksForService__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Connection is not properly setup for processId=%@");
  OUTLINED_FUNCTION_3();
}

@end
