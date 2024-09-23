@implementation VCAudioStreamReceiveGroup

- (VCAudioStreamReceiveGroup)initWithConfig:(id)a3
{
  VCAudioStreamReceiveGroup *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  v4 = -[VCMediaStreamReceiveGroup initWithConfig:](&v6, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]([VCAudioStreamGroupCommon alloc], "initWithConfig:audioCallback:context:audioDirection:stateQueue:", a3, VCAudioStreamReceiveGroup_PullAudioSamples, v4, 1, v4->super.super._stateQueue);
    -[VCObject setLogPrefix:](v4->_common, "setLogPrefix:", -[VCObject logPrefix](v4, "logPrefix"));
    if (v4->_common)
    {
      -[VCAudioStreamReceiveGroup setMuteOnStreams](v4, "setMuteOnStreams");
      v4->_didPullSamplesCallback = (void *)objc_msgSend((id)objc_msgSend(a3, "audioStreamGroupConfig"), "didProcessSamplesCallback");
      v4->_didPullSamplesCallbackContext = (void *)objc_msgSend((id)objc_msgSend(a3, "audioStreamGroupConfig"), "didProcessSamplesCallbackContext");
      -[VCMediaStreamGroup setCaptureController:](v4, "setCaptureController:", v4);
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamReceiveGroup initWithConfig:].cold.1();
      }
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamReceiveGroup;
  -[VCMediaStreamReceiveGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD v7[6];
  int v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  stateQueue = self->super.super._stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__VCAudioStreamReceiveGroup_setDeviceRole_operatingMode___block_invoke;
  v7[3] = &unk_1E9E52378;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = a4;
  dispatch_sync(stateQueue, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __57__VCAudioStreamReceiveGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deviceRole
{
  return -[VCAudioStreamGroupCommon deviceRole](self->_common, "deviceRole");
}

- (BOOL)isPowerSpectrumEnabled
{
  return -[VCAudioStreamGroupCommon isPowerSpectrumEnabled](self->_common, "isPowerSpectrumEnabled");
}

- (void)setPowerSpectrumEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCAudioStreamReceiveGroup_setPowerSpectrumEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__VCAudioStreamReceiveGroup_setPowerSpectrumEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setPowerSpectrumEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (unsigned)audioChannelIndex
{
  NSObject *stateQueue;
  unsigned int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCAudioStreamReceiveGroup_audioChannelIndex__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__VCAudioStreamReceiveGroup_audioChannelIndex__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "audioChannelIndex");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAudioChannelIndex:(unsigned int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCAudioStreamReceiveGroup_setAudioChannelIndex___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __50__VCAudioStreamReceiveGroup_setAudioChannelIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAudioChannelIndex:", *(unsigned int *)(a1 + 40));
}

- (BOOL)isMuted
{
  return -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted");
}

- (void)setMuted:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCAudioStreamReceiveGroup_setMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __38__VCAudioStreamReceiveGroup_setMuted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setMuted:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setMuteOnStreams");
}

- (BOOL)configureStreams
{
  _BOOL4 v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:](self->_common, "configureStreams:withRateControlConfig:", self->super.super._mediaStreamInfoArray, objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"));
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)VCAudioStreamReceiveGroup;
    LOBYTE(v3) = -[VCMediaStreamGroup configureStreams](&v5, sel_configureStreams);
  }
  return v3;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  double v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  unint64_t speakerProcsCalled;
  unint64_t syncTargetCalled;
  double averageOutputPower;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamGroup state](self, "state") == 1)
  {
    *(float *)&v5 = self->_averageOutputPower;
    -[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:](self->_common, "collectAndLogChannelMetrics:averagePower:", a3, v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = -[VCObject logPrefix](self, "logPrefix");
        speakerProcsCalled = self->_speakerProcsCalled;
        syncTargetCalled = self->_syncTargetCalled;
        averageOutputPower = self->_averageOutputPower;
        v12 = 136316674;
        v13 = v6;
        v14 = 2080;
        v15 = "-[VCAudioStreamReceiveGroup collectAndLogChannelMetrics:]";
        v16 = 1024;
        v17 = 135;
        v18 = 2112;
        v19 = v8;
        v20 = 2048;
        v21 = speakerProcsCalled;
        v22 = 2048;
        v23 = averageOutputPower;
        v24 = 2048;
        v25 = syncTargetCalled;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioStreamReceiveGroup %@ speakerProcsCalled=%ld, averageOutputPower=%f, syncTargetCalled=%ld", (uint8_t *)&v12, 0x44u);
      }
    }
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCAudioStreamReceiveGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCAudioStreamReceiveGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCAudioStreamReceiveGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setReportingAgent:", *(_QWORD *)(a1 + 40));
}

- (void)setActiveStreamIDs:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCAudioStreamReceiveGroup_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __48__VCAudioStreamReceiveGroup_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432)) & 1) == 0)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "objectForKeyedSubscript:", v7), "setTargetStreamID:", v7);
          objc_msgSend(*(id *)(a1 + 40), "setOptedInStreamID:", v7);
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)setOptedInStreamID:(id)a3
{

  self->super._optedInStreamID = (NSNumber *)a3;
}

- (id)willStart
{
  -[VCAudioStreamGroupCommon startAudioDump](self->_common, "startAudioDump");
  self->_averageOutputPower = NAN;
  return 0;
}

- (void)didStart
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCAudioStreamReceiveGroup didStart]";
  v4 = 1024;
  v5 = 173;
  v6 = 2112;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d System audio start capture failed on receive stream group with error=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)didStop
{
  -[VCAudioStreamGroupCommon stopAudioDump](self->_common, "stopAudioDump");
}

- (BOOL)addSyncDestination:(id)a3
{
  NSObject *stateQueue;
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
  v10 = 1;
  stateQueue = self->super.super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke;
  v6[3] = &unk_1E9E52988;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  char *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v5 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
          v6 = *(char **)(*(_QWORD *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316162;
          v32 = v3;
          v33 = 2080;
          v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
          v35 = 1024;
          v36 = 187;
          v37 = 2080;
          v38 = v5;
          v39 = 2048;
          v40 = v6;
          v7 = " [%s] %s:%d Adding syncDestination=%s, common=%p";
          v8 = v4;
          v9 = 48;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(char **)(a1 + 40);
          v13 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316674;
          v32 = v10;
          v33 = 2080;
          v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
          v35 = 1024;
          v36 = 187;
          v37 = 2112;
          v38 = (void *)v2;
          v39 = 2048;
          v40 = v12;
          v41 = 2080;
          v42 = v13;
          v43 = 2048;
          v44 = v14;
          v7 = " [%s] %s:%d %@(%p) Adding syncDestination=%s, common=%p";
          v8 = v11;
          v9 = 68;
          goto LABEL_12;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 472), "addSyncDestination:shouldSchedule:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state") != 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v15 = VCAudioStreamGroup_OverlayToken(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 472));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "stream"), "setOverlayToken:", v15);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        }
        while (v18);
      }
      v21 = objc_msgSend(*(id *)(a1 + 40), "syncSource");
      if (v21)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setSyncSource:", v21);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_1();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v24 = FourccToCStr(objc_msgSend(*(id *)(a1 + 40), "streamGroupID"));
        v25 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
        *(_DWORD *)buf = 136316162;
        v32 = v22;
        v33 = 2080;
        v34 = "-[VCAudioStreamReceiveGroup addSyncDestination:]_block_invoke";
        v35 = 1024;
        v36 = 189;
        v37 = 2080;
        v38 = v24;
        v39 = 2080;
        v40 = v25;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add sync destination. streamGroup=%s syncDestination=%s", buf, 0x30u);
      }
    }
    return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_2();
  }
}

- (BOOL)removeSyncDestination:(id)a3
{
  NSObject *stateQueue;
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
  v10 = 1;
  stateQueue = self->super.super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke;
  v6[3] = &unk_1E9E52988;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  char *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v5 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
          v6 = *(char **)(*(_QWORD *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316162;
          v31 = v3;
          v32 = 2080;
          v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
          v34 = 1024;
          v35 = 213;
          v36 = 2080;
          v37 = v5;
          v38 = 2048;
          v39 = v6;
          v7 = " [%s] %s:%d Removing syncDestination=%s, common=%p";
          v8 = v4;
          v9 = 48;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(char **)(a1 + 40);
          v13 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 472);
          *(_DWORD *)buf = 136316674;
          v31 = v10;
          v32 = 2080;
          v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
          v34 = 1024;
          v35 = 213;
          v36 = 2112;
          v37 = (void *)v2;
          v38 = 2048;
          v39 = v12;
          v40 = 2080;
          v41 = v13;
          v42 = 2048;
          v43 = v14;
          v7 = " [%s] %s:%d %@(%p) Removing syncDestination=%s, common=%p";
          v8 = v11;
          v9 = 68;
          goto LABEL_12;
        }
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 472), "removeSyncDestination:shouldSchedule:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state") != 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v15 = VCAudioStreamGroup_OverlayToken(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 472));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "stream"), "setOverlayToken:", v15);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        }
        while (v18);
      }
      if (objc_msgSend(*(id *)(a1 + 40), "syncSource"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setSyncSource:", 0);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_1();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
        v24 = FourccToCStr(objc_msgSend(*(id *)(a1 + 40), "streamGroupID"));
        *(_DWORD *)buf = 136316162;
        v31 = v21;
        v32 = 2080;
        v33 = "-[VCAudioStreamReceiveGroup removeSyncDestination:]_block_invoke";
        v34 = 1024;
        v35 = 215;
        v36 = 2080;
        v37 = v23;
        v38 = 2080;
        v39 = v24;
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed removing remove syncDestination=%s from streamGroup=%s", buf, 0x30u);
      }
    }
    return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_2();
  }
}

- (void)setMuteOnStreams
{
  NSArray *mediaStreams;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setRemoteMuted:", -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (VCMediaStreamSyncSource)syncSource
{
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1835623287)
    return (VCMediaStreamSyncSource *)-[NSArray firstObject](self->super.super._mediaStreams, "firstObject");
  else
    return 0;
}

- (id)startCapture
{
  return -[VCAudioStreamGroupCommon startCapture](self->_common, "startCapture");
}

- (id)stopCapture
{
  return -[VCAudioStreamGroupCommon stopCapture](self->_common, "stopCapture");
}

- (BOOL)isAudioExpected
{
  return self->super.super._state == 1;
}

- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  NSObject *stateQueue;
  _QWORD v6[6];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke;
  v6[3] = &unk_1E9E529D8;
  v6[4] = self;
  v7 = a4;
  *(double *)&v6[5] = a5;
  dispatch_async(stateQueue, v6);
}

_BYTE *__71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  result = *(_BYTE **)(a1 + 32);
  if (result[528])
  {
    if (*(_BYTE *)(a1 + 48))
    {
      result = (_BYTE *)objc_msgSend(result, "isAudioExpected");
      if ((_DWORD)result)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v3 = VRTraceErrorLogLevelToCSTR();
          v4 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v5 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136315906;
            v25 = v3;
            v26 = 2080;
            v27 = "-[VCAudioStreamReceiveGroup vcMediaStream:remoteMediaStalled:duration:]_block_invoke";
            v28 = 1024;
            v29 = 284;
            v30 = 2048;
            v31 = v5;
            _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio is stalling with duration %f", buf, 0x26u);
          }
        }
        v6 = *(void **)(a1 + 32);
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_12;
        v20 = &unk_1E9E529B0;
        v21 = v6;
        LOBYTE(v23) = *(_BYTE *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 40);
        v7 = &v17;
        return (_BYTE *)objc_msgSend(v6, "callDelegateWithBlock:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
      }
      if (*(_BYTE *)(a1 + 48))
        return result;
    }
    if (*(double *)(a1 + 40) != 0.0)
      return result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v25 = v8;
        v26 = 2080;
        v27 = "-[VCAudioStreamReceiveGroup vcMediaStream:remoteMediaStalled:duration:]_block_invoke_2";
        v28 = 1024;
        v29 = 289;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio has stopped stalling", buf, 0x1Cu);
      }
    }
    v6 = *(void **)(a1 + 32);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_15;
    v13 = &unk_1E9E529B0;
    v14 = v6;
    LOBYTE(v16) = *(_BYTE *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 40);
    v7 = &v10;
    return (_BYTE *)objc_msgSend(v6, "callDelegateWithBlock:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  return result;
}

uint64_t __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:remoteMediaStalled:duration:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

uint64_t __71__VCAudioStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:remoteMediaStalled:duration:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

- (void)vcMediaStream:(id)a3 didSwitchToAudioStreamWithID:(unsigned __int16)a4
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke;
  block[3] = &unk_1E9E52A50;
  v6 = a4;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  __int16 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  __int16 v10;
  __int16 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "isEqualToNumber:", v2);
  if ((result & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "shortValue");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 528) = *(_WORD *)(a1 + 40) == 0;
    objc_msgSend(*(id *)(a1 + 32), "setActiveStreamID:", v2);
    v5 = *(void **)(a1 + 32);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_2;
    v9[3] = &unk_1E9E52A00;
    v9[4] = v5;
    v10 = v4;
    v11 = *(_WORD *)(a1 + 40);
    objc_msgSend(v5, "callDelegateWithBlock:", v9);
    v7 = *(void **)(a1 + 32);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_3;
    v8[3] = &unk_1E9E52A28;
    v8[4] = v7;
    return objc_msgSend(v7, "callDelegateWithBlock:", v8);
  }
  return result;
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didSwitchFromStreamID:toStreamID:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42));
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didSwitchToAudioStreamWithID___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeReceivingStreamsForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4
{
  double v5;
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v5 = micro();
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  *(double *)&block[5] = v5;
  dispatch_async(stateQueue, block);
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v5[5];
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setFirstMediaFrameReceivedTime:", *(double *)(a1 + 40));
  v2 = *(double *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  objc_msgSendSuper2(&v6, sel_finalizePerfTimersForFirstMediaFrameWithTime_, v2);
  VCPerfTimingUtilsSetStopForKeyOnceWithTime(*(void **)(*(_QWORD *)(a1 + 32) + 240), 5, *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reportParticipantsPerfTimings");
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2;
  v5[3] = &unk_1E9E52A28;
  v5[4] = v3;
  return objc_msgSend(v3, "callDelegateWithBlock:", v5);
}

uint64_t __72__VCAudioStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveFirstFrameForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamReceiveGroup;
  -[VCMediaStreamGroup mediaStream:didReceiveNewMediaKeyIndex:](&v6, sel_mediaStream_didReceiveNewMediaKeyIndex_, a3);
  -[VCMediaStreamGroup setupPerfTimersWithMediaKeyIndex:perfTimerIndexToStart:](self, "setupPerfTimersWithMediaKeyIndex:perfTimerIndexToStart:", a4, 5);
}

void __VCAudioStreamReceiveGroup_UpdateAudioPriority_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "streamGroup:didChangeMediaPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)initWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCAudioStreamGroupCommon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set sync source on sync destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCAudioStreamReceiveGroup_addSyncDestination___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set sync source on sync destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__VCAudioStreamReceiveGroup_removeSyncDestination___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected type of syncDestination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
