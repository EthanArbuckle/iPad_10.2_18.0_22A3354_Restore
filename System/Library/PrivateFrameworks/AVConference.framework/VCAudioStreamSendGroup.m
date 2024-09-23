@implementation VCAudioStreamSendGroup

- (VCAudioStreamSendGroup)initWithConfig:(id)a3
{
  VCAudioStreamSendGroup *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v6, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]([VCAudioStreamGroupCommon alloc], "initWithConfig:audioCallback:context:audioDirection:stateQueue:", a3, VCAudioStreamSendGroup_PushAudioSamples, v4, 2, v4->super.super._stateQueue);
    -[VCObject setLogPrefix:](v4->_common, "setLogPrefix:", -[VCObject logPrefix](v4, "logPrefix"));
    if (v4->_common)
    {
      -[VCAudioStreamSendGroup setMuteOnStreams](v4, "setMuteOnStreams");
      -[VCMediaStreamGroup setCaptureController:](v4, "setCaptureController:", v4);
      v4->_forcedAudioPriorityValue = -[VCDefaults forceAudioPriorityValue](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityValue");
      v4->_forcedAudioPriorityEnabled = -[VCDefaults forceAudioPriorityEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityEnabled");
      v4->_lastAudioPriority = 0;
      v4->_systemAudioCaptureSession = (VCSystemAudioCaptureSession *)(id)objc_msgSend(a3, "systemAudioCaptureSession");
      v4->_shouldScheduleMediaQueue = objc_msgSend(a3, "shouldScheduleMediaQueue");
      if (-[VCAudioStreamSendGroup createIOEventQueues](v4, "createIOEventQueues"))
        return v4;

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup initWithConfig:].cold.2();
      }
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup initWithConfig:].cold.1();
      }
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  tagVCMediaQueue *mediaQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCAudioStreamSendGroup flushAudioEventQueue](self, "flushAudioEventQueue");
  -[VCAudioStreamSendGroup flushAudioRedundancyEventQueue](self, "flushAudioRedundancyEventQueue");
  -[VCAudioStreamSendGroup cleanupIOEventQueues](self, "cleanupIOEventQueues");

  -[VCRedundancyControllerProtocol unregisterStatistics](self->super._redundancyController, "unregisterStatistics");
  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
  {
    CFRelease(mediaQueue);
    self->_mediaQueue = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetector);

  v4.receiver = self;
  v4.super_class = (Class)VCAudioStreamSendGroup;
  -[VCMediaStreamSendGroup dealloc](&v4, sel_dealloc);
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_shouldScheduleMediaQueue = objc_msgSend(a3, "shouldScheduleMediaQueue");
  -[VCAudioStreamGroupCommon cleanupStreams](self->_common, "cleanupStreams");
  v6.receiver = self;
  v6.super_class = (Class)VCAudioStreamSendGroup;
  return -[VCMediaStreamSendGroup setupStreamGroupWithConfig:](&v6, sel_setupStreamGroupWithConfig_, a3);
}

- (BOOL)stopCaptureForEndToEndStreamIfNeeded
{
  if (self->super._streamGroupMode != 1
    || -[VCAudioIO state](-[VCAudioStreamGroupCommon audioIO](self->_common, "audioIO"), "state") != 2)
  {
    return 0;
  }
  -[VCAudioStreamGroupCommon stopCapture](self->_common, "stopCapture");
  return 1;
}

- (BOOL)startCaptureIfNeeded:(BOOL)a3
{
  id v4;
  id v5;
  const __CFString *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCAudioStreamSendGroup *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && (v4 = -[VCAudioStreamGroupCommon startCapture](self->_common, "startCapture")) != 0)
  {
    v5 = v4;
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        -[VCAudioStreamSendGroup startCaptureIfNeeded:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        v11 = 136316418;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCAudioStreamSendGroup startCaptureIfNeeded:]";
        v15 = 1024;
        v16 = 149;
        v17 = 2112;
        v18 = v6;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        v22 = v5;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Starting capture failed with error=%@", (uint8_t *)&v11, 0x3Au);
      }
    }
    LOBYTE(v7) = 0;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
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
  v7[2] = __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke;
  v7[3] = &unk_1E9E55810;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = a4;
  dispatch_sync(stateQueue, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BYTE v43[10];
  uint64_t v44;
  _BYTE v45[6];
  _BYTE v46[6];
  _BYTE v47[6];
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "stopCaptureForEndToEndStreamIfNeeded");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 864) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "audioIO"), "supportsVoiceActivityDetection");
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v3 + 472) == 1
      && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)v3, "configureAudioStreams:deviceRole:operatingMode:", *(_QWORD *)(v3 + 168), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52)), v3 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v27 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v34 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v35 = *(_QWORD *)(a1 + 32);
            v36 = 136316162;
            v37 = v34;
            v38 = 2080;
            v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
            v40 = 1024;
            v41 = 167;
            v42 = 2112;
            *(_QWORD *)v43 = v27;
            *(_WORD *)&v43[8] = 2048;
            v44 = v35;
            v31 = " [%s] %s:%d %@(%p) Failed to configureAudioStreams";
            goto LABEL_47;
          }
        }
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)v3, "startCaptureIfNeeded:", v2);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        goto LABEL_5;
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_3();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v26 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v26 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v33 = *(_QWORD *)(a1 + 32);
            v36 = 136316162;
            v37 = v32;
            v38 = 2080;
            v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
            v40 = 1024;
            v41 = 170;
            v42 = 2112;
            *(_QWORD *)v43 = v26;
            *(_WORD *)&v43[8] = 2048;
            v44 = v33;
            v31 = " [%s] %s:%d %@(%p) Failed to restart capture";
            goto LABEL_47;
          }
        }
      }
    }
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 32);
        v36 = 136316162;
        v37 = v28;
        v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        v40 = 1024;
        v41 = 161;
        v42 = 2112;
        *(_QWORD *)v43 = v25;
        *(_WORD *)&v43[8] = 2048;
        v44 = v30;
        v31 = " [%s] %s:%d %@(%p) Failed to setDeviceRole";
LABEL_47:
        _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v36, 0x30u);
      }
    }
  }
LABEL_5:
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_DWORD *)(a1 + 48);
        v8 = *(_DWORD *)(a1 + 52);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(unsigned __int8 *)(v9 + 864);
        v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v12 = *(_DWORD *)(v9 + 472);
        LODWORD(v9) = *(unsigned __int8 *)(*(_QWORD *)(v9 + 760) + 168);
        v36 = 136317186;
        v37 = v5;
        v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        v40 = 1024;
        v41 = 172;
        v42 = 1024;
        *(_DWORD *)v43 = v7;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v8;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = v11;
        HIWORD(v44) = 1024;
        *(_DWORD *)v45 = v10;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)v46 = v12;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)v47 = v9;
        v13 = " [%s] %s:%d Setting deviceRole=%d, operatingMode=%u, didSucceed=%{BOOL}d, audioControllerSupportsVoiceActi"
              "vityDetection=%{BOOL}d, streamGroupMode=%u, isMediaPriorityEnabled=%{BOOL}d";
        v14 = v6;
        v15 = 64;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v36, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_DWORD *)(a1 + 48);
        v19 = *(_DWORD *)(a1 + 52);
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(unsigned __int8 *)(v20 + 864);
        v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v23 = *(_DWORD *)(v20 + 472);
        v24 = *(unsigned __int8 *)(*(_QWORD *)(v20 + 760) + 168);
        v36 = 136317698;
        v37 = v16;
        v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup setDeviceRole:operatingMode:]_block_invoke";
        v40 = 1024;
        v41 = 172;
        v42 = 2112;
        *(_QWORD *)v43 = v4;
        *(_WORD *)&v43[8] = 2048;
        v44 = v20;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v18;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v19;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = v22;
        v48 = 1024;
        v49 = v21;
        v50 = 1024;
        v51 = v23;
        v52 = 1024;
        v53 = v24;
        v13 = " [%s] %s:%d %@(%p) Setting deviceRole=%d, operatingMode=%u, didSucceed=%{BOOL}d, audioControllerSupportsVo"
              "iceActivityDetection=%{BOOL}d, streamGroupMode=%u, isMediaPriorityEnabled=%{BOOL}d";
        v14 = v17;
        v15 = 84;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)configureAudioStreams:(id)a3 deviceRole:(int)a4 operatingMode:(int)a5
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  _BOOL4 v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  VCAudioStreamSendGroup *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  VCAudioStreamSendGroup *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v5 = *(_QWORD *)&a5;
  v63 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v39 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
  if (!v39)
    goto LABEL_31;
  v36 = self;
  v38 = *(_QWORD *)v60;
  if (a4 == 3)
    v8 = 6;
  else
    v8 = 5;
LABEL_5:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v60 != v38)
      objc_enumerationMutation(a3);
    v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v9);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v11 = (void *)objc_msgSend(v10, "streamConfigs");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v16, "setAudioStreamMode:", v8);
          objc_msgSend(v16, "setOneToOneOperatingMode:", v5);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      }
      while (v13);
    }
    v17 = (void *)objc_msgSend(v10, "stream");
    v18 = objc_msgSend(v17, "state");
    v19 = objc_msgSend(v17, "state");
    v20 = v19;
    v21 = v18 == 2 || v19 == 4;
    v22 = v21;
    if (v21 || objc_msgSend(v17, "state"))
    {
      v40 = objc_msgSend(v17, "stop");
      if (v40)
      {
        if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:].cold.4();
          }
          goto LABEL_31;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v25 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v36, "performSelector:", sel_logPrefix);
        else
          v25 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_31;
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 136316162;
        v42 = v29;
        v43 = 2080;
        v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
        v45 = 1024;
        v46 = 196;
        v47 = 2112;
        v48 = v25;
        v49 = 2048;
        v50 = v36;
        v31 = " [%s] %s:%d %@(%p) stop audio stream failed";
LABEL_74:
        _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
        goto LABEL_31;
      }
    }
    if ((objc_msgSend(v17, "setStreamConfig:withError:", objc_msgSend(v10, "streamConfigs"), &v40) & 1) == 0)
    {
      if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v23)
            return v23;
          -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:].cold.3();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v24 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v36, "performSelector:", sel_logPrefix);
        else
          v24 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x1E0CF2758];
          v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v23)
            return v23;
          *(_DWORD *)buf = 136316418;
          v42 = v27;
          v43 = 2080;
          v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
          v45 = 1024;
          v46 = 200;
          v47 = 2112;
          v48 = v24;
          v49 = 2048;
          v50 = v36;
          v51 = 2112;
          v52 = v40;
          _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) configuring audio stream failed error=%@", buf, 0x3Au);
        }
      }
      LOBYTE(v23) = 0;
      return v23;
    }
    if (v22)
      break;
LABEL_29:
    if (++v9 == v39)
    {
      v39 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      if (v39)
        goto LABEL_5;
      goto LABEL_31;
    }
  }
  v40 = objc_msgSend(v17, "start");
  if (v40)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:].cold.2();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v36, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_31;
    v33 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_DWORD *)buf = 136316162;
    v42 = v33;
    v43 = 2080;
    v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
    v45 = 1024;
    v46 = 204;
    v47 = 2112;
    v48 = v26;
    v49 = 2048;
    v50 = v36;
    v31 = " [%s] %s:%d %@(%p) start audio stream failed";
    goto LABEL_74;
  }
  if (v20 != 4)
    goto LABEL_29;
  v40 = objc_msgSend(v17, "setPause:", 1);
  if (!v40)
    goto LABEL_29;
  if ((VCAudioStreamSendGroup *)objc_opt_class() == v36)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v36, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v42 = v34;
        v43 = 2080;
        v44 = "-[VCAudioStreamSendGroup configureAudioStreams:deviceRole:operatingMode:]";
        v45 = 1024;
        v46 = 208;
        v47 = 2112;
        v48 = v32;
        v49 = 2048;
        v50 = v36;
        v31 = " [%s] %s:%d %@(%p) pause audio stream failed";
        goto LABEL_74;
      }
    }
  }
LABEL_31:
  LOBYTE(v23) = 1;
  return v23;
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
  block[2] = __50__VCAudioStreamSendGroup_setPowerSpectrumEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __50__VCAudioStreamSendGroup_setPowerSpectrumEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setPowerSpectrumEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setBasebandCongestionDetector:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCAudioStreamSendGroup_setBasebandCongestionDetector___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __56__VCAudioStreamSendGroup_setBasebandCongestionDetector___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = *(id *)(a1 + 40);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stream"), "setBasebandCongestionDetector:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)setVADFilteringEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCAudioStreamSendGroup_setVADFilteringEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __49__VCAudioStreamSendGroup_setVADFilteringEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 737) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveVoiceOnly:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateActiveVoiceOnly:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  NSArray *obj;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[18];
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->super.super._mediaStreamInfoArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v35;
    *(_QWORD *)&v6 = 136316162;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "stream", v19);
        objc_msgSend(v10, "setSendActiveVoiceOnly:", v3);
        if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v22 = v17;
              v23 = 2080;
              v24 = "-[VCAudioStreamSendGroup updateActiveVoiceOnly:]";
              v25 = 1024;
              v26 = 251;
              v27 = 1024;
              *(_DWORD *)v28 = v3;
              *(_WORD *)&v28[4] = 2112;
              *(_QWORD *)&v28[6] = v10;
              v14 = v18;
              v15 = " [%s] %s:%d Send active voice only set to %d for stream=%@";
              v16 = 44;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v11 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              v22 = v12;
              v23 = 2080;
              v24 = "-[VCAudioStreamSendGroup updateActiveVoiceOnly:]";
              v25 = 1024;
              v26 = 251;
              v27 = 2112;
              *(_QWORD *)v28 = v11;
              *(_WORD *)&v28[8] = 2048;
              *(_QWORD *)&v28[10] = self;
              v29 = 1024;
              v30 = v3;
              v31 = 2112;
              v32 = v10;
              v14 = v13;
              v15 = " [%s] %s:%d %@(%p) Send active voice only set to %d for stream=%@";
              v16 = 64;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              continue;
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v7);
  }
}

- (void)dispatchedUpdateStreamsWithActiveConnection:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super *v17;
  id v18;
  VCAudioStreamSendGroup *v19;
  objc_super v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super.super._stateQueue);
  if (VCConnection_IsEndToEndLink((uint64_t)a3) && self->super._streamGroupMode == 1)
  {
    v5 = -[VCMediaStreamSendGroup dispatchedMediaStreamInfosForEndToEndConnection:](self, "dispatchedMediaStreamInfosForEndToEndConnection:", 1);
    v18 = a3;
    v6 = objc_msgSend(a3, "isWifiToWifi");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v12 = (void *)objc_msgSend(v11, "streamConfigs");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v23;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v23 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16++), "setUseWifiTiers:", v6);
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
            }
            while (v14);
          }
          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v8);
    }
    v19 = self;
    v17 = (objc_super *)&v19;
    a3 = v18;
  }
  else
  {
    v20.receiver = self;
    v17 = &v20;
  }
  v17->super_class = (Class)VCAudioStreamSendGroup;
  -[objc_super dispatchedUpdateStreamsWithActiveConnection:](v17, sel_dispatchedUpdateStreamsWithActiveConnection_, a3);
}

- (void)setCurrentDTXEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCAudioStreamSendGroup_setCurrentDTXEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCAudioStreamSendGroup_setCurrentDTXEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 738) = *(_BYTE *)(a1 + 40);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stream"), "setCurrentDTXEnable:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCAudioStreamSendGroup_updateVoiceActivityEnabled_isMediaPriorityEnabled___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __76__VCAudioStreamSendGroup_updateVoiceActivityEnabled_isMediaPriorityEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "updateVoiceActivityEnabled:isMediaPriorityEnabled:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (id)willStart
{
  -[VCAudioStreamSendGroup flushAudioEventQueue](self, "flushAudioEventQueue");
  -[VCAudioStreamSendGroup flushAudioRedundancyEventQueue](self, "flushAudioRedundancyEventQueue");
  -[VCAudioStreamGroupCommon startAudioDump](self->_common, "startAudioDump");
  self->_averageInputPower = NAN;
  -[VCAudioStreamSendGroup startVoiceActivityDetection](self, "startVoiceActivityDetection");
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1835623282
    || -[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1835623287)
  {
    -[VCAudioStreamSendGroup startDynamicDucker](self, "startDynamicDucker");
  }
  return -[VCAudioStreamSendGroup setupRedundancyControllerForMode:](self, "setupRedundancyControllerForMode:", self->super._streamGroupMode);
}

- (void)didStop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCAudioStreamGroupCommon stopAudioDump](self->_common, "stopAudioDump");
  -[VCAudioStreamSendGroup stopVoiceActivityDetection](self, "stopVoiceActivityDetection");
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1835623282
    || -[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1835623287)
  {
    -[VCAudioStreamSendGroup stopDynamicDucker](self, "stopDynamicDucker");
  }
  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamSendGroup;
  -[VCMediaStreamSendGroup didStop](&v3, sel_didStop);
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
  block[2] = __35__VCAudioStreamSendGroup_setMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __35__VCAudioStreamSendGroup_setMuted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setMuted:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setMuteOnStreams");
}

- (BOOL)configureStreams
{
  _BOOL4 v3;
  tagVCMediaQueue *v4;
  NSArray *mediaStreamInfoArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  objc_super v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:](self->_common, "configureStreams:withRateControlConfig:", self->super.super._mediaStreamInfoArray, objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"));
  if (v3)
  {
    if (!self->_mediaQueue)
    {
      v4 = (tagVCMediaQueue *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "rateControlConfig"), "vcMediaQueue");
      if (v4)
        v4 = (tagVCMediaQueue *)CFRetain(v4);
      self->_mediaQueue = v4;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(mediaStreamInfoArray);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = (void *)objc_msgSend(v10, "streamConfigs");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "setCellularUniqueTag:", self->_cellularUniqueTag);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
            }
            while (v13);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      }
      while (v7);
    }
    v17.receiver = self;
    v17.super_class = (Class)VCAudioStreamSendGroup;
    LOBYTE(v3) = -[VCMediaStreamGroup configureStreams](&v17, sel_configureStreams);
  }
  return v3;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  double v5;

  if (-[VCMediaStreamGroup state](self, "state") == 1)
  {
    *(float *)&v5 = self->_averageInputPower;
    -[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:](self->_common, "collectAndLogChannelMetrics:averagePower:", a3, v5);
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
  block[2] = __44__VCAudioStreamSendGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __44__VCAudioStreamSendGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCAudioStreamSendGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "setReportingAgent:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  uint64_t v6;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  id v21;
  int v22;
  const __CFString *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  unsigned int v46;
  uint64_t v47;

  v6 = *(_QWORD *)&a6;
  v47 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v30 = v12;
        v31 = 2080;
        v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        v33 = 1024;
        v34 = 360;
        v35 = 2080;
        v36 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        v37 = 2112;
        v38 = a3;
        v39 = 2112;
        v40 = a5;
        v41 = 1024;
        LODWORD(v42) = a4;
        v14 = " [%s] %s:%d StreamGroup=%s streamIDs=%@ mediaBitrates=%@ for targetBitrate=%d";
        v15 = v13;
        v16 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v30 = v17;
        v31 = 2080;
        v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        v33 = 1024;
        v34 = 360;
        v35 = 2112;
        v36 = (char *)v11;
        v37 = 2048;
        v38 = self;
        v39 = 2080;
        v40 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        v41 = 2112;
        v42 = a3;
        v43 = 2112;
        v44 = a5;
        v45 = 1024;
        v46 = a4;
        v14 = " [%s] %s:%d %@(%p) StreamGroup=%s streamIDs=%@ mediaBitrates=%@ for targetBitrate=%d";
        v15 = v18;
        v16 = 84;
        goto LABEL_11;
      }
    }
  }
  v19 = (unsigned __int8 *)VCMemoryPool_Alloc((OSQueueHead *)self->_audioStreamUpdatePool);
  *v19 = objc_msgSend(a3, "count");
  v19[18] = -[VCMediaStreamSendGroup v2PayloadsAllowed](self, "v2PayloadsAllowed");
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v20 = 0;
    do
    {
      *(_WORD *)&v19[2 * v20 + 2] = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v20), "unsignedShortValue");
      v21 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", v20));
      if (v21 && self->super._streamGroupMode == 1)
        objc_msgSend(v21, "setTargetBitrate:rateChangeCounter:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v20), "unsignedIntValue"), v6);
      ++v20;
    }
    while (v20 < (int)objc_msgSend(a3, "count"));
  }
  _VCAudioStreamSendGroup_ProcessActiveStreams((uint64_t)self, v19, (uint64_t)&__block_literal_global_43);
  v22 = *v19;
  if (self->_lastEnqueuedStreamUpdateEventWasEmpty && v22 == 0)
    goto LABEL_33;
  if (CMSimpleQueueEnqueue(self->_audioStreamUpdateEventQueue, v19))
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = *v19;
          *(_DWORD *)buf = 136316418;
          v30 = v27;
          v31 = 2080;
          v32 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          v33 = 1024;
          v34 = 392;
          v35 = 2112;
          v36 = (char *)v24;
          v37 = 2048;
          v38 = self;
          v39 = 1024;
          LODWORD(v40) = v26;
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full! Dropping audio stream update event with %d active streams", buf, 0x36u);
        }
      }
    }
LABEL_33:
    VCMemoryPool_Free((OSQueueHead *)self->_audioStreamUpdatePool, v19);
  }
  self->_lastEnqueuedStreamUpdateEventWasEmpty = v22 == 0;
  v28.receiver = self;
  v28.super_class = (Class)VCAudioStreamSendGroup;
  -[VCMediaStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:](&v28, sel_dispatchedUpdateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter_, a3, a4, a5, v6);
}

void __113__VCAudioStreamSendGroup_dispatchedUpdateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  uint64_t v7;
  id v9;
  unsigned int v10;

  if ((_DWORD)a3)
  {
    LODWORD(v7) = a5;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((_DWORD)v7)
    {
      v7 = v7;
      do
      {
        v10 = *a4++;
        objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v10));
        --v7;
      }
      while (v7);
    }
    objc_msgSend(*(id *)(a2 + 40), "setCompoundStreamIDs:", v9);

  }
  if (*(_BYTE *)(a2 + 9))
    objc_msgSend(*(id *)(a2 + 40), "setRtcpEnabled:", a3);
}

- (id)activeStreamKeys
{
  void *v3;
  tagVCAudioStreamGroupStream *v4;
  tagVCAudioStreamGroupStream *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[VCAudioStreamGroupCommon audioStreams](self->_common, "audioStreams");
  if (v4)
  {
    v5 = v4;
    do
    {
      if (v5->var1)
      {
        v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5->var7, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
        if ((_DWORD)v6)
          v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
        else
          v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->super.super._participantUUID, v7));
      }
      v5 = v5->var0;
    }
    while (v5);
  }
  return v3;
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
  v6[2] = __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke;
  v6[3] = &unk_1E9E52988;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v3 = VRTraceErrorLogLevelToCSTR(),
            v4 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_13:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 760), "addSyncDestination:shouldSchedule:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19) != 0);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_1();
        }
        return;
      }
      v5 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 760);
      *(_DWORD *)v15 = 136316162;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCAudioStreamSendGroup addSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 423;
      WORD2(v16) = 2080;
      *(_QWORD *)((char *)&v16 + 6) = v5;
      HIWORD(v16) = 2048;
      v17 = v6;
      v7 = " [%s] %s:%d Adding syncDestination=%s, common=%p";
      v8 = v4;
      v9 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = *(_QWORD *)(a1 + 40);
      v13 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 760);
      *(_DWORD *)v15 = 136316674;
      *(_QWORD *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCAudioStreamSendGroup addSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 423;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v2;
      HIWORD(v16) = 2048;
      v17 = v12;
      *(_WORD *)v18 = 2080;
      *(_QWORD *)&v18[2] = v13;
      *(_WORD *)&v18[10] = 2048;
      *(_QWORD *)&v18[12] = v14;
      v7 = " [%s] %s:%d %@(%p) Adding syncDestination=%s, common=%p";
      v8 = v11;
      v9 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_2();
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
  v6[2] = __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke;
  v6[3] = &unk_1E9E52988;
  v6[5] = self;
  v6[6] = &v7;
  v6[4] = a3;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v3 = VRTraceErrorLogLevelToCSTR(),
            v4 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_13:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 760), "removeSyncDestination:shouldSchedule:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "state", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19) != 0);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_1();
        }
        return;
      }
      v5 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 760);
      *(_DWORD *)v15 = 136316162;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCAudioStreamSendGroup removeSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 439;
      WORD2(v16) = 2080;
      *(_QWORD *)((char *)&v16 + 6) = v5;
      HIWORD(v16) = 2048;
      v17 = v6;
      v7 = " [%s] %s:%d Removing syncDestination=%s, common=%p";
      v8 = v4;
      v9 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = *(_QWORD *)(a1 + 40);
      v13 = FourccToCStr(objc_msgSend(*(id *)(a1 + 32), "streamGroupID"));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 760);
      *(_DWORD *)v15 = 136316674;
      *(_QWORD *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCAudioStreamSendGroup removeSyncDestination:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 439;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v2;
      HIWORD(v16) = 2048;
      v17 = v12;
      *(_WORD *)v18 = 2080;
      *(_QWORD *)&v18[2] = v13;
      *(_WORD *)&v18[10] = 2048;
      *(_QWORD *)&v18[12] = v14;
      v7 = " [%s] %s:%d %@(%p) Removing syncDestination=%s, common=%p";
      v8 = v11;
      v9 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_2();
  }
}

- (id)startCapture
{
  return -[VCAudioStreamGroupCommon startCapture](self->_common, "startCapture");
}

- (id)stopCapture
{
  return -[VCAudioStreamGroupCommon stopCapture](self->_common, "stopCapture");
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v5[4] = a3;
  v5[5] = self;
  v6 = a4;
  dispatch_async(stateQueue, v5);
}

void __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  const __CFString *v4;
  _DWORD *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  int v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(v3 - 1) == *(id *)(v2 + 480))
  {
    v5 = VCMemoryPool_Alloc(*(OSQueueHead **)(v2 + 800));
    *v5 = *(_DWORD *)(a1 + 48);
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_DWORD *)(a1 + 48);
          v36 = 136315906;
          v37 = v19;
          v38 = 2080;
          v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          v40 = 1024;
          v41 = 471;
          v42 = 1024;
          LODWORD(v43) = v21;
          v22 = " [%s] %s:%d Enqueue new audio redundancyPercentage=%d";
          v23 = v20;
          v24 = 34;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v36, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*v3, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(void **)(a1 + 40);
          v28 = *(_DWORD *)(a1 + 48);
          v36 = 136316418;
          v37 = v25;
          v38 = 2080;
          v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          v40 = 1024;
          v41 = 471;
          v42 = 2112;
          v43 = v6;
          v44 = 2048;
          v45 = v27;
          v46 = 1024;
          LODWORD(v47) = v28;
          v22 = " [%s] %s:%d %@(%p) Enqueue new audio redundancyPercentage=%d";
          v23 = v26;
          v24 = 54;
          goto LABEL_23;
        }
      }
    }
    if (CMSimpleQueueEnqueue(*((CMSimpleQueueRef *)*v3 + 98), v5))
    {
      if ((id)objc_opt_class() == *v3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1(v30, (uint64_t)v3, v31);
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v29 = (const __CFString *)objc_msgSend(*v3, "performSelector:", sel_logPrefix);
        else
          v29 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v34 = *v3;
            v35 = objc_msgSend((id)objc_msgSend(*((id *)*v3 + 95), "audioIO"), "state");
            v36 = 136316418;
            v37 = v32;
            v38 = 2080;
            v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
            v40 = 1024;
            v41 = 474;
            v42 = 2112;
            v43 = v29;
            v44 = 2048;
            v45 = v34;
            v46 = 1024;
            LODWORD(v47) = v35;
            _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full, audioIO.state=%d", (uint8_t *)&v36, 0x36u);
          }
        }
      }
      VCMemoryPool_Free(*((OSQueueHead **)*v3 + 100), v5);
    }
    return;
  }
  if ((id)objc_opt_class() == *v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(const __CFString **)(a1 + 32);
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 480);
        v36 = 136316162;
        v37 = v7;
        v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v40 = 1024;
        v41 = 464;
        v42 = 2112;
        v43 = v9;
        v44 = 2112;
        v45 = v10;
        v11 = " [%s] %s:%d Redundancy controller callback for inactive redundancy controller was ignored. Redundancy cont"
              "roller=%@ Current controller=%@";
        v12 = v8;
        v13 = 48;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v36, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*v3, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD **)(a1 + 40);
        v18 = v16[60];
        v36 = 136316674;
        v37 = v14;
        v38 = 2080;
        v39 = "-[VCAudioStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v40 = 1024;
        v41 = 464;
        v42 = 2112;
        v43 = v4;
        v44 = 2048;
        v45 = v16;
        v46 = 2112;
        v47 = v17;
        v48 = 2112;
        v49 = v18;
        v11 = " [%s] %s:%d %@(%p) Redundancy controller callback for inactive redundancy controller was ignored. Redundan"
              "cy controller=%@ Current controller=%@";
        v12 = v15;
        v13 = 68;
        goto LABEL_15;
      }
    }
  }
}

- (BOOL)createIOEventQueues
{
  const __CFAllocator *v3;
  opaqueCMSimpleQueue **p_audioStreamUpdateEventQueue;
  tagVCMemoryPool *v5;
  tagVCMemoryPool *v6;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  _BYTE v14[24];
  __int128 v15;
  VCAudioStreamSendGroup *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  p_audioStreamUpdateEventQueue = &self->_audioStreamUpdateEventQueue;
  CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 10, &self->_audioStreamUpdateEventQueue);
  if (!*p_audioStreamUpdateEventQueue)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup createIOEventQueues].cold.1();
      }
      goto LABEL_32;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_32;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_DWORD *)v14 = 136316162;
    *(_QWORD *)&v14[4] = v10;
    *(_WORD *)&v14[12] = 2080;
    *(_QWORD *)&v14[14] = "-[VCAudioStreamSendGroup createIOEventQueues]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 492;
    WORD2(v15) = 2112;
    *(_QWORD *)((char *)&v15 + 6) = v8;
    HIWORD(v15) = 2048;
    v16 = self;
    v12 = " [%s] %s:%d %@(%p) Failed to create audio event queue";
    goto LABEL_34;
  }
  v5 = (tagVCMemoryPool *)VCMemoryPool_Create(0x14uLL);
  self->_audioStreamUpdatePool = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamSendGroup createIOEventQueues].cold.2();
    }
    goto LABEL_32;
  }
  CMSimpleQueueCreate(v3, 10, &self->_audioRedundancyChangeEventQueue);
  if (!self->_audioRedundancyChangeEventQueue)
  {
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup createIOEventQueues].cold.3();
      }
      goto LABEL_32;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v13 = VRTraceErrorLogLevelToCSTR(),
          v11 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_32:
      -[VCAudioStreamSendGroup cleanupIOEventQueues](self, "cleanupIOEventQueues", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16);
      return 0;
    }
    *(_DWORD *)v14 = 136316162;
    *(_QWORD *)&v14[4] = v13;
    *(_WORD *)&v14[12] = 2080;
    *(_QWORD *)&v14[14] = "-[VCAudioStreamSendGroup createIOEventQueues]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 498;
    WORD2(v15) = 2112;
    *(_QWORD *)((char *)&v15 + 6) = v9;
    HIWORD(v15) = 2048;
    v16 = self;
    v12 = " [%s] %s:%d %@(%p) Failed to create audioRedundancyChangeQueue";
LABEL_34:
    _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v12, v14, 0x30u);
    goto LABEL_32;
  }
  v6 = (tagVCMemoryPool *)VCMemoryPool_Create(4uLL);
  self->_audioRedundancyEventPool = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamSendGroup createIOEventQueues].cold.4();
    }
    goto LABEL_32;
  }
  return 1;
}

- (void)cleanupIOEventQueues
{
  opaqueCMSimpleQueue *audioStreamUpdateEventQueue;
  opaqueCMSimpleQueue *audioRedundancyChangeEventQueue;

  VCMemoryPool_Destroy((OSQueueHead *)self->_audioStreamUpdatePool);
  audioStreamUpdateEventQueue = self->_audioStreamUpdateEventQueue;
  if (audioStreamUpdateEventQueue)
  {
    CFRelease(audioStreamUpdateEventQueue);
    self->_audioStreamUpdateEventQueue = 0;
  }
  VCMemoryPool_Destroy((OSQueueHead *)self->_audioRedundancyEventPool);
  audioRedundancyChangeEventQueue = self->_audioRedundancyChangeEventQueue;
  if (audioRedundancyChangeEventQueue)
  {
    CFRelease(audioRedundancyChangeEventQueue);
    self->_audioRedundancyChangeEventQueue = 0;
  }
}

- (void)flushAudioEventQueue
{
  void *v3;
  void *v4;

  v3 = (void *)CMSimpleQueueDequeue(self->_audioStreamUpdateEventQueue);
  if (v3)
  {
    v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_audioStreamUpdatePool, v4);
      v4 = (void *)CMSimpleQueueDequeue(self->_audioStreamUpdateEventQueue);
    }
    while (v4);
  }
  self->_lastEnqueuedStreamUpdateEventWasEmpty = 0;
}

- (void)flushAudioRedundancyEventQueue
{
  void *v3;
  void *v4;

  v3 = (void *)CMSimpleQueueDequeue(self->_audioRedundancyChangeEventQueue);
  if (v3)
  {
    v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_audioRedundancyEventPool, v4);
      v4 = (void *)CMSimpleQueueDequeue(self->_audioRedundancyChangeEventQueue);
    }
    while (v4);
  }
}

- (void)startVoiceActivityDetection
{
  opaqueVCVoiceDetector *v3;

  v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_voiceDetector = v3;
  VCVoiceDetector_Start(v3, (uint64_t)-[VCAudioIO clientFormat](-[VCAudioStreamGroupCommon audioIO](self->_common, "audioIO"), "clientFormat"));
}

- (void)stopVoiceActivityDetection
{
  void **p_voiceDetector;

  p_voiceDetector = (void **)&self->_voiceDetector;
  VCVoiceDetector_Stop(self->_voiceDetector);
  VCVoiceDetector_Destroy(p_voiceDetector);
}

- (void)startDynamicDucker
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start the dynamic ducker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopDynamicDucker
{
  void **p_audioDucker;

  p_audioDucker = (void **)&self->_audioDucker;
  VCAudioDucker_Stop((uint64_t)self->_audioDucker);
  VCAudioDucker_Destroy(p_audioDucker);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setMuted:", -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (id)setupRedundancyControllerForMode:(unsigned int)a3
{
  void *v4;
  void *v5;
  VCRedundancyControllerAudio *v6;
  VCRedundancyControllerAudio *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE v21[24];
  __int128 v22;
  VCAudioStreamSendGroup *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
  if (v4)
  {
    v5 = v4;
    if (!objc_msgSend(v4, "streamGroupRedundancyControlEnabled")
      || objc_msgSend(v5, "redundancyController"))
    {
      return 0;
    }
    if (objc_msgSend(v5, "statisticsCollector"))
    {
      v6 = -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]([VCRedundancyControllerAudio alloc], "initWithDelegate:statisticsCollector:mode:", self, objc_msgSend(v5, "statisticsCollector"), objc_msgSend(v5, "redundancyMode"));
      if (v6)
      {
        v7 = v6;
        if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_17;
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_17;
          *(_DWORD *)v21 = 136315650;
          *(_QWORD *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 584;
          v11 = " [%s] %s:%d Redundancy controller is created";
          v12 = v10;
          v13 = 28;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v8 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_17;
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_17;
          *(_DWORD *)v21 = 136316162;
          *(_QWORD *)&v21[4] = v14;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 584;
          WORD2(v22) = 2112;
          *(_QWORD *)((char *)&v22 + 6) = v8;
          HIWORD(v22) = 2048;
          v23 = self;
          v11 = " [%s] %s:%d %@(%p) Redundancy controller is created";
          v12 = v15;
          v13 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
LABEL_17:
        objc_msgSend(v5, "setRedundancyController:", v7, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23);
        -[VCMediaStreamSendGroup setRedundancyController:](self, "setRedundancyController:", v7);

        return 0;
      }
      v17 = CFSTR("Failed to create audio redundancy controller");
    }
    else
    {
      v17 = CFSTR("Need statistics collector to create redundancy controller");
    }
  }
  else
  {
    v17 = CFSTR("Tried to create redundancy controller for mode which VCMediaStreamSendGroupConfig is nil");
  }
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamSendGroup setupRedundancyControllerForMode:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v21 = 136316418;
        *(_QWORD *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCAudioStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 592;
        WORD2(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 6) = v18;
        HIWORD(v22) = 2048;
        v23 = self;
        v24 = 2112;
        v25 = v17;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", v21, 0x3Au);
      }
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, v17);
}

- (id)checkStreamsForAdditionalOptIn:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 isRemoteOnPeace;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->super._isRemoteOnPeace)
  {
    if (-[NSArray count](self->super.super._mediaStreamInfoArray, "count"))
    {
      v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->super.super._mediaStreamInfoArray, "objectAtIndexedSubscript:", 0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v5, "idsStreamID"));
      if ((objc_msgSend(a3, "containsObject:", v6) & 1) == 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a3);
        objc_msgSend(v7, "addObject:", v6);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            isRemoteOnPeace = self->super._isRemoteOnPeace;
            v12 = 136316162;
            v13 = v8;
            v14 = 2080;
            v15 = "-[VCAudioStreamSendGroup checkStreamsForAdditionalOptIn:]";
            v16 = 1024;
            v17 = 611;
            v18 = 1024;
            v19 = isRemoteOnPeace;
            v20 = 2112;
            v21 = v6;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote side is on Peace [%d]. Adding subscription to low Quality audio %@", (uint8_t *)&v12, 0x2Cu);
          }
        }
        return v7;
      }
    }
  }
  return a3;
}

- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  unint64_t v5;
  char v6;
  VCAudioStreamSendGroup *v7;
  NSArray *mediaStreams;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  unsigned int var0;
  unsigned __int8 *v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  char v33;
  unsigned __int8 *v36;
  uint8_t buf[4];
  uint64_t v38;
  _WORD v39[6];
  int v40;
  _BYTE v41[12];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&a3->var0 & 0x1F) != 0)
  {
    v5 = 0;
    v6 = 0;
    v36 = &a3->var1.var22.var1.var0[16];
LABEL_3:
    v33 = v6;
    do
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v7 = self;
      mediaStreams = self->super.super._mediaStreams;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
      if (v9)
      {
        v10 = v9;
        v11 = &v36[24 * v5];
        v12 = *(_QWORD *)v54;
LABEL_6:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(mediaStreams);
          v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v13);
          v15 = *(_DWORD *)v11;
          if (v15 == objc_msgSend(v14, "localSSRC"))
            break;
          if (v10 == ++v13)
          {
            v10 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
            if (v10)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
        var0 = a3->var1.var0.var0;
        v17 = &v36[24 * v5];
        v18 = (100 * v17[4]) >> 8;
        v19 = *((_DWORD *)v17 + 2);
        v20 = RTCPComputeRoundTripTimeMiddle32((uint64_t)v11, a4.wide);
        v21 = Middle32ToMilliSeconds(v20);
        v38 = 0;
        memset(v39, 0, sizeof(v39));
        *(_DWORD *)buf = 8;
        v40 = var0;
        *(_DWORD *)v41 = v18;
        *(_DWORD *)&v41[4] = v19;
        *(_DWORD *)&v41[8] = v21;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v14, "setVCStatistics:", buf);
        ++v5;
        v6 = 1;
        self = v7;
        if (v5 < (*(_WORD *)&a3->var0 & 0x1Fu))
          goto LABEL_3;
        goto LABEL_17;
      }
LABEL_12:
      ++v5;
      self = v7;
    }
    while (v5 < (*(_WORD *)&a3->var0 & 0x1Fu));
    if ((v33 & 1) == 0)
      goto LABEL_20;
LABEL_17:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v38 = v24;
          v39[0] = 2080;
          *(_QWORD *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          v40 = 640;
          v26 = " [%s] %s:%d RTCP report found!!";
          v27 = v25;
          v28 = 28;
LABEL_33:
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v22 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v38 = v29;
          v39[0] = 2080;
          *(_QWORD *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          v40 = 640;
          *(_WORD *)v41 = 2112;
          *(_QWORD *)&v41[2] = v22;
          *(_WORD *)&v41[10] = 2048;
          *(_QWORD *)&v42 = self;
          v26 = " [%s] %s:%d %@(%p) RTCP report found!!";
          v27 = v30;
          v28 = 48;
          goto LABEL_33;
        }
      }
    }
  }
  else
  {
LABEL_20:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v38 = v31;
          v39[0] = 2080;
          *(_QWORD *)&v39[1] = "-[VCAudioStreamSendGroup didReceiveReportPacket:arrivalNTPTime:]";
          v39[5] = 1024;
          v40 = 638;
          *(_WORD *)v41 = 2112;
          *(_QWORD *)&v41[2] = v23;
          *(_WORD *)&v41[10] = 2048;
          *(_QWORD *)&v42 = self;
          _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) RTCP report not found!!", buf, 0x30u);
        }
      }
    }
  }
}

- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  VCAudioStreamSendGroup *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  unsigned int var0;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  char v19;
  NSArray *mediaStreams;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  unint64_t wide;
  char v52;
  VCAudioStreamSendGroup *v53;
  uint64_t var2;
  uint64_t v55;
  uint8_t buf[4];
  uint64_t v57;
  _WORD v58[6];
  int v59;
  _BYTE v60[12];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  wide = a4.wide;
  v5 = self;
  v76 = *MEMORY[0x1E0C80C00];
  var2 = a3->var1.var0.var2;
  if ((VCAudioStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *((unsigned __int8 *)&a3->var0 + 1);
        var0 = a3->var1.var0.var0;
        *(_DWORD *)buf = 136316418;
        v57 = v7;
        v58[0] = 2080;
        *(_QWORD *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
        v58[5] = 1024;
        v59 = 648;
        *(_WORD *)v60 = 1024;
        *(_DWORD *)&v60[2] = v9;
        *(_WORD *)&v60[6] = 1024;
        *(_DWORD *)&v60[8] = var0;
        LOWORD(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 2) = var2;
        v11 = " [%s] %s:%d Received custom report (%d) from %x with %d reception reports";
        v12 = v8;
        v13 = 46;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v5, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *((unsigned __int8 *)&a3->var0 + 1);
        v17 = a3->var1.var0.var0;
        *(_DWORD *)buf = 136316930;
        v57 = v14;
        v58[0] = 2080;
        *(_QWORD *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
        v58[5] = 1024;
        v59 = 648;
        *(_WORD *)v60 = 2112;
        *(_QWORD *)&v60[2] = v6;
        *(_WORD *)&v60[10] = 2048;
        *(_QWORD *)&v61 = v5;
        WORD4(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 10) = v16;
        HIWORD(v61) = 1024;
        LODWORD(v62) = v17;
        WORD2(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 6) = var2;
        v11 = " [%s] %s:%d %@(%p) Received custom report (%d) from %x with %d reception reports";
        v12 = v15;
        v13 = 66;
        goto LABEL_11;
      }
    }
  }
  if ((_DWORD)var2)
  {
    v18 = 0;
    v19 = 0;
    v53 = v5;
LABEL_14:
    v52 = v19;
    do
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      mediaStreams = v5->super.super._mediaStreams;
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v72, v71, 16, wide);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v73;
        v24 = &a3->var1.var2.var1.var2[12 * v18 + 7];
        v25 = &a3->var1.var2.var1.var2[12 * v18 + 23];
        v55 = v18;
LABEL_17:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v73 != v23)
            objc_enumerationMutation(mediaStreams);
          v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v26);
          v28 = *((unsigned __int8 *)&a3->var0 + 1) << 8 == 62720 ? v24 : v25;
          v29 = *(_DWORD *)v28;
          if (v29 == objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v26), "localSSRC"))
            break;
          if (v22 == ++v26)
          {
            v22 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
            v18 = v55;
            if (v22)
              goto LABEL_17;
            goto LABEL_26;
          }
        }
        v30 = *((unsigned __int16 *)v28 + 3);
        v31 = objc_msgSend(v27, "getRTCPReportNTPTimeMiddle32ForReportId:", *((_WORD *)v28 + 2) & 0xF);
        if (v30)
        {
          v32 = v31;
          v33 = 0xFFFF * v30;
          v34 = NTPToMiddle32(wide);
          if (v34 - v32 >= v33)
            v35 = v34 - v32 - v33;
          else
            v35 = 0;
        }
        else
        {
          v35 = 0;
        }
        v36 = a3->var1.var0.var0;
        v37 = (3289700 * v28[10]) >> 23;
        v38 = objc_msgSend(v27, "getExtendedSequenceNumberForSequenceNumber:", *((unsigned __int16 *)v28 + 4));
        v39 = Middle32ToMilliSeconds(v35);
        v57 = 0;
        memset(v58, 0, sizeof(v58));
        *(_DWORD *)buf = 8;
        v59 = v36;
        *(_DWORD *)v60 = v37;
        *(_DWORD *)&v60[4] = v38;
        *(_DWORD *)&v60[8] = v39;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v27, "setVCStatistics:", buf);
        v18 = v55 + 1;
        v19 = 1;
        v5 = v53;
        if (v55 + 1 != var2)
          goto LABEL_14;
        goto LABEL_36;
      }
LABEL_26:
      ++v18;
      v5 = v53;
    }
    while (v18 != var2);
    if ((v52 & 1) == 0)
      goto LABEL_39;
LABEL_36:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v57 = v42;
          v58[0] = 2080;
          *(_QWORD *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          v59 = 682;
          v44 = " [%s] %s:%d RTCP report found!!";
          v45 = v43;
          v46 = 28;
LABEL_52:
          _os_log_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v40 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v40 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v47 = VRTraceErrorLogLevelToCSTR();
        v48 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v57 = v47;
          v58[0] = 2080;
          *(_QWORD *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          v59 = 682;
          *(_WORD *)v60 = 2112;
          *(_QWORD *)&v60[2] = v40;
          *(_WORD *)&v60[10] = 2048;
          *(_QWORD *)&v61 = v5;
          v44 = " [%s] %s:%d %@(%p) RTCP report found!!";
          v45 = v48;
          v46 = 48;
          goto LABEL_52;
        }
      }
    }
  }
  else
  {
LABEL_39:
    if ((VCAudioStreamSendGroup *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[VCAudioStreamSendGroup performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v49 = VRTraceErrorLogLevelToCSTR();
        v50 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v57 = v49;
          v58[0] = 2080;
          *(_QWORD *)&v58[1] = "-[VCAudioStreamSendGroup didReceiveCustomReportPacket:arrivalNTPTime:]";
          v58[5] = 1024;
          v59 = 680;
          *(_WORD *)v60 = 2112;
          *(_QWORD *)&v60[2] = v41;
          *(_WORD *)&v60[10] = 2048;
          *(_QWORD *)&v61 = v5;
          _os_log_error_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) RTCP report not found!!", buf, 0x30u);
        }
      }
    }
  }
}

- (BOOL)isVADFilteringEnabled
{
  return self->_isCurrentDTXEnabled;
}

- (BOOL)isCurrentDTXEnabled
{
  return *(&self->_isCurrentDTXEnabled + 1);
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (unsigned)cellularUniqueTag
{
  return self->_cellularUniqueTag;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  self->_cellularUniqueTag = a3;
}

- (VCAudioStreamGroupCommon)common
{
  return self->_common;
}

void __VCAudioStreamSendGroup_UpdateActiveAudioStreams_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, unsigned int a5)
{
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  void *v16;
  id v17;

  if (*(_BYTE *)(a2 + 8) && (a3 & 1) == 0)
    VCAudioStream_PushRemainingSamples(*(_QWORD *)(a2 + 40));
  *(_BYTE *)(a2 + 8) = a3;
  if (a3 && !*(_DWORD *)(*(_QWORD *)(a1 + 32) + 472))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 18);
    if (*(unsigned __int8 *)(a2 + 72) != v10)
    {
      v11 = 64;
      if (!v10)
        v11 = 56;
      VCAudioStream_SetAllowedCodecConfigurations(*(_QWORD *)(a2 + 40), *(const __CFDictionary **)(a2 + v11));
      *(_BYTE *)(a2 + 72) = v10;
    }
    v12 = *(void **)(a2 + 40);
    v13 = a5;
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
    if (a5)
    {
      do
      {
        v14 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v15 = *a4++;
        v16 = (void *)objc_msgSend(v14, "initWithUnsignedShort:", v15);
        objc_msgSend(v17, "addObject:", v16);

        --v13;
      }
      while (v13);
    }
    objc_msgSend(v12, "setStreamIDs:repairStreamIDs:", v17, 0);

  }
}

void __VCAudioStreamSendGroup_UpdateActiveAudioStreams_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didChangeSendingStreamsForStreamGroup:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __VCAudioStreamSendGroup_UpdateAudioPriorityUplink_block_invoke(uint64_t a1)
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

- (void)initWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create IO event queues", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startCaptureIfNeeded:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Starting capture failed with error=%@");
  OUTLINED_FUNCTION_3();
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setDeviceRole", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configureAudioStreams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__VCAudioStreamSendGroup_setDeviceRole_operatingMode___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to restart capture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d pause audio stream failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d start audio stream failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d configuring audio stream failed error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)configureAudioStreams:deviceRole:operatingMode:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stop audio stream failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = "-[VCAudioStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
  v4 = 1024;
  v5 = 392;
  v6 = 1024;
  v7 = v0;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d CMSimpleQueueEnqueue Full! Dropping audio stream update event with %d active streams", v2);
  OUTLINED_FUNCTION_3();
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add sync destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCAudioStreamSendGroup_addSyncDestination___block_invoke_cold_2()
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

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to remove sync destination", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCAudioStreamSendGroup_removeSyncDestination___block_invoke_cold_2()
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

void __77__VCAudioStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)a2 + 760), "audioIO"), "state");
  v8 = 136315906;
  v9 = a1;
  v10 = 2080;
  OUTLINED_FUNCTION_4_0();
  v11 = 474;
  v12 = v5;
  v13 = v6;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v7, " [%s] %s:%d CMSimpleQueueEnqueue Full, audioIO.state=%d", (uint8_t *)&v8);
}

- (void)createIOEventQueues
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio redundancy event pool", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRedundancyControllerForMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d %@");
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveReportPacket:arrivalNTPTime:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RTCP report not found!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveCustomReportPacket:arrivalNTPTime:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RTCP report not found!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
