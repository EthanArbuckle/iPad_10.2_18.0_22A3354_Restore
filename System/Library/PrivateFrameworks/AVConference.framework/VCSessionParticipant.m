@implementation VCSessionParticipant

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  objc_storeWeak(&self->_reportingAgentWeak, a3);
}

- (int)operatingMode
{
  if (!self->_oneToOneModeEnabled)
    return 6;
  if (-[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled"))
    return 1;
  return 2;
}

- (BOOL)isAnyCameraMediaTypeEnabled
{
  return -[VCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 1)
      || -[VCSessionParticipant isPersonaCameraEnabled](self, "isPersonaCameraEnabled");
}

- (BOOL)dispatchedIsAnyCameraMediaTypeEnabled
{
  return self->_videoEnabled
      || -[VCSessionParticipant dispatchedIsPersonaCameraEnabled](self, "dispatchedIsPersonaCameraEnabled");
}

- (BOOL)dispatchedIsPersonaCameraEnabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  return -[VCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 6)
      || -[VCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 7)
      || -[VCSessionParticipant isEnabledMediaType:](self, "isEnabledMediaType:", 8);
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant isEnabledMediaType:]"), 0));
}

- (BOOL)isPersonaCameraEnabled
{
  NSObject *participantQueue;
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
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCSessionParticipant_isPersonaCameraEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__VCSessionParticipant_isPersonaCameraEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedIsPersonaCameraEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSDictionary)mediaTypeMixingList
{
  os_unfair_lock_s *p_mediaTypeMixingListLock;
  NSDictionary *v4;

  p_mediaTypeMixingListLock = &self->_mediaTypeMixingListLock;
  os_unfair_lock_lock(&self->_mediaTypeMixingListLock);
  v4 = (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mediaTypeMixingList, "copy");
  os_unfair_lock_unlock(p_mediaTypeMixingListLock);
  return v4;
}

- (void)callDelegateWithBlock:(id)a3
{
  uint64_t v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCSessionParticipant *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = MEMORY[0x1DF086F1C](&self->_delegate, a2);
    if (v5)
    {
      v6 = (const void *)v5;
      (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
      CFRelease(v6);
      return;
    }
    if ((VCSessionParticipant *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v13 = 136316162;
      v14 = v12;
      v15 = 2080;
      v16 = "-[VCSessionParticipant callDelegateWithBlock:]";
      v17 = 1024;
      v18 = 157;
      v19 = 2112;
      v20 = v8;
      v21 = 2048;
      v22 = self;
      v11 = " [%s] %s:%d %@(%p) delegate could not be loaded";
LABEL_25:
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant callDelegateWithBlock:].cold.2();
    }
  }
  else if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant callDelegateWithBlock:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCSessionParticipant callDelegateWithBlock:]";
        v17 = 1024;
        v18 = 149;
        v19 = 2112;
        v20 = v7;
        v21 = 2048;
        v22 = self;
        v11 = " [%s] %s:%d %@(%p) block is nil";
        goto LABEL_25;
      }
    }
  }
}

- (void)callStreamDelegateWithBlock:(id)a3
{
  const void *v4;

  v4 = (const void *)MEMORY[0x1DF086F1C](&self->_streamDelegate, a2);
  (*((void (**)(id, const void *))a3 + 2))(a3, v4);
  if (v4)
    CFRelease(v4);
}

- (void)logAllStreamTokens
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_t *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCSessionParticipant *v20;
  __int16 v21;
  int v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](self->_participantStreamTokens, "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v6 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            v11 = objc_msgSend(v8, "unsignedIntValue");
            *(_DWORD *)buf = 136316162;
            v14 = v9;
            v15 = 2080;
            v16 = "-[VCSessionParticipant logAllStreamTokens]";
            v17 = 1024;
            v18 = 169;
            v19 = 2048;
            v20 = self;
            v21 = 1024;
            v22 = v11;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) streamToken=%u", buf, 0x2Cu);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v4);
  }
}

- (void)startOneToOneStreams
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__VCSessionParticipant_startOneToOneStreams__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __44__VCSessionParticipant_startOneToOneStreams__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136315650;
        *(_QWORD *)&v12[4] = v3;
        *(_WORD *)&v12[12] = 2080;
        *(_QWORD *)&v12[14] = "-[VCSessionParticipant startOneToOneStreams]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 175;
        v5 = " [%s] %s:%d starting oneToOne streams";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v12, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v12 = 136316162;
        *(_QWORD *)&v12[4] = v8;
        *(_WORD *)&v12[12] = 2080;
        *(_QWORD *)&v12[14] = "-[VCSessionParticipant startOneToOneStreams]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 175;
        WORD2(v13) = 2112;
        *(_QWORD *)((char *)&v13 + 6) = v2;
        HIWORD(v13) = 2048;
        v14 = v10;
        v5 = " [%s] %s:%d %@(%p) starting oneToOne streams";
        v6 = v9;
        v7 = 48;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStartOneToOneStreams", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
}

- (void)setSharingEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCSessionParticipant_setSharingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __42__VCSessionParticipant_setSharingEnabled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 409) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setFECConfigurationOnStreamConfig:(id)a3 withStreamGroupID:(unsigned int)a4
{
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int FECFeedbackVersion;
  _BOOL8 IsLossStatsEnabled;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
    if (a4 == 1718909044 || v6)
    {
      v9 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-generator-enabled"), CFSTR("isFECGeneratorEnabled"), &unk_1E9EF73E8, 0), "BOOLValue");
      FECFeedbackVersion = VCMediaControlInfoGeneratorGetFECFeedbackVersion(objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaControlInfoGenerator"));
      IsLossStatsEnabled = VCMediaControlInfo_IsLossStatsEnabled(FECFeedbackVersion);
      v12 = v9 | IsLossStatsEnabled;
      if ((v9 & 1) == 0)
      {
        v13 = IsLossStatsEnabled;
        if (IsLossStatsEnabled)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v16 = 136315906;
              v17 = v14;
              v18 = 2080;
              v19 = "-[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:]";
              v20 = 1024;
              v21 = 197;
              v22 = 1024;
              v23 = FECFeedbackVersion;
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enabling FECGenerator for FECFeedbackVersion=%d", (uint8_t *)&v16, 0x22u);
            }
          }
          v12 = v13;
        }
      }
      objc_msgSend(a3, "setFecGeneratorEnabled:", v12);
      objc_msgSend(a3, "setFecHeaderVersion:", 1);
    }
    else
    {
      objc_msgSend(a3, "setFecGeneratorEnabled:", 0);
      objc_msgSend(a3, "setFecHeaderVersion:", 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = v7;
      v18 = 2080;
      v19 = "-[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:]";
      v20 = 1024;
      v21 = 188;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoStreamConfig is nil!", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)dispatchedStartOneToOneStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start the VCAudioIO. error=%@");
  OUTLINED_FUNCTION_3();
}

uint64_t __54__VCSessionParticipant_dispatchedStartOneToOneStreams__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) == 0);
}

- (void)startMultiwayStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start the stream groups. error=%@");
  OUTLINED_FUNCTION_3();
}

uint64_t __44__VCSessionParticipant_startMultiwayStreams__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) == 0);
}

- (id)stopMultiwayStreams
{
  -[VCSessionParticipant stopStreamGroups](self, "stopStreamGroups");
  -[VCSessionParticipant stopSystemAudioCapture](self, "stopSystemAudioCapture");
  return -[VCSessionParticipant stopAudioIO](self, "stopAudioIO");
}

- (void)dispatchedStart
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __39__VCSessionParticipant_dispatchedStart__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

- (void)dispatchedStop
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant already stopped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __38__VCSessionParticipant_dispatchedStop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStopWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)dispatchedSetAudioEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 audioEnabled;
  _QWORD *v8;
  unsigned int state;
  id v10;
  _QWORD v11[6];
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  if (self->_audioEnabled == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioEnabled = self->_audioEnabled;
        *(_DWORD *)buf = 136315906;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCSessionParticipant dispatchedSetAudioEnabled:]";
        v21 = 1024;
        v22 = 308;
        v23 = 1024;
        v24 = audioEnabled;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant audio already set to enabled[%d]", buf, 0x22u);
      }
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke;
    v15[3] = &unk_1E9E55118;
    v15[4] = self;
    v16 = v3;
    v8 = v15;
  }
  else
  {
    if (self->_audioEnabled)
    {
      self->_audioPaused = 0;
      self->_audioPausedToStart = 0;
    }
    state = self->_state;
    self->_audioEnabled = v3;
    if (state)
    {
      v10 = -[VCSessionParticipant updateStreamGroups:](self, "updateStreamGroups:", self->_micStreamGroups);
      if (v10)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipant dispatchedSetAudioEnabled:].cold.1();
        }
      }
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_28;
      v11[3] = &unk_1E9E58CD0;
      v12 = v3;
      v11[4] = self;
      v11[5] = v10;
      v8 = v11;
    }
    else
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_2;
      v13[3] = &unk_1E9E55118;
      v13[4] = self;
      v14 = v3;
      v8 = v13;
    }
  }
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchedSetVideoEnabled:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 videoEnabled;
  uint64_t *v8;
  unsigned int state;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  VCSessionParticipant *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  VCSessionParticipant *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  void *v29;
  VCSessionParticipant *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (self->_videoEnabled == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoEnabled = self->_videoEnabled;
        *(_DWORD *)buf = 136315906;
        v33 = v5;
        v34 = 2080;
        v35 = "-[VCSessionParticipant dispatchedSetVideoEnabled:]";
        v36 = 1024;
        v37 = 343;
        v38 = 1024;
        v39 = videoEnabled;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant video already set to enabled[%d]", buf, 0x22u);
      }
    }
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke;
    v29 = &unk_1E9E55118;
    v30 = self;
    LOBYTE(v31) = a3;
    v8 = &v26;
  }
  else
  {
    if (self->_videoEnabled)
    {
      self->_videoPaused = 0;
      self->_videoPausedToStart = 0;
    }
    state = self->_state;
    if (state == 1)
    {
      if (!a3)
        self->_videoPausedToStart = self->_videoPaused;
      v11 = -[VCSessionParticipant applyVideoEnabledSetting:](self, "applyVideoEnabledSetting:", a3);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_3;
      v15 = &unk_1E9E58CD0;
      LOBYTE(v18) = a3;
      v16 = self;
      v17 = v11;
      v8 = &v12;
    }
    else
    {
      if (state)
        return;
      v10 = -[VCSessionParticipant applyVideoEnabledSetting:](self, "applyVideoEnabledSetting:", a3);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_2;
      v22 = &unk_1E9E58CD0;
      LOBYTE(v25) = a3;
      v23 = self;
      v24 = v10;
      v8 = &v19;
    }
  }
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v8, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
    v28,
    v29,
    v30,
    v31);
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchedSetScreenEnabled:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int state;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 screenEnabled;
  _QWORD *v20;
  unsigned int v21;
  id v22;
  id v23;
  _QWORD v24[6];
  BOOL v25;
  _QWORD v26[5];
  BOOL v27;
  _QWORD v28[5];
  BOOL v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  VCSessionParticipant *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup"), "mediaStreamInfoArray");
        state = self->_state;
        *(_DWORD *)buf = 136316162;
        v31 = v6;
        v32 = 2080;
        v33 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        v34 = 1024;
        v35 = 380;
        v36 = 2112;
        v37 = v8;
        v38 = 1024;
        LODWORD(v39) = state;
        v10 = " [%s] %s:%d screenStream[%@] state=%d";
        v11 = v7;
        v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup"), "mediaStreamInfoArray");
        v16 = self->_state;
        *(_DWORD *)buf = 136316674;
        v31 = v13;
        v32 = 2080;
        v33 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        v34 = 1024;
        v35 = 380;
        v36 = 2112;
        v37 = (uint64_t)v5;
        v38 = 2048;
        v39 = self;
        v40 = 2112;
        v41 = v15;
        v42 = 1024;
        v43 = v16;
        v10 = " [%s] %s:%d %@(%p) screenStream[%@] state=%d";
        v11 = v14;
        v12 = 64;
        goto LABEL_11;
      }
    }
  }
  if (self->_screenEnabled == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        screenEnabled = self->_screenEnabled;
        *(_DWORD *)buf = 136315906;
        v31 = v17;
        v32 = 2080;
        v33 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        v34 = 1024;
        v35 = 382;
        v36 = 1024;
        LODWORD(v37) = screenEnabled;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant screen video already set to enabled[%d]", buf, 0x22u);
      }
    }
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke;
    v28[3] = &unk_1E9E55118;
    v28[4] = self;
    v29 = v3;
    v20 = v28;
  }
  else
  {
    v21 = self->_state;
    if (v21 == 1)
    {
      if (v3)
        v22 = -[VCSessionParticipant startScreenGroup](self, "startScreenGroup");
      else
        v22 = -[VCSessionParticipant stopScreenGroup](self, "stopScreenGroup");
      v23 = v22;
      if (!v22)
        -[VCSessionParticipant applyScreenEnabledSetting:](self, "applyScreenEnabledSetting:", v3);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_3;
      v24[3] = &unk_1E9E58CD0;
      v25 = v3;
      v24[4] = self;
      v24[5] = v23;
      v20 = v24;
    }
    else
    {
      if (v21)
        return;
      -[VCSessionParticipant applyScreenEnabledSetting:](self, "applyScreenEnabledSetting:", v3);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_2;
      v26[3] = &unk_1E9E55118;
      v26[4] = self;
      v27 = v3;
      v20 = v26;
    }
  }
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v20);
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchedSetAudioPaused:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 audioPaused;
  _QWORD *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[6];
  BOOL v21;
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[5];
  BOOL v25;
  _QWORD v26[6];
  BOOL v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (self->_audioEnabled)
  {
    if (self->_audioPaused == a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioPaused = self->_audioPaused;
          *(_DWORD *)buf = 136315906;
          v29 = v5;
          v30 = 2080;
          v31 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
          v32 = 1024;
          v33 = 425;
          v34 = 1024;
          v35 = audioPaused;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant audio already set to paused[%d]", buf, 0x22u);
        }
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_29;
      v24[3] = &unk_1E9E55118;
      v24[4] = self;
      v25 = v3;
      v8 = v24;
      goto LABEL_25;
    }
    if (!self->_state)
    {
      self->_audioPaused = a3;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_2;
      v22[3] = &unk_1E9E55118;
      v22[4] = self;
      v23 = a3;
      v8 = v22;
      goto LABEL_25;
    }
    if (self->_audioPausedToStart)
    {
      if (a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipant dispatchedSetAudioPaused:].cold.2();
        }
        v10 = 0;
      }
      else
      {
        v13 = -[VCSessionParticipant startMicStreamGroups](self, "startMicStreamGroups");
        if (v13)
        {
          v19 = v13;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3
            && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
          {
            v10 = v19;
            -[VCSessionParticipant dispatchedSetAudioPaused:].cold.3();
          }
          else
          {
            v10 = v19;
          }
        }
        else
        {
          v10 = 0;
          self->_audioPausedToStart = 0;
        }
      }
      goto LABEL_24;
    }
    v11 = -[VCSessionParticipant setAudioStreamGroupsPaused:](self, "setAudioStreamGroupsPaused:", a3);
    if (v11)
    {
      v14 = v11;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_31;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 136316162;
      v29 = v15;
      v30 = 2080;
      v31 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
      v32 = 1024;
      v33 = 454;
      v34 = 1024;
      v35 = v3;
      v36 = 2112;
      v37 = v14;
      v17 = " [%s] %s:%d setAudioStreamGroupsPaused=%d failed with error=%@";
    }
    else
    {
      v12 = -[VCSessionParticipant pauseAudioStreams:](self, "pauseAudioStreams:", v3);
      if (!v12)
      {
        v10 = 0;
        self->_audioPaused = v3;
LABEL_24:
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_30;
        v20[3] = &unk_1E9E58CD0;
        v21 = v3;
        v20[4] = self;
        v20[5] = v10;
        v8 = v20;
        goto LABEL_25;
      }
      v14 = v12;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v18 = VRTraceErrorLogLevelToCSTR(),
            v16 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_31:
        v10 = v14;
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316162;
      v29 = v18;
      v30 = 2080;
      v31 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
      v32 = 1024;
      v33 = 456;
      v34 = 1024;
      v35 = v3;
      v36 = 2112;
      v37 = v14;
      v17 = " [%s] %s:%d pauseAudioStreams=%d failed with error=%@";
    }
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x2Cu);
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant dispatchedSetAudioPaused:].cold.1();
  }
  v9 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 417));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke;
  v26[3] = &unk_1E9E58CD0;
  v27 = v3;
  v26[4] = self;
  v26[5] = v9;
  v8 = v26;
LABEL_25:
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_29(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_30(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchedSetVideoPaused:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 videoPaused;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  VCSessionParticipant *v15;
  _BOOL8 v16;
  _QWORD v17[6];
  BOOL v18;
  _QWORD v19[5];
  BOOL v20;
  _QWORD v21[5];
  BOOL v22;
  _QWORD v23[6];
  BOOL v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (self->_videoEnabled)
  {
    if (self->_videoPaused == a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          videoPaused = self->_videoPaused;
          *(_DWORD *)buf = 136315906;
          v26 = v5;
          v27 = 2080;
          v28 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
          v29 = 1024;
          v30 = 477;
          v31 = 1024;
          v32 = videoPaused;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant video already set to paused[%d]", buf, 0x22u);
        }
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_31;
      v21[3] = &unk_1E9E55118;
      v21[4] = self;
      v22 = v3;
      v8 = v21;
      goto LABEL_32;
    }
    if (!self->_state)
    {
      self->_videoPaused = a3;
      -[VCSessionParticipant updateAudioSpectrumState](self, "updateAudioSpectrumState");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_2;
      v19[3] = &unk_1E9E55118;
      v19[4] = self;
      v20 = v3;
      v8 = v19;
      goto LABEL_32;
    }
    if (self->_videoPausedToStart)
    {
      if (a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipant dispatchedSetVideoPaused:].cold.2();
        }
        v10 = 0;
        goto LABEL_31;
      }
      v10 = -[VCSessionParticipant startVideo](self, "startVideo");
      self->_videoPausedToStart = 0;
      if (v10)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_31;
        v14 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 136316162;
        v26 = v14;
        v27 = 2080;
        v28 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
        v29 = 1024;
        v30 = 504;
        v31 = 1024;
        v32 = v3;
        v33 = 2112;
        v34 = v10;
        v13 = " [%s] %s:%d Failed to startVideo for videoPausedToStart paused=%d error=%@ ";
        goto LABEL_27;
      }
      v15 = self;
      v16 = 0;
    }
    else
    {
      v10 = -[VCSessionParticipant pauseVideo:](self, "pauseVideo:", a3);
      if (v10)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_31;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 136316162;
        v26 = v11;
        v27 = 2080;
        v28 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
        v29 = 1024;
        v30 = 514;
        v31 = 1024;
        v32 = v3;
        v33 = 2112;
        v34 = v10;
        v13 = " [%s] %s:%d paused=%d error=%@ ";
LABEL_27:
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x2Cu);
LABEL_31:
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_32;
        v17[3] = &unk_1E9E58CD0;
        v18 = v3;
        v17[4] = self;
        v17[5] = v10;
        v8 = v17;
        goto LABEL_32;
      }
      v15 = self;
      v16 = v3;
    }
    -[VCSessionParticipant updateVideoPaused:](v15, "updateVideoPaused:", v16);
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant dispatchedSetVideoPaused:].cold.1();
  }
  v9 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 469));
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke;
  v23[3] = &unk_1E9E58CD0;
  v24 = v3;
  v23[4] = self;
  v23[5] = v9;
  v8 = v23;
LABEL_32:
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_31(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSessionParticipant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[6];
  int v41;
  int v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  uint64_t v59;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v59 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
  if (!v7)
  {
    v12 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 527));
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      *(_DWORD *)buf = 136316162;
      v44 = v14;
      v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      v47 = 1024;
      v48 = 528;
      v49 = 2112;
      v50 = VCSessionMediaType_Name(v4);
      v51 = 2112;
      v52 = VCSessionMediaState_Name(v5);
      v16 = " [%s] %s:%d mediaTypeSettings is missing for mediaType=%@ mediaState=%@";
      v17 = v15;
      v18 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      *(_DWORD *)buf = 136316674;
      v44 = v19;
      v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      v47 = 1024;
      v48 = 528;
      v49 = 2112;
      v50 = (__CFString *)v13;
      v51 = 2048;
      v52 = self;
      v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      v16 = " [%s] %s:%d %@(%p) mediaTypeSettings is missing for mediaType=%@ mediaState=%@";
      v17 = v20;
      v18 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "mediaState");
  if ((_DWORD)v9 == (_DWORD)v5)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_41;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 136316162;
      v44 = v24;
      v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      v47 = 1024;
      v48 = 531;
      v49 = 2112;
      v50 = VCSessionMediaType_Name(v4);
      v51 = 2112;
      v52 = VCSessionMediaState_Name(v5);
      v26 = " [%s] %s:%d mediaType=%@ already set to mediaState=%@";
      v27 = v25;
      v28 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_41;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 136316674;
      v44 = v35;
      v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      v47 = 1024;
      v48 = 531;
      v49 = 2112;
      v50 = (__CFString *)v21;
      v51 = 2048;
      v52 = self;
      v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      v26 = " [%s] %s:%d %@(%p) mediaType=%@ already set to mediaState=%@";
      v27 = v36;
      v28 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
LABEL_41:
    v12 = 0;
    goto LABEL_5;
  }
  v10 = v9;
  objc_msgSend(v8, "setMediaState:", v5);
  v11 = -[VCSessionParticipant applyMediaState:forMediaType:](self, "applyMediaState:forMediaType:", v5, v4);
  if (!v11)
  {
    v12 = -[VCSessionParticipant completeMediaStateChange](self, "completeMediaStateChange");
    if (!v12)
      goto LABEL_5;
    objc_msgSend(v8, "setMediaState:", v10);
    if ((VCSessionParticipant *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          v44 = v39;
          v45 = 2080;
          v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
          v47 = 1024;
          v48 = 538;
          v49 = 2112;
          v50 = (__CFString *)v23;
          v51 = 2048;
          v52 = self;
          v53 = 2112;
          v54 = VCSessionMediaType_Name(v4);
          v55 = 2112;
          v56 = VCSessionMediaState_Name(v5);
          v57 = 2112;
          v58 = v12;
          v31 = " [%s] %s:%d %@(%p) Failed to complete setting the mediaState=%@ for mediaType=%@. error=%@";
          goto LABEL_50;
        }
      }
      goto LABEL_5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_5;
    v32 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136316418;
    v44 = v32;
    v45 = 2080;
    v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
    v47 = 1024;
    v48 = 538;
    v49 = 2112;
    v50 = VCSessionMediaType_Name(v4);
    v51 = 2112;
    v52 = VCSessionMediaState_Name(v5);
    v53 = 2112;
    v54 = v12;
    v31 = " [%s] %s:%d Failed to complete setting the mediaState=%@ for mediaType=%@. error=%@";
LABEL_35:
    v33 = v30;
    v34 = 58;
LABEL_51:
    _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, v31, buf, v34);
    goto LABEL_5;
  }
  v12 = v11;
  objc_msgSend(v8, "setMediaState:", v10);
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_5;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136316418;
    v44 = v29;
    v45 = 2080;
    v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
    v47 = 1024;
    v48 = 535;
    v49 = 2112;
    v50 = VCSessionMediaType_Name(v4);
    v51 = 2112;
    v52 = VCSessionMediaState_Name(v5);
    v53 = 2112;
    v54 = v12;
    v31 = " [%s] %s:%d Failed to set the mediaState=%@ for mediaType=%@. error=%@";
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v22 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v37 = VRTraceErrorLogLevelToCSTR();
    v38 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v44 = v37;
      v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      v47 = 1024;
      v48 = 535;
      v49 = 2112;
      v50 = (__CFString *)v22;
      v51 = 2048;
      v52 = self;
      v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      v57 = 2112;
      v58 = v12;
      v31 = " [%s] %s:%d %@(%p) Failed to set the mediaState=%@ for mediaType=%@. error=%@";
LABEL_50:
      v33 = v38;
      v34 = 78;
      goto LABEL_51;
    }
  }
LABEL_5:
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __61__VCSessionParticipant_dispatchedSetMediaState_forMediaType___block_invoke;
  v40[3] = &unk_1E9E58CF8;
  v41 = v5;
  v42 = v4;
  v40[4] = self;
  v40[5] = v12;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v40);
}

uint64_t __61__VCSessionParticipant_dispatchedSetMediaState_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 40) == 0);
}

- (void)dispatchSetMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  id v8;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[5];
  int v30;
  int v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[10];
  void *v40;
  __int16 v41;
  _BYTE v42[10];
  __CFString *v43;
  uint64_t v44;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v44 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v8 = -[NSDictionary objectForKeyedSubscript:](-[VCSessionParticipant mediaTypeMixingList](self, "mediaTypeMixingList"), "objectForKeyedSubscript:", v7);
  v10 = (_DWORD)v5 != (_DWORD)v4 && v8 == 0;
  if (v8)
    v11 = objc_msgSend(v8, "integerValue") != v4;
  else
    v11 = 0;
  if (v10 || v11)
  {
    os_unfair_lock_lock(&self->_mediaTypeMixingListLock);
    if ((_DWORD)v5 == (_DWORD)v4)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeMixingList, "setObject:forKeyedSubscript:", 0, v7);
      os_unfair_lock_unlock(&self->_mediaTypeMixingListLock);
      if ((_DWORD)v5 != 2)
        goto LABEL_21;
      v12 = 1937339233;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeMixingList, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), v7);
      os_unfair_lock_unlock(&self->_mediaTypeMixingListLock);
      if ((_DWORD)v5 != 2 || (_DWORD)v4 != 1)
      {
LABEL_21:
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_40;
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_40;
          *(_DWORD *)buf = 136316162;
          v33 = v20;
          v34 = 2080;
          v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
          v36 = 1024;
          v37 = 568;
          v38 = 2112;
          *(_QWORD *)v39 = VCSessionMediaType_Name(v5);
          *(_WORD *)&v39[8] = 2112;
          v40 = VCSessionMediaType_Name(v4);
          v22 = " [%s] %s:%d Setting mediaType=%@ mixingMediaType=%@";
          v23 = v21;
          v24 = 48;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v14 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v14 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_40;
          v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_40;
          *(_DWORD *)buf = 136316674;
          v33 = v27;
          v34 = 2080;
          v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
          v36 = 1024;
          v37 = 568;
          v38 = 2112;
          *(_QWORD *)v39 = v14;
          *(_WORD *)&v39[8] = 2048;
          v40 = self;
          v41 = 2112;
          *(_QWORD *)v42 = VCSessionMediaType_Name(v5);
          *(_WORD *)&v42[8] = 2112;
          v43 = VCSessionMediaType_Name(v4);
          v22 = " [%s] %s:%d %@(%p) Setting mediaType=%@ mixingMediaType=%@";
          v23 = v28;
          v24 = 68;
        }
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_40:
        -[VCSessionParticipant reportCameraCompositionEnabled:](self, "reportCameraCompositionEnabled:", (_DWORD)v5 != (_DWORD)v4);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __65__VCSessionParticipant_dispatchSetMediaType_mixingWithMediaType___block_invoke;
        v29[3] = &unk_1E9E551B8;
        v29[4] = self;
        v30 = v5;
        v31 = v4;
        -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v29);
        return;
      }
      v12 = 1835623282;
    }
    -[VCSessionParticipant setStreamGroup:syncSourceStreamGroupID:](self, "setStreamGroup:syncSourceStreamGroupID:", 1935897189, v12);
    goto LABEL_21;
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v33 = v15;
        v34 = 2080;
        v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
        v36 = 1024;
        v37 = 576;
        v38 = 1024;
        *(_DWORD *)v39 = v5;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v4;
        v17 = " [%s] %s:%d mediaType=%d already mixingMediaType=%d";
        v18 = v16;
        v19 = 40;
LABEL_34:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v33 = v25;
        v34 = 2080;
        v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
        v36 = 1024;
        v37 = 576;
        v38 = 2112;
        *(_QWORD *)v39 = v13;
        *(_WORD *)&v39[8] = 2048;
        v40 = self;
        v41 = 1024;
        *(_DWORD *)v42 = v5;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v4;
        v17 = " [%s] %s:%d %@(%p) mediaType=%d already mixingMediaType=%d";
        v18 = v26;
        v19 = 60;
        goto LABEL_34;
      }
    }
  }
}

uint64_t __65__VCSessionParticipant_dispatchSetMediaType_mixingWithMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:mediaMixingDidChangeForMediaType:mixingMediaType:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (void)reportCameraCompositionEnabled:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant reportCameraCompositionEnabled:]"), 0));
}

+ (id)participantInfoWithParticipantData:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  else
    return 0;
}

+ (id)participantDataWithParticipantInfo:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
  else
    return 0;
}

+ (id)participantDataWithMediaNegotiatorVersion:(int)a3 participantData:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  if (a4)
  {
    v4 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", a4);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
      if (v6)
      {
        v7 = v6;
        v8 = +[VCSessionMediaNegotiator mediaBlobForVersion:negotiationData:](VCSessionMediaNegotiator, "mediaBlobForVersion:negotiationData:", 0, v6);
        if (v8)
        {
          v9 = v8;
          v10 = +[VCSessionMediaNegotiator mediaBlobForVersion:negotiationData:](VCSessionMediaNegotiator, "mediaBlobForVersion:negotiationData:", 1, v7);
          if (v10)
          {
            v11 = v10;
            v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
            if (v12)
            {
              v13 = v12;
              objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("vcSessionParticipantKeyMediaBlob"));
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("b2n"));
              return +[VCSessionParticipant participantDataWithParticipantInfo:](VCSessionParticipant, "participantDataWithParticipantInfo:", v13);
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.6();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.5();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.1();
  }
  return 0;
}

+ (id)participantDataWithParticipantData:(id)a3 isReinit:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.1();
    }
    return 0;
  }
  v4 = a4;
  v5 = a3;
  v6 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:");
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.2();
    }
    return 0;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
  if (v4 && v8)
    return v5;
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.3();
    }
    return 0;
  }
  v9 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaBlob"));
  v10 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("b2n"));
  v11 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("b2w"));
  if (v4)
  {
    if (!v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.4();
      }
      return 0;
    }
    if (!v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.5();
      }
      return 0;
    }
    v12 = +[VCSessionMediaNegotiator negotiationDataWithVersion1:version2:](VCSessionMediaNegotiator, "negotiationDataWithVersion1:version2:", v9, v10);
    goto LABEL_20;
  }
  v13 = v11;
  if (!v9 && !v10 && !v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.8();
    }
    return 0;
  }
  if (v10)
  {
    v14 = 1;
    v13 = v10;
LABEL_19:
    v12 = +[VCSessionMediaNegotiator negotiationDataWithVersion:mediaBlob:](VCSessionMediaNegotiator, "negotiationDataWithVersion:mediaBlob:", v14, v13);
LABEL_20:
    v15 = v12;
    if (v12)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("vcSessionParticipantKeyMediaBlob"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("b2n"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("b2w"));
        return +[VCSessionParticipant participantDataWithParticipantInfo:](VCSessionParticipant, "participantDataWithParticipantInfo:", v17);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.7();
      }
      return 0;
    }
    goto LABEL_23;
  }
  if (v11)
  {
    v14 = 1;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaBlob")))
  {
    v14 = 0;
    v13 = v9;
    goto LABEL_19;
  }
LABEL_23:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.6();
  }
  return 0;
}

+ (id)streamGroupIDsFromParticipantData:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", a3);
  if (v3)
  {
    v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
    if (v4)
      return +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:](VCSessionMediaNegotiator, "streamGroupIDsWithMediaBlob:", v4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant streamGroupIDsFromParticipantData:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSessionParticipant streamGroupIDsFromParticipantData:].cold.1();
  }
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p] idsDestination[%@] idsParticipantID[%llu] participantUUID[%@] state[%s]"), NSStringFromClass(v4), self, self->_idsDestination, self->_idsParticipantID, self->_uuid, -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", self->_state));
}

- (id)generateEncryptionKey
{
  void *v2;
  unsigned int v3;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 30);
  v3 = 0;
  do
  {
    v6 = -21846;
    v6 = hwrandom();
    objc_msgSend(v2, "appendBytes:length:", &v6, 2);
  }
  while (v3++ < 0xE);
  return v2;
}

- (void)stopInternal
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCSessionParticipant *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCSessionParticipant stopInternal]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 709;
        v6 = " [%s] %s:%d Tearing down participant";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCSessionParticipant stopInternal]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 709;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = " [%s] %s:%d %@(%p) Tearing down participant";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCSessionParticipant stopVideoCaptureClient](self, "stopVideoCaptureClient", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
  -[VCSessionParticipant stopStreamGroups](self, "stopStreamGroups");
  -[VCSessionParticipant stopOneToOneStreams](self, "stopOneToOneStreams");
  -[VCSessionParticipant setState:](self, "setState:", 0);
}

- (BOOL)isAudioStream:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isVideoStream:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)startAudioIO
{
  uint64_t v3;
  NSObject *v4;
  VCAudioIO *audioIO;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCSessionParticipant *v14;
  __int16 v15;
  VCAudioIO *v16;
  _OWORD v17[8];
  UInt32 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipant onStartAudioIO](self, "onStartAudioIO");
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  AUIOGetAUNumber(&v18);
  -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", v17);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      audioIO = self->_audioIO;
      v7 = 136316162;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCSessionParticipant startAudioIO]";
      v11 = 1024;
      v12 = 734;
      v13 = 2048;
      v14 = self;
      v15 = 2048;
      v16 = audioIO;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) starting audioIO=%p", (uint8_t *)&v7, 0x30u);
    }
  }
  return -[VCAudioIO start](self->_audioIO, "start");
}

- (id)stopAudioIO
{
  id v2;

  v2 = -[VCAudioIO stop](self->_audioIO, "stop");
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant stopAudioIO].cold.1();
    }
  }
  return v2;
}

- (id)startMediaStreams:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if (!objc_msgSend((id)objc_msgSend(v9, "stream"), "state"))
      {
        v10 = objc_msgSend((id)objc_msgSend(v9, "stream"), "start");
        if (v10)
          v6 = (void *)v10;
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  }
  while (v5);
  return v6;
}

- (id)stopMicStreamGroups
{
  if (self->_oneToOneModeEnabled)
    return 0;
  else
    return -[VCSessionParticipant stopStreamGroups:](self, "stopStreamGroups:", self->_micStreamGroups);
}

- (id)startMicStreamGroups
{
  if (self->_oneToOneModeEnabled)
    return 0;
  else
    return -[VCSessionParticipant startStreamGroups:](self, "startStreamGroups:", self->_micStreamGroups);
}

- (id)startCameraStreamGroups
{
  if (self->_oneToOneModeEnabled)
    return 0;
  else
    return -[VCSessionParticipant startStreamGroups:](self, "startStreamGroups:", -[VCSessionParticipant cameraGroups](self, "cameraGroups"));
}

- (id)stopStreamGroups:(id)a3
{
  id result;
  id v5;
  uint64_t v6;
  uint64_t v7;
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
  result = (id)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(a3);
      result = (id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "stop");
      if (result)
        break;
      if (v5 == (id)++v7)
      {
        result = (id)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
        v5 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)startStreamGroups:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "start");
        if (v9)
        {
          v10 = (void *)v9;
          -[VCSessionParticipant stopStreamGroups:](self, "stopStreamGroups:", a3);
          return v10;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 0;
}

- (id)updateStreamGroups:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  VCSessionParticipant *v10;
  VCSessionParticipant *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  VCSessionParticipant *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  VCSessionParticipant *v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v37;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v37 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v10 = -[VCSessionParticipant updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", v9);
      if (v10)
      {
        v12 = v10;
        -[VCSessionParticipant stopStreamGroups:](self, "stopStreamGroups:", a3);
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            return 0;
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            return 0;
          v21 = 136316162;
          v22 = v14;
          v23 = 2080;
          v24 = "-[VCSessionParticipant updateStreamGroups:]";
          v25 = 1024;
          v26 = 804;
          v27 = 2080;
          v28 = FourccToCStr(objc_msgSend(v9, "streamGroupID"));
          v29 = 2112;
          v30 = v12;
          v16 = " [%s] %s:%d Failed to update streamgroup=%s, Error=%@";
          v17 = v15;
          v18 = 48;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v13 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v13 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            return 0;
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            return 0;
          v21 = 136316674;
          v22 = v19;
          v23 = 2080;
          v24 = "-[VCSessionParticipant updateStreamGroups:]";
          v25 = 1024;
          v26 = 804;
          v27 = 2112;
          v28 = (char *)v13;
          v29 = 2048;
          v30 = self;
          v31 = 2080;
          v32 = FourccToCStr(objc_msgSend(v9, "streamGroupID"));
          v33 = 2112;
          v34 = v12;
          v16 = " [%s] %s:%d %@(%p) Failed to update streamgroup=%s, Error=%@";
          v17 = v20;
          v18 = 68;
        }
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, v18);
        return 0;
      }
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v6)
      continue;
    break;
  }
  return 0;
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant isActiveMediaType:]"), 0));
}

- (BOOL)isStreamGroupActive:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant isStreamGroupActive:]"), 0));
}

- (id)updateActiveStateForStreamGroup:(id)a3
{
  _BOOL4 v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    return 0;
  v4 = -[VCSessionParticipant isStreamGroupActive:](self, "isStreamGroupActive:");
  v5 = objc_msgSend(a3, "state");
  v6 = v5;
  if (!v4 || v5)
  {
    if (v5)
      v10 = v4;
    else
      v10 = 1;
    if ((v10 & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316418;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCSessionParticipant updateActiveStateForStreamGroup:]";
          v18 = 1024;
          v19 = 832;
          v20 = 2112;
          v21 = a3;
          v22 = 1024;
          LODWORD(v23[0]) = v4;
          WORD2(v23[0]) = 1024;
          *(_DWORD *)((char *)v23 + 6) = v6 != 0;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore start/stop for stream group=%@ isStreamGroupActive=%d isStreamGroupStarted=%d", (uint8_t *)&v14, 0x32u);
        }
      }
    }
    else
    {
      objc_msgSend(a3, "stop");
    }
    return 0;
  }
  v7 = (void *)objc_msgSend(a3, "start");
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v14 = 136316162;
        v15 = v8;
        v16 = 2080;
        v17 = "-[VCSessionParticipant updateActiveStateForStreamGroup:]";
        v18 = 1024;
        v19 = 837;
        v20 = 2112;
        v21 = a3;
        v22 = 2112;
        v23[0] = v7;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update stream group=%@ with error=%@", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return v7;
}

- (id)startStreamGroups
{
  uint64_t v3;
  uint64_t v4;
  os_log_t *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  VCSessionParticipant *v10;
  const __CFString *v11;
  uint64_t v12;
  os_log_t v13;
  char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  const __CFString *v19;
  uint64_t v20;
  os_log_t v21;
  char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  uint64_t v27;
  os_log_t v28;
  char *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  os_log_t v33;
  char *v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  const __CFString *v42;
  uint64_t v43;
  os_log_t v44;
  char *v45;
  int v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  os_log_t v51;
  char *v52;
  int v53;
  id obj;
  id v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  _BYTE v70[18];
  __int16 v71;
  int v72;
  __int16 v73;
  id v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v55)
  {
    v36 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 846));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
      -[VCSessionParticipant startStreamGroups].cold.1();
      if (!v36)
        goto LABEL_43;
    }
    else if (!v36)
    {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = (id)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
  if (!v3)
    goto LABEL_32;
  v4 = v3;
  v5 = (os_log_t *)MEMORY[0x1E0CF2758];
  v6 = *(_QWORD *)v77;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v77 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
      v9 = -[VCSessionParticipant isStreamGroupActive:](self, "isStreamGroupActive:", v8);
      v10 = (VCSessionParticipant *)objc_opt_class();
      if (v9)
      {
        if (v10 == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              v29 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
              v30 = objc_msgSend(v8, "streamToken");
              *(_DWORD *)buf = 136316162;
              v62 = v27;
              v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              v65 = 1024;
              v66 = 855;
              v67 = 2080;
              v68 = v29;
              v5 = (os_log_t *)MEMORY[0x1E0CF2758];
              v69 = 1024;
              *(_DWORD *)v70 = v30;
              v16 = v28;
              v17 = " [%s] %s:%d Starting stream group. streamGroupID=%s, streamToken=%u";
              v18 = 44;
              goto LABEL_23;
            }
          }
        }
        else
        {
          v11 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              v14 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
              v15 = objc_msgSend(v8, "streamToken");
              *(_DWORD *)buf = 136316674;
              v62 = v12;
              v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              v65 = 1024;
              v66 = 855;
              v67 = 2112;
              v68 = (void *)v11;
              v69 = 2048;
              *(_QWORD *)v70 = self;
              *(_WORD *)&v70[8] = 2080;
              *(_QWORD *)&v70[10] = v14;
              v5 = (os_log_t *)MEMORY[0x1E0CF2758];
              v71 = 1024;
              v72 = v15;
              v16 = v13;
              v17 = " [%s] %s:%d %@(%p) Starting stream group. streamGroupID=%s, streamToken=%u";
              v18 = 64;
LABEL_23:
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
            }
          }
        }
        v31 = objc_msgSend(v8, "start");
        if (!v31)
        {
          objc_msgSend(v55, "addObject:", v8);
          continue;
        }
        v36 = (id)v31;
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v43 = VRTraceErrorLogLevelToCSTR();
            v44 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
            {
              v45 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
              v46 = objc_msgSend(v8, "streamToken");
              *(_DWORD *)buf = 136316418;
              v62 = v43;
              v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              v65 = 1024;
              v66 = 857;
              v67 = 2080;
              v68 = v45;
              v69 = 1024;
              *(_DWORD *)v70 = v46;
              *(_WORD *)&v70[4] = 2112;
              *(_QWORD *)&v70[6] = v36;
              v47 = " [%s] %s:%d Failed to start stream group. streamGroupID=%s streamToken=%u error=%@";
              v48 = v44;
              v49 = 54;
LABEL_54:
              _os_log_error_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v42 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v42 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v50 = VRTraceErrorLogLevelToCSTR();
            v51 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
            {
              v52 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
              v53 = objc_msgSend(v8, "streamToken");
              *(_DWORD *)buf = 136316930;
              v62 = v50;
              v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              v65 = 1024;
              v66 = 857;
              v67 = 2112;
              v68 = (void *)v42;
              v69 = 2048;
              *(_QWORD *)v70 = self;
              *(_WORD *)&v70[8] = 2080;
              *(_QWORD *)&v70[10] = v52;
              v71 = 1024;
              v72 = v53;
              v73 = 2112;
              v74 = v36;
              v47 = " [%s] %s:%d %@(%p) Failed to start stream group. streamGroupID=%s streamToken=%u error=%@";
              v48 = v51;
              v49 = 74;
              goto LABEL_54;
            }
          }
        }
LABEL_36:
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v37 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v58 != v39)
                objc_enumerationMutation(v55);
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "stop");
            }
            v38 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
          }
          while (v38);
        }
        goto LABEL_43;
      }
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            v34 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
            v35 = objc_msgSend(v8, "streamToken");
            *(_DWORD *)buf = 136316162;
            v62 = v32;
            v63 = 2080;
            v64 = "-[VCSessionParticipant startStreamGroups]";
            v65 = 1024;
            v66 = 852;
            v67 = 2080;
            v68 = v34;
            v69 = 1024;
            *(_DWORD *)v70 = v35;
            v24 = v33;
            v25 = " [%s] %s:%d streamGroupID=%s, streamToken=%u is inactive";
            v26 = 44;
            goto LABEL_29;
          }
        }
      }
      else
      {
        v19 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v19 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            v22 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
            v23 = objc_msgSend(v8, "streamToken");
            *(_DWORD *)buf = 136316674;
            v62 = v20;
            v63 = 2080;
            v64 = "-[VCSessionParticipant startStreamGroups]";
            v65 = 1024;
            v66 = 852;
            v67 = 2112;
            v68 = (void *)v19;
            v69 = 2048;
            *(_QWORD *)v70 = self;
            *(_WORD *)&v70[8] = 2080;
            *(_QWORD *)&v70[10] = v22;
            v5 = (os_log_t *)MEMORY[0x1E0CF2758];
            v71 = 1024;
            v72 = v23;
            v24 = v21;
            v25 = " [%s] %s:%d %@(%p) streamGroupID=%s, streamToken=%u is inactive";
            v26 = 64;
LABEL_29:
            _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
            continue;
          }
        }
      }
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
    if (v4)
      continue;
    break;
  }
LABEL_32:
  v36 = 0;
LABEL_43:

  return v36;
}

- (void)stopStreamGroups
{
  void *v2;
  uint64_t v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stop");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (id)startScreenGroup
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[24];
  __int128 v16;
  VCSessionParticipant *v17;
  _BYTE v18[32];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316418;
        *(_QWORD *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSessionParticipant startScreenGroup]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 882;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = -[VCSessionParticipant screenGroup](self, "screenGroup");
        HIWORD(v16) = 2112;
        v17 = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
        *(_WORD *)v18 = 1024;
        *(_DWORD *)&v18[2] = +[VCHardwareSettings supportsDedicatedSystemAudioStream](VCHardwareSettings, "supportsDedicatedSystemAudioStream");
        v6 = " [%s] %s:%d screenStreamGroup=%@, sysaStreamGroup=%@, supportsDedicatedSystemAudioStream=%d";
        v7 = v5;
        v8 = 54;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316930;
        *(_QWORD *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSessionParticipant startScreenGroup]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 882;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        v17 = self;
        *(_WORD *)v18 = 2112;
        *(_QWORD *)&v18[2] = -[VCSessionParticipant screenGroup](self, "screenGroup");
        *(_WORD *)&v18[10] = 2112;
        *(_QWORD *)&v18[12] = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
        *(_WORD *)&v18[20] = 1024;
        *(_DWORD *)&v18[22] = +[VCHardwareSettings supportsDedicatedSystemAudioStream](VCHardwareSettings, "supportsDedicatedSystemAudioStream");
        v6 = " [%s] %s:%d %@(%p) screenStreamGroup=%@, sysaStreamGroup=%@, supportsDedicatedSystemAudioStream=%d";
        v7 = v10;
        v8 = 74;
        goto LABEL_11;
      }
    }
  }
  v11 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, *(_OWORD *)v18, *(_OWORD *)&v18[16]), "start");
  if (v11)
  {
    v13 = (void *)v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant startScreenGroup].cold.2();
    }
    goto LABEL_23;
  }
  if (-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"))
  {
    v12 = objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "start");
    if (v12)
    {
      v13 = (void *)v12;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant startScreenGroup].cold.1();
      }
LABEL_23:
      -[VCSessionParticipant stopScreenGroup](self, "stopScreenGroup");
      return v13;
    }
  }
  -[VCSessionParticipant startSystemAudioCapture](self, "startSystemAudioCapture");
  -[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:](self, "swapScreenStreamGroupSyncSourceWithState:", 2);
  return 0;
}

- (id)stopScreenGroup
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BYTE v14[24];
  __int128 v15;
  VCSessionParticipant *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v14 = 136316162;
    *(_QWORD *)&v14[4] = v4;
    *(_WORD *)&v14[12] = 2080;
    *(_QWORD *)&v14[14] = "-[VCSessionParticipant stopScreenGroup]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 901;
    WORD2(v15) = 2112;
    *(_QWORD *)((char *)&v15 + 6) = -[VCSessionParticipant screenGroup](self, "screenGroup");
    HIWORD(v15) = 2112;
    v16 = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
    v6 = " [%s] %s:%d streamGroup: %@, streamGroup: %@";
    v7 = v5;
    v8 = 48;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v3 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 136316674;
      *(_QWORD *)&v14[4] = v9;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCSessionParticipant stopScreenGroup]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 901;
      WORD2(v15) = 2112;
      *(_QWORD *)((char *)&v15 + 6) = v3;
      HIWORD(v15) = 2048;
      v16 = self;
      *(_WORD *)v17 = 2112;
      *(_QWORD *)&v17[2] = -[VCSessionParticipant screenGroup](self, "screenGroup");
      *(_WORD *)&v17[10] = 2112;
      *(_QWORD *)&v17[12] = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
      v6 = " [%s] %s:%d %@(%p) streamGroup: %@, streamGroup: %@";
      v7 = v10;
      v8 = 68;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
    }
  }
LABEL_12:
  v11 = (void *)objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18), "stop");
  if (-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"))
    v12 = (void *)objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "stop");
  else
    v12 = 0;
  -[VCSessionParticipant stopSystemAudioCapture](self, "stopSystemAudioCapture");
  if (v11)
    return v11;
  else
    return v12;
}

- (id)stopMediaStreams:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v9, "stream"), "state"))
      {
        v10 = objc_msgSend((id)objc_msgSend(v9, "stream"), "stop");
        if (v10)
          v6 = (void *)v10;
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  }
  while (v5);
  return v6;
}

- (id)stopAudioStreams
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  VCAudioIO *audioIO;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  VCAudioIO *v12;
  id v13;
  _BYTE v15[24];
  __int128 v16;
  VCSessionParticipant *v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipant stopSystemAudioCapture](self, "stopSystemAudioCapture");
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    audioIO = self->_audioIO;
    *(_DWORD *)v15 = 136315906;
    *(_QWORD *)&v15[4] = v4;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[VCSessionParticipant stopAudioStreams]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 941;
    WORD2(v16) = 2048;
    *(_QWORD *)((char *)&v16 + 6) = audioIO;
    v7 = " [%s] %s:%d Stopping audioIO=%p";
    v8 = v5;
    v9 = 38;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v3 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_audioIO;
      *(_DWORD *)v15 = 136316418;
      *(_QWORD *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCSessionParticipant stopAudioStreams]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 941;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v3;
      HIWORD(v16) = 2048;
      v17 = self;
      LOWORD(v18) = 2048;
      *(_QWORD *)((char *)&v18 + 2) = v12;
      v7 = " [%s] %s:%d %@(%p) Stopping audioIO=%p";
      v8 = v11;
      v9 = 58;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    }
  }
LABEL_12:
  if (-[VCAudioIO state](self->_audioIO, "state", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18) == 2)
    v13 = -[VCAudioIO stop](self->_audioIO, "stop");
  else
    v13 = 0;
  -[VCSessionParticipant stopAudioIOCompletion](self, "stopAudioIOCompletion");
  return v13;
}

- (id)setAudioStreamGroupsPaused:(BOOL)a3
{
  return -[VCSessionParticipant setPaused:onStreamGroups:](self, "setPaused:onStreamGroups:", a3, self->_micStreamGroups);
}

- (id)setCameraStreamGroupsPaused:(BOOL)a3
{
  return -[VCSessionParticipant setPaused:onStreamGroups:](self, "setPaused:onStreamGroups:", a3, -[VCSessionParticipant cameraGroups](self, "cameraGroups"));
}

- (id)setPaused:(BOOL)a3 onStreamGroups:(id)a4
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "state");
        if (v5)
        {
          if (v12 == 1)
          {
            v13 = objc_msgSend(v11, "pause");
            goto LABEL_12;
          }
        }
        else if (v12 == 2)
        {
          v13 = objc_msgSend(v11, "resume");
          goto LABEL_12;
        }
        v13 = 0;
LABEL_12:
        if (v13)
          v8 = (void *)v13;
      }
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (!v7)
        return v8;
    }
  }
  return 0;
}

- (BOOL)shouldSetPause:(BOOL)a3 onStream:(id)a4
{
  _BOOL4 v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a4, "state");
  if (v4)
    v6 = 4;
  else
    v6 = 2;
  return v5 != v6;
}

- (id)pauseAudioStreams:(BOOL)a3
{
  if (a3)
    -[VCSessionParticipant onPauseAudioStreams](self, "onPauseAudioStreams");
  else
    -[VCSessionParticipant onDidResumeAudio](self, "onDidResumeAudio");
  return 0;
}

+ (void)addCodecModesForPayload:(int)a3 toCodecConfig:(id)a4
{
  uint64_t v5;
  void *v6;

  switch(a3)
  {
    case 'q':
      v5 = 25;
      v6 = &unk_1E9EFB078;
      break;
    case 'l':
      v5 = 14;
      v6 = &unk_1E9EFB048;
      break;
    case 'b':
      v5 = 1;
      v6 = &unk_1E9EFB060;
      break;
    default:
      return;
  }
  objc_msgSend(a4, "setSupportedModes:", v6);
  objc_msgSend(a4, "setPreferredMode:", v5);
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 audioRules:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VCAudioStreamCodecConfig *v13;
  VCAudioStreamCodecConfig *v14;
  _BOOL4 v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCSessionParticipant *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = (void *)objc_msgSend(a4, "rules");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v10), "payload");
      if ((_DWORD)v11 == 20)
      {
        objc_msgSend(a3, "setupRedWithRxPayload:txPayload:", 20, 20);
      }
      else
      {
        v12 = v11;
        v13 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v11));
        v14 = v13;
        if ((_DWORD)v12 == 101 && self->_isLowLatencyAudio && v21 == 1835623282)
          -[VCAudioStreamCodecConfig setPTime:](v13, "setPTime:", 10);
        if (!v14)
        {
          if ((VCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_35;
            VRTraceErrorLogLevelToCSTR();
            v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (v16)
            {
              -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:].cold.3();
              goto LABEL_35;
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v17 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v17 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v16)
                return v16;
              *(_DWORD *)buf = 136316418;
              v24 = v18;
              v25 = 2080;
              v26 = "-[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]";
              v27 = 1024;
              v28 = 1065;
              v29 = 2112;
              v30 = v17;
              v31 = 2048;
              v32 = self;
              v33 = 1024;
              v34 = v12;
              _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate codec config for payload=%d!", buf, 0x36u);
            }
LABEL_35:
            LOBYTE(v16) = 0;
          }
          return v16;
        }
        +[VCSessionParticipant addCodecModesForPayload:toCodecConfig:](VCSessionParticipant, "addCodecModesForPayload:toCodecConfig:", v12, v14);
        objc_msgSend(a3, "addCodecConfiguration:", v14);
        objc_msgSend(a3, "setForceEVSWideBand:", -[VCHardwareSettingsEmbedded deviceClass](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "deviceClass") == 6);
        if (-[VCDefaults forceEVSWideBand](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEVSWideBand"))
        {
          objc_msgSend(a3, "setForceEVSWideBand:", 1);
        }

      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  objc_msgSend(a3, "setAudioRules:", a4);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules"), "count"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "count"))
    {
      LOBYTE(v16) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_35;
      VRTraceErrorLogLevelToCSTR();
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:].cold.2();
        goto LABEL_35;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    VRTraceErrorLogLevelToCSTR();
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:].cold.1();
      goto LABEL_35;
    }
  }
  return v16;
}

- (void)updateOneToOneVideoStreamCustomResolution:(id)a3 videoSettings:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
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
  v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "videoRuleCollections"), "supportedPayloads");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntValue");
        if (!v9)
          v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, v12, 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (+[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iWidth"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iHeight")) == 27)
  {
    objc_msgSend(a3, "setCustomWidth:", (int)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iWidth"));
    objc_msgSend(a3, "setCustomHeight:", (int)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iHeight"));
  }
}

- (BOOL)isOneToOneTemporalSupportedForSettings:(id)a3 streamDirection:(int64_t)a4
{
  void *v4;
  uint64_t v5;

  if (a4 == 1)
  {
    v4 = (void *)objc_msgSend(a3, "videoRuleCollections");
    v5 = 1;
    return objc_msgSend(v4, "getVideoRulesForTransport:payload:encodingType:", 1, 100, v5) != 0;
  }
  if (a4 == 2)
  {
    v4 = (void *)objc_msgSend(a3, "videoRuleCollections");
    v5 = 2;
    return objc_msgSend(v4, "getVideoRulesForTransport:payload:encodingType:", 1, 100, v5) != 0;
  }
  return 0;
}

- (id)newOneToOneVideoStreamMultiwayConfiguration:(unsigned __int8)a3 streamGroupId:(unsigned int)a4 videoSettings:(id)a5 streamDirection:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  VCMediaStreamMultiwayConfigVideo *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  float v19;
  VCSessionParticipant *v21;
  int64_t v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (v11)
  {
    v21 = self;
    v22 = a6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = (void *)objc_msgSend((id)objc_msgSend(a5, "videoRuleCollections"), "supportedPayloads");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v12);
          v18 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntValue");
          -[VCMediaStreamMultiwayConfigVideo addPayload:](v11, "addPayload:", v18);
          if (!v15)
            v15 = (void *)objc_msgSend((id)objc_msgSend(a5, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, v18, v9);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    -[VCMediaStreamMultiwayConfig setIsOneToOne:](v11, "setIsOneToOne:", 1);
    -[VCMediaStreamMultiwayConfig setStreamGroupID:](v11, "setStreamGroupID:", v8);
    -[VCMediaStreamMultiwayConfigVideo setResolution:](v11, "setResolution:", +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "iWidth"), objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "iHeight")));
    objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "fRate");
    -[VCMediaStreamMultiwayConfigVideo setFramerate:](v11, "setFramerate:", v19);
    -[VCMediaStreamMultiwayConfigVideo setKeyFrameInterval:](v11, "setKeyFrameInterval:", 0);
    if ((_DWORD)v8 == 1650745716
      || (_DWORD)v8 == 1935897189
      && -[VCSessionParticipant isOneToOneTemporalSupportedForSettings:streamDirection:](v21, "isOneToOneTemporalSupportedForSettings:streamDirection:", a5, v22))
    {
      -[VCMediaStreamMultiwayConfigVideo setIsTemporalStream:](v11, "setIsTemporalStream:", 1);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:].cold.1();
  }
  return v11;
}

- (BOOL)didNegotiateStreamGroupWithID:(unsigned int)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = -[VCSessionMediaNegotiator negotiatedStreamGroups](self->_mediaNegotiator, "negotiatedStreamGroups");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "groupID") == a3)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)supportsLowLatencyAudio
{
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
    return 0;
  if (self->_oneToOneModeEnabled)
  {
    if ((objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->_mediaNegotiator, "negotiatedResultsForGroupID:", 1650745716), "isSupported") & 1) == 0)return objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->_mediaNegotiator, "negotiatedResultsForGroupID:", 1718909044), "isSupported");
    return 1;
  }
  if (-[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1650745716)
    || -[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1718909044))
  {
    return 1;
  }
  return -[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1717854580);
}

- (id)newOneToOneAudioStreamConfigWithAudioSettings:(id)a3 streamDirection:(int64_t)a4 streamGroupId:(unsigned int)a5 streamSsrc:(unsigned int)a6
{
  uint64_t v6;
  VCSessionParticipantAudioStreamConfig *v11;
  VCSessionParticipantAudioStreamConfig *v12;
  VCMediaStreamMultiwayConfigAudio *v13;
  VCMediaStreamMultiwayConfigAudio *v14;
  VCMediaStreamRateControlConfig *v15;
  VCMediaStreamRateControlConfig *v16;
  VCAudioRuleCollection *v17;
  VCMediaStreamMultiwayConfigAudio *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  VCMediaStreamRateControlConfig *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  VCSessionParticipantAudioStreamConfig *v35;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  int64_t v44;
  unsigned int v45;
  VCMediaStreamRateControlConfig *v46;
  VCSessionParticipant *v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  VCSessionParticipant *v62;
  uint64_t v63;

  v6 = *(_QWORD *)&a6;
  v63 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (v11)
  {
    v12 = v11;
    -[VCMediaStreamConfig setDirection:](v11, "setDirection:", a4);
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[VCMediaStreamConfig setRemoteSSRC:](v12, "setRemoteSSRC:", v6);
    -[VCAudioStreamConfig setAudioStreamMode:](v12, "setAudioStreamMode:", 5);
    -[VCAudioStreamConfig setIsHigherAudioREDCutoverU1Enabled:](v12, "setIsHigherAudioREDCutoverU1Enabled:", -[VCAudioRuleCollection isHigherAudioREDCutoverU1Enabled](self->_supportedAudioRules, "isHigherAudioREDCutoverU1Enabled"));
    -[VCAudioStreamConfig setSupportsAdaptation:](v12, "setSupportsAdaptation:", a5 != 1937339233);
    -[VCAudioStreamConfig setOneToOneOperatingMode:](v12, "setOneToOneOperatingMode:", -[VCSessionParticipant operatingMode](self, "operatingMode"));
    -[VCAudioStreamConfig setBundlingScheme:](v12, "setBundlingScheme:", 1);
    v13 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
    if (v13)
    {
      v14 = v13;
      v15 = objc_alloc_init(VCMediaStreamRateControlConfig);
      if (v15)
      {
        v16 = v15;
        v44 = a4;
        v17 = [VCAudioRuleCollection alloc];
        v18 = v14;
        v19 = objc_msgSend(a3, "primaryPayload");
        v20 = objc_msgSend(a3, "dtxPayload");
        v46 = v16;
        v45 = a5;
        v21 = objc_msgSend(a3, "redPayload");
        v22 = objc_msgSend(a3, "secondaryPayloads");
        v47 = self;
        v23 = objc_msgSend(a3, "allowSwitching");
        v24 = objc_msgSend(a3, "useSBR");
        LODWORD(v43) = 480;
        v25 = v19;
        v14 = v18;
        v26 = v21;
        v27 = v46;
        v28 = -[VCAudioRuleCollection initPrimaryPayload:dtxPayload:redPayload:secondaryPayloads:allowAudioSwitching:sbr:aacBlockSize:](v17, "initPrimaryPayload:dtxPayload:redPayload:secondaryPayloads:allowAudioSwitching:sbr:aacBlockSize:", v25, v20, v26, v22, v23, v24, v43);
        -[VCMediaStreamMultiwayConfig setIsOneToOne:](v18, "setIsOneToOne:", 1);
        -[VCMediaStreamMultiwayConfig setSsrc:](v18, "setSsrc:", v6);
        -[VCMediaStreamMultiwayConfig setStreamGroupID:](v18, "setStreamGroupID:", v45);
        -[VCMediaStreamMultiwayConfigAudio setAudioRules:](v18, "setAudioRules:", v28);
        -[VCMediaStreamConfig setMultiwayConfig:](v12, "setMultiwayConfig:", v18);
        -[VCMediaStreamConfig setRateControlConfig:](v12, "setRateControlConfig:", v46);
        -[VCAudioStreamConfig setExternalIOFormat:](v12, "setExternalIOFormat:", -[VCAudioIO clientFormat](v47->_audioIO, "clientFormat"));
        if (v47->_deviceRole == 3)
          v29 = 6;
        else
          v29 = 5;
        -[VCAudioStreamConfig setAudioStreamMode:](v12, "setAudioStreamMode:", v29);
        -[VCAudioStreamConfig setShouldApplyRedAsBoolean:](v12, "setShouldApplyRedAsBoolean:", 1);
        -[VCMediaStreamConfig setRtpTimestampRate:](v12, "setRtpTimestampRate:", -[VCSessionParticipant preferredRTPTimestampRateForGroupID:](v47, "preferredRTPTimestampRateForGroupID:", -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v12, "multiwayConfig"), "streamGroupID")));
        if (v45 == 1835623282)
          -[VCAudioStreamConfig setIsLowLatency:](v12, "setIsLowLatency:", -[VCSessionParticipant supportsLowLatencyAudio](v47, "supportsLowLatencyAudio"));
        if (-[VCSessionParticipant setupAudioStreamConfiguration:audioRules:](v47, "setupAudioStreamConfiguration:audioRules:", v12, -[VCMediaStreamMultiwayConfigAudio audioRules](v18, "audioRules")))
        {
          v49 = 0u;
          v50 = 0u;
          if (objc_msgSend(a3, "redPayload") == 20)
            v30 = &unk_1E9EFB090;
          else
            v30 = &unk_1E9EFB0A8;
          v51 = 0uLL;
          v52 = 0uLL;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v50 != v33)
                  objc_enumerationMutation(v30);
                -[VCAudioStreamConfig addSupportedNumRedundantPayload:](v12, "addSupportedNumRedundantPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "intValue"));
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
            }
            while (v32);
          }
          if (-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](v47, "completeStreamSetup:rtpCipherSuite:", v12, objc_msgSend(a3, "cipherSuite")))
          {
            if (v44 == 2)
            {
              -[VCMediaStreamConfig setRtcpEnabled:](v12, "setRtcpEnabled:", 1);
              -[VCMediaStreamConfig setRtcpSendInterval:](v12, "setRtcpSendInterval:", 5.0);
            }
            v35 = 0;
            goto LABEL_26;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.4();
LABEL_60:
            v35 = v12;
            v12 = 0;
            v27 = v46;
            goto LABEL_26;
          }
        }
        else
        {
          if ((VCSessionParticipant *)objc_opt_class() != v47)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v38 = (const __CFString *)-[VCSessionParticipant performSelector:](v47, "performSelector:", sel_logPrefix);
            else
              v38 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v41 = VRTraceErrorLogLevelToCSTR();
              v42 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v54 = v41;
                v55 = 2080;
                v56 = "-[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]";
                v57 = 1024;
                v58 = 1220;
                v59 = 2112;
                v60 = v38;
                v61 = 2048;
                v62 = v47;
                _os_log_error_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup the audio stream config", buf, 0x30u);
              }
            }
            goto LABEL_60;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.5();
            goto LABEL_60;
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.3();
        }
        v27 = 0;
        v28 = 0;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.2();
      }
      v27 = 0;
      v28 = 0;
      v14 = 0;
    }
    v35 = v12;
    v12 = 0;
    goto LABEL_26;
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v37 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v54 = v39;
        v55 = 2080;
        v56 = "-[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]";
        v57 = 1024;
        v58 = 1174;
        v59 = 2112;
        v60 = v37;
        v61 = 2048;
        v62 = self;
        _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate stream configuration!", buf, 0x30u);
      }
    }
  }
  v35 = 0;
  v27 = 0;
  v12 = 0;
  v28 = 0;
  v14 = 0;
LABEL_26:

  return v12;
}

+ (void)applyVideoNegotiatedSettings:(id)a3 toStreamConfiguration:(id)a4 withFeatureStringDictionary:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "featureStrings"), "objectForKeyedSubscript:", v14), v14);
        if (objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v14, "unsignedIntValue"), 1))
        {
          objc_msgSend(v7, "addObject:", v14);
        }
        if (objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v14, "unsignedIntValue"), 2))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v11);
  }
  objc_msgSend(a4, "setupRxPayloads:featureStrings:", v8, v6);
  objc_msgSend(a4, "setupTxPayloads:featureStrings:", v7, v6);

}

- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3
{
  return 0;
}

- (BOOL)rtcpPSFBForFeedbackStoreBagConfig
{
  id v2;
  double v3;
  double v4;

  v2 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-rtcp-psfb-for-loss-feedback"), CFSTR("rtcpPSBFForLossFeedbackEnabled"), &unk_1E9EF73E8, 1);
  v3 = (double)arc4random() / 4294967300.0;
  objc_msgSend(v2, "doubleValue");
  return v3 < v4;
}

- (BOOL)rtcpPSFBForLTRAckStoreBagConfig
{
  id v2;
  double v3;
  double v4;

  v2 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-rtcp-psfb-for-ltr-ack"), CFSTR("rtcpPSBFForLTRAckEnabled"), &unk_1E9EF73E8, 1);
  v3 = (double)arc4random() / 4294967300.0;
  objc_msgSend(v2, "doubleValue");
  return v3 < v4;
}

- (unsigned)mediaControlVersionForStreamGroup:(unsigned int)a3
{
  unsigned __int8 result;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  VCSessionParticipant *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = 1;
  if ((int)a3 <= 1718909043)
  {
    if (a3 != 1650745716)
    {
      if (a3 == 1667329381)
        return result;
      goto LABEL_8;
    }
    return 2;
  }
  if (a3 == 1718909044)
    return result;
  if (a3 == 1935897189)
    return 2;
LABEL_8:
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 1;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v14 = 136315906;
    v15 = v7;
    v16 = 2080;
    v17 = "-[VCSessionParticipant mediaControlVersionForStreamGroup:]";
    v18 = 1024;
    v19 = 1290;
    v20 = 2080;
    v21 = FourccToCStr(a3);
    v9 = " [%s] %s:%d Media version control for unsupported streamGroupID=%s";
    v10 = v8;
    v11 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return 1;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v14 = 136316418;
    v15 = v12;
    v16 = 2080;
    v17 = "-[VCSessionParticipant mediaControlVersionForStreamGroup:]";
    v18 = 1024;
    v19 = 1290;
    v20 = 2112;
    v21 = (char *)v6;
    v22 = 2048;
    v23 = self;
    v24 = 2080;
    v25 = FourccToCStr(a3);
    v9 = " [%s] %s:%d %@(%p) Media version control for unsupported streamGroupID=%s";
    v10 = v13;
    v11 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
  return 1;
}

- (id)newOneToOneVideoStreamConfigWithStreamDirection:(int64_t)a3 streamGroupId:(unsigned int)a4 streamSsrc:(unsigned int)a5 encodingType:(unsigned __int8)a6 videoSettings:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VCSessionParticipantVideoStreamConfig *v13;
  VCSessionParticipantVideoStreamConfig *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  VCSessionParticipantVideoStreamConfig *v23;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCSessionParticipant *v37;
  uint64_t v38;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v28 = 136316162;
          v29 = v26;
          v30 = 2080;
          v31 = "-[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encoding"
                "Type:videoSettings:]";
          v32 = 1024;
          v33 = 1302;
          v34 = 2112;
          v35 = v25;
          v36 = 2048;
          v37 = self;
          _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate one to one video stream configuration!", (uint8_t *)&v28, 0x30u);
        }
      }
    }
    v18 = 0;
    v23 = 0;
    v16 = 0;
    goto LABEL_27;
  }
  v14 = v13;
  v15 = -[VCSessionParticipant newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:](self, "newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:", v8, v10, a7, a3);
  if (v15)
  {
    v16 = v15;
    v17 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", -[VCSessionParticipant mediaControlVersionForStreamGroup:](self, "mediaControlVersionForStreamGroup:", v10), 1, (_DWORD)v10 == 1667329381, 1);
    if (!v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:].cold.3();
      }
      v18 = 0;
      goto LABEL_44;
    }
    v18 = v17;
    -[VCMediaStreamConfig setMultiwayConfig:](v14, "setMultiwayConfig:", v16);
    -[VCVideoStreamConfig setFramerate:](v14, "setFramerate:", objc_msgSend(v16, "framerate"));
    -[VCMediaStreamConfig setDirection:](v14, "setDirection:", a3);
    -[VCMediaStreamConfig setRateControlConfig:](v14, "setRateControlConfig:", v18);
    -[VCVideoStreamConfig setType:](v14, "setType:", 3);
    -[VCVideoStreamConfig setSourceFramerate:](v14, "setSourceFramerate:", objc_msgSend(v16, "framerate"));
    -[VCVideoStreamConfig setRemoteVideoInitialOrientation:](v14, "setRemoteVideoInitialOrientation:", 2 * ((_DWORD)v10 == 1935897189));
    -[VCVideoStreamConfig setKeyFrameInterval:](v14, "setKeyFrameInterval:", 0);
    -[VCMediaStreamConfig setRtpTimestampRate:](v14, "setRtpTimestampRate:", -[VCSessionParticipant preferredRTPTimestampRateForGroupID:](self, "preferredRTPTimestampRateForGroupID:", -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v14, "multiwayConfig"), "streamGroupID")));
    -[VCVideoStreamConfig setAudioIOSampleRate:](v14, "setAudioIOSampleRate:", self->_preferredIOSampleRate);
    LODWORD(v19) = self->_preferredIOSamplesPerFrame;
    LODWORD(v20) = self->_preferredIOSampleRate;
    -[VCVideoStreamConfig setMinPlaybackInterval:](v14, "setMinPlaybackInterval:", (double)v19 / (double)v20);
    -[VCVideoStreamConfig setTemporalScalingEnabled:](v14, "setTemporalScalingEnabled:", objc_msgSend(v16, "isTemporalStream"));
    -[VCMediaStreamConfig setCaptureSource:](v14, "setCaptureSource:", -[VCSessionParticipant captureSourceIDFromStreamGroupID:](self, "captureSourceIDFromStreamGroupID:", v10));
    -[VCVideoStreamConfig setVideoResolution:](v14, "setVideoResolution:", objc_msgSend(v16, "resolution"));
    if (-[VCVideoStreamConfig videoResolution](v14, "videoResolution") == 27)
      -[VCSessionParticipant updateOneToOneVideoStreamCustomResolution:videoSettings:](self, "updateOneToOneVideoStreamCustomResolution:videoSettings:", v14, a7);
    if (a3 == 2)
    {
      -[VCVideoStreamConfig setRxMaxBitrate:](v14, "setRxMaxBitrate:", -[VCMediaNegotiatorResults maxBandwidthWithArbiterMode:connectionType:](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "maxBandwidthWithArbiterMode:connectionType:", 1, 3));
      -[VCMediaStreamConfig setRemoteSSRC:](v14, "setRemoteSSRC:", v9);
    }
    else
    {
      -[VCSessionParticipant configureOneToOneVideoSendingConfigs:streamGroupID:](self, "configureOneToOneVideoSendingConfigs:streamGroupID:", v14, v10);
      -[VCMediaStreamConfig setLocalSSRC:](v14, "setLocalSSRC:", v9);
      -[VCMediaStreamMultiwayConfig setSsrc:](-[VCMediaStreamConfig multiwayConfig](v14, "multiwayConfig"), "setSsrc:", v9);
    }
    +[VCSessionParticipant applyVideoNegotiatedSettings:toStreamConfiguration:withFeatureStringDictionary:](VCSessionParticipant, "applyVideoNegotiatedSettings:toStreamConfiguration:withFeatureStringDictionary:", a7, v14, objc_msgSend(a7, "featureStrings"));
    if ((_DWORD)v10 == 1935897189)
    {
      -[VCMediaStreamConfig setIsRTCPForLossFeedbackEnabled:](v14, "setIsRTCPForLossFeedbackEnabled:", -[VCSessionParticipant rtcpPSFBForFeedbackStoreBagConfig](self, "rtcpPSFBForFeedbackStoreBagConfig"));
      -[VCMediaStreamConfig setRtcpPSFB_LTRAckEnabled:](v14, "setRtcpPSFB_LTRAckEnabled:", -[VCSessionParticipant rtcpPSFBForLTRAckStoreBagConfig](self, "rtcpPSFBForLTRAckStoreBagConfig"));
    }
    else if ((_DWORD)v10 == 1718909044)
    {
      -[VCMediaStreamConfig setRtcpPSFB_LTRAckEnabled:](v14, "setRtcpPSFB_LTRAckEnabled:", -[VCSessionParticipant rtcpPSFBForLTRAckStoreBagConfig](self, "rtcpPSFBForLTRAckStoreBagConfig"));
      if ((_DWORD)v8 == 1)
      {
        -[VCVideoStreamConfig setEncoderUsage:](v14, "setEncoderUsage:", 4);
        -[VCVideoStreamConfig setEncodingMode:](v14, "setEncodingMode:", 0);
      }
      else
      {
        v8 = 1;
      }
      goto LABEL_15;
    }
    v8 = 0;
LABEL_15:
    if (-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", v14, objc_msgSend(a7, "cipherSuite")))
    {
      if (a3 == 2)
      {
        -[VCMediaStreamConfig setRtcpEnabled:](v14, "setRtcpEnabled:", 1);
        -[VCVideoStreamConfig setLtrpEnabled:](v14, "setLtrpEnabled:", 1);
        -[VCMediaStreamConfig setRtcpSendInterval:](v14, "setRtcpSendInterval:", 5.0);
        -[VCMediaStreamConfig setRtcpTimeOutEnabled:](v14, "setRtcpTimeOutEnabled:", 1);
        -[VCVideoStreamConfig setDeferredAssemblyEnabled:](v14, "setDeferredAssemblyEnabled:", (_DWORD)v10 == 1935897189);
        -[VCVideoStreamConfig setLooseAVSyncEnabled:](v14, "setLooseAVSyncEnabled:", (_DWORD)v10 == 1935897189);
      }
      else if (a3 == 1)
      {
        v21 = 1;
        if ((_DWORD)v10 != 1667329381 && (_DWORD)v10 != 1935897189)
          v21 = v8;
        -[VCMediaStreamConfig setRtcpEnabled:](v14, "setRtcpEnabled:", v21);
        v22 = 1;
        if ((_DWORD)v10 != 1667329381 && (_DWORD)v10 != 1935897189)
          v22 = v8;
        -[VCVideoStreamConfig setLtrpEnabled:](v14, "setLtrpEnabled:", v22);
      }
      -[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:](self, "setFECConfigurationOnStreamConfig:withStreamGroupID:", v14, v10);
      v23 = v14;
LABEL_27:
      v14 = 0;
      goto LABEL_28;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:].cold.4();
    }
LABEL_44:
    v23 = 0;
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:].cold.2();
  }
  v18 = 0;
  v23 = 0;
  v16 = 0;
LABEL_28:

  return v23;
}

- (void)configureOneToOneVideoSendingConfigs:(id)a3 streamGroupID:(unsigned int)a4
{
  if (a4 == 1650745716)
  {
    objc_msgSend(a3, "setTxMinBitrate:", 90560);
    objc_msgSend(a3, "setTxMaxBitrate:", 140640);
    objc_msgSend(a3, "addTxBitrateTier:", &unk_1E9EF7640);
    objc_msgSend(a3, "addTxBitrateTier:", &unk_1E9EF7658);
  }
  else
  {
    objc_msgSend(a3, "setTxMaxBitrate:", -[VCMediaNegotiatorResults maxBandwidthWithArbiterMode:connectionType:](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "maxBandwidthWithArbiterMode:connectionType:", 1, 3));
  }
  objc_msgSend(a3, "setUseInBandFEC:", a4 != 1650745716);
}

- (int64_t)participantMicrophoneToken
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF7670), "integerValue");
}

- (int64_t)participantVideoToken
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF7688), "integerValue");
}

- (id)cameraGroups
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1667329381);
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1667329399);
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  return v3;
}

- (id)cameraGroupsExt
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_1E9EFB0C0, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(&unk_1E9EFB0C0);
        v8 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "intValue"));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_1E9EFB0C0, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v5);
  }
  return v3;
}

- (int64_t)participantScreenToken
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF7700), "integerValue");
}

- (id)screenGroup
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSessionParticipant participantScreenToken](self, "participantScreenToken")));
}

- (id)systemAudioGroup
{
  return -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1937339233);
}

- (id)microphoneGroup
{
  return -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1835623282);
}

- (id)captionsGroup
{
  return -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1667330164);
}

- (id)streamGroupWithID:(unsigned int)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamGroups, "objectForKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)));
}

- (NSDictionary)participantStreamTokens
{
  return &self->_participantStreamTokens->super;
}

- (int)securityKeyHolderUsageForStreamConfigDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

- (BOOL)setupSecurityKeyHolderForStreamConfig:(id)a3
{
  unsigned int v5;
  _BOOL4 v6;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!self->_securityKeyManager)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[VCSessionParticipant setupSecurityKeyHolderForStreamConfig:].cold.1();
    }
    goto LABEL_17;
  }
  cf[0] = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID") == 1667329399
    || objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID") == 1835623287)
  {
    v5 = 2;
  }
  else
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
  }
  if (VCSecurityKeyHolder_Create(*MEMORY[0x1E0C9AE00], (uint64_t)self->_securityKeyManager, -[VCSessionParticipant securityKeyHolderUsageForStreamConfigDirection:](self, "securityKeyHolderUsageForStreamConfigDirection:", objc_msgSend(a3, "direction")), self->_idsParticipantID, -[VCSessionParticipant isParticipantIDBasedKeyLookupEnabled](self, "isParticipantIDBasedKeyLookupEnabled"), v5, (uint64_t *)cf))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[VCSessionParticipant setupSecurityKeyHolderForStreamConfig:].cold.2();
    }
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_msgSend(a3, "setSecurityKeyHolder:", cf[0]);
  if (cf[0])
    CFRelease(cf[0]);
  LOBYTE(v6) = 1;
  return v6;
}

- (id)getAudioDumpName
{
  return 0;
}

- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4
{
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  int64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setSessionId:", self->_sessionUUID);
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setParticipantId:", self->_uuid);
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setRemoteIDSParticipantID:", self->_idsParticipantID);
  objc_msgSend(a3, "setSendMediaKey:", -[VCSessionParticipant generateEncryptionKey](self, "generateEncryptionKey"));
  objc_msgSend(a3, "setReceiveMediaKey:", -[VCSessionParticipant generateEncryptionKey](self, "generateEncryptionKey"));
  v7 = -[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption");
  if (v7 || objc_msgSend(a3, "sframeCipherSuite"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316162;
        v17 = v8;
        v18 = 2080;
        v19 = "-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:]";
        v20 = 1024;
        v21 = 1526;
        v22 = 1024;
        v23 = v7;
        v24 = 1024;
        v25 = objc_msgSend(a3, "sframeCipherSuite");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disabling SRTP encryption. isEncryptionDisabled=%d, sframeCipherSuite=%d", (uint8_t *)&v16, 0x28u);
      }
    }
    v10 = a3;
    v11 = 0;
  }
  else
  {
    v10 = a3;
    v11 = a4;
  }
  objc_msgSend(v10, "setSRTPCipherSuite:", v11);
  objc_msgSend(a3, "setSRTCPCipherSuite:", 0);
  objc_msgSend(a3, "setDecryptionTimeOutEnabled:", 0);
  objc_msgSend(a3, "setDecryptionTimeOutInterval:", (double)self->_decryptionTimeOutInterval);
  objc_msgSend(a3, "setDecryptionMKMRecoveryInterval:", self->_participantMKMRecoveryTimeout);
  v12 = -[VCSessionParticipant setupSecurityKeyHolderForStreamConfig:](self, "setupSecurityKeyHolderForStreamConfig:", a3);
  if (v12)
  {
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315650;
          v17 = v13;
          v18 = 2080;
          v19 = "-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:]";
          v20 = 1024;
          v21 = 1541;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disabling SFrame encryption. isEncryptionDisabled=YES", (uint8_t *)&v16, 0x1Cu);
        }
      }
      objc_msgSend(a3, "setSframeCipherSuite:", 0);
    }
    -[VCSessionParticipant setupNetworkAddressesForMediaConfig:](self, "setupNetworkAddressesForMediaConfig:", a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant completeStreamSetup:rtpCipherSuite:].cold.1();
  }
  return v12;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, "-[VCSessionParticipant configureAudioIOWithDeviceRole:operatingMode:]"), 0));
}

- (BOOL)updateConfigurationWithDeviceRole:(int)a3
{
  NSObject *participantQueue;
  char v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  participantQueue = self->_participantQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke;
  v6[3] = &unk_1E9E54D70;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(participantQueue, v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 304) == *(_DWORD *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v3 = *(void **)(v2 + 480);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v28;
LABEL_5:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v7), "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
          if (v5)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1667330164);
      if (v8
        && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"))) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_2();
        }
      }
      else
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_DWORD *)(v9 + 168);
        if (v10 == 1)
        {
          v11 = objc_msgSend(*(id *)(v9 + 392), "state");
          if (v11 == 2)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "stop");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "configureAudioIOWithDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
          if (v11 == 2)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "start");
        }
        else if (!v10)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)v9, "configureAudioIOWithDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 304) = *(_DWORD *)(a1 + 48);
    }
    else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = 136316162;
          v17 = v13;
          v18 = 2080;
          v19 = "-[VCSessionParticipant updateConfigurationWithDeviceRole:]_block_invoke";
          v20 = 1024;
          v21 = 1594;
          v22 = 2112;
          v23 = v12;
          v24 = 2048;
          v25 = v15;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring audioIO", (uint8_t *)&v16, 0x30u);
        }
      }
    }
  }
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3
{
  return 1;
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  AVCStatisticsCollector *statisticsCollector;
  AVCBasebandCongestionDetector *basebandCongestionDetector;
  AVCRateControlFeedbackController *v20;
  uint64_t v21;
  void *v22;
  VCRateControlMediaController *v23;
  tagHANDLE *v24;
  VCAudioIO *audioIO;
  unint64_t v26;
  double v27;
  VCNetworkFeedbackController *v28;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  if (self->_oneToOneModeEnabled || !objc_msgSend(a4, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v48 = v6;
        v49 = 2080;
        v50 = "-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:]";
        v51 = 1024;
        v52 = 1611;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d There are no audio streams to configure, bypassing configuration", buf, 0x1Cu);
      }
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
  if (v32)
  {
    if (a3 == 3)
      v9 = 6;
    else
      v9 = 5;
    v31 = *(_QWORD *)v44;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(a4);
        v33 = v10;
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        v35 = (void *)objc_msgSend(v11, "stream");
        objc_msgSend(v35, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v34 = v11;
        v12 = (void *)objc_msgSend(v11, "streamConfigs");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v17, "setAudioStreamMode:", v9);
              objc_msgSend(v17, "setCellularUniqueTag:", self->_cellularUniqueTag);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                statisticsCollector = -[VCSessionParticipantOneToOneConfig statisticsCollector](self->_oneToOneConfig, "statisticsCollector");
              else
                statisticsCollector = self->_statisticsCollector;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setStatisticsCollector:", statisticsCollector);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                basebandCongestionDetector = -[VCSessionParticipantOneToOneConfig basebandCongestionDetector](self->_oneToOneConfig, "basebandCongestionDetector");
              else
                basebandCongestionDetector = self->_basebandCongestionDetector;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setBasebandCongestionDetector:", basebandCongestionDetector);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                v20 = -[VCSessionParticipantOneToOneConfig feedbackController](self->_oneToOneConfig, "feedbackController");
              else
                v20 = 0;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setFeedbackController:", v20);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setShouldCreateMediaControlInfoGenerator:", 0);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setShouldRegisterMediaControlInfoGeneratorCallbacks:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"));
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                v21 = -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion");
              else
                v21 = 1;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoVersion:", v21);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGeneratorType:", 0);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                v22 = -[VCSessionParticipantOneToOneConfig audioMediaControlInfoGenerator](self->_oneToOneConfig, "audioMediaControlInfoGenerator");
              else
                v22 = 0;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGenerator:", v22);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGeneratorOptions:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"));
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                v23 = -[VCSessionParticipantOneToOneConfig mediaController](self->_oneToOneConfig, "mediaController");
              else
                v23 = 0;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaController:", v23);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setVcMediaQueue:", self->_mediaQueue);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"))
                v24 = -[VCSessionParticipantOneToOneConfig mediaQueue](self->_oneToOneConfig, "mediaQueue");
              else
                v24 = (tagHANDLE *)0xFFFFFFFFLL;
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaQueue:", v24);
              audioIO = self->_audioIO;
              if (audioIO)
              {
                LODWORD(v26) = (_DWORD)-[VCAudioIO clientFormat](audioIO, "clientFormat")[40];
                v27 = (double)v26 / *(double *)-[VCAudioIO clientFormat](self->_audioIO, "clientFormat");
              }
              else
              {
                v27 = (double)(self->_preferredIOSamplesPerFrame / self->_preferredIOSampleRate);
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaQueueThrottlingInterval:", v27);
              objc_msgSend(v17, "setShouldApplyRedAsBoolean:", 1);
              objc_msgSend(v17, "setExternalIOFormat:", -[VCAudioIO clientFormat](self->_audioIO, "clientFormat"));
              if (self->_oneToOneModeEnabled)
                v28 = -[VCSessionParticipantOneToOneConfig networkFeedbackController](self->_oneToOneConfig, "networkFeedbackController");
              else
                v28 = 0;
              objc_msgSend(v17, "setNetworkFeedbackController:", v28);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
          }
          while (v14);
        }
        if ((objc_msgSend(v35, "setStreamConfig:withError:", objc_msgSend(v34, "streamConfigs"), &v36) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:].cold.1();
          }
          return 0;
        }
        v10 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
      if (v32)
        continue;
      break;
    }
    return 1;
  }
  return v8;
}

- (id)newVideoRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableMediaControlInfoGenerator:(BOOL)a4 enableFeedbackController:(BOOL)a5 isOneToOne:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  VCMediaStreamRateControlConfig *v11;
  VCMediaStreamRateControlConfig *v12;
  AVCRateControlFeedbackController *v13;
  void *v14;
  tagHANDLE *v15;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = objc_alloc_init(VCMediaStreamRateControlConfig);
  v12 = v11;
  if (v11)
  {
    if (v6)
    {
      -[VCMediaStreamRateControlConfig setStatisticsCollector:](v11, "setStatisticsCollector:", -[VCSessionParticipantOneToOneConfig statisticsCollector](self->_oneToOneConfig, "statisticsCollector"));
      -[VCMediaStreamRateControlConfig setBasebandCongestionDetector:](v12, "setBasebandCongestionDetector:", -[VCSessionParticipantOneToOneConfig basebandCongestionDetector](self->_oneToOneConfig, "basebandCongestionDetector"));
      v13 = 0;
      if (v7 && v6)
        v13 = -[VCSessionParticipantOneToOneConfig feedbackController](self->_oneToOneConfig, "feedbackController", 0);
    }
    else
    {
      -[VCMediaStreamRateControlConfig setStatisticsCollector:](v11, "setStatisticsCollector:", self->_statisticsCollector);
      -[VCMediaStreamRateControlConfig setBasebandCongestionDetector:](v12, "setBasebandCongestionDetector:", self->_basebandCongestionDetector);
      v13 = 0;
    }
    -[VCMediaStreamRateControlConfig setFeedbackController:](v12, "setFeedbackController:", v13);
    -[VCMediaStreamRateControlConfig setShouldCreateMediaControlInfoGenerator:](v12, "setShouldCreateMediaControlInfoGenerator:", !v6 & v8);
    -[VCMediaStreamRateControlConfig setShouldRegisterMediaControlInfoGeneratorCallbacks:](v12, "setShouldRegisterMediaControlInfoGeneratorCallbacks:", v6);
    if (!v6)
    {
      -[VCMediaStreamRateControlConfig setMediaControlInfoVersion:](v12, "setMediaControlInfoVersion:", v9);
      -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorType:](v12, "setMediaControlInfoGeneratorType:", 1);
      v14 = 0;
    }
    else
    {
      -[VCMediaStreamRateControlConfig setMediaControlInfoVersion:](v12, "setMediaControlInfoVersion:", -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion"));
      -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorType:](v12, "setMediaControlInfoGeneratorType:", 1);
      v14 = -[VCSessionParticipantOneToOneConfig videoMediaControlInfoGenerator](self->_oneToOneConfig, "videoMediaControlInfoGenerator");
    }
    -[VCMediaStreamRateControlConfig setMediaControlInfoGenerator:](v12, "setMediaControlInfoGenerator:", v14);
    -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorOptions:](v12, "setMediaControlInfoGeneratorOptions:", 0);
    if (v6)
    {
      -[VCMediaStreamRateControlConfig setMediaController:](v12, "setMediaController:", -[VCSessionParticipantOneToOneConfig mediaController](self->_oneToOneConfig, "mediaController"));
      v15 = -[VCSessionParticipantOneToOneConfig mediaQueue](self->_oneToOneConfig, "mediaQueue");
    }
    else
    {
      -[VCMediaStreamRateControlConfig setMediaController:](v12, "setMediaController:", 0);
      v15 = (tagHANDLE *)0xFFFFFFFFLL;
    }
    -[VCMediaStreamRateControlConfig setMediaQueue:](v12, "setMediaQueue:", v15);
    -[VCMediaStreamRateControlConfig setVcMediaQueue:](v12, "setVcMediaQueue:", self->_mediaQueue);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:].cold.1();
  }
  return v12;
}

- (id)newAudioRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableFeedbackController:(BOOL)a4 isOneToOne:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v7;
  VCMediaStreamRateControlConfig *v9;
  VCMediaStreamRateControlConfig *v10;
  AVCRateControlFeedbackController *v11;
  void *v12;
  tagHANDLE *v13;
  VCAudioIO *audioIO;
  unint64_t v15;
  double v16;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(VCMediaStreamRateControlConfig);
  v10 = v9;
  if (v5)
  {
    -[VCMediaStreamRateControlConfig setStatisticsCollector:](v9, "setStatisticsCollector:", -[VCSessionParticipantOneToOneConfig statisticsCollector](self->_oneToOneConfig, "statisticsCollector"));
    -[VCMediaStreamRateControlConfig setBasebandCongestionDetector:](v10, "setBasebandCongestionDetector:", -[VCSessionParticipantOneToOneConfig basebandCongestionDetector](self->_oneToOneConfig, "basebandCongestionDetector"));
    v11 = 0;
    if (v6 && v5)
      v11 = -[VCSessionParticipantOneToOneConfig feedbackController](self->_oneToOneConfig, "feedbackController", 0);
  }
  else
  {
    -[VCMediaStreamRateControlConfig setStatisticsCollector:](v9, "setStatisticsCollector:", self->_statisticsCollector);
    -[VCMediaStreamRateControlConfig setBasebandCongestionDetector:](v10, "setBasebandCongestionDetector:", self->_basebandCongestionDetector);
    v11 = 0;
  }
  -[VCMediaStreamRateControlConfig setFeedbackController:](v10, "setFeedbackController:", v11);
  -[VCMediaStreamRateControlConfig setShouldCreateMediaControlInfoGenerator:](v10, "setShouldCreateMediaControlInfoGenerator:", 0);
  -[VCMediaStreamRateControlConfig setShouldRegisterMediaControlInfoGeneratorCallbacks:](v10, "setShouldRegisterMediaControlInfoGeneratorCallbacks:", v5);
  if (v5)
  {
    -[VCMediaStreamRateControlConfig setMediaControlInfoVersion:](v10, "setMediaControlInfoVersion:", -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion"));
    -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorType:](v10, "setMediaControlInfoGeneratorType:", 0);
    v12 = -[VCSessionParticipantOneToOneConfig audioMediaControlInfoGenerator](self->_oneToOneConfig, "audioMediaControlInfoGenerator");
  }
  else
  {
    -[VCMediaStreamRateControlConfig setMediaControlInfoVersion:](v10, "setMediaControlInfoVersion:", v7);
    -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorType:](v10, "setMediaControlInfoGeneratorType:", 0);
    v12 = 0;
  }
  -[VCMediaStreamRateControlConfig setMediaControlInfoGenerator:](v10, "setMediaControlInfoGenerator:", v12);
  -[VCMediaStreamRateControlConfig setMediaControlInfoGeneratorOptions:](v10, "setMediaControlInfoGeneratorOptions:", v5);
  if (v5)
  {
    -[VCMediaStreamRateControlConfig setMediaController:](v10, "setMediaController:", -[VCSessionParticipantOneToOneConfig mediaController](self->_oneToOneConfig, "mediaController"));
    -[VCMediaStreamRateControlConfig setVcMediaQueue:](v10, "setVcMediaQueue:", self->_mediaQueue);
    v13 = -[VCSessionParticipantOneToOneConfig mediaQueue](self->_oneToOneConfig, "mediaQueue");
  }
  else
  {
    -[VCMediaStreamRateControlConfig setMediaController:](v10, "setMediaController:", 0);
    -[VCMediaStreamRateControlConfig setVcMediaQueue:](v10, "setVcMediaQueue:", self->_mediaQueue);
    v13 = (tagHANDLE *)0xFFFFFFFFLL;
  }
  -[VCMediaStreamRateControlConfig setMediaQueue:](v10, "setMediaQueue:", v13);
  audioIO = self->_audioIO;
  if (audioIO)
  {
    LODWORD(v15) = (_DWORD)-[VCAudioIO clientFormat](audioIO, "clientFormat")[40];
    v16 = (double)v15 / *(double *)-[VCAudioIO clientFormat](self->_audioIO, "clientFormat");
  }
  else
  {
    v16 = (double)(self->_preferredIOSamplesPerFrame / self->_preferredIOSampleRate);
  }
  -[VCMediaStreamRateControlConfig setMediaQueueThrottlingInterval:](v10, "setMediaQueueThrottlingInterval:", v16);
  return v10;
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3
{
  return 1;
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  VCNetworkFeedbackController *networkFeedbackController;
  int ErrorLogLevelForModule;
  uint64_t v20;
  NSObject *v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE buf[12];
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
  {
    *(_QWORD *)buf = 0;
    v6 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", 1, 1, 0, 0);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v23)
    {
      v7 = 0;
      v25 = *(_QWORD *)v36;
      while (2)
      {
        v8 = 0;
        do
        {
          v24 = v7;
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(a4);
          v26 = v8;
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
          v10 = (void *)objc_msgSend(v9, "stream");
          objc_msgSend(v10, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
          v28 = v10;
          objc_msgSend(v10, "setOperatingMode:", 6);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v27 = v9;
          v11 = (void *)objc_msgSend(v9, "streamConfigs");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v31 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne"))
                {
                  v17 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", 1, 1, objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "streamGroupID") == 1667329381, 1);
                  if (!v17)
                  {
                    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                    if (ErrorLogLevelForModule < 3)
                    {
                      v7 = v24;
                    }
                    else
                    {
                      VRTraceErrorLogLevelToCSTR();
                      v7 = v24;
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:].cold.2();
                    }
                    goto LABEL_37;
                  }
                }
                else
                {
                  v17 = v6;
                }
                objc_msgSend(v16, "setRateControlConfig:", v17);

                if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne"))
                  networkFeedbackController = self->_networkFeedbackController;
                else
                  networkFeedbackController = 0;
                objc_msgSend(v16, "setNetworkFeedbackController:", networkFeedbackController);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
              if (v13)
                continue;
              break;
            }
          }
          if ((objc_msgSend(v28, "setStreamConfig:withError:", objc_msgSend(v27, "streamConfigs"), buf) & 1) == 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:].cold.1();
            }
            goto LABEL_36;
          }
          v8 = v26 + 1;
          v7 = 1;
        }
        while (v26 + 1 != v23);
        v23 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
        if (v23)
          continue;
        break;
      }
    }
    else
    {
LABEL_36:
      v7 = 0;
    }
LABEL_37:

  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v20;
        v40 = 2080;
        v41 = "-[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:]";
        v42 = 1024;
        v43 = 1694;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d There are no video streams to configure, bypassing configuration", buf, 0x1Cu);
      }
    }
    return 1;
  }
  return v7;
}

- (BOOL)configureOneToOneWithConfig:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  _BOOL4 v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  _BYTE v19[24];
  __int128 v20;
  VCSessionParticipant *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 136316674;
        *(_QWORD *)&v19[4] = v6;
        *(_WORD *)&v19[12] = 2080;
        *(_QWORD *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
        *(_WORD *)&v19[22] = 1024;
        LODWORD(v20) = 1731;
        WORD2(v20) = 1024;
        *(_DWORD *)((char *)&v20 + 6) = objc_msgSend(a3, "deviceRole");
        WORD5(v20) = 1024;
        HIDWORD(v20) = objc_msgSend(a3, "negotiatedVideoEnabled");
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = objc_msgSend(a3, "negotiatedScreenEnabled");
        HIWORD(v21) = 1024;
        LODWORD(v22) = objc_msgSend(a3, "operatingMode");
        v8 = " [%s] %s:%d deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        v9 = v7;
        v10 = 52;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v19, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 136317186;
        *(_QWORD *)&v19[4] = v11;
        *(_WORD *)&v19[12] = 2080;
        *(_QWORD *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
        *(_WORD *)&v19[22] = 1024;
        LODWORD(v20) = 1731;
        WORD2(v20) = 2112;
        *(_QWORD *)((char *)&v20 + 6) = v5;
        HIWORD(v20) = 2048;
        v21 = self;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = objc_msgSend(a3, "deviceRole");
        HIWORD(v22) = 1024;
        LODWORD(v23) = objc_msgSend(a3, "negotiatedVideoEnabled");
        WORD2(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 6) = objc_msgSend(a3, "negotiatedScreenEnabled");
        WORD5(v23) = 1024;
        HIDWORD(v23) = objc_msgSend(a3, "operatingMode");
        v8 = " [%s] %s:%d %@(%p) deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        v9 = v12;
        v10 = 72;
        goto LABEL_11;
      }
    }
  }
  v13 = -[VCAudioIO state](self->_audioIO, "state", *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23, v24);
  if (v13 == 2)
    -[VCAudioIO stop](self->_audioIO, "stop");
  if (-[VCSessionParticipant configureAudioIOWithDeviceRole:operatingMode:](self, "configureAudioIOWithDeviceRole:operatingMode:", objc_msgSend(a3, "deviceRole"), objc_msgSend(a3, "operatingMode")))
  {
    if (-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:](self, "configureOneToOneAudioStreamsWithDeviceRole:", objc_msgSend(a3, "deviceRole")))
    {
      if (v13 == 2)
        -[VCAudioIO start](self->_audioIO, "start");
      if (!objc_msgSend(a3, "negotiatedVideoEnabled")
        || -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:](self, "configureOneToOneVideoStreamsWithDeviceRole:", objc_msgSend(a3, "deviceRole")))
      {
        self->_deviceRole = objc_msgSend(a3, "deviceRole");
        LOBYTE(v14) = 1;
        return v14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v14)
          return v14;
        -[VCSessionParticipant configureOneToOneWithConfig:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCSessionParticipant configureOneToOneWithConfig:].cold.2();
    }
  }
  else if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCSessionParticipant configureOneToOneWithConfig:].cold.3();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      *(_DWORD *)v19 = 136316162;
      *(_QWORD *)&v19[4] = v16;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 1737;
      WORD2(v20) = 2112;
      *(_QWORD *)((char *)&v20 + 6) = v15;
      HIWORD(v20) = 2048;
      v21 = self;
      _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring audioIO", v19, 0x30u);
    }
  }
  LOBYTE(v14) = 0;
  return v14;
}

- (BOOL)configureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6
{
  NSObject *participantQueue;
  char v7;
  _QWORD block[6];
  int v10;
  int v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke;
  block[3] = &unk_1E9E58D20;
  block[4] = self;
  block[5] = &v14;
  v12 = a4;
  v13 = a5;
  v10 = a3;
  v11 = a6;
  dispatch_sync(participantQueue, block);
  v7 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned int *)(a1 + 52));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 32);
          v6 = 136316162;
          v7 = v3;
          v8 = 2080;
          v9 = "-[VCSessionParticipant configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMo"
               "de:]_block_invoke";
          v10 = 1024;
          v11 = 1763;
          v12 = 2112;
          v13 = v2;
          v14 = 2048;
          v15 = v5;
          _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fail configure participant", (uint8_t *)&v6, 0x30u);
        }
      }
    }
  }
}

- (BOOL)dispatchedConfigureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  VCSessionParticipantOneToOneConfig *v19;
  VCSessionParticipantOneToOneConfig *v20;
  BOOL v21;
  NSMutableArray *micStreamGroups;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[10];
  VCSessionParticipant *v45;
  _BYTE v46[6];
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v53 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v38 = v12;
        v39 = 2080;
        v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
        v41 = 1024;
        v42 = 1774;
        v43 = 1024;
        *(_DWORD *)v44 = v9;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v8;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v7;
        HIWORD(v45) = 1024;
        *(_DWORD *)v46 = v6;
        v14 = " [%s] %s:%d deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        v15 = v13;
        v16 = 52;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v38 = v17;
        v39 = 2080;
        v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
        v41 = 1024;
        v42 = 1774;
        v43 = 2112;
        *(_QWORD *)v44 = v11;
        *(_WORD *)&v44[8] = 2048;
        v45 = self;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v9;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v7;
        v51 = 1024;
        v52 = v6;
        v14 = " [%s] %s:%d %@(%p) deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        v15 = v18;
        v16 = 72;
        goto LABEL_11;
      }
    }
  }
  v19 = objc_alloc_init(VCSessionParticipantOneToOneConfig);
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:].cold.1();
    }
    goto LABEL_34;
  }
  v20 = v19;
  -[VCSessionParticipantOneToOneConfig setDeviceRole:](v19, "setDeviceRole:", v9);
  -[VCSessionParticipantOneToOneConfig setNegotiatedVideoEnabled:](v20, "setNegotiatedVideoEnabled:", v8);
  -[VCSessionParticipantOneToOneConfig setNegotiatedScreenEnabled:](v20, "setNegotiatedScreenEnabled:", v7);
  -[VCSessionParticipantOneToOneConfig setOperatingMode:](v20, "setOperatingMode:", v6);
  v21 = -[VCSessionParticipant configureOneToOneWithConfig:](self, "configureOneToOneWithConfig:", v20);

  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:].cold.3();
    }
    goto LABEL_34;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  micStreamGroups = self->_micStreamGroups;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (!v23)
  {
LABEL_22:
    LOBYTE(v27) = -[VCSessionParticipant configureMultiwayStreamGroups](self, "configureMultiwayStreamGroups");
    self->_deviceRole = v9;
    return v27;
  }
  v24 = v23;
  v25 = *(_QWORD *)v34;
LABEL_16:
  v26 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v25)
      objc_enumerationMutation(micStreamGroups);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "setDeviceRole:operatingMode:", v9, v6) & 1) == 0)
      break;
    if (v24 == ++v26)
    {
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      if (v24)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
  if ((VCSessionParticipant *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v27)
        return v27;
      *(_DWORD *)buf = 136316162;
      v38 = v29;
      v39 = 2080;
      v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
      v41 = 1024;
      v42 = 1787;
      v43 = 2112;
      *(_QWORD *)v44 = v28;
      *(_WORD *)&v44[8] = 2048;
      v45 = self;
      _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error setting device role on stream group", buf, 0x30u);
    }
LABEL_34:
    LOBYTE(v27) = 0;
    return v27;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_34;
  VRTraceErrorLogLevelToCSTR();
  v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v27)
  {
    -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:].cold.2();
    goto LABEL_34;
  }
  return v27;
}

- (BOOL)configureStreamInfosForMultiway:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v6;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  VCNetworkFeedbackController *networkFeedbackController;
  uint64_t v20;
  _BOOL4 v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VCSessionParticipant *v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a4 == 1718909044 || a4 == 1937339233 || a4 == 1935897189)
    v6 = 2;
  else
    v6 = 1;
  v48 = 0u;
  v49 = 0u;
  v8 = a4 == 1667329381 || a4 == 1835623282;
  v46 = 0uLL;
  v47 = 0uLL;
  v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
  if (v26)
  {
    v28 = *(_QWORD *)v47;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(a3);
        v29 = v9;
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
        objc_msgSend((id)objc_msgSend(v10, "stream"), "setOperatingMode:", 6);
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v11 = (void *)objc_msgSend(v10, "streamConfigs");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v42;
LABEL_19:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v15);
            if (a4 == 1937339233 || a4 == 1835623282)
              v17 = -[VCSessionParticipant newAudioRateControlConfigWithMediaControlInfoVersion:enableFeedbackController:isOneToOne:](self, "newAudioRateControlConfigWithMediaControlInfoVersion:enableFeedbackController:isOneToOne:", v6, v8, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v15), "multiwayConfig"), "isOneToOne"));
            else
              v17 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", v6, a4 != 1667329399, v8, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v15), "multiwayConfig"), "isOneToOne"));
            v18 = v17;
            if (!v17)
              break;
            objc_msgSend(v16, "setRateControlConfig:", v17);

            if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne"))
              networkFeedbackController = self->_networkFeedbackController;
            else
              networkFeedbackController = 0;
            objc_msgSend(v16, "setNetworkFeedbackController:", networkFeedbackController);
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
              if (v13)
                goto LABEL_19;
              goto LABEL_32;
            }
          }
          if ((VCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v21)
                return v21;
              -[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:].cold.1();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v22 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v22 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *MEMORY[0x1E0CF2758];
              v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v21)
                return v21;
              *(_DWORD *)buf = 136316162;
              v31 = v23;
              v32 = 2080;
              v33 = "-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:]";
              v34 = 1024;
              v35 = 1812;
              v36 = 2112;
              v37 = v22;
              v38 = 2048;
              v39 = self;
              _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", buf, 0x30u);
            }
          }
          LOBYTE(v21) = 0;
          return v21;
        }
LABEL_32:
        v9 = v29 + 1;
      }
      while (v29 + 1 != v26);
      v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
      LOBYTE(v21) = 1;
      v26 = v20;
      if (v20)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (BOOL)configureMultiwayStreamGroups
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_streamGroups, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(v8, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
        if (!-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:](self, "configureStreamInfosForMultiway:streamGroupID:", objc_msgSend(v8, "mediaStreamInfoArray"), objc_msgSend(v8, "streamGroupID")))break;
        if ((objc_msgSend(v8, "configureStreams") & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v9)
              return v9;
            -[VCSessionParticipant configureMultiwayStreamGroups].cold.1();
          }
          goto LABEL_19;
        }
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v9)
          return v9;
        -[VCSessionParticipant configureMultiwayStreamGroups].cold.2();
      }
LABEL_19:
      LOBYTE(v9) = 0;
      return v9;
    }
  }
LABEL_11:
  LOBYTE(v9) = 1;
  return v9;
}

- (VCSessionParticipant)initWithConfig:(id)a3 delegate:(id)a4
{
  VCSessionParticipant *v6;
  NSObject *CustomRootQueue;
  VCNetworkFeedbackController *networkFeedbackController;
  VCNetworkFeedbackController *v9;
  VCAudioRuleCollection *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  VCSessionMediaTypeSettings *v18;
  VCSessionMediaTypeSettings *v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  objc_super v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  VCSessionParticipant *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)VCSessionParticipant;
  v6 = -[VCObject init](&v33, sel_init);
  if (!v6)
    return v6;
  if (!objc_msgSend(a3, "idsDestination"))
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant initWithConfig:delegate:].cold.1();
      }
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_46;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    v26 = objc_msgSend((id)objc_msgSend(a3, "idsDestination"), "UTF8String");
    *(_DWORD *)buf = 136316418;
    v35 = v24;
    v36 = 2080;
    v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    v38 = 1024;
    v39 = 1843;
    v40 = 2112;
    v41 = v21;
    v42 = 2048;
    v43 = v6;
    v44 = 2080;
    v45 = v26;
    v27 = " [%s] %s:%d %@(%p) Unable to initialize participant. Destination=%s ";
    v28 = v25;
    v29 = 58;
LABEL_49:
    _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_46;
  }
  objc_storeWeak(&v6->_delegate, a4);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v6->_participantQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionParticipant.participantQueue", 0, CustomRootQueue);
  v6->_state = 0;
  v6->_volume = 1.0;
  v6->_audioPosition = 0.0;
  v6->_streamGroups = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6->_micStreamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6->_videoStreamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6->_isLowLatencyAudio = objc_msgSend(a3, "isLowLatencyAudio");
  v6->_transportSessionID = objc_msgSend(a3, "transportSessionID");
  v6->_captionsCoordinator = (VCAudioCaptionsCoordinator *)(id)objc_msgSend(a3, "captionsCoordinator");
  networkFeedbackController = v6->_networkFeedbackController;
  v9 = (VCNetworkFeedbackController *)objc_msgSend(a3, "networkFeedbackController");
  v6->_networkFeedbackController = v9;
  if (v9)
    CFRetain(v9);
  if (networkFeedbackController)
    CFRelease(networkFeedbackController);
  -[VCSessionParticipant setupPreferredIOSettings](v6, "setupPreferredIOSettings");
  v10 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:]([VCAudioRuleCollection alloc], "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:", 0, 1, 0, 480, v6->_isLowLatencyAudio);
  v6->_supportedAudioRules = v10;
  if (!v10)
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant initWithConfig:delegate:].cold.2();
      }
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_46;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v35 = v30;
    v36 = 2080;
    v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    v38 = 1024;
    v39 = 1866;
    v40 = 2112;
    v41 = v22;
    v42 = 2048;
    v43 = v6;
    v27 = " [%s] %s:%d %@(%p) Failed to create the list of supported audio rules";
LABEL_48:
    v28 = v31;
    v29 = 48;
    goto LABEL_49;
  }
  -[VCAudioRuleCollection setIsHigherAudioREDCutoverU1Enabled:](v6->_supportedAudioRules, "setIsHigherAudioREDCutoverU1Enabled:", objc_msgSend(a3, "isHigherAudioREDCutoverU1Enabled"));
  v6->_processId = objc_msgSend(a3, "processId");
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v6->_participantStreamTokens = (NSMutableDictionary *)v11;
  if (!v11)
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant initWithConfig:delegate:].cold.3();
      }
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v32 = VRTraceErrorLogLevelToCSTR(),
          v31 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_46:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v35 = v32;
    v36 = 2080;
    v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    v38 = 1024;
    v39 = 1875;
    v40 = 2112;
    v41 = v23;
    v42 = 2048;
    v43 = v6;
    v27 = " [%s] %s:%d %@(%p) Failed to create the participant stream token dictionary";
    goto LABEL_48;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_participantStreamTokens, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", VCUniqueIDGenerator_GenerateID()), &unk_1E9EF7688);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF7688);
      *(_DWORD *)buf = 136316162;
      v35 = v12;
      v36 = 2080;
      v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
      v38 = 1024;
      v39 = 1878;
      v40 = 2048;
      v41 = (const __CFString *)v6;
      v42 = 2112;
      v43 = (VCSessionParticipant *)v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) Generated video stream token=%@", buf, 0x30u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_participantStreamTokens, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", VCUniqueIDGenerator_GenerateID()), &unk_1E9EF7670);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF7670);
      *(_DWORD *)buf = 136316162;
      v35 = v15;
      v36 = 2080;
      v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
      v38 = 1024;
      v39 = 1880;
      v40 = 2048;
      v41 = (const __CFString *)v6;
      v42 = 2112;
      v43 = (VCSessionParticipant *)v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) Generated audio stream token=%@", buf, 0x30u);
    }
  }
  v6->_idsDestination = (NSString *)(id)objc_msgSend(a3, "idsDestination");
  v6->_sessionUUID = (NSString *)(id)objc_msgSend(a3, "sessionUUID");
  v6->_audioEnabled = 1;
  v6->_videoEnabled = objc_msgSend(a3, "videoEnabled");
  v6->_videoPaused = objc_msgSend(a3, "videoPaused");
  v6->_participantMKMRecoveryTimeout = (double)+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval](GKSConnectivitySettings, "getDecryptionMKMRecoveryInterval");
  v6->_decryptionTimeOutInterval = +[GKSConnectivitySettings getDecryptionTimeoutInterval](GKSConnectivitySettings, "getDecryptionTimeoutInterval");
  -[VCSessionParticipant updateAudioSpectrumState](v6, "updateAudioSpectrumState");
  v6->_securityKeyManager = (VCSecurityKeyManager *)(id)objc_msgSend(a3, "securityKeyManager");
  v6->_mediaTypeSettingsDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", 1);
  -[VCSessionMediaTypeSettings setMediaState:](v18, "setMediaState:", v6->_videoEnabled);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_mediaTypeSettingsDict, "setObject:forKeyedSubscript:", v18, &unk_1E9EF7718);
  v19 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", 0);
  -[VCSessionMediaTypeSettings setMediaState:](v19, "setMediaState:", 1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_mediaTypeSettingsDict, "setObject:forKeyedSubscript:", v19, &unk_1E9EF7730);
  v6->_mediaTypeMixingList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6->_mediaTypeMixingListLock._os_unfair_lock_opaque = 0;
  return v6;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  tagVCMediaQueue *mediaQueue;
  NSObject *participantQueue;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  NSString *p_isa;
  __int16 v22;
  VCSessionParticipant *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCSessionParticipant dealloc]";
        v18 = 1024;
        v19 = 1913;
        v20 = 2112;
        p_isa = -[VCSessionParticipant description](self, "description");
        v6 = " [%s] %s:%d Participant dealloc %@";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCSessionParticipant dealloc]";
        v18 = 1024;
        v19 = 1913;
        v20 = 2112;
        p_isa = &v3->isa;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = -[VCSessionParticipant description](self, "description");
        v6 = " [%s] %s:%d %@(%p) Participant dealloc %@";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }

  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
    CFRelease(mediaQueue);

  -[NSMutableDictionary removeAllObjects](self->_mediaTypeMixingList, "removeAllObjects");
  participantQueue = self->_participantQueue;
  if (participantQueue)
    dispatch_release(participantQueue);
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_streamDelegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);
  v13.receiver = self;
  v13.super_class = (Class)VCSessionParticipant;
  -[VCObject dealloc](&v13, sel_dealloc);
}

- (BOOL)updateMediaStatesWithConfig:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  VCSessionMediaTypeSettings *v11;
  uint64_t v12;
  VCSessionMediaTypeSettings *v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  VCSessionMediaTypeSettings *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  NSMutableDictionary *mediaTypeSettingsDict;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  NSMutableDictionary *v33;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  NSObject *v45;
  BOOL v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  char *obja;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  VCSessionParticipant *v71;
  __int16 v72;
  __CFString *v73;
  _BYTE v74[128];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "mediaStates"))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = (id)objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "allKeys");
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v76;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v76 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "unsignedIntValue");
          v11 = (VCSessionMediaTypeSettings *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", v9);
          v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "objectForKeyedSubscript:", v9), "unsignedIntValue");
          if (!v11)
          {
            v13 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", objc_msgSend(v9, "unsignedIntValue"));
            if (!v13)
            {
              if ((VCSessionParticipant *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCSessionParticipant updateMediaStatesWithConfig:].cold.1();
                }
              }
              else
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v35 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
                else
                  v35 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v36 = VRTraceErrorLogLevelToCSTR();
                  v37 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    v63 = v36;
                    v64 = 2080;
                    v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
                    v66 = 1024;
                    v67 = 1960;
                    v68 = 2112;
                    v69 = (void *)v35;
                    v70 = 2048;
                    v71 = self;
                    v72 = 2112;
                    v73 = VCSessionMediaType_Name(v10);
                    _os_log_error_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the media type settings for mediaType=%@", buf, 0x3Au);
                  }
                }
              }
              v46 = 0;
              goto LABEL_13;
            }
            v11 = v13;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeSettingsDict, "setObject:forKeyedSubscript:", v13, v9);
          }
          -[VCSessionMediaTypeSettings setMediaState:](v11, "setMediaState:", v12);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_12;
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 136315650;
      v63 = v39;
      v64 = 2080;
      v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
      v66 = 1024;
      v67 = 1953;
      v41 = " [%s] %s:%d Media state data dictionary is nil";
      v42 = v40;
      v43 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v38 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v38 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_12;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 136316162;
      v63 = v44;
      v64 = 2080;
      v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
      v66 = 1024;
      v67 = 1953;
      v68 = 2112;
      v69 = (void *)v38;
      v70 = 2048;
      v71 = self;
      v41 = " [%s] %s:%d %@(%p) Media state data dictionary is nil";
      v42 = v45;
      v43 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
  }
LABEL_12:
  v46 = 1;
LABEL_13:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v47 = (id)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v59;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v59 != v48)
          objc_enumerationMutation(v47);
        obja = v14;
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v14);
        v16 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", objc_msgSend(v15, "streamGroupID"));
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v54 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              v22 = objc_msgSend(v21, "unsignedIntValue");
              v23 = (VCSessionMediaTypeSettings *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", v21);
              if (!v23)
              {
                v23 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", v22);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeSettingsDict, "setObject:forKeyedSubscript:", v23, v21);
              }
              -[VCSessionMediaTypeSettings addStreamGroupID:](v23, "addStreamGroupID:", objc_msgSend(v15, "streamGroupID"));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
          }
          while (v18);
        }
        ++v14;
      }
      while (obja + 1 != (char *)v49);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
    }
    while (v49);
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        mediaTypeSettingsDict = self->_mediaTypeSettingsDict;
        *(_DWORD *)buf = 136315906;
        v63 = v25;
        v64 = 2080;
        v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
        v66 = 1024;
        v67 = 1978;
        v68 = 2112;
        v69 = mediaTypeSettingsDict;
        v28 = " [%s] %s:%d _mediaTypeSettingsDict=%@";
        v29 = v26;
        v30 = 38;
LABEL_39:
        _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_mediaTypeSettingsDict;
        *(_DWORD *)buf = 136316418;
        v63 = v31;
        v64 = 2080;
        v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
        v66 = 1024;
        v67 = 1978;
        v68 = 2112;
        v69 = (void *)v24;
        v70 = 2048;
        v71 = self;
        v72 = 2112;
        v73 = (__CFString *)v33;
        v28 = " [%s] %s:%d %@(%p) _mediaTypeSettingsDict=%@";
        v29 = v32;
        v30 = 58;
        goto LABEL_39;
      }
    }
  }
  return v46;
}

- (void)setupMediaTypeSettingsWithConfig:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  VCSessionMediaTypeSettings *v13;
  void *v14;
  uint64_t videoEnabled;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  __CFString *v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v47;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(obj);
        v25 = v4;
        v5 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v4);
        v6 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", objc_msgSend(v5, "streamGroupID"));
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v26 = v6;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v42;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v42 != v9)
                objc_enumerationMutation(v26);
              v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
              v12 = objc_msgSend(v11, "unsignedIntValue");
              v13 = (VCSessionMediaTypeSettings *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", v11);
              if (!v13)
              {
                v13 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", v12);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeSettingsDict, "setObject:forKeyedSubscript:", v13, v11);
              }
              -[VCSessionMediaTypeSettings addStreamGroupID:](v13, "addStreamGroupID:", objc_msgSend(v5, "streamGroupID"));
              v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "objectForKeyedSubscript:", v11);
              if (v14)
              {
                videoEnabled = objc_msgSend(v14, "unsignedIntValue");
              }
              else if ((_DWORD)v12)
              {
                if ((_DWORD)v12 != 1)
                  goto LABEL_16;
                videoEnabled = self->_videoEnabled;
              }
              else
              {
                videoEnabled = 1;
              }
              -[VCSessionMediaTypeSettings setMediaState:](v13, "setMediaState:", videoEnabled);
LABEL_16:
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v16 = VRTraceErrorLogLevelToCSTR();
                v17 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v18 = FourccToCStr(objc_msgSend(v5, "streamGroupID"));
                  v19 = VCSessionMediaType_Name(v12);
                  v20 = VCSessionMediaState_Name(-[VCSessionMediaTypeSettings mediaState](v13, "mediaState"));
                  *(_DWORD *)buf = 136316418;
                  v29 = v16;
                  v30 = 2080;
                  v31 = "-[VCSessionParticipant setupMediaTypeSettingsWithConfig:]";
                  v32 = 1024;
                  v33 = 2002;
                  v34 = 2080;
                  v35 = v18;
                  v36 = 2112;
                  v37 = v19;
                  v38 = 2112;
                  v39 = v20;
                  _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding streamGroupID=%s for mediaType=%@ mediaState=%@", buf, 0x3Au);
                }
              }
              ++v10;
            }
            while (v8 != v10);
            v21 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
            v8 = v21;
          }
          while (v21);
        }
        v4 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
    }
    while (v24);
  }
}

- (void)setupPreferredIOSettings
{
  uint64_t v3;
  double DoubleValueForKey;
  unsigned int IntValueForKey;

  if (self->_isLowLatencyAudio)
    v3 = 48000;
  else
    v3 = 24000;
  DoubleValueForKey = VCDefaults_GetDoubleValueForKey(CFSTR("forceAudioBlockSize"), dbl_1D9110CB0[!self->_isLowLatencyAudio]);
  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceAudioSampleRate"), v3);
  self->_preferredIOSampleRate = IntValueForKey;
  self->_preferredIOSamplesPerFrame = (DoubleValueForKey * (double)IntValueForKey);
}

- (unsigned)preferredRTPTimestampRateForGroupID:(unsigned int)a3
{
  unsigned int result;
  int v4;

  result = 48000;
  if ((int)a3 > 1935897188)
  {
    if (a3 == 1935897189)
      return result;
    v4 = 1937339233;
  }
  else
  {
    if (a3 == 1650745716)
      return result;
    v4 = 1718909044;
  }
  if (a3 != v4)
    return 24000;
  return result;
}

- (unsigned)preferredIOSampleRateForGroupID:(unsigned int)a3
{
  uint64_t v3;

  v3 = 48000;
  if (a3 != 1935897189 && a3 != 1937339233)
  {
    if (self->_isLowLatencyAudio)
      v3 = 48000;
    else
      v3 = 24000;
  }
  return VCDefaults_GetIntValueForKey(CFSTR("forceAudioSampleRate"), v3);
}

- (unsigned)preferredIOSamplesPerFrameForGroupID:(unsigned int)a3
{
  unsigned int v5;
  double v6;

  v5 = -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:");
  v6 = 0.02;
  if (a3 != 1935897189 && a3 != 1937339233)
    v6 = dbl_1D9110CB0[!self->_isLowLatencyAudio];
  return (VCDefaults_GetDoubleValueForKey(CFSTR("forceAudioBlockSize"), v6) * (double)v5);
}

- (BOOL)setState:(unsigned int)a3
{
  uint64_t v3;
  unsigned int state;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v9 = -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", self->_state);
      v17 = 136316162;
      v18 = v7;
      v19 = 2080;
      v20 = "-[VCSessionParticipant setState:]";
      v21 = 1024;
      v22 = 2088;
      v23 = 2080;
      v24 = v9;
      v25 = 2080;
      v26 = -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", v3);
      v10 = " [%s] %s:%d Exiting state participant %s. Entering state participant %s.";
      v11 = v8;
      v12 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v15 = -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", self->_state);
      v17 = 136316674;
      v18 = v13;
      v19 = 2080;
      v20 = "-[VCSessionParticipant setState:]";
      v21 = 1024;
      v22 = 2088;
      v23 = 2112;
      v24 = (void *)v6;
      v25 = 2048;
      v26 = (char *)self;
      v27 = 2080;
      v28 = v15;
      v29 = 2080;
      v30 = -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", v3);
      v10 = " [%s] %s:%d %@(%p) Exiting state participant %s. Entering state participant %s.";
      v11 = v14;
      v12 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
LABEL_13:
    self->_state = v3;
  }
  return state != (_DWORD)v3;
}

- (char)participantStateToString:(unsigned int)a3
{
  if (a3)
    return "Running";
  else
    return "Stopped";
}

- (VCSessionParticipantDelegate)delegate
{
  return (VCSessionParticipantDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCSessionParticipantStreamDelegate)streamDelegate
{
  return (VCSessionParticipantStreamDelegate *)objc_loadWeak(&self->_streamDelegate);
}

- (void)setStreamDelegate:(id)a3
{
  objc_storeWeak(&self->_streamDelegate, a3);
}

- (void)start
{
  NSObject *participantQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipant participantVideoToken](self, "participantVideoToken");
  kdebug_trace();
  participantQueue = self->_participantQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__VCSessionParticipant_start__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(participantQueue, v4);
}

uint64_t __29__VCSessionParticipant_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStart");
}

- (void)stop
{
  NSObject *participantQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipant participantVideoToken](self, "participantVideoToken");
  kdebug_trace();
  participantQueue = self->_participantQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__VCSessionParticipant_stop__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(participantQueue, v4);
}

uint64_t __28__VCSessionParticipant_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStop");
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant applyVideoEnabledSetting:]"), 0));
}

- (void)applyScreenEnabledSetting:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCSessionParticipant *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCSessionParticipant applyScreenEnabledSetting:]";
        v17 = 1024;
        v18 = 2135;
        v19 = 1024;
        LODWORD(v20) = v3;
        v8 = " [%s] %s:%d Changing participant screenEnabled to %d";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCSessionParticipant applyScreenEnabledSetting:]";
        v17 = 1024;
        v18 = 2135;
        v19 = 2112;
        v20 = v5;
        v21 = 2048;
        v22 = self;
        v23 = 1024;
        v24 = v3;
        v8 = " [%s] %s:%d %@(%p) Changing participant screenEnabled to %d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_screenEnabled = v3;
}

- (id)streamGroupsForMediaType:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCSessionParticipant *v35;
  __int16 v36;
  const __CFString *v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v3 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = (void *)objc_msgSend(v6, "streamGroupIDs");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v40;
    *(_QWORD *)&v9 = 136315906;
    v25 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v7);
        v13 = *(const __CFString **)(*((_QWORD *)&v39 + 1) + 8 * v12);
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", v13, v25);
        if (v14)
        {
          objc_msgSend(v5, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](self->_streamGroups, "objectForKeyedSubscript:", v14));
          goto LABEL_8;
        }
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v21 = VRTraceErrorLogLevelToCSTR();
            v22 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              v27 = v21;
              v28 = 2080;
              v29 = "-[VCSessionParticipant streamGroupsForMediaType:]";
              v30 = 1024;
              v31 = 2145;
              v32 = 2112;
              v33 = v13;
              v18 = v22;
              v19 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              v20 = 38;
              goto LABEL_19;
            }
          }
        }
        else
        {
          v15 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v15 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v27 = v16;
              v28 = 2080;
              v29 = "-[VCSessionParticipant streamGroupsForMediaType:]";
              v30 = 1024;
              v31 = 2145;
              v32 = 2112;
              v33 = v15;
              v34 = 2048;
              v35 = self;
              v36 = 2112;
              v37 = v13;
              v18 = v17;
              v19 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              v20 = 58;
LABEL_19:
              _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
            }
          }
        }
LABEL_8:
        ++v12;
      }
      while (v10 != v12);
      v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      v10 = v23;
    }
    while (v23);
  }
  return v5;
}

- (id)streamGroupsForIDs:(id)a3
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCSessionParticipant *v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 136315906;
    v23 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(a3);
        v10 = *(const __CFString **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", v10, v23);
        if (v11)
        {
          v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamGroups, "objectForKeyedSubscript:", v11);
          if (v12)
            objc_msgSend(v24, "addObject:", v12);
        }
        else if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v19 = VRTraceErrorLogLevelToCSTR();
            v20 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v26 = v19;
              v27 = 2080;
              v28 = "-[VCSessionParticipant streamGroupsForIDs:]";
              v29 = 1024;
              v30 = 2158;
              v31 = 2112;
              v32 = v10;
              v16 = v20;
              v17 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              v18 = 38;
              goto LABEL_20;
            }
          }
        }
        else
        {
          v13 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v13 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v26 = v14;
              v27 = 2080;
              v28 = "-[VCSessionParticipant streamGroupsForIDs:]";
              v29 = 1024;
              v30 = 2158;
              v31 = 2112;
              v32 = v13;
              v33 = 2048;
              v34 = self;
              v35 = 2112;
              v36 = v10;
              v16 = v15;
              v17 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              v18 = 58;
LABEL_20:
              _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      v7 = v21;
    }
    while (v21);
  }
  return v24;
}

- (id)completeMediaStateChange
{
  -[VCSessionParticipant updateAudioSpectrumState](self, "updateAudioSpectrumState");
  return 0;
}

- (id)applyMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  VCSessionParticipant *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  uint32_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v62;
  NSObject *v63;
  uint32_t v64;
  const __CFString *v65;
  uint64_t v66;
  NSObject *v67;
  __CFString *v68;
  __CFString *v69;
  uint64_t v70;
  NSObject *v71;
  __CFString *v72;
  uint64_t v73;
  NSObject *v74;
  __CFString *v75;
  uint64_t v76;
  NSObject *v77;
  __CFString *v78;
  __CFString *v79;
  unsigned int v80;
  unsigned int v81;
  id obj;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  VCSessionParticipant *v86;
  _BYTE v87[128];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  const __CFString *v99;
  __int16 v100;
  VCSessionParticipant *v101;
  __int16 v102;
  __CFString *v103;
  __int16 v104;
  __CFString *v105;
  __int16 v106;
  __CFString *v107;
  _BYTE v108[128];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;

  v4 = *(_QWORD *)&a4;
  v6 = self;
  v123 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
  if (!v7)
  {
    v56 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 2180));
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant applyMediaState:forMediaType:].cold.1();
      }
      return v56;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v58 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
    else
      v58 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v56;
    v59 = VRTraceErrorLogLevelToCSTR();
    v60 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v56;
    *(_DWORD *)buf = 136316418;
    v93 = v59;
    v94 = 2080;
    v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
    v96 = 1024;
    v97 = 2181;
    v98 = 2112;
    v99 = v58;
    v100 = 2048;
    v101 = v6;
    v102 = 2112;
    v103 = VCSessionMediaType_Name(v4);
    v62 = " [%s] %s:%d %@(%p) mediaTypeSettings is missing for mediaType=%@";
    v63 = v60;
LABEL_85:
    v64 = 58;
    goto LABEL_86;
  }
  v8 = v7;
  v81 = a3;
  v9 = (void *)objc_msgSend(v7, "streamGroupIDs");
  v86 = v6;
  v80 = v4;
  if (-[VCSessionParticipant isActiveMediaType:](v6, "isActiveMediaType:", v4) && v6->_state == 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v9);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v9);
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = (id)-[NSMutableDictionary allValues](v6->_mediaTypeSettingsDict, "allValues");
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v118, 16);
    if (v85)
    {
      v83 = *(_QWORD *)v120;
      v84 = v8;
      do
      {
        for (i = 0; i != v85; ++i)
        {
          if (*(_QWORD *)v120 != v83)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
          if (v13 != v8)
          {
            v14 = -[VCSessionParticipant isActiveMediaType:](v86, "isActiveMediaType:", objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "mediaType"))&& v86->_state == 1;
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v15 = (void *)objc_msgSend(v13, "streamGroupIDs");
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v114, v113, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v115;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v115 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
                  if ((objc_msgSend(v9, "containsObject:", v20) & v14) == 1)
                  {
                    objc_msgSend(v10, "addObject:", v20);
                    objc_msgSend(v11, "removeObject:", v20);
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v114, v113, 16);
              }
              while (v17);
            }
          }
          v8 = v84;
        }
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v118, 16);
      }
      while (v85);
      v6 = v86;
    }
  }
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v10, "count"));
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v22 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v109, v108, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v110;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v110 != v24)
          objc_enumerationMutation(v10);
        v26 = *(__CFString **)(*((_QWORD *)&v109 + 1) + 8 * v25);
        v27 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_participantStreamTokens, "objectForKeyedSubscript:", v26);
        if (v27)
        {
          objc_msgSend(v21, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](v6->_streamGroups, "objectForKeyedSubscript:", v27));
          goto LABEL_33;
        }
        if ((VCSessionParticipant *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v34 = VRTraceErrorLogLevelToCSTR();
            v35 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v93 = v34;
              v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              v96 = 1024;
              v97 = 2211;
              v98 = 2112;
              v99 = v26;
              v31 = v35;
              v32 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              v33 = 38;
              goto LABEL_44;
            }
          }
        }
        else
        {
          v28 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v28 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v29 = VRTraceErrorLogLevelToCSTR();
            v30 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v93 = v29;
              v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              v96 = 1024;
              v97 = 2211;
              v98 = 2112;
              v99 = v28;
              v100 = 2048;
              v101 = v86;
              v102 = 2112;
              v103 = v26;
              v31 = v30;
              v32 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              v33 = 58;
LABEL_44:
              _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
            }
          }
        }
LABEL_33:
        ++v25;
        v6 = v86;
      }
      while (v23 != v25);
      v36 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v109, v108, 16);
      v23 = v36;
    }
    while (v36);
  }
  v37 = objc_msgSend(v21, "count");
  v38 = v81;
  if (!v37
    || (v39 = -[VCSessionParticipant updateMediaState:forStreamGroups:](v6, "updateMediaState:forStreamGroups:", v81, v21)) == 0)
  {
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count", v38));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v41 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
    if (!v41)
      goto LABEL_68;
    v42 = v41;
    v43 = *(_QWORD *)v89;
    while (1)
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v89 != v43)
          objc_enumerationMutation(v11);
        v45 = *(__CFString **)(*((_QWORD *)&v88 + 1) + 8 * v44);
        v46 = -[NSMutableDictionary objectForKeyedSubscript:](v6->_participantStreamTokens, "objectForKeyedSubscript:", v45);
        if (v46)
        {
          objc_msgSend(v40, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](v6->_streamGroups, "objectForKeyedSubscript:", v46));
          goto LABEL_55;
        }
        if ((VCSessionParticipant *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v53 = VRTraceErrorLogLevelToCSTR();
            v54 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v93 = v53;
              v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              v96 = 1024;
              v97 = 2226;
              v98 = 2112;
              v99 = v45;
              v50 = v54;
              v51 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              v52 = 38;
              goto LABEL_66;
            }
          }
        }
        else
        {
          v47 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v47 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v48 = VRTraceErrorLogLevelToCSTR();
            v49 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v93 = v48;
              v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              v96 = 1024;
              v97 = 2226;
              v98 = 2112;
              v99 = v47;
              v100 = 2048;
              v101 = v86;
              v102 = 2112;
              v103 = v45;
              v50 = v49;
              v51 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              v52 = 58;
LABEL_66:
              _os_log_error_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_ERROR, v51, buf, v52);
            }
          }
        }
LABEL_55:
        ++v44;
        v6 = v86;
      }
      while (v42 != v44);
      v55 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
      v42 = v55;
      if (!v55)
      {
LABEL_68:
        if (!objc_msgSend(v40, "count"))
          return 0;
        v56 = -[VCSessionParticipant updateMediaState:forStreamGroups:](v6, "updateMediaState:forStreamGroups:", 0, v40);
        if (v56)
        {
          if ((VCSessionParticipant *)objc_opt_class() == v6)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v70 = VRTraceErrorLogLevelToCSTR();
              v71 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v72 = VCSessionMediaType_Name(v80);
                *(_DWORD *)buf = 136316162;
                v93 = v70;
                v94 = 2080;
                v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
                v96 = 1024;
                v97 = 2233;
                v98 = 2112;
                v99 = v72;
                v100 = 2112;
                v101 = (VCSessionParticipant *)v56;
                v62 = " [%s] %s:%d Failed to deactivate stream groups. mediaState=%@ error=%@";
                v63 = v71;
                v64 = 48;
                goto LABEL_86;
              }
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v57 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
            else
              v57 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v73 = VRTraceErrorLogLevelToCSTR();
              v74 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v75 = VCSessionMediaType_Name(v80);
                *(_DWORD *)buf = 136316674;
                v93 = v73;
                v94 = 2080;
                v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
                v96 = 1024;
                v97 = 2233;
                v98 = 2112;
                v99 = v57;
                v100 = 2048;
                v101 = v86;
                v102 = 2112;
                v103 = v75;
                v104 = 2112;
                v105 = v56;
                v62 = " [%s] %s:%d %@(%p) Failed to deactivate stream groups. mediaState=%@ error=%@";
                v63 = v74;
                v64 = 68;
                goto LABEL_86;
              }
            }
          }
        }
        return v56;
      }
    }
  }
  v56 = (__CFString *)v39;
  if ((VCSessionParticipant *)objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v56;
    v66 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v56;
    v68 = VCSessionMediaType_Name(v80);
    v69 = VCSessionMediaState_Name(v81);
    *(_DWORD *)buf = 136316418;
    v93 = v66;
    v94 = 2080;
    v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
    v96 = 1024;
    v97 = 2218;
    v98 = 2112;
    v99 = v68;
    v100 = 2112;
    v101 = (VCSessionParticipant *)v69;
    v102 = 2112;
    v103 = v56;
    v62 = " [%s] %s:%d Failed to activate stream groups. mediaType=%@ mediaState=%@ error=%@";
    v63 = v67;
    goto LABEL_85;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v65 = (const __CFString *)-[VCSessionParticipant performSelector:](v6, "performSelector:", sel_logPrefix);
  else
    v65 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v76 = VRTraceErrorLogLevelToCSTR();
    v77 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v78 = VCSessionMediaType_Name(v80);
      v79 = VCSessionMediaState_Name(v81);
      *(_DWORD *)buf = 136316930;
      v93 = v76;
      v94 = 2080;
      v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
      v96 = 1024;
      v97 = 2218;
      v98 = 2112;
      v99 = v65;
      v100 = 2048;
      v101 = v86;
      v102 = 2112;
      v103 = v78;
      v104 = 2112;
      v105 = v79;
      v106 = 2112;
      v107 = v56;
      v62 = " [%s] %s:%d %@(%p) Failed to activate stream groups. mediaType=%@ mediaState=%@ error=%@";
      v63 = v77;
      v64 = 78;
LABEL_86:
      _os_log_error_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_ERROR, v62, buf, v64);
    }
  }
  return v56;
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char **v11;
  uint64_t v12;
  VCSessionParticipant *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v20;
  const __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  __CFString *v29;
  uint64_t v30;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  char *v36;
  id obj;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  VCSessionParticipant *v47;
  __int16 v48;
  _BYTE v49[10];
  VCSessionParticipant *v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  _BOOL4 v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v5 = *(_QWORD *)&a3;
  v60 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  obj = a4;
  if (!objc_msgSend(a4, "count")
    && (v7 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 2244))) != 0)
  {
    v20 = v7;
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipant updateMediaState:forStreamGroups:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v39 = v33;
          v40 = 2080;
          v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
          v42 = 1024;
          v43 = 2246;
          v44 = 2112;
          v45 = v32;
          v46 = 2048;
          v47 = self;
          v48 = 2112;
          *(_QWORD *)v49 = v20;
          _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream groups not found. error=%@", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    if (self->_state == 1)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v57;
        v11 = &selRef_load;
        do
        {
          v12 = 0;
          v36 = v11[73];
          do
          {
            if (*(_QWORD *)v57 != v10)
              objc_enumerationMutation(obj);
            v13 = *(VCSessionParticipant **)(*((_QWORD *)&v56 + 1) + 8 * v12);
            v14 = -[VCSessionParticipant isStreamGroupActive:](self, "isStreamGroupActive:", v13);
            v15 = -[VCSessionParticipant state](v13, "state");
            v16 = v15;
            v17 = !v14;
            if (v14 && (_DWORD)v5 == 1 && !v15)
            {
              v18 = -[VCSessionParticipant start](v13, "start");
              goto LABEL_20;
            }
            if ((_DWORD)v5 == 1 || v15 == 0)
              v17 = 0;
            if (v17 == 1)
            {
              v18 = -[VCSessionParticipant stop](v13, "stop");
LABEL_20:
              v20 = (void *)v18;
              if (v18)
                return v20;
              goto LABEL_21;
            }
            if ((VCSessionParticipant *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v27 = VRTraceErrorLogLevelToCSTR();
                v28 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v29 = VCSessionMediaState_Name(v5);
                  *(_DWORD *)buf = 136316674;
                  v39 = v27;
                  v40 = 2080;
                  v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
                  v42 = 1024;
                  v43 = 2260;
                  v44 = 2112;
                  v45 = v29;
                  v46 = 2112;
                  v47 = v13;
                  v48 = 1024;
                  *(_DWORD *)v49 = v14;
                  *(_WORD *)&v49[4] = 1024;
                  *(_DWORD *)&v49[6] = v16 != 0;
                  v24 = v28;
                  v25 = " [%s] %s:%d Ignore mediaState=%@ for streamGroup=%@ isStreamGroupActive=%d isStreamGroupStarted=%d";
                  v26 = 60;
                  goto LABEL_32;
                }
              }
            }
            else
            {
              v21 = &stru_1E9E58EE0;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v21 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", v36);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v35 = VRTraceErrorLogLevelToCSTR();
                v22 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v23 = VCSessionMediaState_Name(v5);
                  *(_DWORD *)buf = 136317186;
                  v39 = v35;
                  v40 = 2080;
                  v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
                  v42 = 1024;
                  v43 = 2260;
                  v44 = 2112;
                  v45 = v21;
                  v46 = 2048;
                  v47 = self;
                  v48 = 2112;
                  *(_QWORD *)v49 = v23;
                  *(_WORD *)&v49[8] = 2112;
                  v50 = v13;
                  v51 = 1024;
                  v52 = v14;
                  v53 = 1024;
                  v54 = v16 != 0;
                  v24 = v22;
                  v25 = " [%s] %s:%d %@(%p) Ignore mediaState=%@ for streamGroup=%@ isStreamGroupActive=%d isStreamGroupStarted=%d";
                  v26 = 80;
LABEL_32:
                  _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
                }
              }
            }
LABEL_21:
            ++v12;
          }
          while (v9 != v12);
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
          v9 = v30;
          v11 = &selRef_load;
        }
        while (v30);
      }
    }
    return 0;
  }
  return v20;
}

- (void)updateVideoPaused:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  VCSessionParticipant *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionParticipant updateVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 2272;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Changing participant videoPaused to %d";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionParticipant updateVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 2272;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Changing participant videoPaused to %d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_videoPaused = v3;
  -[VCSessionParticipant updateAudioSpectrumState](self, "updateAudioSpectrumState", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (NSArray)allParticipantStreamInfo
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "mediaStreamInfoArray"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)setMuted:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCSessionParticipant_setMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __33__VCSessionParticipant_setMuted___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "setMuted:", *(unsigned __int8 *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 372) = *(_BYTE *)(a1 + 40);
  return result;
}

- (BOOL)setVolume:(float)a3
{
  _BOOL4 v3;

  v3 = a3 <= 1.0 && a3 >= 0.0;
  if (v3)
    self->_volume = a3;
  return v3;
}

- (BOOL)setAudioPosition:(float)a3
{
  _BOOL4 v3;

  v3 = a3 <= 1.0 && a3 >= -1.0;
  if (v3)
    self->_audioPosition = a3;
  return v3;
}

- (void)setAudioEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCSessionParticipant_setAudioEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __40__VCSessionParticipant_setAudioEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetAudioEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isVideoEnabled
{
  NSObject *participantQueue;
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
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCSessionParticipant_isVideoEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__VCSessionParticipant_isVideoEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 374);
  return result;
}

- (void)setVideoEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCSessionParticipant_setVideoEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __40__VCSessionParticipant_setVideoEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetVideoEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isScreenEnabled
{
  NSObject *participantQueue;
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
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipant_isScreenEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__VCSessionParticipant_isScreenEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 375);
  return result;
}

- (void)setScreenEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCSessionParticipant_setScreenEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __41__VCSessionParticipant_setScreenEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetScreenEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setAudioPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipant_setAudioPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipant_setAudioPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetAudioPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setVideoPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipant_setVideoPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipant_setVideoPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetVideoPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipant_setMediaState_forMediaType___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipant_setMediaState_forMediaType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetMediaState:forMediaType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (void)setMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipant_setMediaType_mixingWithMediaType___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __57__VCSessionParticipant_setMediaType_mixingWithMediaType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchSetMediaType:mixingWithMediaType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (unsigned)streamGroupStateFromStreamGroupID:(unsigned int)a3
{
  return objc_msgSend((id)objc_opt_class(), "mediaStreamGroupStateToVCStreamGroupState:", objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", *(_QWORD *)&a3), "state"));
}

+ (unsigned)mediaStreamGroupStateToVCStreamGroupState:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3;
  if (a3 >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionParticipant mediaStreamGroupStateToVCStreamGroupState:].cold.1();
    }
    return -1;
  }
  return v3;
}

+ (id)mediaTypesFromStreamGroupID:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = v4;
  v6 = &unk_1E9EF7718;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 <= 1936290408)
    {
      if ((int)a3 > 1835623286)
      {
        if (a3 != 1835623287)
        {
          if (a3 == 1935897189)
          {
            v6 = &unk_1E9EF7748;
            goto LABEL_28;
          }
          return v5;
        }
      }
      else
      {
        if (a3 == 1718909044)
        {
          v6 = &unk_1E9EF77A8;
          goto LABEL_28;
        }
        if (a3 != 1835623282)
          return v5;
      }
      v6 = &unk_1E9EF7730;
      goto LABEL_28;
    }
    if (a3 - 1986618417 < 4)
      goto LABEL_28;
    if (a3 == 1936290409)
    {
      v6 = &unk_1E9EF7790;
      goto LABEL_28;
    }
    if (a3 == 1937339233)
    {
      v6 = &unk_1E9EF7760;
      goto LABEL_28;
    }
  }
  else if ((int)a3 <= 1667330163)
  {
    if (a3 == 1650745716)
    {
      objc_msgSend(v4, "addObject:", &unk_1E9EF77A8);
      objc_msgSend(v5, "addObject:", &unk_1E9EF77C0);
      v6 = &unk_1E9EF77D8;
      goto LABEL_28;
    }
    if (a3 == 1667329381 || a3 == 1667329399)
      goto LABEL_28;
  }
  else
  {
    if (a3 - 1684108337 < 5)
    {
LABEL_28:
      objc_msgSend(v5, "addObject:", v6);
      return v5;
    }
    if (a3 == 1667330164)
    {
      v6 = &unk_1E9EF7778;
      goto LABEL_28;
    }
    if (a3 == 1717854580)
    {
      v6 = &unk_1E9EF77C0;
      goto LABEL_28;
    }
  }
  return v5;
}

- (void)setStatisticsCollector:(id)a3
{
  AVCStatisticsCollector *statisticsCollector;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  statisticsCollector = self->_statisticsCollector;

  self->_statisticsCollector = (AVCStatisticsCollector *)a3;
  if (!statisticsCollector)
    -[VCSessionParticipant createRedundancyControllers](self, "createRedundancyControllers");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setStatisticsCollector:", self->_statisticsCollector);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v8);
  }
}

- (void)setBasebandCongestionDetector:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSMutableArray *micStreamGroups;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];

  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = v5;
      v19 = 2080;
      v20 = "-[VCSessionParticipant setBasebandCongestionDetector:]";
      v21 = 1024;
      v22 = 2457;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set VCRateControl baseband congestion detector to all audio streams", buf, 0x1Cu);
    }
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  micStreamGroups = self->_micStreamGroups;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(micStreamGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setBasebandCongestionDetector:", self->_basebandCongestionDetector);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (void)createRedundancyControllers
{
  VCRedundancyControllerVideo *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, 7, self->_statisticsCollector, 400);
  self->_videoRedundancyController = v3;
  -[VCRedundancyControllerVideo setStatisticsID:](v3, "setStatisticsID:", self->_idsParticipantID);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCSessionParticipant createRedundancyControllers]";
      v10 = 1024;
      v11 = 2469;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy controllers are created", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)collectVideoChannelMetrics:(id *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant collectVideoChannelMetrics:]"), 0));
}

- (void)collectAudioChannelMetrics:(id *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant collectAudioChannelMetrics:]"), 0));
}

- (void)collectCaptionsChannelMetrics:(id *)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipant_collectCaptionsChannelMetrics___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __54__VCSessionParticipant_collectCaptionsChannelMetrics___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captionsGroup"), "collectAndLogChannelMetrics:", *(_QWORD *)(a1 + 40));
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  tagVCMediaQueue *mediaQueue;
  tagVCMediaQueue *v6;

  mediaQueue = self->_mediaQueue;
  if (mediaQueue != a3)
  {
    if (mediaQueue)
      CFRelease(mediaQueue);
    if (a3)
      v6 = (tagVCMediaQueue *)CFRetain(a3);
    else
      v6 = 0;
    self->_mediaQueue = v6;
  }
}

- (void)handleStreamGroupsActiveConnectionChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "handleActiveConnectionChange:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (BOOL)setupMediaSyncForStreamGroup:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", objc_msgSend(a3, "syncGroupID"));
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant setupMediaSyncForStreamGroup:].cold.1(v6, a3);
    }
    goto LABEL_3;
  }
  if ((objc_msgSend(v4, "addSyncDestination:", a3) & 1) != 0)
  {
LABEL_3:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    -[VCSessionParticipant setupMediaSyncForStreamGroup:].cold.2(v7, a3);
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)setupStreamGroupMediaSync
{
  NSMutableArray *videoStreamGroups;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
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
  videoStreamGroups = self->_videoStreamGroups;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(videoStreamGroups);
      v8 = -[VCSessionParticipant setupMediaSyncForStreamGroup:](self, "setupMediaSyncForStreamGroup:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
      if (!v8)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (void)swapScreenStreamGroupSyncSourceWithState:(unsigned int)a3
{
  id v5;
  id v6;
  id v7;
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
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BYTE v25[24];
  __int128 v26;
  VCSessionParticipant *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  v5 = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
  v6 = -[VCSessionParticipant microphoneGroup](self, "microphoneGroup");
  v7 = -[VCSessionParticipant screenGroup](self, "screenGroup");
  if (a3 == 1)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)v25 = 136315650;
      *(_QWORD *)&v25[4] = v15;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2539;
      v17 = " [%s] %s:%d System Audio Stream Group has resumed, swapping sync sources";
      v18 = v16;
      v19 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)v25 = 136316162;
      *(_QWORD *)&v25[4] = v23;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2539;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = v9;
      HIWORD(v26) = 2048;
      v27 = self;
      v17 = " [%s] %s:%d %@(%p) System Audio Stream Group has resumed, swapping sync sources";
      v18 = v24;
      v19 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v25, v19);
LABEL_26:
    v22 = v6;
    v6 = v5;
    goto LABEL_27;
  }
  if (a3 != 2)
    return;
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_20;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)v25 = 136315650;
    *(_QWORD *)&v25[4] = v10;
    *(_WORD *)&v25[12] = 2080;
    *(_QWORD *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 2532;
    v12 = " [%s] %s:%d System Audio Stream Group has paused, swapping sync sources";
    v13 = v11;
    v14 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_20;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)v25 = 136316162;
    *(_QWORD *)&v25[4] = v20;
    *(_WORD *)&v25[12] = 2080;
    *(_QWORD *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 2532;
    WORD2(v26) = 2112;
    *(_QWORD *)((char *)&v26 + 6) = v8;
    HIWORD(v26) = 2048;
    v27 = self;
    v12 = " [%s] %s:%d %@(%p) System Audio Stream Group has paused, swapping sync sources";
    v13 = v21;
    v14 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v25, v14);
LABEL_20:
  v22 = v5;
LABEL_27:
  objc_msgSend(v22, "removeSyncDestination:", v7, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27);
  objc_msgSend(v6, "addSyncDestination:", v7);
}

- (void)setMediaRecorder:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCSessionParticipant_setMediaRecorder___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

id __41__VCSessionParticipant_setMediaRecorder___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512) = result;
  return result;
}

- (VCMediaRecorder)mediaRecorder
{
  NSObject *participantQueue;
  VCMediaRecorder *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCSessionParticipant_mediaRecorder__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = (VCMediaRecorder *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__VCSessionParticipant_mediaRecorder__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionsCoordinator:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCSessionParticipant_setCaptionsCoordinator___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

id __47__VCSessionParticipant_setCaptionsCoordinator___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) = result;
  return result;
}

- (VCAudioCaptionsCoordinator)captionsCoordinator
{
  NSObject *participantQueue;
  VCAudioCaptionsCoordinator *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCSessionParticipant_captionsCoordinator__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = (VCAudioCaptionsCoordinator *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__VCSessionParticipant_captionsCoordinator__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 520);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316162;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VCSessionParticipant vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
      v15 = 1024;
      v16 = 2587;
      v17 = 1024;
      v18 = v6;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d requestKeyFrameGenerationWithStreamID:%d FIRType:%d", (uint8_t *)&v11, 0x28u);
    }
  }
  v10 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  objc_msgSend(v10, "vcSessionParticipant:requestKeyFrameGenerationWithStreamID:streamGroupID:firType:", self, v6, 0, v5);
  if (v10)
    CFRelease(v10);
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = (void *)-[NSMutableDictionary allValues](self->_streamGroups, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "handleEncryptionInfoChange:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return 1;
}

- (void)resetDecryptionTimeout
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 2609;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Resetting decryption status", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant pullAudioSamples:]"), 0));
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCSessionParticipant pushAudioSamples:]"), 0));
}

- (void)handleActiveConnectionChange:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCSessionParticipant_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __53__VCSessionParticipant_handleActiveConnectionChange___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = VCConnection_IsLocalOnWiFiOrWired(*(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "handleStreamGroupsActiveConnectionChange:", *(_QWORD *)(a1 + 40));
}

- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCSessionParticipant redundancyController:redundancyIntervalDidChange:]"), 0));
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, "-[VCSessionParticipant redundancyController:redundancyPercentageDidChange:]"), 0));
}

- (void)audioPowerSpectrumSinkDidRegister
{
  -[VCSessionParticipant sendAudioPowerSpectrumSourceRegistration:](self, "sendAudioPowerSpectrumSourceRegistration:", 1);
}

- (void)audioPowerSpectrumSinkDidUnregister
{
  -[VCSessionParticipant sendAudioPowerSpectrumSourceRegistration:](self, "sendAudioPowerSpectrumSourceRegistration:", 0);
}

- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3
{
  _BOOL8 v3;
  __CFDictionary *Mutable;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), self->_uuid);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPAPSReg"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  if (Mutable)
    CFRelease(Mutable);
}

- (int64_t)negotiatedCipherSuiteForStreamGroupID:(unsigned int)a3
{
  NSObject *participantQueue;
  int64_t v4;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  participantQueue = self->_participantQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__VCSessionParticipant_negotiatedCipherSuiteForStreamGroupID___block_invoke;
  v6[3] = &unk_1E9E54AC8;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  dispatch_sync(participantQueue, v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __62__VCSessionParticipant_negotiatedCipherSuiteForStreamGroupID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", *(unsigned int *)(a1 + 48)), "cipherSuite");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipant didUpdateBasebandCodec:].cold.1();
  }
}

- (void)handleRemoteOneToOneSwitchWithStreamGroup:(id)a3 fromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  BOOL v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a4 || !a5)
  {
    v6 = a4 || a5 == 0;
    v7 = !v6;
    if (objc_msgSend(a3, "streamGroupID") == 1835623282)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315906;
          v12 = v8;
          v13 = 2080;
          v14 = "-[VCSessionParticipant handleRemoteOneToOneSwitchWithStreamGroup:fromStreamID:toStreamID:]";
          v15 = 1024;
          v16 = 2711;
          v17 = 1024;
          v18 = v7;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Detected remote switch of oneToOne mode %d", (uint8_t *)&v11, 0x22u);
        }
      }
      v10 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
      objc_msgSend(v10, "vcSessionParticipant:oneToOneModeDidChange:", self, !v7);
      if (v10)
        CFRelease(v10);
    }
  }
}

- (void)handleSymptomReportForDecryptionError
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), self->_sessionUUID);
  CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_idsParticipantID));
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingSymptom();
  CFRelease(Mutable);
}

- (void)streamGroup:(id)a3 didChangeMediaPriority:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  __CFString **v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VCSessionParticipant streamGroup:didChangeMediaPriority:]";
      v16 = 1024;
      v17 = 2729;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d priority %hhu", (uint8_t *)&v12, 0x22u);
    }
  }
  v9 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  v10 = objc_msgSend(a3, "streamGroupID");
  if (v10 > 1835623281)
  {
    if (v10 != 1835623287 && v10 != 1835623282)
      goto LABEL_12;
    v11 = AVCSessionParticipantMediaTypeKeyAudio;
  }
  else
  {
    v11 = &AVCSessionParticipantMediaTypeKeyVideo;
    if (v10 != 1667329381 && v10 != 1667329399)
      goto LABEL_12;
  }
  objc_msgSend(v9, "vcSessionParticipant:didChangeMediaPriority:description:", self, v4, *v11);
LABEL_12:
  if (v9)
    CFRelease(v9);
}

- (void)didChangeSendingStreamsForStreamGroup:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCSessionParticipant didChangeSendingStreamsForStreamGroup:]";
      v12 = 1024;
      v13 = 2751;
      v14 = 2112;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__VCSessionParticipant_didChangeSendingStreamsForStreamGroup___block_invoke;
  v7[3] = &unk_1E9E55140;
  v7[4] = self;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v7);
}

uint64_t __62__VCSessionParticipant_didChangeSendingStreamsForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidChangeSendingStreams:", *(_QWORD *)(a1 + 32));
}

- (void)didMediaDecryptionTimeOutForStreamGroup:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *uuid;
  void *v8;
  const __CFString *v9;
  NSString *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCSessionParticipant didMediaDecryptionTimeOutForStreamGroup:]";
      v15 = 1024;
      v16 = 2758;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  uuid = self->_uuid;
  v9 = CFSTR("VCSPUUID");
  v10 = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  reportingGenericEvent();
  v8 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  objc_msgSend(v8, "vcSessionParticipantDidMediaDecryptionTimeOut:", self);
  if (v8)
    CFRelease(v8);
}

- (void)streamGroup:(id)a3 didRemoteEnableChange:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  _BYTE v9[24];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = "NO";
      *(_DWORD *)v9 = 136315906;
      *(_QWORD *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2080;
      *(_QWORD *)&v9[14] = "-[VCSessionParticipant streamGroup:didRemoteEnableChange:]";
      if (v4)
        v8 = "YES";
      *(_WORD *)&v9[22] = 1024;
      v10 = 2766;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enabled %s", v9, 0x26u);
    }
  }
  -[VCSessionParticipant updateAudioSpectrumState](self, "updateAudioSpectrumState", *(_OWORD *)v9, *(_QWORD *)&v9[16]);
}

- (void)streamGroup:(id)a3 didRemotePauseChange:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  _BYTE v9[24];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = "NO";
      *(_DWORD *)v9 = 136315906;
      *(_QWORD *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2080;
      *(_QWORD *)&v9[14] = "-[VCSessionParticipant streamGroup:didRemotePauseChange:]";
      if (v4)
        v8 = "YES";
      *(_WORD *)&v9[22] = 1024;
      v10 = 2771;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d paused %s", v9, 0x26u);
    }
  }
  -[VCSessionParticipant updateAudioSpectrumState](self, "updateAudioSpectrumState", *(_OWORD *)v9, *(_QWORD *)&v9[16]);
}

- (void)streamGroup:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = a5;
  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((_DWORD)v6 == (_DWORD)v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCSessionParticipant streamGroup:didSwitchFromStreamID:toStreamID:]";
        v18 = 1024;
        v19 = 2777;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fromStreamID & toStreamID are equal, no switch needed", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCSessionParticipant streamGroup:didSwitchFromStreamID:toStreamID:]";
        v18 = 1024;
        v19 = 2780;
        v20 = 1024;
        v21 = v6;
        v22 = 1024;
        v23 = v5;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switched streamID %hu -> %hu", (uint8_t *)&v14, 0x28u);
      }
    }
    v13 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
    objc_msgSend(v13, "vcSessionParticipant:didSwitchFromStreamID:toStreamID:", self, v6, v5);
    if (v13)
      CFRelease(v13);
  }
}

- (void)didChangeReceivingStreamsForStreamGroup:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCSessionParticipant didChangeReceivingStreamsForStreamGroup:]";
      v10 = 1024;
      v11 = 2787;
      v12 = 2112;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)didChangeActualNetworkBitrateForStreamGroup:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCSessionParticipant didChangeActualNetworkBitrateForStreamGroup:]";
      v12 = 1024;
      v13 = 2791;
      v14 = 2112;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__VCSessionParticipant_didChangeActualNetworkBitrateForStreamGroup___block_invoke;
  v7[3] = &unk_1E9E55208;
  v7[4] = self;
  v7[5] = a3;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v7);
}

uint64_t __68__VCSessionParticipant_didChangeActualNetworkBitrateForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didChangeActualNetworkBitrateForStreamGroupID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "streamGroupID"));
}

- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = "NO";
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCSessionParticipant streamGroup:didRequestRedundancy:]";
      if (v4)
        v7 = "YES";
      v12 = 1024;
      v13 = 2798;
      v14 = 2080;
      v15 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d requestRedundancy %s", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)streamGroup:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCSessionParticipant streamGroup:requestKeyFrameGenerationWithStreamID:firType:]";
      v16 = 1024;
      v17 = 2802;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamID %d", (uint8_t *)&v12, 0x22u);
    }
  }
  v11 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  objc_msgSend(v11, "vcSessionParticipant:requestKeyFrameGenerationWithStreamID:streamGroupID:firType:", self, v6, objc_msgSend(a3, "streamGroupID"), v5);
  if (v11)
    CFRelease(v11);
}

- (void)didDecryptionTimeOutForMKMRecoveryForStreamGroup:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *participantQueue;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionParticipant *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipant didDecryptionTimeOutForMKMRecoveryForStreamGroup:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipant performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCSessionParticipant didDecryptionTimeOutForMKMRecoveryForStreamGroup:]";
        v18 = 1024;
        v19 = 2809;
        v20 = 2112;
        v21 = v5;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) streamGroup=%@", buf, 0x3Au);
      }
    }
  }
  v8 = micro();
  if (v8 - self->_lastParticipantMKMRecoveryTime > self->_participantMKMRecoveryTimeout)
  {
    self->_lastParticipantMKMRecoveryTime = v8;
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke;
    v13[3] = &unk_1E9E55140;
    v13[4] = self;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v13);
    v10 = dispatch_time(0, 5000000000);
    participantQueue = self->_participantQueue;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke_2;
    v12[3] = &unk_1E9E521C0;
    v12[4] = self;
    dispatch_after(v10, participantQueue, v12);
  }
}

uint64_t __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:", *(_QWORD *)(a1 + 32));
}

uint64_t __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSymptomReportForDecryptionError");
}

- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCSessionParticipant streamGroup:didSuspendStreams:]";
      v12 = 1024;
      v13 = 2825;
      v14 = 2112;
      v15 = a3;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@ didSuspendStreams:%d", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)streamGroup:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCSessionParticipant streamGroup:remoteMediaStalled:duration:]";
      v16 = 1024;
      v17 = 2829;
      v18 = 2112;
      v19 = a3;
      v20 = 1024;
      v21 = v6;
      v22 = 2048;
      v23 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup=%@ remoteMediaStalled=%d duration=%f", buf, 0x36u);
    }
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__VCSessionParticipant_streamGroup_remoteMediaStalled_duration___block_invoke;
  v11[3] = &unk_1E9E551B8;
  v11[4] = self;
  *(double *)&v11[5] = a5;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v11);
}

uint64_t __64__VCSessionParticipant_streamGroup_remoteMediaStalled_duration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidRemoteMediaStallTimeout:duration:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)streamGroup:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__VCSessionParticipant_streamGroup_didReceiveFlushRequestWithPayloads___block_invoke;
  v4[3] = &unk_1E9E55140;
  v4[4] = a4;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v4);
}

uint64_t __71__VCSessionParticipant_streamGroup_didReceiveFlushRequestWithPayloads___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:", *(_QWORD *)(a1 + 32));
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSData)opaqueData
{
  return self->_opaqueData;
}

- (tagNTP)creationTime
{
  return (tagNTP)self->_creationTime.wide;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (float)volume
{
  return self->_volume;
}

- (float)audioPosition
{
  return self->_audioPosition;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
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

- (VCAudioRuleCollection)supportedAudioRules
{
  return self->_supportedAudioRules;
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (VCSessionMediaNegotiator)mediaNegotiator
{
  return self->_mediaNegotiator;
}

- (BOOL)isLocalOnWiFi
{
  return self->_localOnWiFi;
}

- (void)setLocalOnWiFi:(BOOL)a3
{
  self->_localOnWiFi = a3;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (VCCallInfoBlob)callInfoBlob
{
  return self->_callInfoBlob;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (unsigned)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(unsigned __int8)a3
{
  self->_presentationState = a3;
}

- (VCSessionParticipantOneToOneConfig)oneToOneConfig
{
  return self->_oneToOneConfig;
}

- (void)setOneToOneConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return self->_isParticipantIDBasedKeyLookupEnabled;
}

- (void)callDelegateWithBlock:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d block is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)callDelegateWithBlock:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d delegate could not be loaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetAudioEnabled:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d updateStreamGroups failed with error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetAudioPaused:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can't set pause when participant audio is not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetAudioPaused:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Shouldn't come here when setting audio paused", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetAudioPaused:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d startAudioStreamGroups failed with error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetVideoPaused:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Can't set pause when participant video is not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedSetVideoPaused:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Shouldn't come here when setting video paused", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The participant info data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Media blob missing in the participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.4()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]";
  OUTLINED_FUNCTION_4();
  v5 = 615;
  v6 = v0;
  v7 = 0;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d Negotiation data not available for version=%d", v3);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.5()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]";
  OUTLINED_FUNCTION_4();
  v5 = 618;
  v6 = v0;
  v7 = 1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d Negotiation data not available for version=%d", v3);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate output dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The participant info data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected participant data in participant info dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Negotiation v1 blob not present in particiant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Negotiation v2 blob not present in particiant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the negotation data entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate output dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)participantDataWithParticipantData:isReinit:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing media blob entry in particiant info. ParticipantInfo=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsFromParticipantData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsFromParticipantData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Media blob is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopAudioIO
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to stop the VCAudioIO. error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)startStreamGroups
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate temporary stream group array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startScreenGroup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start screen group. Error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No audio rules for stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No codec configurations for stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.3()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]";
  OUTLINED_FUNCTION_4();
  v5 = 1065;
  v6 = v0;
  v7 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Failed to allocate codec config for payload=%d!", v3);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate multiway video config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate multiway audio config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate rate controller audio config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the audio stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate one to one video stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate multiway video config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate rate controller config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSecurityKeyHolderForStreamConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid VCSecurityKeyManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSecurityKeyHolderForStreamConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCSecurityKeyHolder_Create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)completeStreamSetup:rtpCipherSuite:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupSecurityKeyHolderForStreamConfig failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring audioIO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setDevice role on captionsStreamGroup=%@");
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring audio stream [%@]");
  OUTLINED_FUNCTION_3();
}

- (void)newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate video rate control config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring stream [%@]");
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate one to one rate config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring video stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring audio stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneWithConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring audioIO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to create the oneToOneConfig", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error setting device role on stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureStreamInfosForMultiway:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureMultiwayStreamGroups
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14_2();
  v8 = *MEMORY[0x1E0C80C00];
  v4 = OUTLINED_FUNCTION_21_1(v2, v3);
  FourccToCStr(v4);
  v6 = 136315906;
  v7 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v5, " [%s] %s:%d Error configuring stream infos for streamGroupID=%s", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithConfig:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_2();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(v2, "idsDestination"), "UTF8String");
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, " [%s] %s:%d Unable to initialize participant. Destination=%s ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithConfig:delegate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the list of supported audio rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the participant stream token dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateMediaStatesWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_16_0(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, " [%s] %s:%d Failed to allocate the media type settings for mediaType=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyMediaState:forMediaType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_16_0(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, " [%s] %s:%d mediaTypeSettings is missing for mediaType=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)updateMediaState:forStreamGroups:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream groups not found. error=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)mediaStreamGroupStateToVCStreamGroupState:.cold.1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "+[VCSessionParticipant mediaStreamGroupStateToVCStreamGroupState:]";
  OUTLINED_FUNCTION_4();
  v5 = 2390;
  v6 = v0;
  v7 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Unknown media stream group state: %d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)setupMediaSyncForStreamGroup:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  FourccToCStr(objc_msgSend(a2, "syncGroupID"));
  FourccToCStr(objc_msgSend(a2, "streamGroupID"));
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15_11();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v3, v4, " [%s] %s:%d Sync group=%s not found for group=%s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_9_1();
}

- (void)setupMediaSyncForStreamGroup:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_21_1(a1, a2);
  FourccToCStr(v3);
  FourccToCStr(objc_msgSend(a2, "syncGroupID"));
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15_11();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v4, v5, " [%s] %s:%d Failed to add %s as sync destination to %s", v6, v7, v8, v9, 2u);
  OUTLINED_FUNCTION_9_1();
}

- (void)didUpdateBasebandCodec:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didDecryptionTimeOutForMKMRecoveryForStreamGroup:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamGroup=%@");
  OUTLINED_FUNCTION_3();
}

@end
