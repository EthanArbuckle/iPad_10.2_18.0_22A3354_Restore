@implementation VCMediaRecorderLocal

- (VCMediaRecorderLocal)initWithStreamToken:(int64_t)a3 configuration:(id)a4 reportingAgent:(opaqueRTCReporting *)a5
{
  VCMediaRecorderLocal *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  VCMediaRecorderLocal *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaRecorderLocal;
  v6 = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:](&v13, sel_initWithStreamToken_delegate_reportingAgent_);
  if (v6)
  {
    v6->_configuration = (VCMediaRecorderConfiguration *)a4;
    v6->_audioSessionId = VCUniqueIDGenerator_GenerateID();
    v7 = -[VCMediaRecorderConfiguration mediaAvailability](v6->_configuration, "mediaAvailability");
    if ((v7 & 2) != 0)
    {
      -[VCMediaRecorder setCapabilities:](v6, "setCapabilities:", 2);
      if (!-[VCMediaRecorderLocal configureVideoRecording](v6, "configureVideoRecording"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:].cold.3();
        }
        goto LABEL_10;
      }
      if (!-[VCMediaRecorderLocal registerForCameraCapture](v6, "registerForCameraCapture"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:].cold.2();
        }
        goto LABEL_10;
      }
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorderLocal-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v15 = v8;
          v16 = 2080;
          v17 = "-[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]";
          v18 = 1024;
          v19 = 38;
          v20 = 2048;
          v21 = v6;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-init (%p) video started", buf, 0x26u);
        }
      }
    }
    if ((-[VCMediaRecorderConfiguration mediaAvailability](v6->_configuration, "mediaAvailability") & 1) != 0)
    {
      -[VCMediaRecorder setCapabilities:](v6, "setCapabilities:", 2);
      -[VCMediaRecorderLocal setupSpatialAudio](v6, "setupSpatialAudio");
      if (!-[VCMediaRecorderLocal startAudio](v6, "startAudio"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:].cold.1();
        }
        goto LABEL_10;
      }
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorderLocal-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v15 = v10;
          v16 = 2080;
          v17 = "-[VCMediaRecorderLocal initWithStreamToken:configuration:reportingAgent:]";
          v18 = 1024;
          v19 = 46;
          v20 = 2048;
          v21 = v6;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-init (%p) audio started", buf, 0x26u);
        }
      }
    }
    else if ((v7 & 2) == 0)
    {
LABEL_10:

      return 0;
    }
  }
  return v6;
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCMediaRecorderLocal *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderLocal;
  -[VCMediaRecorder invalidate](&v5, sel_invalidate);
  -[VCObject reportingAgent](self, "reportingAgent");
  VCReporting_finalizeAggregation();
  -[VCMediaRecorderLocal deregisterForCameraCapture](self, "deregisterForCameraCapture");
  -[VCAudioIO stop](self->_audioIO, "stop");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorderLocal-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCMediaRecorderLocal invalidate]";
      v10 = 1024;
      v11 = 62;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-invalidate (%p)", buf, 0x26u);
    }
  }
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCMediaRecorderLocal *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];

  -[VCMediaRecorderLocal cleanupSpatialAudio](self, "cleanupSpatialAudio");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorderLocal-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCMediaRecorderLocal dealloc]";
      v10 = 1024;
      v11 = 70;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorderLocal-dealloc (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorderLocal;
  -[VCMediaRecorder dealloc](&v5, sel_dealloc);
}

- (tagVCAudioIOConfiguration)defaultAudioIOConfig
{
  unsigned int IntValueForKey;
  unsigned int v6;
  __int128 v7;
  unsigned int audioSessionId;
  tagVCAudioIOConfiguration *result;

  IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceAudioSampleRate"), 24000);
  v6 = (VCDefaults_GetDoubleValueForKey(CFSTR("forceAudioBlockSize"), 0.02) * (double)IntValueForKey);
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var4 = v7;
  *(_OWORD *)&retstr->var8 = v7;
  *(_OWORD *)&retstr->var12 = v7;
  *(_OWORD *)&retstr->var14 = v7;
  *(_OWORD *)&retstr->var16 = v7;
  *(_OWORD *)&retstr->var19.delegate = v7;
  *(_OWORD *)&retstr->var19.clientContext = v7;
  *(_OWORD *)&retstr->var19.captionsCoordinator = v7;
  *(_OWORD *)&retstr->var19.injector = v7;
  *(_OWORD *)&retstr->var20.clientCallback = v7;
  *(_OWORD *)&retstr->var20.captionsToken = v7;
  *(_OWORD *)&retstr->var20.captionsUseSecondaryThread = v7;
  audioSessionId = self->_audioSessionId;
  *(_OWORD *)&retstr->var21 = v7;
  retstr->var0 = audioSessionId;
  *(_OWORD *)&retstr->var1 = xmmword_1D910D830;
  *(_WORD *)&retstr->var5 = 2;
  retstr->var7 = 0;
  result = (tagVCAudioIOConfiguration *)-[VCMediaRecorderConfiguration clientPid](self->_configuration, "clientPid");
  retstr->var8 = (int)result;
  retstr->var9 = IntValueForKey;
  retstr->var10 = v6;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var15 = 0;
  retstr->var16 = 0;
  retstr->var14 = 0;
  *(_WORD *)&retstr->var17 = 0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  *(_OWORD *)&retstr->var19.injector = 0u;
  retstr->var20.clientCallback = _VCMediaRecorderLocal_PushAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (void)setupSpatialAudio
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
  {
    v3 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", self->_audioSessionId, 1, 32, 0);
    if (v3 < 0)
    {
      v4 = v3;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315906;
          v8 = v5;
          v9 = 2080;
          v10 = "-[VCMediaRecorderLocal setupSpatialAudio]";
          v11 = 1024;
          v12 = 107;
          v13 = 1024;
          v14 = v4;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to register for spatial audio. status=%08x", (uint8_t *)&v7, 0x22u);
        }
      }
    }
  }
}

- (void)cleanupSpatialAudio
{
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
    objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "unregisterAudioSessionId:", self->_audioSessionId);
}

- (BOOL)startAudio
{
  __int128 v3;
  VCAudioIO *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = v3;
  v19 = v3;
  v16 = v3;
  v17 = v3;
  v14 = v3;
  v15 = v3;
  v12 = v3;
  v13 = v3;
  v10 = v3;
  v11 = v3;
  v8 = v3;
  v9 = v3;
  v6 = v3;
  v7 = v3;
  if (self)
  {
    -[VCMediaRecorderLocal defaultAudioIOConfig](self, "defaultAudioIOConfig", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
  }
  v4 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", &v6);
  self->_audioIO = v4;
  if (v4)
  {
    if (-[VCAudioIO start](v4, "start"))
    {

      self->_audioIO = 0;
      -[VCMediaRecorderLocal cleanupSpatialAudio](self, "cleanupSpatialAudio");
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (BOOL)registerForCameraCapture
{
  return objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForFrames:", self);
}

- (void)deregisterForCameraCapture
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
  VCMediaRecorder_ClearHistoryBuffer((uint64_t)self);
  VCMediaRecorder_StopProcessingAllRequests((uint64_t)self);
}

- (BOOL)configureVideoRecording
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  BOOL v8;

  v3 = (void *)VCVideoCaptureServer_CopyLocalVideoAttributes((uint64_t)+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"));
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderLocal configureVideoRecording].cold.1();
    }
    goto LABEL_14;
  }
  v4 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyLocalScreenAttributesForVideoAttributes:", v3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderLocal configureVideoRecording].cold.2();
    }
LABEL_14:
    v5 = 0;
    goto LABEL_18;
  }
  v5 = (void *)v4;
  VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self, v4);
  v6 = -[VCMediaRecorderLocal supportedVideoCodec](self, "supportedVideoCodec");
  if ((_DWORD)v6 != 128)
  {
    -[VCMediaRecorder setVideoCodec:](self, "setVideoCodec:", v6);
    *(float *)&v7 = (float)(int)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "bestCameraCaptureFrameRate");
    -[VCMediaRecorder setFrameRate:](self, "setFrameRate:", v7);
    v8 = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaRecorderLocal configureVideoRecording].cold.3();
  }
LABEL_18:
  v8 = 0;
LABEL_5:

  if (!v8)
    -[VCMediaRecorderLocal deregisterForCameraCapture](self, "deregisterForCameraCapture");
  return v8;
}

- (int)supportedVideoCodec
{
  id v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[VCVideoRuleCollectionsMediaRecorder mediaRecorderVideoCodecs](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderVideoCodecs");
  if (v2)
  {
    if (objc_msgSend(v2, "containsObject:", &unk_1E9EF5408)
      && +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
    {
      v3 = 100;
    }
    else
    {
      v3 = 123;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCMediaRecorderLocal supportedVideoCodec]";
        v11 = 1024;
        v12 = 199;
        v13 = 1024;
        v14 = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using video codec=%u", (uint8_t *)&v7, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderLocal supportedVideoCodec].cold.1();
    }
    return 128;
  }
  return v3;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  VCMediaRecorder_AddLocalVideoSampleBuffer((uint64_t)self, a3, a5->var6, ((double)a4->var0 / (double)a4->var1 * 1000.0));
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  double v3;

  *(float *)&v3 = (float)a3;
  -[VCMediaRecorder setFrameRate:](self, "setFrameRate:", v3);
}

- (id)clientCaptureRule
{
  return 0;
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.1()
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start audio, streamToken=%u", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.2()
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register for video frames, streamToken=%u", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:configuration:reportingAgent:.cold.3()
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure video recording, streamToken=%u", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)configureVideoRecording
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get valid video codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)supportedVideoCodec
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get supported video codecs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
