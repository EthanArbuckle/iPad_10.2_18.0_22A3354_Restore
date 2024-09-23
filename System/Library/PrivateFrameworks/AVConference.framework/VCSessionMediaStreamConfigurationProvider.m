@implementation VCSessionMediaStreamConfigurationProvider

- (VCSessionMediaStreamConfigurationProvider)initWithStreamIDGenerator:(id)a3 sessionMode:(int64_t)a4 supportedAudioRules:(id)a5
{
  VCSessionMediaStreamConfigurationProvider *v8;
  VCSessionMediaStreamConfigurationProvider *v9;
  VCIDSStreamIDGenerator *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCSessionMediaStreamConfigurationProvider *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCSessionMediaStreamConfigurationProvider;
  v8 = -[VCSessionMediaStreamConfigurationProvider init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    _audioStreamConfigurationsCount = 0;
    v8->_sessionMode = a4;
    v10 = (VCIDSStreamIDGenerator *)a3;
    v9->_streamIDGenerator = v10;
    if (v10)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9->_audioStreamConfigurations = v11;
      if (v11)
      {
        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9->_videoStreamConfigurations = v12;
        if (v12)
        {
          if (-[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:](v9, "initializeStreamsWithSupportedAudioRules:", a5))
          {
            return v9;
          }
          if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:].cold.4();
            }
            goto LABEL_48;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v17 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](v9, "performSelector:", sel_logPrefix);
          else
            v17 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            v19 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v26 = v23;
              v27 = 2080;
              v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
              v29 = 1024;
              v30 = 399;
              v31 = 2112;
              v32 = v17;
              v33 = 2048;
              v34 = v9;
              v20 = " [%s] %s:%d %@(%p) Failed to initialize streams";
              goto LABEL_47;
            }
          }
LABEL_48:

          return 0;
        }
        if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:].cold.3();
          }
          goto LABEL_48;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](v9, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_48;
        v22 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        *(_DWORD *)buf = 136316162;
        v26 = v22;
        v27 = 2080;
        v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
        v29 = 1024;
        v30 = 396;
        v31 = 2112;
        v32 = v16;
        v33 = 2048;
        v34 = v9;
        v20 = " [%s] %s:%d %@(%p) Failed to allocate video stream array";
      }
      else
      {
        if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:].cold.2();
          }
          goto LABEL_48;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](v9, "performSelector:", sel_logPrefix);
        else
          v15 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_48;
        v21 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        *(_DWORD *)buf = 136316162;
        v26 = v21;
        v27 = 2080;
        v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
        v29 = 1024;
        v30 = 393;
        v31 = 2112;
        v32 = v15;
        v33 = 2048;
        v34 = v9;
        v20 = " [%s] %s:%d %@(%p) Failed to allocate audio stream array";
      }
    }
    else
    {
      if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:].cold.1();
        }
        goto LABEL_48;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](v9, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_48;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_DWORD *)buf = 136316162;
      v26 = v18;
      v27 = 2080;
      v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
      v29 = 1024;
      v30 = 390;
      v31 = 2112;
      v32 = v14;
      v33 = 2048;
      v34 = v9;
      v20 = " [%s] %s:%d %@(%p) Invalid stream ID generator provided";
    }
LABEL_47:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x30u);
    goto LABEL_48;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaStreamConfigurationProvider;
  -[VCSessionMediaStreamConfigurationProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)initializeStreamsWithSupportedAudioRules:(id)a3
{
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSessionMediaStreamConfigurationProvider *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:](self, "initializeAudioStreamsWithSupportedRules:", a3))
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_25;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      v12 = 136316162;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]";
      v16 = 1024;
      v17 = 420;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = self;
      v9 = " [%s] %s:%d %@(%p) Audio Stream initialization failed";
LABEL_24:
      _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0x30u);
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      -[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:].cold.2();
    }
LABEL_25:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (!-[VCSessionMediaStreamConfigurationProvider initializeVideoStreams](self, "initializeVideoStreams"))
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_25;
      v10 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      v12 = 136316162;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]";
      v16 = 1024;
      v17 = 424;
      v18 = 2112;
      v19 = v6;
      v20 = 2048;
      v21 = self;
      v9 = " [%s] %s:%d %@(%p) Video Stream initialization failed";
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      -[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:].cold.1();
    }
    goto LABEL_25;
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)initializeVideoStreams
{
  _BOOL4 v3;
  uint64_t v4;
  int64_t *v5;
  int64_t v6;
  const __CFString *v7;
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
  VCSessionMediaStreamConfigurationProvider *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings isVideoRenderingSupported](VCHardwareSettings, "isVideoRenderingSupported"))
  {
    if (-[VCDefaults forceMultiwayHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceMultiwayHWI"))
    {
      LOBYTE(v3) = -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults](self, "initializeVideoStreamWithDefaults");
    }
    else
    {
      v4 = 0;
      self->_videoStreamConfigurationsCount = 7;
      v5 = &_videoStreamConfigs;
      while (-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:](self, "initializeVideoStreamWithConfig:streamIndex:", v5, v4))
      {
        v6 = *v5;
        v5 += 6;
        self->_highestEncodingResolution = v6;
        if (++v4 >= (unint64_t)self->_videoStreamConfigurationsCount)
          goto LABEL_7;
      }
      if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v3)
            return v3;
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreams].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v3)
            return v3;
          v11 = 136316162;
          v12 = v8;
          v13 = 2080;
          v14 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreams]";
          v15 = 1024;
          v16 = 442;
          v17 = 2112;
          v18 = v7;
          v19 = 2048;
          v20 = self;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize video multiway stream", (uint8_t *)&v11, 0x30u);
        }
      }
      LOBYTE(v3) = 0;
    }
  }
  else
  {
LABEL_7:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (int)streamPayloadFromProviderConfig:(_VCMediaStreamConfigurationProviderVideo *)a3
{
  VCVideoRuleCollectionsCamera *v4;
  unsigned __int8 i;
  unsigned int v6;
  VCVideoRuleCollectionKey *v7;
  void *v8;

  v4 = +[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance");
  for (i = 1; ; ++i)
  {
    v6 = i;
    v7 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", a3->var6, i, 1);
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[VCVideoRuleCollections rules](v4, "rules"), "objectForKeyedSubscript:", v7);

    if (v8)
    {
      if (objc_msgSend(v8, "count"))
        break;
    }
    if (v6 >= 2)
      return 123;
  }
  return a3->var6;
}

- (BOOL)initializeVideoStreamWithConfig:(_VCMediaStreamConfigurationProviderVideo *)a3 streamIndex:(unsigned int)a4
{
  uint64_t v6;
  unsigned int var1;
  int64_t var0;
  char v11;
  VCMediaStreamMultiwayConfigVideo *v12;
  VCSessionParticipantVideoStreamConfig *v13;
  VCSessionParticipantVideoStreamConfig *v14;
  VCMediaStreamRateControlConfig *v15;
  VCMediaStreamRateControlConfig *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t var4;
  uint64_t var3;
  uint64_t v21;
  id v22;
  void *v23;
  BOOL v24;
  double v25;
  double v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  int64_t v32;
  uint64_t v33;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  VCSessionMediaStreamConfigurationProvider *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = -[VCSessionMediaStreamConfigurationProvider streamPayloadFromProviderConfig:](self, "streamPayloadFromProviderConfig:", a3, *(_QWORD *)&a4);
  var1 = a3->var1;
  if (var1 >= +[VCHardwareSettings maxMultiwayFramerateSupported](VCHardwareSettings, "maxMultiwayFramerateSupported"))var1 = +[VCHardwareSettings maxMultiwayFramerateSupported](VCHardwareSettings, "maxMultiwayFramerateSupported");
  var0 = a3->var0;
  if (a3->var0 == 16)
  {
    if (!+[VCHardwareSettings supportsMultiway720pStream](VCHardwareSettings, "supportsMultiway720pStream"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 1;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      *(_DWORD *)buf = 136315650;
      v50 = v27;
      v51 = 2080;
      v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
      v53 = 1024;
      v54 = 480;
      v29 = " [%s] %s:%d Device does not support 720p stream. Skipping this stream";
      goto LABEL_39;
    }
    var0 = a3->var0;
  }
  if (var0 == 20
    && !+[VCHardwareSettings supportsMultiway1080pStream](VCHardwareSettings, "supportsMultiway1080pStream"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v33 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_DWORD *)buf = 136315650;
    v50 = v33;
    v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    v53 = 1024;
    v54 = 484;
    v29 = " [%s] %s:%d Device does not support 1080p stream. Skipping this stream";
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x1Cu);
    return 1;
  }
  v11 = a3->var6 == 100 && (_DWORD)v6 == 123 && var1 > 0xF;
  v12 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (!v12)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:].cold.1();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v35 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v35 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_73;
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_DWORD *)buf = 136316162;
    v50 = v39;
    v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    v53 = 1024;
    v54 = 496;
    v55 = 2112;
    v56 = v35;
    v57 = 2048;
    v58 = self;
    v41 = " [%s] %s:%d %@(%p) Failed to create video multiway config";
    goto LABEL_85;
  }
  v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:].cold.2();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v36 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v42 = VRTraceErrorLogLevelToCSTR(),
          v40 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_73:
      v16 = 0;
      v14 = 0;
      goto LABEL_83;
    }
    *(_DWORD *)buf = 136316162;
    v50 = v42;
    v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    v53 = 1024;
    v54 = 499;
    v55 = 2112;
    v56 = v36;
    v57 = 2048;
    v58 = self;
    v41 = " [%s] %s:%d %@(%p) Failed to create video stream config";
LABEL_85:
    _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, v41, buf, 0x30u);
    goto LABEL_73;
  }
  v14 = v13;
  v15 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v15)
  {
    v16 = v15;
    v17 = var1 >> v11;
    v18 = -[VCIDSStreamIDGenerator generateSSRC:streamID:repairStreamID:v2StreamID:](self->_streamIDGenerator, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 1, a3->var7 != 0, 0);
    -[VCMediaStreamMultiwayConfig setSsrc:](v12, "setSsrc:", v18);
    -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v12, "setMaxNetworkBitrate:", a3->var3);
    -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v12, "setMaxMediaBitrate:", a3->var4);
    -[VCMediaStreamMultiwayConfig setQualityIndex:](v12, "setQualityIndex:", a3->var5);
    -[VCMediaStreamMultiwayConfig setIdsStreamID:](v12, "setIdsStreamID:", WORD2(v18));
    if (a3->var7)
    {
      -[VCMediaStreamMultiwayConfig setRepairedStreamID:](v12, "setRepairedStreamID:", HIWORD(v18));
      -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v12, "setRepairedMaxNetworkBitrate:", a3->var7);
    }
    -[VCMediaStreamMultiwayConfigVideo setResolution:](v12, "setResolution:", a3->var0);
    -[VCMediaStreamMultiwayConfigVideo setFramerate:](v12, "setFramerate:", v17);
    -[VCMediaStreamMultiwayConfigVideo setKeyFrameInterval:](v12, "setKeyFrameInterval:", a3->var2);
    -[VCMediaStreamMultiwayConfig setStartOnDemand:](v12, "setStartOnDemand:", +[VCSessionMediaStreamConfigurationProvider isVideoStreamOnDemand:](VCSessionMediaStreamConfigurationProvider, "isVideoStreamOnDemand:", a3));
    -[VCMediaStreamMultiwayConfig setNegotiationProtocolMask:](v12, "setNegotiationProtocolMask:", a3->var9);
    -[VCMediaStreamMultiwayConfig setRepairedFECLevel:](v12, "setRepairedFECLevel:", a3->var10);
    -[VCMediaStreamMultiwayConfigVideo addPayload:](v12, "addPayload:", v6);
    var3 = a3->var3;
    var4 = a3->var4;
    -[VCMediaStreamConfig setMultiwayConfig:](v14, "setMultiwayConfig:", v12);
    -[VCMediaStreamConfig setDirection:](v14, "setDirection:", 1);
    -[VCVideoStreamConfig setVideoResolution:](v14, "setVideoResolution:", a3->var0);
    -[VCVideoStreamConfig setFramerate:](v14, "setFramerate:", v17);
    -[VCVideoStreamConfig setKeyFrameInterval:](v14, "setKeyFrameInterval:", a3->var2);
    -[VCVideoStreamConfig setTxMinBitrate:](v14, "setTxMinBitrate:", var4);
    -[VCVideoStreamConfig setTxMaxBitrate:](v14, "setTxMaxBitrate:", a3->var4);
    -[VCVideoStreamConfig setRxMinBitrate:](v14, "setRxMinBitrate:", var3);
    -[VCVideoStreamConfig setRxMaxBitrate:](v14, "setRxMaxBitrate:", a3->var3);
    -[VCVideoStreamConfig setType:](v14, "setType:", 3);
    -[VCVideoStreamConfig setSourceFramerate:](v14, "setSourceFramerate:", 30);
    -[VCVideoStreamConfig setRemoteVideoInitialOrientation:](v14, "setRemoteVideoInitialOrientation:", 0);
    -[VCMediaStreamConfig setRemoteSSRC:](v14, "setRemoteSSRC:", -[VCIDSStreamIDGenerator generateSSRC](self->_streamIDGenerator, "generateSSRC"));
    -[VCMediaStreamConfig setRateControlConfig:](v14, "setRateControlConfig:", v16);
    -[VCVideoStreamConfig setParameterSets:](v14, "setParameterSets:", VCVideoParamaterSets_DefaultSupportedSets(v6));
    -[VCMediaStreamConfig setRtpTimestampRate:](v14, "setRtpTimestampRate:", 24000);
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](v14, "addTxPayloadType:networkPayload:", v6, v6);
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](v14, "addRxPayloadType:networkPayload:", v6, v6);
    if (-[VCMediaStreamMultiwayConfig isOneToOne](v12, "isOneToOne"))
      v21 = 1;
    else
      v21 = 2;
    v22 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", v21);
    if (v22)
    {
      v23 = v22;
      v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
      v24 = 1;
      -[VCSessionParticipantVideoStreamConfig setupRxPayloads:featureStrings:](v14, "setupRxPayloads:featureStrings:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1), v23);
      v47 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
      -[VCSessionParticipantVideoStreamConfig setupTxPayloads:featureStrings:](v14, "setupTxPayloads:featureStrings:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1), v23);

      -[NSMutableArray addObject:](self->_videoStreamConfigurations, "addObject:", v14);
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", a3->var0);
      if (v26 == v25)
      {
        self->_isEncodingSqaures = 1;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v32 = a3->var0;
            *(_DWORD *)buf = 136315906;
            v50 = v30;
            v51 = 2080;
            v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
            v53 = 1024;
            v54 = 557;
            v55 = 1024;
            LODWORD(v56) = v32;
            _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoResolution is %d, not encoding squares", buf, 0x22u);
          }
        }
        v24 = 1;
      }
      goto LABEL_35;
    }
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:].cold.4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v38 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v38 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v50 = v45;
          v51 = 2080;
          v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
          v53 = 1024;
          v54 = 547;
          v55 = 2112;
          v56 = v38;
          v57 = 2048;
          v58 = self;
          _os_log_error_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create featureStrings", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v37 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v37 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v43 = VRTraceErrorLogLevelToCSTR();
        v44 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v50 = v43;
          v51 = 2080;
          v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
          v53 = 1024;
          v54 = 502;
          v55 = 2112;
          v56 = v37;
          v57 = 2048;
          v58 = self;
          _os_log_error_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", buf, 0x30u);
        }
      }
    }
    v16 = 0;
  }
LABEL_83:
  v24 = 0;
LABEL_35:

  return v24;
}

- (BOOL)initializeVideoStreamWithDefaults
{
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  BOOL v10;
  VCSessionMediaStreamConfigurationProvider *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  int v35;
  int64_t v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[10];
  VCSessionMediaStreamConfigurationProvider *v53;
  _BYTE v54[6];
  _BYTE v55[6];
  _BYTE v56[6];
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth"), -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v46 = v4;
      v47 = 2080;
      v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
      v49 = 1024;
      v50 = 571;
      v51 = 1024;
      *(_DWORD *)v52 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d force encode size width is %d, height is %d", buf, 0x28u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v46 = v6;
      v47 = 2080;
      v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
      v49 = 1024;
      v50 = 572;
      v51 = 1024;
      *(_DWORD *)v52 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video reolution is %d", buf, 0x22u);
    }
  }
  v36 = v3;
  v37 = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
  v38 = -[VCDefaults forceKeyFrameInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceKeyFrameInterval");
  v39 = ((double)(1000
                              * -[VCDefaults forceBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceBitrate"))* 1.2);
  v40 = 1000
      * -[VCDefaults forceBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceBitrate");
  v41 = 125;
  v42 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
  v43 = 0xAAAAAA0000000000;
  v44 = 0;
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", v3);
  if (v9 == v8)
    self->_isEncodingSqaures = 1;
  self->_highestEncodingResolution = v3;
  v10 = -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:](self, "initializeVideoStreamWithConfig:streamIndex:", &v36, 0xFFFFFFFFLL);
  v11 = (VCSessionMediaStreamConfigurationProvider *)objc_opt_class();
  if (v10)
  {
    if (v11 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
          v17 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
          v18 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
          v19 = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
          v20 = -[VCDefaults forceBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceBitrate");
          v21 = -[VCDefaults forceKeyFrameInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceKeyFrameInterval");
          *(_DWORD *)buf = 136317186;
          v46 = v14;
          v47 = 2080;
          v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
          v49 = 1024;
          v50 = 592;
          v51 = 1024;
          *(_DWORD *)v52 = v16;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v17;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = v18;
          HIWORD(v53) = 1024;
          *(_DWORD *)v54 = v19;
          *(_WORD *)&v54[4] = 1024;
          *(_DWORD *)v55 = v20;
          *(_WORD *)&v55[4] = 1024;
          *(_DWORD *)v56 = v21;
          v22 = " [%s] %s:%d Created video stream config with forceHWI to initialize video a multiway stream. Stream[Code"
                "c=%d,W=%d,H=%d,fps=%d,%xkbps, %dIDR/sec]";
          v23 = v15;
          v24 = 64;
LABEL_26:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v35 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
          v27 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
          v28 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
          v29 = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
          v30 = -[VCDefaults forceBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceBitrate");
          v31 = -[VCDefaults forceKeyFrameInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceKeyFrameInterval");
          *(_DWORD *)buf = 136317698;
          v46 = v25;
          v47 = 2080;
          v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
          v49 = 1024;
          v50 = 592;
          v51 = 2112;
          *(_QWORD *)v52 = v12;
          *(_WORD *)&v52[8] = 2048;
          v53 = self;
          *(_WORD *)v54 = 1024;
          *(_DWORD *)&v54[2] = v35;
          *(_WORD *)v55 = 1024;
          *(_DWORD *)&v55[2] = v27;
          *(_WORD *)v56 = 1024;
          *(_DWORD *)&v56[2] = v28;
          v57 = 1024;
          v58 = v29;
          v59 = 1024;
          v60 = v30;
          v61 = 1024;
          v62 = v31;
          v22 = " [%s] %s:%d %@(%p) Created video stream config with forceHWI to initialize video a multiway stream. Stre"
                "am[Codec=%d,W=%d,H=%d,fps=%d,%xkbps, %dIDR/sec]";
          v23 = v26;
          v24 = 84;
          goto LABEL_26;
        }
      }
    }
  }
  else if (v11 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v46 = v32;
        v47 = 2080;
        v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
        v49 = 1024;
        v50 = 589;
        v51 = 2112;
        *(_QWORD *)v52 = v13;
        *(_WORD *)&v52[8] = 2048;
        v53 = self;
        _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to forceHWI initialize video multiway stream", buf, 0x30u);
      }
    }
  }
  return v10;
}

+ (void)fixAudioStreamConfigurations
{
  int64_t v2;
  int v3;
  int v4;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  if (v2 == 8)
    v3 = 31867;
  else
    v3 = 31334;
  if (v2 == 8)
    v4 = 74000;
  else
    v4 = 73400;
  _audioStreamConfigs = v3;
  dword_1F01B9330 = v4;
  _audioStreamConfigurationsCount = v2 != 8;
}

- (void)audioStreamConfigs:(_VCMediaStreamConfigurationProviderAudio *)a3 configCount:(unsigned int *)a4
{
  _VCMediaStreamConfigurationProviderAudio *v7;
  unsigned int v8;

  +[VCSessionMediaStreamConfigurationProvider fixAudioStreamConfigurations](VCSessionMediaStreamConfigurationProvider, "fixAudioStreamConfigurations");
  v7 = (_VCMediaStreamConfigurationProviderAudio *)&_audioStreamConfigs;
  if (self->_sessionMode == 2)
    v7 = (_VCMediaStreamConfigurationProviderAudio *)&_spatialAudioStreamConfigs;
  if ((self->_sessionMode == 2) | _audioStreamConfigurationsCount & 1)
    v8 = 2;
  else
    v8 = 3;
  *a3 = v7;
  *a4 = v8;
}

+ (BOOL)audioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportsDeviceClass:(int64_t)a4
{
  unint64_t var11;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  var11 = a3->var11;
  if (!(_DWORD)var11)
    return 0;
  if (a3->var12[0] == a4)
    return 1;
  v6 = 0;
  do
  {
    v7 = v6;
    if (var11 - 1 == v6)
      break;
    v8 = a3->var12[++v6];
  }
  while (v8 != a4);
  return v7 + 1 < var11;
}

- (BOOL)initializeAudioStreamsWithSupportedRules:(id)a3
{
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const __CFString *v15;
  uint64_t v16;
  unsigned int v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCSessionMediaStreamConfigurationProvider *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v18 = 0;
  -[VCSessionMediaStreamConfigurationProvider audioStreamConfigs:configCount:](self, "audioStreamConfigs:configCount:", &v19, &v18);
  if (a3)
  {
    v5 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
    if (v18)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (+[VCSessionMediaStreamConfigurationProvider audioConfig:supportsDeviceClass:](VCSessionMediaStreamConfigurationProvider, "audioConfig:supportsDeviceClass:", v19 + v7, v6))
      {
        if (!-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:](self, "initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:", v19 + v7, v8 + v18, a3, v8 == 0))
        {
          if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_30;
            VRTraceErrorLogLevelToCSTR();
            v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (v10)
            {
              -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:].cold.2();
              goto LABEL_30;
            }
            return v10;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v11 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_30;
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v10)
            return v10;
          *(_DWORD *)buf = 136316162;
          v21 = v12;
          v22 = 2080;
          v23 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]";
          v24 = 1024;
          v25 = 652;
          v26 = 2112;
          v27 = v11;
          v28 = 2048;
          v29 = self;
          v14 = " [%s] %s:%d %@(%p) Failed to create audio stream config";
          goto LABEL_19;
        }
        ++v9;
        --v8;
        v7 += 232;
        if (v9 >= v18)
          break;
      }
    }
    LOBYTE(v10) = 1;
  }
  else
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        *(_DWORD *)buf = 136316162;
        v21 = v16;
        v22 = 2080;
        v23 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]";
        v24 = 1024;
        v25 = 638;
        v26 = 2112;
        v27 = v15;
        v28 = 2048;
        v29 = self;
        v14 = " [%s] %s:%d %@(%p) Failed to load supported audio rule collection";
LABEL_19:
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x30u);
      }
    }
LABEL_30:
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (unsigned)maxStreamIDCountFromStreamIndex:(unsigned int)a3
{
  int64_t v4;
  unint64_t v5;
  int *v6;
  unint64_t v7;

  v4 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  +[VCSessionMediaStreamConfigurationProvider fixAudioStreamConfigurations](VCSessionMediaStreamConfigurationProvider, "fixAudioStreamConfigurations");
  v5 = 0;
  v6 = &_audioStreamConfigs;
  do
  {
    if (!+[VCSessionMediaStreamConfigurationProvider audioConfig:supportsDeviceClass:](VCSessionMediaStreamConfigurationProvider, "audioConfig:supportsDeviceClass:", v6, v4))break;
    ++v5;
    v7 = _audioStreamConfigurationsCount ? 2 : 3;
    v6 += 58;
  }
  while (v5 < v7);
  if (v5 >= a3)
    return v5 - a3;
  else
    return 0;
}

+ (BOOL)isAudioStreamOnDemand:(_VCMediaStreamConfigurationProviderAudio *)a3 isLowestQualityAudio:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t BoolValueForKey;

  v4 = a4;
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("forceAudioOnDemand"), a3->var8);
  if (v4)
    LOBYTE(BoolValueForKey) = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-low-quality-audio-stream-on-demand"), CFSTR("lowQualityAudioOnDemand"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BoolValueForKey), 0), "BOOLValue");
  return BoolValueForKey;
}

+ (BOOL)isVideoStreamOnDemand:(_VCMediaStreamConfigurationProviderVideo *)a3
{
  uint64_t BoolValueForKey;

  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("forceVideoOnDemand"), a3->var8);
  if (a3->var5 == dword_1F01B8F40)
    LOBYTE(BoolValueForKey) = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-low-quality-video-stream-on-demand"), CFSTR("lowQualityVideoOnDemand"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BoolValueForKey), 0), "BOOLValue");
  return BoolValueForKey;
}

+ (void)configureAudioStreams:(id)a3 withCodecConfiguration:(_VCMediaStreamConfigurationProviderAudio *)a4 payloadsVersion:(unsigned int)a5
{
  int v6;
  unsigned int *p_var13;
  _VCMediaStreamConfigurationProviderAudioPayload *var14;
  uint64_t v9;
  unsigned int *i;
  uint64_t v11;
  int v12;
  VCAudioStreamCodecConfig *v13;
  VCAudioStreamCodecConfig *v14;
  VCAudioStreamCodecConfig *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a5 == 2)
  {
    p_var13 = &a4->var13;
    var14 = a4->var14;
    v6 = 1;
  }
  else
  {
    if (a5 != 1)
      return;
    v6 = 0;
    p_var13 = &a4->var3;
    var14 = a4->var4;
  }
  v9 = *p_var13;
  if ((_DWORD)v9)
  {
    for (i = (unsigned int *)&var14->var1; ; i += 4)
    {
      v11 = *((_QWORD *)i - 1);
      v12 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", v11);
      v13 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", v11);
      if (!v13)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:].cold.1();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v17 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
          else
            v17 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v18 = VRTraceErrorLogLevelToCSTR();
            v19 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v22 = v18;
              v23 = 2080;
              v24 = "+[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:]";
              v25 = 1024;
              v26 = 726;
              v27 = 2112;
              v28 = v17;
              v29 = 2048;
              v30 = a1;
              v31 = 1024;
              v32 = v12;
              _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate codec config for payload=%d", buf, 0x36u);
            }
          }
        }
        return;
      }
      v14 = v13;
      -[VCAudioStreamCodecConfig setPreferredMode:](v13, "setPreferredMode:", *i);
      if (v12 <= 110)
        break;
      if (v12 == 113)
      {
        -[VCAudioStreamCodecConfig setNetworkPayload:](v14, "setNetworkPayload:", 113);
        v15 = v14;
        v16 = &unk_1E9EFA2E0;
        goto LABEL_16;
      }
      if (v12 == 111)
        goto LABEL_14;
LABEL_17:
      if (v6)
        objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "addV2CodecConfiguration:", v14);
      else
        objc_msgSend(a3, "addCodecConfiguration:", v14);

      if (!--v9)
        return;
    }
    if ((v12 - 107) >= 2)
    {
      if (v12 == 101)
        -[VCAudioStreamCodecConfig setPTime:](v14, "setPTime:", 10);
      goto LABEL_17;
    }
LABEL_14:
    -[VCAudioStreamCodecConfig setDtxEnabled:](v14, "setDtxEnabled:", 1);
    v15 = v14;
    v16 = &unk_1E9EFA2C8;
LABEL_16:
    -[VCAudioStreamCodecConfig setSupportedModes:](v15, "setSupportedModes:", v16);
    goto LABEL_17;
  }
}

- (BOOL)initializeAudioStreamWithConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 maxIDSStreamIDCount:(unsigned int)a4 supportedAudioRules:(id)a5 isLowestQualityAudio:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  VCMediaStreamMultiwayConfigAudio *v11;
  VCMediaStreamRateControlConfig *v12;
  VCMediaStreamRateControlConfig *v13;
  VCSessionParticipantAudioStreamConfig *v14;
  VCSessionParticipantAudioStreamConfig *v15;
  id v16;
  id v17;
  uint64_t var7;
  VCMediaStreamRateControlConfig *v19;
  unint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  int v24;
  double v25;
  uint64_t v26;
  BOOL v27;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  VCSessionMediaStreamConfigurationProvider *v51;
  uint64_t v52;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
  if (!v11)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:].cold.1();
      }
      goto LABEL_48;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_48;
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_DWORD *)buf = 136316162;
    v43 = v33;
    v44 = 2080;
    v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudio"
          "Rules:isLowestQualityAudio:]";
    v46 = 1024;
    v47 = 762;
    v48 = 2112;
    v49 = v29;
    v50 = 2048;
    v51 = self;
    v35 = " [%s] %s:%d %@(%p) Failed to create video multiway config";
    goto LABEL_60;
  }
  v12 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v12)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:].cold.2();
      }
      goto LABEL_48;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v36 = VRTraceErrorLogLevelToCSTR(),
          v34 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_48:
      v13 = 0;
LABEL_49:
      v15 = 0;
LABEL_50:
      v27 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316162;
    v43 = v36;
    v44 = 2080;
    v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudio"
          "Rules:isLowestQualityAudio:]";
    v46 = 1024;
    v47 = 765;
    v48 = 2112;
    v49 = v30;
    v50 = 2048;
    v51 = self;
    v35 = " [%s] %s:%d %@(%p) Failed to create rate control config";
LABEL_60:
    _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x30u);
    goto LABEL_48;
  }
  v13 = v12;
  v14 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (!v14)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v43 = v37;
          v44 = 2080;
          v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supporte"
                "dAudioRules:isLowestQualityAudio:]";
          v46 = 1024;
          v47 = 768;
          v48 = 2112;
          v49 = v31;
          v50 = 2048;
          v51 = self;
          _os_log_error_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create video stream config", buf, 0x30u);
        }
      }
    }
    goto LABEL_49;
  }
  v15 = v14;
  -[VCMediaStreamConfig setJitterBufferMode:](v14, "setJitterBufferMode:", 1);
  v16 = -[VCSessionMediaStreamConfigurationProvider audioRuleCollectionWithAudioConfig:supportedAudioRules:](self, "audioRuleCollectionWithAudioConfig:supportedAudioRules:", a3, a5);
  if (!v16)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:].cold.4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v43 = v39;
          v44 = 2080;
          v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supporte"
                "dAudioRules:isLowestQualityAudio:]";
          v46 = 1024;
          v47 = 773;
          v48 = 2112;
          v49 = v32;
          v50 = 2048;
          v51 = self;
          _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules multiway config", buf, 0x30u);
        }
      }
    }
    goto LABEL_50;
  }
  v17 = v16;
  v41 = v6;
  +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:](VCSessionMediaStreamConfigurationProvider, "configureAudioStreams:withCodecConfiguration:payloadsVersion:", v15, a3, 1);
  var7 = a3->var7;
  if ((_DWORD)var7 != 128)
    -[VCAudioStreamConfig setupRedWithRxPayload:txPayload:](v15, "setupRedWithRxPayload:txPayload:", var7, a3->var7);
  v19 = v13;
  if (a3->var5)
  {
    v20 = 0;
    do
      -[VCAudioStreamConfig addSupportedNumRedundantPayload:](v15, "addSupportedNumRedundantPayload:", a3->var6[v20++]);
    while (v20 < a3->var5);
  }
  -[VCSessionParticipantAudioStreamConfig setAudioRules:](v15, "setAudioRules:", v17);
  -[VCMediaStreamConfig setDirection:](v15, "setDirection:", 1);
  -[VCAudioStreamConfig setNumRedundantPayloads:](v15, "setNumRedundantPayloads:", LOBYTE(a3->var6[0]));
  -[VCAudioStreamConfig setSupportsAdaptation:](v15, "setSupportsAdaptation:", 1);
  -[VCAudioStreamConfig setBundlingScheme:](v15, "setBundlingScheme:", 1);
  -[VCAudioStreamConfig setChannelCount:](v15, "setChannelCount:", 1);
  -[VCMediaStreamConfig setRtpTimestampRate:](v15, "setRtpTimestampRate:", 24000);
  v21 = -[VCIDSStreamIDGenerator generateSSRC:streamID:repairStreamID:v2StreamID:](self->_streamIDGenerator, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 1, 0, 0);
  v23 = v22;
  -[VCAudioStreamConfig setIsHigherAudioREDCutoverU1Enabled:](v15, "setIsHigherAudioREDCutoverU1Enabled:", objc_msgSend(a5, "isHigherAudioREDCutoverU1Enabled"));
  -[VCMediaStreamMultiwayConfig setSsrc:](v11, "setSsrc:", v21);
  -[VCMediaStreamMultiwayConfig setIdsStreamID:](v11, "setIdsStreamID:", WORD2(v21));
  v24 = v23;
  -[VCMediaStreamMultiwayConfig setV2StreamID:](v11, "setV2StreamID:", v23);
  -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v11, "setMaxNetworkBitrate:", a3->var0);
  -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v11, "setMaxMediaBitrate:", a3->var2.var1);
  *(float *)&v25 = (float)a3->var9;
  -[VCMediaStreamMultiwayConfig setMaxPacketsPerSecond:](v11, "setMaxPacketsPerSecond:", v25);
  -[VCMediaStreamMultiwayConfig setQualityIndex:](v11, "setQualityIndex:", a3->var1);
  -[VCMediaStreamMultiwayConfig setMaxIDSStreamIdCount:](v11, "setMaxIDSStreamIdCount:", v8);
  -[VCMediaStreamMultiwayConfigAudio setAudioRules:](v11, "setAudioRules:", v17);
  -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v11, "setRepairedMaxNetworkBitrate:", a3->var0);
  -[VCMediaStreamMultiwayConfig setStartOnDemand:](v11, "setStartOnDemand:", +[VCSessionMediaStreamConfigurationProvider isAudioStreamOnDemand:isLowestQualityAudio:](VCSessionMediaStreamConfigurationProvider, "isAudioStreamOnDemand:isLowestQualityAudio:", a3, v41));
  -[VCMediaStreamMultiwayConfig setNegotiationProtocolMask:](v11, "setNegotiationProtocolMask:", a3->var10);
  -[VCMediaStreamConfig setMultiwayConfig:](v15, "setMultiwayConfig:", v11);
  v13 = v19;
  -[VCMediaStreamConfig setRateControlConfig:](v15, "setRateControlConfig:", v19);
  if (v24)
    +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:](VCSessionMediaStreamConfigurationProvider, "configureAudioStreams:withCodecConfiguration:payloadsVersion:", v15, a3, 2);
  if (-[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption"))
  {
    v26 = 0;
  }
  else
  {
    v26 = 3;
  }
  -[VCMediaStreamConfig setSRTPCipherSuite:](v15, "setSRTPCipherSuite:", v26);
  -[NSMutableArray addObject:](self->_audioStreamConfigurations, "addObject:", v15);
  v27 = 1;
LABEL_16:

  return v27;
}

- (id)audioRuleCollectionWithAudioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportedAudioRules:(id)a4
{
  unint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  VCAudioRuleCollection *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  VCSessionMediaStreamConfigurationProvider *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(VCAudioRuleCollection);
  if (v25)
  {
    if (a3->var3)
    {
      v7 = 0;
      do
      {
        v8 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", a3->var4[v7].var0);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = (void *)objc_msgSend(a4, "rules");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v33 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              if (objc_msgSend(v14, "payload") == v8)
              {
                -[VCAudioRuleCollection addAudioRule:](v25, "addAudioRule:", v14);
                goto LABEL_14;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_14:
        ++v7;
      }
      while (v7 < a3->var3);
    }
    if (a3->var7 != 128)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = (void *)objc_msgSend(a4, "rules");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        while (2)
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
            if (objc_msgSend(v20, "payload") == a3->var7)
            {
              -[VCAudioRuleCollection addAudioRule:](v25, "addAudioRule:", v20);
              return v25;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
          if (v17)
            continue;
          break;
        }
      }
    }
  }
  else if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamConfigurationProvider audioRuleCollectionWithAudioConfig:supportedAudioRules:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionMediaStreamConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v37 = v23;
        v38 = 2080;
        v39 = "-[VCSessionMediaStreamConfigurationProvider audioRuleCollectionWithAudioConfig:supportedAudioRules:]";
        v40 = 1024;
        v41 = 837;
        v42 = 2112;
        v43 = v22;
        v44 = 2048;
        v45 = self;
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules collection", buf, 0x30u);
      }
    }
  }
  return v25;
}

- (NSArray)videoStreamConfigurations
{
  return &self->_videoStreamConfigurations->super;
}

- (NSArray)audioStreamConfigurations
{
  return &self->_audioStreamConfigurations->super;
}

- (int64_t)highestEncodingResolution
{
  return self->_highestEncodingResolution;
}

- (BOOL)isEncodingSqaures
{
  return self->_isEncodingSqaures;
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid stream ID generator provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio stream array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate video stream array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeStreamsWithSupportedAudioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Video Stream initialization failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeStreamsWithSupportedAudioRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio Stream initialization failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeVideoStreams
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize video multiway stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.3()
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

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create featureStrings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeVideoStreamWithDefaults
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to forceHWI initialize video multiway stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAudioStreamsWithSupportedRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load supported audio rule collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAudioStreamsWithSupportedRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)configureAudioStreams:withCodecConfiguration:payloadsVersion:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:]";
  v6 = 1024;
  v7 = 726;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate codec config for payload=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.2()
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

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create video stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio rules multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)audioRuleCollectionWithAudioConfig:supportedAudioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio rules collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
