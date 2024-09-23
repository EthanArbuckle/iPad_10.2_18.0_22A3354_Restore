@implementation VCAudioSessionCMS

- (void)resetOverrideRoute
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_cmSession)
  {
    VCCMSessionStub_CMSessionSetProperty();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCAudioSessionCMS resetOverrideRoute]";
      v8 = 1024;
      v9 = 51;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error no CMSession", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (BOOL)hasStarted
{
  return self->_cmSession != 0;
}

- (BOOL)isInputSupported
{
  uint64_t v3;
  NSObject *v4;
  opaqueCMSession *cmSession;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  opaqueCMSession *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      cmSession = self->_cmSession;
      v7 = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAudioSessionCMS isInputSupported]";
      v11 = 1024;
      v12 = 60;
      v13 = 2112;
      v14 = cmSession;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d This flow is not supported with cmSession=%@, returning NO", (uint8_t *)&v7, 0x26u);
    }
  }
  return 0;
}

- (void)setSpeakerProperty:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
    {
      v7 = *MEMORY[0x1E0D49638];
    }
    else
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      v7 = *MEMORY[0x1E0D49638];
      if (v6)
      {
        v8 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49638]);
        v9 = 136316162;
        v10 = v4;
        v11 = 2080;
        v12 = "-[VCAudioSessionCMS setSpeakerProperty:]";
        v13 = 1024;
        v14 = 66;
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio session setting property kCMSessionProperty_CreateSpeakerDevice=%@ to value=%@", (uint8_t *)&v9, 0x30u);
      }
    }
    objc_msgSend(a3, "objectForKeyedSubscript:", v7);
    VCCMSessionStub_CMSessionSetProperty();
  }
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
  id v7;
  int v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCAudioSessionCMS applyRequestedProperty:defaultValue:].cold.1();
    }
LABEL_16:
    LOBYTE(v12) = 0;
    return v12;
  }
  v7 = -[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", a3);
  if (v7)
    a4 = v7;
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCAudioSessionCMS applyRequestedProperty:defaultValue:].cold.2();
    }
    goto LABEL_16;
  }
  v8 = VCCMSessionStub_CMSessionSetProperty();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = v10;
        v18 = 2080;
        v19 = "-[VCAudioSessionCMS applyRequestedProperty:defaultValue:]";
        v20 = 1024;
        v21 = 93;
        v22 = 2112;
        v23 = a3;
        v24 = 2112;
        v25 = a4;
        v26 = 1024;
        v27 = v8;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting propertyKey=%@ failed, value=%@ status=%d", (uint8_t *)&v16, 0x36u);
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", 0, a3);
    goto LABEL_16;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136316162;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VCAudioSessionCMS applyRequestedProperty:defaultValue:]";
      v20 = 1024;
      v21 = 90;
      v22 = 2112;
      v23 = a3;
      v24 = 2112;
      v25 = a4;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Property propertyKey=%@ successfully set value=%@", (uint8_t *)&v16, 0x30u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", a4, a3);
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t i;
  _BOOL4 v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = v7;
      v23 = 2080;
      v24 = "-[VCAudioSessionCMS applyRequestedProperties:propertyOrder:]";
      v25 = 1024;
      v26 = 102;
      v27 = 2112;
      v28 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting requested properties=%@", buf, 0x26u);
    }
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v9)
    goto LABEL_15;
  v10 = v9;
  v11 = *(_QWORD *)v18;
  v12 = 1;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(a4);
      v12 = v12
         && -[VCAudioSessionCMS applyRequestedProperty:defaultValue:](self, "applyRequestedProperty:defaultValue:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)));
    }
    v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  }
  while (v10);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCAudioSessionCMS applyRequestedProperties:propertyOrder:].cold.1();
    }
    LOBYTE(v14) = 0;
  }
  else
  {
LABEL_15:
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (void)setClientName
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Setting kCMSessionProperty_ClientName to GameKitServices failed, result=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = *(_QWORD *)&a3;
  v6 = *MEMORY[0x1E0C80C00];
  -[VCAudioSessionCMS setClientName](self, "setClientName");
  v5.receiver = self;
  v5.super_class = (Class)VCAudioSessionCMS;
  -[VCAudioSession applyAudioSessionPropertiesWithVPOperatingMode:](&v5, sel_applyAudioSessionPropertiesWithVPOperatingMode_, v3);
}

- (void)applyAudioSessionMediaPropertiesForSystemAudio
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSessionProperty_AudioCategory failed: status=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->super._playbackMode)
  {
    v7 = a3 == 2 || a3 == 4;
    *a4 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *a4;
        v19 = 136315906;
        v20 = v8;
        v21 = 2080;
        v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
        v23 = 1024;
        v24 = 161;
        v25 = 1024;
        v26 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCMSessionProperty_IsSharePlayCapableCallSession=%d", (uint8_t *)&v19, 0x22u);
      }
    }
    v11 = VCCMSessionStub_CMSessionSetProperty();
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v11)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = *a4;
          v19 = 136316162;
          v20 = v13;
          v21 = 2080;
          v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
          v23 = 1024;
          v24 = 164;
          v25 = 1024;
          v26 = v15;
          v27 = 1024;
          v28 = v11;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting kCMSessionProperty_IsSharePlayCapableCallSession=%d failed, result=%d", (uint8_t *)&v19, 0x28u);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = *a4;
        v19 = 136315906;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCAudioSessionCMS shouldSetupSharePlayWithOperatingMode:isSharePlayCapable:]";
        v23 = 1024;
        v24 = 166;
        v25 = 1024;
        v26 = v18;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set kCMSessionProperty_IsSharePlayCapableCallSession=%d returned with no failure", (uint8_t *)&v19, 0x22u);
      }
    }
  }
  return 0;
}

- (BOOL)setSampleRate:(double)a3
{
  uint64_t valuePtr;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->super._isTetheredDisplayMode)
    a3 = 48000.0;
  v6 = a3;
  valuePtr = 0;
  VCCMSessionStub_CMSessionCopyProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioSessionCMS setSampleRate:].cold.1();
  }
  return 0;
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  const __CFAllocator *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  CFNumberRef v12;
  uint64_t v13;
  NSObject *v14;
  CFNumberRef number;
  int v16;
  double valuePtr;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  _WORD v28[8];
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  valuePtr = a4;
  v16 = 0;
  if (self->super._isTetheredDisplayMode)
  {
    valuePtr = 48000.0;
    a4 = 48000.0;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a5)
    goto LABEL_9;
  number = 0;
  v9 = VCCMSessionStub_CMSessionCopyProperty();
  v16 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v19 = v10;
      v20 = 2080;
      v21 = "-[VCAudioSessionCMS setBlockSize:sampleRate:force:]";
      v22 = 1024;
      v23 = 228;
      v24 = 1024;
      v25 = v9;
      v26 = 1040;
      v27 = 4;
      v28[0] = 2080;
      *(_QWORD *)&v28[1] = &v16;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_CurrentAudioHardwareSampleRate failed result=%d, result=%.4s", buf, 0x32u);
      v9 = v16;
    }
  }
  if (!v9)
  {
    a4 = valuePtr;
    if (self->super._hardwareSampleRate != valuePtr)
    {
LABEL_9:
      LODWORD(number) = llround(a4 * a3);
      -[VCAudioSession forceBufferFrames:](self, "forceBufferFrames:", &number);
      v12 = CFNumberCreate(v8, kCFNumberSInt32Type, &number);
      v16 = VCCMSessionStub_CMSessionSetProperty();
      CFRelease(v12);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v19 = v13;
          v20 = 2080;
          v21 = "-[VCAudioSessionCMS setBlockSize:sampleRate:force:]";
          v22 = 1024;
          v23 = 241;
          v24 = 1024;
          v25 = (int)number;
          v26 = 1024;
          v27 = v16;
          v28[0] = 1024;
          *(_DWORD *)&v28[1] = v5;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_PreferredAudioHardwareIOBufferFrames: blockSize=%d, result=%d, force=%d", buf, 0x2Eu);
        }
      }
      self->super._hardwareSampleRate = valuePtr;
    }
  }
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
  int v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = VCCMSessionStub_CMSessionSetProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioSessionCMS setVPBlockConfigurationProperties:]";
      v13 = 1024;
      v14 = 248;
      v15 = 2080;
      v16 = v7;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration vpBlockDict=%s, result=%d", (uint8_t *)&v9, 0x2Cu);
    }
  }
  return v4 == 0;
}

- (void)applyClientPid
{
  CFNumberRef v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  valuePtr = -[VCAudioSessionMediaProperties processId](-[VCAudioSessionClient mediaProperties](self->super._activeClient, "mediaProperties"), "processId");
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  v3 = VCCMSessionStub_CMSessionSetProperty();
  CFRelease(v2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCAudioSessionCMS applyClientPid]";
      v11 = 1024;
      v12 = 258;
      v13 = 1024;
      v14 = valuePtr;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_ClientPID processId=%d, result=%d", buf, 0x28u);
    }
  }
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioSessionCMS applyAudioSessionMediaProperties:]";
      v13 = 1024;
      v14 = 262;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  -[VCAudioSessionCMS applyClientPid](self, "applyClientPid");
  v8.receiver = self;
  v8.super_class = (Class)VCAudioSessionCMS;
  return -[VCAudioSession applyAudioSessionMediaProperties:](&v8, sel_applyAudioSessionMediaProperties_, a3);
}

- (BOOL)startInternal
{
  int v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  BOOL isInterrupted;
  BOOL result;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = VCCMSessionStub_CMSessionBeginInterruption();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v5 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCAudioSessionCMS startInternal]";
      v17 = 1024;
      v18 = 272;
      v19 = 1024;
      v20 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCMSessionStub_CMSessionBeginInterruption result=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  v8 = VCCMSessionStub_CMSessionSetProperty();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCAudioSessionCMS startInternal]";
      v17 = 1024;
      v18 = 276;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_IsPlaying YES result=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  if (v3)
    isInterrupted = self->super._isInterrupted;
  else
    isInterrupted = 0;
  result = v3 == 0;
  self->super._isInterrupted = isInterrupted;
  return result;
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
  opaqueCMSession **p_cmSession;
  BOOL v5;
  int CMSession;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  int v14;
  unsigned int audioSessionId;
  __CFNotificationCenter *LocalCenter;
  uint64_t v17;
  NSObject *v18;
  uint64_t sessionPid;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_cmSession = &self->_cmSession;
  if (self->_cmSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:].cold.1();
    }
    return 0;
  }
  else
  {
    self->super._sessionPid = objc_msgSend(a3, "processId");
    CMSession = VCCMSessionStub_AudioSessionCreateCMSession();
    v5 = CMSession == 0;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (CMSession)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          sessionPid = self->super._sessionPid;
          v20 = 136316162;
          v21 = v17;
          v22 = 2080;
          v23 = "-[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:]";
          v24 = 1024;
          v25 = 290;
          v26 = 1024;
          v27 = CMSession;
          v28 = 2048;
          v29 = sessionPid;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CMSessionCreate failed err=%d, _sessionPid=%ld", (uint8_t *)&v20, 0x2Cu);
        }
      }
      if (-[NSMutableArray count](self->super._clients, "count") && *p_cmSession)
      {
        CFRelease(*p_cmSession);
        *p_cmSession = 0;
        VCCMSessionStub_AudioSessionDestroyCMSession();
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 6)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = self->super._sessionPid;
          audioSessionId = self->super._audioSessionId;
          v20 = 136316162;
          v21 = v12;
          v22 = 2080;
          v23 = "-[VCAudioSessionCMS startSessionWithMediaProperties:sessionRef:]";
          v24 = 1024;
          v25 = 292;
          v26 = 1024;
          v27 = v14;
          v28 = 1024;
          LODWORD(v29) = audioSessionId;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created session for _sessionPid=%d, _audioSessionId=%u", (uint8_t *)&v20, 0x28u);
        }
      }
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_InterruptionListenerCallback, (CFStringRef)*MEMORY[0x1E0D493E0], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
      self->super._operatingMode = objc_msgSend(a3, "operatingMode");
      if (self->super._playbackMode)
        -[VCAudioSessionCMS applyAudioSessionMediaPropertiesForSystemAudio](self, "applyAudioSessionMediaPropertiesForSystemAudio");
      else
        -[VCAudioSessionCMS applyAudioSessionPropertiesWithVPOperatingMode:](self, "applyAudioSessionPropertiesWithVPOperatingMode:", objc_msgSend(a3, "vpOperatingMode"));
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_AvailableSampleRateChangeListenerCallback, (CFStringRef)*MEMORY[0x1E0D49398], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
      -[VCAudioSessionCMS refreshAudioOuputLatencyWithReason:](self, "refreshAudioOuputLatencyWithReason:", 0);
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)VCAudioSession_ActiveAudioRouteDidChange, (CFStringRef)*MEMORY[0x1E0D49350], *p_cmSession, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (a4 && *p_cmSession)
      *a4 = CFHash(*p_cmSession);
  }
  return v5;
}

- (BOOL)stopSession
{
  __CFNotificationCenter *LocalCenter;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int sessionPid;
  unsigned int audioSessionId;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_cmSession)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0D49350], self->_cmSession);
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0D49398], self->_cmSession);
    CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0D493E0], self->_cmSession);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315650;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS stopSession]";
        v19 = 1024;
        v20 = 341;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCMSessionProperty_IsPlaying to false", (uint8_t *)&v15, 0x1Cu);
      }
    }
    VCCMSessionStub_CMSessionSetProperty();
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315650;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS stopSession]";
        v19 = 1024;
        v20 = 344;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ending CMSessionInteruption", (uint8_t *)&v15, 0x1Cu);
      }
    }
    VCCMSessionStub_CMSessionEndInterruption();
    VCCMSessionStub_CMSessionNotificationBarrier();
    CFRelease(self->_cmSession);
    self->_cmSession = 0;
    VCCMSessionStub_AudioSessionDestroyCMSession();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        sessionPid = self->super._sessionPid;
        audioSessionId = self->super._audioSessionId;
        v15 = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS stopSession]";
        v19 = 1024;
        v20 = 350;
        v21 = 1024;
        v22 = sessionPid;
        v23 = 1024;
        v24 = audioSessionId;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Releasing session for _sessionPid=%d, _audioSessionId=%u", (uint8_t *)&v15, 0x28u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioSessionCMS stopSession].cold.1();
  }
  return 0;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  void *v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  VCAudioSessionCMS *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = objc_msgSend(v4, "stringWithFormat:", CFSTR("Setting microphone muted is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks"), class_getName(v5));
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v7;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS setMicrophoneMuted:]";
        v19 = 1024;
        v20 = 358;
        v21 = 2112;
        v22 = v6;
        v9 = " [%s] %s:%d %@";
        v10 = v8;
        v11 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCAudioSessionCMS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS setMicrophoneMuted:]";
        v19 = 1024;
        v20 = 358;
        v21 = 2112;
        v22 = (uint64_t)v12;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v6;
        v9 = " [%s] %s:%d %@(%p) %@";
        v10 = v14;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("_VCAudioSessionCMS_UnsupportedOperationException"), v6, 0));
}

- (BOOL)microphoneMuted
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  VCAudioSessionCMS *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = objc_msgSend(v3, "stringWithFormat:", CFSTR("Fetching microphone muted is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks"), class_getName(v4));
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS microphoneMuted]";
        v19 = 1024;
        v20 = 364;
        v21 = 2112;
        v22 = v5;
        v8 = " [%s] %s:%d %@";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioSessionCMS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCAudioSessionCMS microphoneMuted]";
        v19 = 1024;
        v20 = 364;
        v21 = 2112;
        v22 = (uint64_t)v11;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v5;
        v8 = " [%s] %s:%d %@(%p) %@";
        v9 = v13;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("_VCAudioSessionCMS_UnsupportedOperationException"), v5, 0));
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
  void *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  VCAudioSessionCMS *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = objc_msgSend(v5, "stringWithFormat:", CFSTR("Listening for microphone mute state changed events is unsupported for class=%s, please ensure client paths are guarded with the appropriate feature flag checks"), class_getName(v6));
  if ((VCAudioSessionCMS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v8;
        v18 = 2080;
        v19 = "-[VCAudioSessionCMS setMuteStateChangedHandler:delegateQueue:]";
        v20 = 1024;
        v21 = 371;
        v22 = 2112;
        v23 = v7;
        v10 = " [%s] %s:%d %@";
        v11 = v9;
        v12 = 38;
LABEL_11:
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCAudioSessionCMS performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v14;
        v18 = 2080;
        v19 = "-[VCAudioSessionCMS setMuteStateChangedHandler:delegateQueue:]";
        v20 = 1024;
        v21 = 371;
        v22 = 2112;
        v23 = (uint64_t)v13;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = v7;
        v10 = " [%s] %s:%d %@(%p) %@";
        v11 = v15;
        v12 = 58;
        goto LABEL_11;
      }
    }
  }
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("_VCAudioSessionCMS_UnsupportedOperationException"), v7, 0));
}

- (void)didBeginQuietTime
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCAudioSessionCMS didBeginQuietTime]";
      v8 = 1024;
      v9 = 379;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore interruption", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)didEndQuietTime
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCAudioSessionCMS didEndQuietTime]";
      v8 = 1024;
      v9 = 384;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore interruption", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)handleSecureMicNotificationWithInterruptionInfo:(__CFDictionary *)a3
{
  const __CFNumber *Value;
  int v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Value = (const __CFNumber *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0D49268]);
  if (!Value)
    return;
  valuePtr = -1;
  if (!CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v17 = v8;
    v18 = 2080;
    v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
    v20 = 1024;
    v21 = 394;
    v10 = " [%s] %s:%d No interruption reason provided";
    v11 = v9;
    v12 = 28;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return;
  }
  v4 = valuePtr;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 != 1)
  {
    if (ErrorLogLevelForModule < 6)
      return;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315906;
    v17 = v13;
    v18 = 2080;
    v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
    v20 = 1024;
    v21 = 403;
    v22 = 1024;
    v23 = valuePtr;
    v10 = " [%s] %s:%d Interruption reason=%d";
    v11 = v14;
    v12 = 34;
    goto LABEL_14;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = v6;
      v18 = 2080;
      v19 = "-[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:]";
      v20 = 1024;
      v21 = 399;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secure microphone engaged interruption reason", buf, 0x1Cu);
    }
  }
  -[VCAudioClientManager secureMicrophoneEngagedNotification](+[VCAudioClientManager sharedInstance](VCAudioClientManager, "sharedInstance"), "secureMicrophoneEngagedNotification");
}

- (void)handleAudioInterruption:(opaqueCMSession *)a3 interruptionInfo:(__CFDictionary *)a4
{
  const __CFNumber *Value;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  Value = (const __CFNumber *)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E0D49260]);
  valuePtr = -1431655766;
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = valuePtr;
      if (a4)
        v11 = (const char *)objc_msgSend((id)-[__CFDictionary description](a4, "description"), "UTF8String");
      else
        v11 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:]";
      v19 = 1024;
      v20 = 413;
      v21 = 1024;
      v22 = v10;
      v23 = 2080;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interruptionValue=%d, interruptInfo=%s", buf, 0x2Cu);
    }
  }
  if (self->_cmSession == a3)
  {
    switch(valuePtr)
    {
      case 0:
        -[VCAudioSessionCMS handleSecureMicNotificationWithInterruptionInfo:](self, "handleSecureMicNotificationWithInterruptionInfo:", a4);
        -[VCAudioSession didStop](self, "didStop");
        break;
      case 1:
        -[VCAudioSession didInterruptionEnded](self, "didInterruptionEnded");
        break;
      case 2:
        -[VCAudioSessionCMS didBeginQuietTime](self, "didBeginQuietTime");
        break;
      case 3:
        -[VCAudioSessionCMS didEndQuietTime](self, "didEndQuietTime");
        break;
      case 4:
        -[VCAudioSession didPause](self, "didPause");
        break;
      case 5:
        -[VCAudioSession didResume](self, "didResume");
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v16 = v12;
            v17 = 2080;
            v18 = "-[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:]";
            v19 = 1024;
            v20 = 440;
            v21 = 1024;
            v22 = valuePtr;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unhandled session interruption: interruptionValue=%u", buf, 0x22u);
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioSessionCMS handleAudioInterruption:interruptionInfo:].cold.1();
  }
}

- (void)setupInputBeamforming
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCAudioSessionCMS setupInputBeamforming]";
  v6 = 1024;
  v7 = 480;
  v8 = 1040;
  v9 = 4;
  v10 = v0;
  v11 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d kCMSessionProperty_SelectableInputs failed err=%.4s", v3, 0x2Cu);
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
  CFDictionaryRef *p_micSourceBack;
  uint64_t v6;
  NSObject *v7;
  CFDictionaryRef v8;
  const char *v9;
  uint64_t v10;
  CFDictionaryRef v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  CFDictionaryRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (a3 == 1)
  {
    p_micSourceBack = (CFDictionaryRef *)&self->super._micSourceBack;
    if (self->super._micSourceBack)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_12;
      v10 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v11 = *p_micSourceBack;
      v13 = 136315906;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCAudioSessionCMS internalSelectMicrophoneWithType:]";
      v17 = 1024;
      v18 = 508;
      v19 = 2112;
      v20 = v11;
      v9 = " [%s] %s:%d applying back microphone preference _micSourceBack=%@";
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    p_micSourceBack = (CFDictionaryRef *)&self->super._micSourceFront;
    if (self->super._micSourceFront)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_12;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v8 = *p_micSourceBack;
      v13 = 136315906;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCAudioSessionCMS internalSelectMicrophoneWithType:]";
      v17 = 1024;
      v18 = 505;
      v19 = 2112;
      v20 = v8;
      v9 = " [%s] %s:%d applying front microphone preference _micSourceFront=%@";
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x26u);
LABEL_12:
      VCMicrophonePreferencesCMS_ApplyMicrophonePreferences((int)self->_cmSession, *p_micSourceBack);
    }
  }
  self->super._selectedMicrophone = a3;
  return 1;
}

- (BOOL)readSessionProperty:(__CFString *)a3 floatValue:(float *)a4
{
  int v5;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *a4 = NAN;
  v5 = VCCMSessionStub_CMSessionCopyProperty();
  if (v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCAudioSessionCMS readSessionProperty:floatValue:]";
        v13 = 1024;
        v14 = 519;
        v15 = 2112;
        v16 = a3;
        v17 = 1024;
        v18 = v5;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to read property=%@. error=%d", buf, 0x2Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioSessionCMS readSessionProperty:floatValue:].cold.1();
  }
  return v5 == 0;
}

- (void)refreshAudioOuputLatencyWithReason:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  double externalInputAudioLatency;
  double externalOutputAudioLatency;
  float v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = NAN;
  if (-[VCAudioSessionCMS readSessionProperty:floatValue:](self, "readSessionProperty:floatValue:", *MEMORY[0x1E0D49690], &v9))
  {
    -[VCAudioSessionCMS setExternalInputAudioLatency:](self, "setExternalInputAudioLatency:", v9);
  }
  if (-[VCAudioSessionCMS readSessionProperty:floatValue:](self, "readSessionProperty:floatValue:", *MEMORY[0x1E0D496B8], &v9))
  {
    -[VCAudioSessionCMS setExternalOutputAudioLatency:](self, "setExternalOutputAudioLatency:", v9);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      externalInputAudioLatency = self->_externalInputAudioLatency;
      externalOutputAudioLatency = self->_externalOutputAudioLatency;
      *(_DWORD *)buf = 136316418;
      v11 = v5;
      v12 = 2080;
      v13 = "-[VCAudioSessionCMS refreshAudioOuputLatencyWithReason:]";
      v14 = 1024;
      v15 = 536;
      v16 = 2112;
      v17 = a3;
      v18 = 2048;
      v19 = externalInputAudioLatency;
      v20 = 2048;
      v21 = externalOutputAudioLatency;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received audio route changed with audioSessionRouteChangeReason=%@ new externalInputAudioLatency=%f externalOutputAudioLatency=%f", buf, 0x3Au);
    }
  }
}

- (void)didAudioRouteChangeWithUserInfo:(__CFDictionary *)a3
{
  const void *Value;
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0D49E40]);
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCAudioSessionCMS_didAudioRouteChangeWithUserInfo___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = Value;
  dispatch_async(dispatchQueue, block);
}

uint64_t __53__VCAudioSessionCMS_didAudioRouteChangeWithUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshAudioOuputLatencyWithReason:", *(_QWORD *)(a1 + 40));
}

- (opaqueCMSession)cmSession
{
  return self->_cmSession;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (void)setExternalInputAudioLatency:(double)a3
{
  self->_externalInputAudioLatency = a3;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)setExternalOutputAudioLatency:(double)a3
{
  self->_externalOutputAudioLatency = a3;
}

- (void)applyRequestedProperty:defaultValue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error: _cmSession is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperty:defaultValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Setting propertyKey=%@ failed, value is nil.");
  OUTLINED_FUNCTION_3();
}

- (void)applyRequestedProperties:propertyOrder:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to batch set request properties=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setSampleRate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error Getting kCMSessionProperty_PreferredOutputSampleRate result=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setSampleRate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate sample rate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setSampleRate:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error Setting kCMSessionProperty_PreferredOutputSampleRate result=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startSessionWithMediaProperties:sessionRef:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid state... ????", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopSession
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session already stopped ?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleAudioInterruption:interruptionInfo:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected session reference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)readSessionProperty:floatValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Value returned for property=%@ is nil!");
  OUTLINED_FUNCTION_3();
}

@end
