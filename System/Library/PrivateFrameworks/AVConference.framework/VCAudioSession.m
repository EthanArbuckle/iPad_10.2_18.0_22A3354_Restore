@implementation VCAudioSession

+ (id)sharedVoiceChatInstance
{
  if (sharedVoiceChatInstance_onceToken_0 != -1)
    dispatch_once(&sharedVoiceChatInstance_onceToken_0, &__block_literal_global_37);
  return (id)sharedVoiceChatInstance__VCAudioSessionVoiceChat;
}

uint64_t __41__VCAudioSession_sharedVoiceChatInstance__block_invoke(uint64_t result)
{
  int v1;
  __objc2_class **v2;

  if (!sharedVoiceChatInstance__VCAudioSessionVoiceChat)
  {
    v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(result);
    v2 = off_1E9E4D5E0;
    if (!v1)
      v2 = off_1E9E4D5E8;
    result = objc_msgSend(objc_alloc(*v2), "initWithMode:", 0);
    sharedVoiceChatInstance__VCAudioSessionVoiceChat = result;
  }
  return result;
}

+ (id)sharedSystemAudioOutputInstance
{
  if (sharedSystemAudioOutputInstance_onceToken_0 != -1)
    dispatch_once(&sharedSystemAudioOutputInstance_onceToken_0, &__block_literal_global_26);
  return (id)sharedSystemAudioOutputInstance__VCAudioSessionSystemAudioOutput;
}

uint64_t __49__VCAudioSession_sharedSystemAudioOutputInstance__block_invoke(uint64_t a1)
{
  int v1;
  __objc2_class **v2;
  uint64_t result;

  v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(a1);
  v2 = off_1E9E4D5E0;
  if (!v1)
    v2 = off_1E9E4D5E8;
  result = objc_msgSend(objc_alloc(*v2), "initWithMode:", 1);
  sharedSystemAudioOutputInstance__VCAudioSessionSystemAudioOutput = result;
  return result;
}

+ (id)sharedSystemAudioInputInstance
{
  if (sharedSystemAudioInputInstance_onceToken_0 != -1)
    dispatch_once(&sharedSystemAudioInputInstance_onceToken_0, &__block_literal_global_27);
  return (id)sharedSystemAudioInputInstance__VCAudioSessionSystemAudioInput;
}

uint64_t __48__VCAudioSession_sharedSystemAudioInputInstance__block_invoke(uint64_t a1)
{
  int v1;
  __objc2_class **v2;
  uint64_t result;

  v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(a1);
  v2 = off_1E9E4D5E0;
  if (!v1)
    v2 = off_1E9E4D5E8;
  result = objc_msgSend(objc_alloc(*v2), "initWithMode:", 2);
  sharedSystemAudioInputInstance__VCAudioSessionSystemAudioInput = result;
  return result;
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (VCAudioSession)initWithMode:(int)a3
{
  VCAudioSession *v4;
  VCAudioSession *v5;
  NSObject *CustomRootQueue;
  int ErrorLogLevelForModule;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 isTetheredDisplayMode;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 useOptimizedHandoversForTelephony;
  _BOOL4 deferredNetworkUplinkClockEnabled;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCAudioSession;
  v4 = -[VCObject init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_playbackMode = a3;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.cmSessionQueue", 0, CustomRootQueue);
    v5->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_isTetheredDisplayMode = CFPreferencesGetAppBooleanValue(CFSTR("EnableTetheredDisplayPortMode"), (CFStringRef)*MEMORY[0x1E0C9B228], 0) != 0;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v8 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        isTetheredDisplayMode = v5->_isTetheredDisplayMode;
        *(_DWORD *)buf = 136315906;
        v19 = v9;
        v20 = 2080;
        v21 = "-[VCAudioSession initWithMode:]";
        v22 = 1024;
        v23 = 134;
        v24 = 1024;
        v25 = isTetheredDisplayMode;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isTetheredDisplayMode[%d]", buf, 0x22u);
      }
    }
    v5->_currentClientPid = 0x7FFFFFFF;
    v5->_currentAudioSessionProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_useOptimizedHandoversForTelephony = +[VCHardwareSettings supportsOptimizedHandoversForTelephony](VCHardwareSettings, "supportsOptimizedHandoversForTelephony");
    v5->_deferredNetworkUplinkClockEnabled = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableDeferredNetworkUplinkClockUpdate"), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        useOptimizedHandoversForTelephony = v5->_useOptimizedHandoversForTelephony;
        deferredNetworkUplinkClockEnabled = v5->_deferredNetworkUplinkClockEnabled;
        *(_DWORD *)buf = 136316162;
        v19 = v12;
        v20 = 2080;
        v21 = "-[VCAudioSession initWithMode:]";
        v22 = 1024;
        v23 = 139;
        v24 = 1024;
        v25 = useOptimizedHandoversForTelephony;
        v26 = 1024;
        v27 = deferredNetworkUplinkClockEnabled;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useOptimizedHandoversForTelephony=%d deferredNetworkUplinkClockEnabled=%d", buf, 0x28u);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioSession;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)resetOverrideRoute
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession resetOverrideRoute]"), 0));
}

- (BOOL)isAnswerOnHoldUpdateParameters:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49638]);
  if (v4)
  {
    LODWORD(v4) = objc_msgSend(v4, "BOOLValue");
    if ((_DWORD)v4)
    {
      if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D494F8]))
        LOBYTE(v4) = 0;
      else
        LOBYTE(v4) = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49528]) == 0;
    }
  }
  return (char)v4;
}

- (NSDictionary)audioSessionProperties
{
  NSMutableDictionary *requestedAudioSessionProperties;
  _BOOL4 BoolValueForKey;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  requestedAudioSessionProperties = self->_requestedAudioSessionProperties;
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("simulateAppleCalling"), 0);
  v4 = (_QWORD *)MEMORY[0x1E0D495F8];
  v5 = (uint64_t *)MEMORY[0x1E0D494F8];
  v6 = (uint64_t *)MEMORY[0x1E0D48F58];
  v7 = (_QWORD *)MEMORY[0x1E0D49528];
  if (BoolValueForKey)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = v8;
        v23 = 2080;
        v24 = "-[VCAudioSession audioSessionProperties]";
        v25 = 1024;
        v26 = 182;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing apple calling", buf, 0x1Cu);
      }
    }
    v10 = *v5;
    v19[0] = *v4;
    v19[1] = v10;
    v11 = *v6;
    v20[0] = &unk_1E9EF4DC0;
    v20[1] = v11;
    v19[2] = *v7;
    v20[2] = *MEMORY[0x1E0D491F0];
    requestedAudioSessionProperties = (NSMutableDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  }
  if (VCDefaults_GetBoolValueForKey(CFSTR("forceIbisMode"), 0))
  {
    v12 = *v5;
    v17[0] = *v4;
    v17[1] = v12;
    v13 = *v6;
    v18[0] = &unk_1E9EF4DC0;
    v18[1] = v13;
    v17[2] = *v7;
    v18[2] = *MEMORY[0x1E0D490D0];
    requestedAudioSessionProperties = (NSMutableDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = v14;
        v23 = 2080;
        v24 = "-[VCAudioSession audioSessionProperties]";
        v25 = 1024;
        v26 = 193;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Ibis mode", buf, 0x1Cu);
      }
    }
  }
  return &requestedAudioSessionProperties->super;
}

- (void)setAudioSessionProperties:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCAudioSession_setAudioSessionProperties___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__VCAudioSession_setAudioSessionProperties___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetAudioSessionProperties:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hasStarted
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession hasStarted]"), 0));
}

- (BOOL)isInputSupported
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession isInputSupported]"), 0));
}

- (void)dispatchedSetAudioSessionProperties:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSMutableDictionary *requestedAudioSessionProperties;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v23 = v5;
      v24 = 2080;
      v25 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
      v26 = 1024;
      v27 = 215;
      v28 = 2112;
      v29 = objc_msgSend(a3, "description");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d : %@", buf, 0x26u);
    }
  }
  if (-[VCAudioSession isAnswerOnHoldUpdateParameters:](self, "isAnswerOnHoldUpdateParameters:", a3))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedAudioSessionProperties, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49638]), *MEMORY[0x1E0D49638]);
    if (-[VCAudioSession hasStarted](self, "hasStarted"))
      -[VCAudioSession setSpeakerProperty:](self, "setSpeakerProperty:", a3);
  }
  else
  {
    v7 = (NSMutableDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVAudioClientBatchMXPropertiesKey"));
    v8 = *MEMORY[0x1E0D494F8];
    if ((objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D494F8])
       || -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8))
      && ((v9 = *MEMORY[0x1E0D49528], objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49528]))
       || -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v9)))
    {

      self->_requestedAudioSessionProperties = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
      if (v7)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = (void *)-[NSMutableDictionary allKeys](v7, "allKeys");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              if (-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedAudioSessionProperties, "objectForKeyedSubscript:", v15))
              {
                requestedAudioSessionProperties = self->_requestedAudioSessionProperties;
              }
              else
              {
                requestedAudioSessionProperties = v7;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedAudioSessionProperties, "setObject:forKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](requestedAudioSessionProperties, "objectForKeyedSubscript:", v15), v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
          }
          while (v12);
        }
      }
      if (-[VCAudioSession hasStarted](self, "hasStarted"))
        -[VCAudioSession applyDynamicSessionProperties](self, "applyDynamicSessionProperties");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSession dispatchedSetAudioSessionProperties:].cold.1();
    }
  }
}

- (void)setSpeakerProperty:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession setSpeakerProperty:]"), 0));
}

- (void)applyDynamicSessionProperties
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *MEMORY[0x1E0D49820];
  if (-[VCAudioSession didRequestDictionaryPropertyChange:](self, "didRequestDictionaryPropertyChange:", *MEMORY[0x1E0D49820]))
  {
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v3, 0);
  }
  v4 = *MEMORY[0x1E0D498C0];
  if (-[VCAudioSession didRequestBoolPropertyChange:](self, "didRequestBoolPropertyChange:", *MEMORY[0x1E0D498C0]))
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v4, MEMORY[0x1E0C9AAA0]);
  v5 = *MEMORY[0x1E0D494C8];
  if (-[VCAudioSession didRequestArrayPropertyChange:](self, "didRequestArrayPropertyChange:", *MEMORY[0x1E0D494C8]))
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v5, MEMORY[0x1E0C9AA60]);
  if (self->_useOptimizedHandoversForTelephony
    && -[VCAudioSession didRequestBoolPropertyChange:](self, "didRequestBoolPropertyChange:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband")))
  {
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"), MEMORY[0x1E0C9AAA0]);
  }
  v6 = *MEMORY[0x1E0D49B80];
  if (-[VCAudioSession didRequestBoolPropertyChange:](self, "didRequestBoolPropertyChange:", *MEMORY[0x1E0D49B80]))
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v6, MEMORY[0x1E0C9AAA0]);
}

- (void)dispatchedRefreshAudioSessionProperties
{
  uint64_t v3;
  uint64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = *MEMORY[0x1E0D494F8];
  if (-[VCAudioSession didRequestStringPropertyChange:](self, "didRequestStringPropertyChange:", *MEMORY[0x1E0D494F8]))
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v3, *MEMORY[0x1E0D48F58]);
  if (-[VCAudioSession didRequestStringPropertyChange:](self, "didRequestStringPropertyChange:", *MEMORY[0x1E0D49528]))
    -[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:](self, "applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:", *MEMORY[0x1E0D49138], 1);
  v4 = *MEMORY[0x1E0D497D8];
  if (-[VCAudioSession didRequestArrayPropertyChange:](self, "didRequestArrayPropertyChange:", *MEMORY[0x1E0D497D8]))
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", v4, 0);
  if (self->_useOptimizedHandoversForTelephony)
  {
    if (-[VCAudioSession didRequestBoolPropertyChange:](self, "didRequestBoolPropertyChange:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband")))
    {
      -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"), MEMORY[0x1E0C9AAA0]);
    }
  }
}

- (void)refreshAudioSessionProperties
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCAudioSession_refreshAudioSessionProperties__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(dispatchQueue, v3);
}

uint64_t __47__VCAudioSession_refreshAudioSessionProperties__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRefreshAudioSessionProperties");
}

- (void)updateAudioSessionPropertiesWithProperties:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCAudioSession_updateAudioSessionPropertiesWithProperties___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __61__VCAudioSession_updateAudioSessionPropertiesWithProperties___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  if (v2)
    v3 = (id)objc_msgSend(v2, "mutableCopy");
  else
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "dispatchedSetAudioSessionProperties:", v4);

}

- (void)invalidateCache
{
  -[NSMutableDictionary removeAllObjects](self->_currentAudioSessionProperties, "removeAllObjects");
}

- (BOOL)didRequestBoolPropertyChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = -[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", a3);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentAudioSessionProperties, "objectForKeyedSubscript:", a3);
    if (v7)
    {
      v8 = objc_msgSend(v7, "BOOLValue");
      LOBYTE(v5) = v8 ^ objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (BOOL)didRequestedPropertyChange:(id)a3 propertyClass:(Class)a4 compareSelector:(SEL)a5
{
  void *v9;
  id v10;
  id v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  objc_class *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentAudioSessionProperties, "objectForKeyedSubscript:");
  v10 = -[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", a3);
  if (v10)
  {
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v12)
          return v12;
        v15 = NSStringFromClass(a4);
        v16 = (objc_class *)objc_opt_class();
        v18 = 136316418;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:]";
        v22 = 1024;
        v23 = 343;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = a3;
        v28 = 2112;
        v29 = NSStringFromClass(v16);
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected class=%@ for property=%@. Expected class=%@", (uint8_t *)&v18, 0x3Au);
      }
      LOBYTE(v12) = 0;
      return v12;
    }
    if (v9)
      LOBYTE(v12) = objc_msgSend(v9, "performSelector:withObject:", a5, v11) == 0;
    else
      LOBYTE(v12) = 1;
  }
  else
  {
    LOBYTE(v12) = v9 != 0;
  }
  return v12;
}

- (BOOL)didRequestStringPropertyChange:(id)a3
{
  return -[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:](self, "didRequestedPropertyChange:propertyClass:compareSelector:", a3, objc_opt_class(), sel_isEqualToString_);
}

- (BOOL)didRequestArrayPropertyChange:(id)a3
{
  return -[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:](self, "didRequestedPropertyChange:propertyClass:compareSelector:", a3, objc_opt_class(), sel_isEqualToArray_);
}

- (BOOL)didRequestDataPropertyChange:(id)a3
{
  return -[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:](self, "didRequestedPropertyChange:propertyClass:compareSelector:", a3, objc_opt_class(), sel_isEqualToData_);
}

- (BOOL)didRequestDictionaryPropertyChange:(id)a3
{
  return -[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:](self, "didRequestedPropertyChange:propertyClass:compareSelector:", a3, objc_opt_class(), sel_isEqualToDictionary_);
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession applyRequestedProperty:defaultValue:]"), 0));
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession applyRequestedProperties:propertyOrder:]"), 0));
}

- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int vpOperatingMode;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v3 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (a3 == 7)
    v5 = &unk_1E9EF4DD8;
  else
    v5 = &unk_1E9EF4DC0;
  self->_vpOperatingMode = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      vpOperatingMode = self->_vpOperatingMode;
      *(_DWORD *)buf = 136316162;
      v26 = v6;
      v27 = 2080;
      v28 = "-[VCAudioSession applyAudioSessionPropertiesWithVPOperatingMode:]";
      v29 = 1024;
      v30 = 380;
      v31 = 1024;
      v32 = vpOperatingMode;
      v33 = 1024;
      v34 = objc_msgSend(v5, "intValue");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _vpOperatingMode=%d, priority=%d", buf, 0x28u);
    }
  }
  v9 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", CFSTR("AVAudioClientBatchMXPropertiesKey")), "mutableCopy");
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D495F8], v5, v10);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D494F8], *MEMORY[0x1E0D48F58], v10);
  v11 = *MEMORY[0x1E0D49138];
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D49528], *MEMORY[0x1E0D49138], v10);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D49638], MEMORY[0x1E0C9AAA0], v10);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D49820], 0, v10);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D497D8], 0, v10);
  buf[0] = 0;
  if (-[VCAudioSession shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:](self, "shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:", v3, buf))
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", buf[0]);
    v13 = *MEMORY[0x1E0D49938];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D49938]);
    objc_msgSend(v10, "addObject:", v13);
  }
  if ((_DWORD)v3 != 6)
    -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D498C0], MEMORY[0x1E0C9AAA0], v10);
  -[VCAudioSession addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:](self, "addPropertyToBatchedDictionary:property:defaultValue:propertyOrderArray:", v9, *MEMORY[0x1E0D49B80], MEMORY[0x1E0C9AAA0], v10);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = (void *)objc_msgSend(v9, "allKeys");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v10, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v16);
  }
  -[VCAudioSession applyRequestedProperties:propertyOrder:](self, "applyRequestedProperties:propertyOrder:", v9, v10);

  -[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:](self, "applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:", v11, 0);
}

- (void)addPropertyToBatchedDictionary:(id)a3 property:(id)a4 defaultValue:(id)a5 propertyOrderArray:(id)a6
{
  NSDictionary *v11;
  uint64_t v12;

  if (-[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", a4))
  {
    v11 = -[VCAudioSession audioSessionProperties](self, "audioSessionProperties");
  }
  else
  {
    v12 = objc_msgSend(a3, "objectForKeyedSubscript:", a4);
    v11 = (NSDictionary *)a3;
    if (!v12)
      goto LABEL_5;
  }
  a5 = -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", a4);
LABEL_5:
  if (a5)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", a5, a4);
    objc_msgSend(a6, "addObject:", a4);
  }
}

- (void)upgradeAudioSessionProperties
{
  -[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:](self, "applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:", 0, 1);
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]"), 0));
}

- (BOOL)setSampleRate:(double)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a3, "-[VCAudioSession setSampleRate:]"), 0));
}

- (BOOL)forceBufferFrames:(int *)a3
{
  const __CFNumber *v3;
  const __CFNumber *v5;
  int Value;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_isTetheredDisplayMode)
  {
    v3 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("forceAudioBufferFrames"), CFSTR("com.apple.VideoConference"));
    if (v3)
    {
      v5 = v3;
      Value = CFNumberGetValue(v3, kCFNumberSInt32Type, a3);
      CFRelease(v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *a3;
          v10 = " ";
          v12 = 136316162;
          if (!Value)
            v10 = "failed";
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCAudioSession forceBufferFrames:]";
          v16 = 1024;
          v17 = 467;
          v18 = 1024;
          v19 = v9;
          v20 = 2080;
          v21 = v10;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceAudioBufferFrames to %d %s", (uint8_t *)&v12, 0x2Cu);
        }
      }
      LOBYTE(v3) = Value != 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)setBlockSizeOnSampleRateChange
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__VCAudioSession_setBlockSizeOnSampleRateChange__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __48__VCAudioSession_setBlockSizeOnSampleRateChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id *v4;
  double v5;
  double v6;
  double v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v2;
      v11 = 2080;
      v12 = "-[VCAudioSession setBlockSizeOnSampleRateChange]_block_invoke";
      v13 = 1024;
      v14 = 475;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  v4 = *(id **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v4[25], "mediaProperties"), "preferredBlockSize");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "mediaProperties"), "preferredSampleRate");
  return objc_msgSend(v4, "setBlockSize:sampleRate:force:", 0, v6, v7);
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a3, a4, "-[VCAudioSession setBlockSize:sampleRate:force:]"), 0));
}

+ (id)stringFromFormat:(const AudioStreamBasicDescription *)a3
{
  __int128 v3;
  char __str[16];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7 = v3;
  v8 = v3;
  *(_OWORD *)__str = v3;
  v6 = v3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" audioStreamBasicDescription=%s"), FormatToCStr((uint64_t)a3, __str, 0x40uLL));
}

- (void)setUpVPBlockFormatWithProperties:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  _OWORD v36[3];
  _BYTE v37[40];
  int v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _QWORD v52[5];
  _QWORD v53[8];

  v53[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "inputFormat");
    if (HIDWORD(v40) >= 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(a3, "inputFormat");
          *(_DWORD *)buf = 136315906;
          v43 = v5;
          v44 = 2080;
          v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
          v46 = 1024;
          v47 = 492;
          v48 = 1024;
          LODWORD(v49) = v38;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d skipping setting kCMSessionProperty_VPBlockConfiguration channelCount=%d", buf, 0x22u);
        }
      }
      return;
    }
  }
  else
  {
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
  }
  *(_QWORD *)v37 = -1;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v37[8] = v7;
  *(_OWORD *)&v37[24] = v7;
  if (a3)
    objc_msgSend(a3, "inputFormat");
  else
    memset(v37, 0, sizeof(v37));
  v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37, 40);
  *(_QWORD *)&v36[0] = -1;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v36 + 8) = v9;
  *(_OWORD *)((char *)&v36[1] + 8) = v9;
  if (a3)
    objc_msgSend(a3, "outputFormat");
  else
    memset(v36, 0, 40);
  v10 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v36, 40);
  v32 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "vpOperatingMode"));
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "networkUplinkClockUsesBaseband"));
  v13 = (void *)MEMORY[0x1E0CB37E8];
  if (a3)
  {
    objc_msgSend(a3, "outputFormat");
    v14 = v35 > 1;
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v13, "numberWithBool:", v14);
  v16 = (void *)MEMORY[0x1E0C99E08];
  v52[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vp client input format");
  v53[0] = v8;
  v52[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vp client output format");
  v53[1] = v10;
  v52[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vp client operation mode");
  v53[2] = v32;
  v52[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vp_muteControlledByAVSC");
  v53[3] = v11;
  v52[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vp client stereo chat enabled");
  v53[4] = v15;
  v17 = (void *)objc_msgSend(v16, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 5));
  v18 = v17;
  if (self->_useOptimizedHandoversForTelephony && self->_audioClockDeviceEnabled)
    objc_msgSend(v17, "setValue:forKey:", v12, CFSTR("network uplink clock uses baseband"));
  -[VCAudioSession setVPBlockConfigurationProperties:](self, "setVPBlockConfigurationProperties:", v18);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend((id)objc_opt_class(), "stringFromFormat:", v37);
      *(_DWORD *)buf = 136315906;
      v43 = v19;
      v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      v46 = 1024;
      v47 = 513;
      v48 = 2112;
      v49 = v21;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client input format' inFormat=%@)", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend((id)objc_opt_class(), "stringFromFormat:", v36);
      *(_DWORD *)buf = 136315906;
      v43 = v22;
      v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      v46 = 1024;
      v47 = 514;
      v48 = 2112;
      v49 = v24;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client output format' outFormat=%@)", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v32, "unsignedIntValue");
      *(_DWORD *)buf = 136315906;
      v43 = v25;
      v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      v46 = 1024;
      v47 = 515;
      v48 = 1024;
      LODWORD(v49) = v27;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client operation mode' opModeNumber=%u)", buf, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        objc_msgSend(a3, "inputFormat");
        v30 = v34;
        objc_msgSend(a3, "outputFormat");
        v31 = v33;
      }
      else
      {
        v31 = 0;
        v30 = 0;
      }
      *(_DWORD *)buf = 136316162;
      v43 = v28;
      v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      v46 = 1024;
      v47 = 516;
      v48 = 2048;
      v49 = v30;
      v50 = 2048;
      v51 = v31;
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration sampleRateIn=%f, sampleRateOut=%f", buf, 0x30u);
    }
  }

  self->_vpBlock = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v18);
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession setVPBlockConfigurationProperties:]"), 0));
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int operatingMode;
  unsigned int vpOperatingMode;
  double v13;
  double v14;
  double v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v7;
      v19 = 2080;
      v20 = "-[VCAudioSession applyAudioSessionMediaProperties:]";
      v21 = 1024;
      v22 = 528;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v17, 0x1Cu);
    }
  }
  self->_vpOperatingMode = objc_msgSend(a3, "vpOperatingMode");
  self->_operatingMode = objc_msgSend(a3, "operatingMode");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      operatingMode = self->_operatingMode;
      vpOperatingMode = self->_vpOperatingMode;
      v17 = 136316162;
      v18 = v9;
      v19 = 2080;
      v20 = "-[VCAudioSession applyAudioSessionMediaProperties:]";
      v21 = 1024;
      v22 = 532;
      v23 = 1024;
      v24 = operatingMode;
      v25 = 1024;
      v26 = vpOperatingMode;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _operatingMode=%d, _vpOperatingMode=%d", (uint8_t *)&v17, 0x28u);
    }
  }
  objc_msgSend(a3, "preferredSampleRate");
  -[VCAudioSession setSampleRate:](self, "setSampleRate:");
  objc_msgSend(a3, "preferredBlockSize");
  v14 = v13;
  objc_msgSend(a3, "preferredSampleRate");
  -[VCAudioSession setBlockSize:sampleRate:force:](self, "setBlockSize:sampleRate:force:", 1, v14, v15);
  -[VCAudioSession setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:](self, "setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:", objc_msgSend(a3, "audioClockDeviceEnabled"), objc_msgSend(a3, "networkUplinkClockUsesBaseband"));
  if (!self->_playbackMode)
  {
    -[VCAudioSession internalSelectMicrophoneWithType:](self, "internalSelectMicrophoneWithType:", self->_selectedMicrophone);
    if (!VCDefaults_GetBoolValueForKey(CFSTR("skipSettingVPBlockConfiguration"), 0))
      -[VCAudioSession setUpVPBlockFormatWithProperties:](self, "setUpVPBlockFormatWithProperties:", a3);
  }
  return 1;
}

- (BOOL)startInternal
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession startInternal]"), 0));
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession startSessionWithMediaProperties:sessionRef:]"), 0));
}

- (BOOL)validNewStartingClient:(id)a3
{
  NSMutableArray *clients;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  char IsOSFaultDisabled;
  NSObject *v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioSession *v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  clients = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(clients);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
      if ((id)objc_msgSend(v10, "notificationClient") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = objc_msgSend(v10, "clientType");
    if (v12 == 1)
      v13 = 2;
    else
      v13 = 3;
    if ((VCAudioSession *)objc_opt_class() == self)
    {
      if (v13 > (int)VRTraceGetErrorLogLevelForModule())
        goto LABEL_23;
      VRTraceErrorLogLevelToCSTR();
      if (v12 != 1)
      {
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        -[VCAudioSession validNewStartingClient:].cold.1();
        goto LABEL_38;
      }
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioSession validNewStartingClient:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCAudioSession validNewStartingClient:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCAudioSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if (v13 > (int)VRTraceGetErrorLogLevelForModule())
      {
LABEL_23:
        if (v12 != 1)
          goto LABEL_38;
        goto LABEL_37;
      }
      v15 = VRTraceErrorLogLevelToCSTR();
      if (v12 != 1)
      {
        v18 = *MEMORY[0x1E0CF2758];
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v11)
          return v11;
        v20 = 136316162;
        v21 = v15;
        v22 = 2080;
        v23 = "-[VCAudioSession validNewStartingClient:]";
        v24 = 1024;
        v25 = 575;
        v26 = 2112;
        v27 = v14;
        v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
        goto LABEL_38;
      }
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v17 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316162;
          v21 = v15;
          v22 = 2080;
          v23 = "-[VCAudioSession validNewStartingClient:]";
          v24 = 1024;
          v25 = 575;
          v26 = 2112;
          v27 = v14;
          v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v20 = 136316162;
        v21 = v15;
        v22 = 2080;
        v23 = "-[VCAudioSession validNewStartingClient:]";
        v24 = 1024;
        v25 = 575;
        v26 = 2112;
        v27 = v14;
        v28 = 2048;
        v29 = self;
        _os_log_fault_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
      }
    }
LABEL_37:
    +[VCAudioSession terminateProcess:terminateSource:agent:](VCAudioSession, "terminateProcess:terminateSource:agent:", CFSTR("Unexpected already started state when default client requested start"), CFSTR("VCAudioSession"), 0);
LABEL_38:
    LOBYTE(v11) = 0;
    return v11;
  }
LABEL_9:
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)startClient:(id)a3 clientType:(unsigned __int8)a4 mediaProperties:(id)a5 sessionRef:(unsigned int *)a6
{
  NSObject *dispatchQueue;
  char v7;
  _QWORD block[9];
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCAudioSession_startClient_clientType_mediaProperties_sessionRef___block_invoke;
  block[3] = &unk_1E9E55078;
  block[4] = a3;
  block[5] = self;
  block[6] = a5;
  block[7] = &v11;
  block[8] = a6;
  v10 = a4;
  dispatch_sync(dispatchQueue, block);
  v7 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __68__VCAudioSession_startClient_clientType_mediaProperties_sessionRef___block_invoke(uint64_t a1)
{
  int ErrorLogLevelForModule;
  os_log_t *v3;
  uint64_t v4;
  NSObject *v5;
  VCAudioSessionClient *v6;
  uint64_t v7;
  void *v8;
  VCAudioSessionClient *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  VCAudioSessionClient *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v3 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(VCAudioSessionClient **)(a1 + 32);
      v25 = 136315906;
      v26 = v4;
      v27 = 2080;
      v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
      v29 = 1024;
      v30 = 588;
      v31 = 2048;
      v32 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client:%p", (uint8_t *)&v25, 0x26u);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "validNewStartingClient:", *(_QWORD *)(a1 + 32)))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "count");
    v8 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v8, "dispatchedRefreshAudioSessionProperties");
LABEL_8:
      v9 = objc_alloc_init(VCAudioSessionClient);
      -[VCAudioSessionClient setNotificationClient:](v9, "setNotificationClient:", *(_QWORD *)(a1 + 32));
      -[VCAudioSessionClient setMediaProperties:](v9, "setMediaProperties:", *(_QWORD *)(a1 + 48));
      -[VCAudioSessionClient setClientType:](v9, "setClientType:", *(unsigned __int8 *)(a1 + 72));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "addObject:", v9);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "clientType") != 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            v25 = 136315906;
            v26 = v10;
            v27 = 2080;
            v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
            v29 = 1024;
            v30 = 606;
            v31 = 2048;
            v32 = v9;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Select new active client:%p", (uint8_t *)&v25, 0x26u);
          }
        }

        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = v9;
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136315650;
          v26 = v12;
          v27 = 2080;
          v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
          v29 = 1024;
          v30 = 612;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying the activeClients media properties", (uint8_t *)&v25, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "applyAudioSessionMediaProperties:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "mediaProperties"));
      objc_msgSend(*(id *)(a1 + 40), "startInternal");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136315650;
          v26 = v14;
          v27 = 2080;
          v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
          v29 = 1024;
          v30 = 618;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating block size to reflect the hardware sampleRate", (uint8_t *)&v25, 0x1Cu);
        }
      }
      v16 = *(id **)(a1 + 40);
      objc_msgSend((id)objc_msgSend(v16[25], "mediaProperties"), "preferredBlockSize");
      v18 = v17;
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "mediaProperties"), "preferredSampleRate");
      objc_msgSend(v16, "setBlockSize:sampleRate:force:", 0, v18, v19);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_20;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "startSessionWithMediaProperties:sessionRef:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      goto LABEL_8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315650;
        v26 = v23;
        v27 = 2080;
        v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
        v29 = 1024;
        v30 = 593;
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startSession failed", (uint8_t *)&v25, 0x1Cu);
      }
    }
  }
LABEL_20:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v25 = 136315906;
      v26 = v20;
      v27 = 2080;
      v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
      v29 = 1024;
      v30 = 622;
      v31 = 1024;
      LODWORD(v32) = v22;
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d success=%d", (uint8_t *)&v25, 0x22u);
    }
  }
}

- (BOOL)shouldResetAudioSession
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCAudioSession_shouldResetAudioSession__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__VCAudioSession_shouldResetAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
      v13 = 136315906;
      v14 = v2;
      v15 = 2080;
      v16 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
      v17 = 1024;
      v18 = 631;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Requested settings: %@", (uint8_t *)&v13, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
      v13 = 136315906;
      v14 = v5;
      v15 = 2080;
      v16 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
      v17 = 1024;
      v18 = 632;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Existing settings: %@", (uint8_t *)&v13, 0x26u);
    }
  }
  v8 = *MEMORY[0x1E0D49528];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *MEMORY[0x1E0D49528]), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", *MEMORY[0x1E0D49528])) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", v8);
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", v8);
      v13 = 136316162;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
      v17 = 1024;
      v18 = 636;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset needed, audio mode:%@ -> %@", (uint8_t *)&v13, 0x30u);
    }
  }
}

- (BOOL)resetClient:(id)a3 mediaSetting:(id)a4 interruptSuccessful:(BOOL *)a5
{
  NSObject *dispatchQueue;
  char v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  dispatchQueue = self->_dispatchQueue;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__VCAudioSession_resetClient_mediaSetting_interruptSuccessful___block_invoke;
  v8[3] = &unk_1E9E550A0;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = &v9;
  v8[8] = a5;
  dispatch_sync(dispatchQueue, v8);
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __63__VCAudioSession_resetClient_mediaSetting_interruptSuccessful___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t result;
  char v11;
  _BYTE *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v23 = v2;
      v24 = 2080;
      v25 = "-[VCAudioSession resetClient:mediaSetting:interruptSuccessful:]_block_invoke";
      v26 = 1024;
      v27 = 646;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "notificationClient") == *(_QWORD *)(a1 + 40))
        {
          objc_msgSend(v9, "setMediaProperties:", *(_QWORD *)(a1 + 48));
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "notificationClient");
  if (result == *(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "didRequestStringPropertyChange:", *MEMORY[0x1E0D494F8]))
    {
      objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionPropertiesWithVPOperatingMode:", objc_msgSend(*(id *)(a1 + 48), "vpOperatingMode"));
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "didRequestStringPropertyChange:", *MEMORY[0x1E0D49528]))
    {
      objc_msgSend(*(id *)(a1 + 32), "upgradeAudioSessionProperties");
      result = objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionMediaProperties:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "mediaProperties"));
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionMediaProperties:", *(_QWORD *)(a1 + 48));
    v11 = objc_msgSend(*(id *)(a1 + 32), "startInternal");
    v12 = *(_BYTE **)(a1 + 64);
    if (v12)
      *v12 = v11;
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "preferredBlockSize");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 48), "preferredSampleRate");
    result = objc_msgSend(v13, "setBlockSize:sampleRate:force:", 0, v15, v16);
  }
LABEL_22:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (void)resumeActiveClient
{
  uint64_t v3;
  NSObject *v4;
  double v5;
  double v6;
  double v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCAudioSession resumeActiveClient]";
      v12 = 1024;
      v13 = 688;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
    }
  }
  -[VCAudioSession applyAudioSessionMediaProperties:](self, "applyAudioSessionMediaProperties:", -[VCAudioSessionClient mediaProperties](self->_activeClient, "mediaProperties"));
  -[VCAudioSession startInternal](self, "startInternal");
  -[VCAudioSessionMediaProperties preferredBlockSize](-[VCAudioSessionClient mediaProperties](self->_activeClient, "mediaProperties"), "preferredBlockSize");
  v6 = v5;
  -[VCAudioSessionMediaProperties preferredSampleRate](-[VCAudioSessionClient mediaProperties](self->_activeClient, "mediaProperties"), "preferredSampleRate");
  -[VCAudioSession setBlockSize:sampleRate:force:](self, "setBlockSize:sampleRate:force:", 1, v6, v7);
}

- (void)selectNewActiveClient
{
  uint64_t v3;
  NSObject *v4;
  VCAudioSessionClient *activeClient;
  VCAudioSessionClient *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCAudioSessionClient *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_activeClient)
  {
    self->_activeClient = (VCAudioSessionClient *)(id)-[NSMutableArray lastObject](self->_clients, "lastObject");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        activeClient = self->_activeClient;
        v7 = 136315906;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCAudioSession selectNewActiveClient]";
        v11 = 1024;
        v12 = 699;
        v13 = 2048;
        v14 = activeClient;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New active client:%p", (uint8_t *)&v7, 0x26u);
      }
    }
    v6 = self->_activeClient;
    if (v6)
    {
      if (!self->_isInterrupted)
        -[VCAudioSession applyAudioSessionMediaProperties:](self, "applyAudioSessionMediaProperties:", -[VCAudioSessionClient mediaProperties](v6, "mediaProperties"));
    }
  }
}

- (BOOL)stopSession
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession stopSession]"), 0));
}

- (BOOL)stopClient:(id)a3
{
  NSObject *dispatchQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__VCAudioSession_stopClient___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = &v7;
  dispatch_sync(dispatchQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __29__VCAudioSession_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v20 = v2;
      v21 = 2080;
      v22 = "-[VCAudioSession stopClient:]_block_invoke";
      v23 = 1024;
      v24 = 713;
      v25 = 2048;
      v26 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client:%p", buf, 0x26u);
    }
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 208);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "notificationClient") == *(_QWORD *)(a1 + 32))
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v7)
          goto LABEL_6;
        goto LABEL_18;
      }
    }
    if (!v10)
      goto LABEL_18;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "removeObject:", v10);
    v11 = *(_QWORD *)(a1 + 40);
    if (*(void **)(v11 + 200) == v10)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = 0;
      v11 = *(_QWORD *)(a1 + 40);
    }
    v12 = objc_msgSend(*(id *)(v11 + 208), "count");
    v13 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v13, "selectNewActiveClient");
    }
    else
    {
      objc_msgSend(v13, "stopSession");
      objc_msgSend(*(id *)(a1 + 40), "invalidateCache");
      objc_msgSend(*(id *)(a1 + 40), "cleanupMicSources");
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 248) = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
LABEL_18:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __29__VCAudioSession_stopClient___block_invoke_cold_1();
    }
  }
}

- (void)didAvailableSampleRateChange
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__VCAudioSession_didAvailableSampleRateChange__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __46__VCAudioSession_didAvailableSampleRateChange__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "notificationClient");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "didSessionSampleRateChange");
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession setMicrophoneMuted:]"), 0));
}

- (BOOL)microphoneMuted
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession microphoneMuted]"), 0));
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession setMuteStateChangedHandler:delegateQueue:]"), 0));
}

- (void)serverDidDie
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__VCAudioSession_serverDidDie__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __30__VCAudioSession_serverDidDie__block_invoke(uint64_t a1)
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
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "notificationClient"), "serverDidDie");
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didPause
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__VCAudioSession_didPause__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __26__VCAudioSession_didPause__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientType");
  if ((_DWORD)result == 1)
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "notificationClient"), "didSessionPause");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  return result;
}

- (void)didResume
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__VCAudioSession_didResume__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __27__VCAudioSession_didResume__block_invoke(uint64_t a1)
{
  int v2;
  id *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientType");
  v3 = *(id **)(a1 + 32);
  if (v2 == 1)
    return objc_msgSend((id)objc_msgSend(v3[25], "notificationClient"), "didSessionResume");
  else
    return objc_msgSend(v3, "resumeActiveClient");
}

- (void)didStop
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__VCAudioSession_didStop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __25__VCAudioSession_didStop__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientType");
  if ((_DWORD)result == 1)
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "notificationClient"), "didSessionStop");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  return result;
}

- (void)didInterruptionEnded
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VCAudioSession_didInterruptionEnded__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __38__VCAudioSession_didInterruptionEnded__block_invoke(uint64_t a1)
{
  int v2;
  id *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "clientType");
  v3 = *(id **)(a1 + 32);
  if (v2 == 1)
    return objc_msgSend((id)objc_msgSend(v3[25], "notificationClient"), "didSessionEnd");
  else
    return objc_msgSend(v3, "resumeActiveClient");
}

- (void)applyAudioModeWithDefaultValue:(void *)a3 shouldApplyRequestedProperty:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v24[24];
  __int128 v25;
  VCAudioSession *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D49528];
  if (a4)
    -[VCAudioSession applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", *MEMORY[0x1E0D49528], a3);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentAudioSessionProperties, "objectForKeyedSubscript:", v5);
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D491C0]))
  {
    if ((VCAudioSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v24 = 136315650;
      *(_QWORD *)&v24[4] = v10;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 849;
      v12 = " [%s] %s:%d Tearing down beamforming";
      v13 = v11;
      v14 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v24 = 136316162;
      *(_QWORD *)&v24[4] = v20;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 849;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v8;
      HIWORD(v25) = 2048;
      v26 = self;
      v12 = " [%s] %s:%d %@(%p) Tearing down beamforming";
      v13 = v21;
      v14 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v24, v14);
LABEL_24:
    -[VCAudioSession cleanupMicSources](self, "cleanupMicSources", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26);
    return;
  }
  if (self->_micSourceFront)
    v7 = 0;
  else
    v7 = self->_micSourceBack == 0;
  if ((VCAudioSession *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_30;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    *(_DWORD *)v24 = 136316418;
    *(_QWORD *)&v24[4] = v22;
    *(_WORD *)&v24[12] = 2080;
    *(_QWORD *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
    *(_WORD *)&v24[22] = 1024;
    LODWORD(v25) = 843;
    WORD2(v25) = 2112;
    *(_QWORD *)((char *)&v25 + 6) = v9;
    HIWORD(v25) = 2048;
    v26 = self;
    LOWORD(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 2) = v7;
    v17 = " [%s] %s:%d %@(%p) shouldSetUpInputBeamforming=%{BOOL}d";
    v18 = v23;
    v19 = 54;
    goto LABEL_29;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315906;
      *(_QWORD *)&v24[4] = v15;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 843;
      WORD2(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 6) = v7;
      v17 = " [%s] %s:%d shouldSetUpInputBeamforming=%{BOOL}d";
      v18 = v16;
      v19 = 34;
LABEL_29:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v24, v19);
    }
  }
LABEL_30:
  if (v7)
    -[VCAudioSession setupInputBeamforming](self, "setupInputBeamforming");
  -[VCAudioSession internalSelectMicrophoneWithType:](self, "internalSelectMicrophoneWithType:", self->_selectedMicrophone, *(_QWORD *)v24, *(_OWORD *)&v24[8], v25, v26, v27, v28);
}

- (void)handleAudioSessionInterruption:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession handleAudioSessionInterruption:]"), 0));
}

- (void)setAudioSessionMode:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCAudioSession_setAudioSessionMode___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__VCAudioSession_setAudioSessionMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D49528]);
  objc_msgSend(*(id *)(a1 + 32), "applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:", 0, 1);
  result = VCDefaults_GetBoolValueForKey(CFSTR("skipSettingVPBlockConfiguration"), 0);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setUpVPBlockFormatWithProperties:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "mediaProperties"));
  return result;
}

- (void)setupInputBeamforming
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession setupInputBeamforming]"), 0));
}

- (void)cleanupMicSources
{

  self->_micSourceFront = 0;
  self->_micSourceBack = 0;
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCAudioSession internalSelectMicrophoneWithType:]"), 0));
}

- (void)selectMicrophoneWithType:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCAudioSession_selectMicrophoneWithType___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__VCAudioSession_selectMicrophoneWithType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalSelectMicrophoneWithType:", *(unsigned int *)(a1 + 40));
}

+ (BOOL)shouldUseHomeKitConfigurationForAudioMode:(id)a3
{
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 4
    && (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D49090]) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D491D0]);
  }
}

+ (BOOL)convertAudioSessionProperties:(id)a3 operatingMode:(int *)a4 deviceRole:(int *)a5 enableAudioPreWarming:(BOOL *)a6 audioClockDeviceEnabled:(BOOL *)a7 networkUplinkClockUsesBaseband:(BOOL *)a8
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  char v36;
  uint64_t v37;
  NSObject *v38;
  int v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BYTE v47[10];
  int *v48;
  __int16 v49;
  int *v50;
  __int16 v51;
  BOOL *v52;
  __int16 v53;
  BOOL *v54;
  __int16 v55;
  BOOL *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5 || !a6 || !a7 || !a8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v21)
        return v21;
      v40 = 136317186;
      v41 = v25;
      v42 = 2080;
      v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      v44 = 1024;
      v45 = 922;
      v46 = 2048;
      *(_QWORD *)v47 = a3;
      *(_WORD *)&v47[8] = 2048;
      v48 = a5;
      v49 = 2048;
      v50 = a4;
      v51 = 2048;
      v52 = a6;
      v53 = 2048;
      v54 = a7;
      v55 = 2048;
      v56 = a8;
      v22 = " [%s] %s:%d Invalid parameters: sessionProperties=%p deviceRole=%p operationMode=%p prewarming=%p audioClock"
            "DeviceEnabled=%p networkUplinkClockUsesBaseband=%p";
      v23 = v26;
      v24 = 88;
LABEL_20:
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v40, v24);
    }
LABEL_21:
    LOBYTE(v21) = 0;
    return v21;
  }
  v14 = *MEMORY[0x1E0D49528];
  v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49528]);
  if (!v15)
    v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVAudioClientBatchMXPropertiesKey")), "objectForKeyedSubscript:", v14);
  v16 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kAUVoiceIOProperty_OperationMode"));
  v17 = (int *)v16;
  if (v15)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v21)
        return v21;
      v40 = 136316162;
      v41 = v19;
      v42 = 2080;
      v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      v44 = 1024;
      v45 = 931;
      v46 = 2048;
      *(_QWORD *)v47 = v15;
      *(_WORD *)&v47[8] = 2048;
      v48 = v17;
      v22 = " [%s] %s:%d Audio parameters missing audioMode=%p operationMode=%p";
      v23 = v20;
      v24 = 48;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v27 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"));
  *a4 = 0;
  *a5 = 0;
  *a6 = 1;
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D491C0]))
  {
    *a4 = 1;
LABEL_29:
    *a5 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D491F0]))
  {
    if (objc_msgSend(v17, "integerValue") == 8)
      v29 = 7;
    else
      v29 = 2;
    goto LABEL_28;
  }
  if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D49138]))
  {
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D490D0]))
    {
      v29 = 3;
LABEL_28:
      *a4 = v29;
      goto LABEL_29;
    }
    if (!+[VCAudioSession shouldUseHomeKitConfigurationForAudioMode:](VCAudioSession, "shouldUseHomeKitConfigurationForAudioMode:", v15))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:].cold.1(v37, v15, v38);
      }
      goto LABEL_30;
    }
LABEL_45:
    v29 = 5;
    goto LABEL_28;
  }
  if (objc_msgSend(v17, "integerValue") == 6)
  {
    v35 = +[VCHardwareSettings supportsOptimizedHandoversForTelephony](VCHardwareSettings, "supportsOptimizedHandoversForTelephony");
    v36 = 0;
    *a4 = 3;
    *a5 = 0;
    *a7 = v35;
    if (v35)
      v36 = objc_msgSend(v27, "BOOLValue");
    *a8 = v36;
    *a6 = v36;
    goto LABEL_30;
  }
  if (objc_msgSend(v17, "integerValue") == 7)
    goto LABEL_45;
  *a4 = 2;
  *a5 = 1;
  *a6 = 0;
LABEL_30:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v32 = *a4;
      v33 = *a5;
      v34 = *a6;
      v40 = 136316418;
      v41 = v30;
      v42 = 2080;
      v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      v44 = 1024;
      v45 = 975;
      v46 = 1024;
      *(_DWORD *)v47 = v32;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v33;
      LOWORD(v48) = 1024;
      *(_DWORD *)((char *)&v48 + 2) = v34;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d converting Properties to operating mode:%d deviceRole:%d enableAudioPreWarming:%d", (uint8_t *)&v40, 0x2Eu);
    }
  }
  LOBYTE(v21) = *a4 != 0;
  return v21;
}

- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCAudioSession setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:]"), 0));
}

- (int)clientPid
{
  return self->_currentClientPid;
}

- (void)setClientPid:(int)a3
{
  self->_currentClientPid = a3;
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)dispatchedSetAudioSessionProperties:.cold.1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
  v6 = 1024;
  v7 = 231;
  v8 = v0;
  v9 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, v2, " [%s] %s:%d :%s:audioParams does not include audio category or audio mode, Not setting requestedSessionParams", v3);
  OUTLINED_FUNCTION_3();
}

- (void)validNewStartingClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client has already been started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validNewStartingClient:.cold.2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Client has already been started", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

void __29__VCAudioSession_stopClient___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client was not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)convertAudioSessionProperties:(NSObject *)a3 operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = 136315906;
  v6 = a1;
  v7 = 2080;
  v8 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEna"
       "bled:networkUplinkClockUsesBaseband:]";
  v9 = 1024;
  v10 = 973;
  v11 = 2080;
  v12 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, " [%s] %s:%d Could not infer operating mode from audioMode = %s", (uint8_t *)&v5);
}

@end
