@implementation VCMediaNegotiatorBase

- (BOOL)setUpU1MediaSettings
{
  NSMutableDictionary *v3;
  VCMediaNegotiatorResultsAudio *v4;
  VCMediaNegotiatorResultsAudio *v5;
  VCMediaNegotiatorResultsVideo *v6;
  VCMediaNegotiatorResultsVideo *v7;
  VCMediaNegotiatorResultsVideo *v8;
  VCMediaNegotiatorResultsVideo *v9;
  _BOOL4 v10;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_negotiatedU1MediaSettings = v3;
  if (v3)
  {
    v4 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
    if (v4)
    {
      v5 = v4;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v4, &unk_1E9EF35D8);

      v6 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
      if (v6)
      {
        v7 = v6;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v6, &unk_1E9EF35F0);

        v8 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
        if (v8)
        {
          v9 = v8;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v8, &unk_1E9EF3608);

          LOBYTE(v10) = 1;
          return v10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v10)
            return v10;
          -[VCMediaNegotiatorBase setUpU1MediaSettings].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[VCMediaNegotiatorBase setUpU1MediaSettings].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCMediaNegotiatorBase setUpU1MediaSettings].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    -[VCMediaNegotiatorBase setUpU1MediaSettings].cold.1();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (VCMediaNegotiatorBase)initWithLocalSettings:(id)a3
{
  VCMediaNegotiatorBase *v4;
  VCMediaNegotiatorLocalConfiguration *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  VCMediaNegotiatorResults *v11;
  VCMediaNegotiatorResultsMediaRecorder *v12;
  VCMediaNegotiatorResultsFaceTimeSettings *v13;
  NSMutableArray *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VCMediaNegotiatorBase;
  v4 = -[VCMediaNegotiatorBase init](&v16, sel_init);
  if (v4)
  {
    v5 = (VCMediaNegotiatorLocalConfiguration *)a3;
    v4->_localSettings = v5;
    v6 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v5, "mediaConfigurationForMediaType:", 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[VCMediaNegotiatorLocalConfiguration preferredAudioCodec](v4->_localSettings, "preferredAudioCodec");
        v10 = objc_msgSend(v6, "allowAudioSwitching");
        *(_DWORD *)buf = 136316162;
        v18 = v7;
        v19 = 2080;
        v20 = "-[VCMediaNegotiatorBase initWithLocalSettings:]";
        v21 = 1024;
        v22 = 65;
        v23 = 1024;
        v24 = v9;
        v25 = 1024;
        v26 = v10;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local preferredAudioCodec=%u, allowAudioSwitching=%{BOOL}d", buf, 0x28u);
      }
    }
    v11 = objc_alloc_init(VCMediaNegotiatorResults);
    v4->_negotiatedSettings = v11;
    if (v11)
    {
      if (-[VCMediaNegotiatorBase setUpU1MediaSettings](v4, "setUpU1MediaSettings"))
      {
        v12 = objc_alloc_init(VCMediaNegotiatorResultsMediaRecorder);
        v4->_negotiatedMediaRecorderSettings = v12;
        if (v12)
        {
          v13 = objc_alloc_init(VCMediaNegotiatorResultsFaceTimeSettings);
          v4->_negotiatedFaceTimeSettings = v13;
          if (v13)
          {
            v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v4->_negotiatedStreamGroups = v14;
            if (v14)
              return v4;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiatorBase initWithLocalSettings:].cold.4();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiatorBase initWithLocalSettings:].cold.3();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiatorBase initWithLocalSettings:].cold.2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorBase initWithLocalSettings:].cold.1();
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorBase;
  -[VCMediaNegotiatorBase dealloc](&v3, sel_dealloc);
}

- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings
{
  return (VCMediaNegotiatorResultsAudio *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF35D8);
}

- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings
{
  return (VCMediaNegotiatorResultsVideo *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF35F0);
}

- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings
{
  return (VCMediaNegotiatorResultsVideo *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF3608);
}

- (id)negotiationData
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaNegotiatorBase negotiationData]"), 0));
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaNegotiatorBase processRemoteNegotiationData:]"), 0));
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, *(_QWORD *)&a5, *(_QWORD *)&a6, "+[VCMediaNegotiatorBase initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]"), 0));
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "+[VCMediaNegotiatorBase streamGroupIDsWithMediaBlob:]"), 0));
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, "-[VCMediaNegotiatorBase remoteMaxBandwidthForArbiterMode:connectionType:]"), 0));
}

- (id)negotiatedStreamGroupConfigForGroupID:(unsigned int)a3 negotiatedStreamGroupConfigs:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
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
  char *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v8)
        objc_enumerationMutation(a4);
      v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
      if (objc_msgSend(v10, "groupID") == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v11;
        v19 = 2080;
        v20 = "-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:]";
        v21 = 1024;
        v22 = 148;
        v23 = 2080;
        v24 = FourccToCStr(a3);
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found one to one stream group for groupID=%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if (v10)
      return v10;
  }
LABEL_14:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = FourccToCStr(a3);
      v17 = 136315906;
      v18 = v13;
      v19 = 2080;
      v20 = "-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:]";
      v21 = 1024;
      v22 = 152;
      v23 = 2080;
      v24 = v15;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to find one to one stream group for groupID=%s", (uint8_t *)&v17, 0x26u);
    }
  }
  v10 = 0;
  return v10;
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_negotiatedU1MediaSettings, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)));
}

+ (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3
{
  int v3;
  char v5;
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
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 2;
  if ((a3 - 2) < 5 && ((0x1Bu >> v5) & 1) != 0)
    return (0xFu >> v5) & 1;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      +[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:].cold.1();
    }
LABEL_14:
    LOBYTE(v7) = 0;
    return v7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_14;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    v11 = 136316418;
    v12 = v8;
    v13 = 2080;
    v14 = "+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]";
    v15 = 1024;
    v16 = 179;
    v17 = 2112;
    v18 = v6;
    v19 = 2048;
    v20 = a1;
    v21 = 1024;
    v22 = v3;
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v11, 0x36u);
    goto LABEL_14;
  }
  return v7;
}

+ (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3
{
  int v3;
  char v5;
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
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 2;
  if ((a3 - 2) < 5 && ((0x1Bu >> v5) & 1) != 0)
    return (7u >> v5) & 1;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      +[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:].cold.1();
    }
LABEL_14:
    LOBYTE(v7) = 0;
    return v7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_14;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    v11 = 136316418;
    v12 = v8;
    v13 = 2080;
    v14 = "+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]";
    v15 = 1024;
    v16 = 201;
    v17 = 2112;
    v18 = v6;
    v19 = 2048;
    v20 = a1;
    v21 = 1024;
    v22 = v3;
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v11, 0x36u);
    goto LABEL_14;
  }
  return v7;
}

+ (unsigned)featureListStringTypeForMediaType:(unsigned __int8)a3
{
  int v3;
  int v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v3 = a3;
    if (a3 == 5)
    {
      LOBYTE(v4) = 7;
    }
    else
    {
      if (a3 != 3)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v4)
              return v4;
            +[VCMediaNegotiatorBase featureListStringTypeForMediaType:].cold.1();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v6 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
          else
            v6 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v7 = VRTraceErrorLogLevelToCSTR();
            v8 = *MEMORY[0x1E0CF2758];
            v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v4)
              return v4;
            v10 = 136316418;
            v11 = v7;
            v12 = 2080;
            v13 = "+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]";
            v14 = 1024;
            v15 = 224;
            v16 = 2112;
            v17 = v6;
            v18 = 2048;
            v19 = a1;
            v20 = 1024;
            v21 = v3;
            _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v10, 0x36u);
          }
        }
        LOBYTE(v4) = 0;
        return v4;
      }
      LOBYTE(v4) = 6;
    }
  }
  return v4;
}

+ (BOOL)isU1StreamGroup:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 > 1835623281)
  {
    if (a3 != 1835623282 && a3 != 1935897189)
    {
      v4 = 1937339233;
LABEL_8:
      if (a3 != v4)
        return 0;
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    v4 = 1718909044;
    goto LABEL_8;
  }
  return result;
}

+ (BOOL)isAudioStreamGroup:(unsigned int)a3
{
  BOOL v3;

  v3 = a3 == 1835623287 || a3 == 1937339233;
  return a3 == 1835623282 || v3;
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v7 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v8;
      v15 = 2080;
      v16 = "-[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:]";
      v17 = 1024;
      v18 = 293;
      v19 = 2080;
      v20 = FourccToCStr(v7);
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get negotiated results for stream group groupID=%s", (uint8_t *)&v13, 0x26u);
    }
  }
  if (objc_msgSend((id)objc_opt_class(), "isU1StreamGroup:", v7))
  {
    if ((objc_msgSend((id)objc_opt_class(), "isAudioStreamGroup:", v7) & 1) != 0)
      return +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedAudioSettingsForGroupID:localU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedAudioSettingsForGroupID:localU1Config:remoteU1Config:", v7, a4, a5);
    else
      return +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsForGroupID:localU1Config:remoteU1Config:](VCMediaNegotiatorStreamGroupU1Configuration, "negotiatedVideoSettingsForGroupID:localU1Config:remoteU1Config:", v7, a4, a5);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:].cold.1(v11, v7, v12);
    }
    return 0;
  }
}

+ (id)preferredPayloadsForMediaType:(unsigned __int8)a3
{
  char v3;

  v3 = a3 - 2;
  if ((a3 - 2) < 5 && ((0x1Bu >> v3) & 1) != 0)
    return (id)qword_1E9E527F0[v3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCMediaNegotiatorBase preferredPayloadsForMediaType:].cold.1();
  }
  return 0;
}

+ (id)getPreferredVideoPayloadList:(id)a3 localSupportedPayloads:(id)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  char v16;
  int ErrorLogLevelForModule;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
    return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
  v9 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
  if ((_DWORD)v9 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    *(_DWORD *)buf = 136315650;
    v26 = v10;
    v27 = 2080;
    v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    v29 = 1024;
    v30 = 337;
    v12 = " [%s] %s:%d Video payload OVERRIDE is PL_INVALID! Ignoring ...";
    v13 = v11;
    v14 = 28;
LABEL_19:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
  }
  v15 = v9;
  if ((objc_msgSend(a3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9)) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    *(_DWORD *)buf = 136315906;
    v26 = v21;
    v27 = 2080;
    v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    v29 = 1024;
    v30 = 339;
    v31 = 1024;
    v32 = v15;
    v12 = " [%s] %s:%d Remote client doesn't support video OVERRIDE payload (%d). Ignoring ...";
LABEL_18:
    v13 = v22;
    v14 = 34;
    goto LABEL_19;
  }
  v16 = objc_msgSend(a4, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v16 & 1) == 0)
  {
    if (ErrorLogLevelForModule < 5)
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    v23 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return (id)objc_msgSend(a1, "preferredPayloadsForMediaType:", v5);
    *(_DWORD *)buf = 136315906;
    v26 = v23;
    v27 = 2080;
    v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    v29 = 1024;
    v30 = 341;
    v31 = 1024;
    v32 = v15;
    v12 = " [%s] %s:%d Local client doesn't support video OVERRIDE payload (%d). Ignoring ...";
    goto LABEL_18;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v26 = v18;
      v27 = 2080;
      v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
      v29 = 1024;
      v30 = 343;
      v31 = 1024;
      v32 = v15;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
    }
  }
  v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
}

+ (id)negotiateVideoMaxResolutionWithEncodeRules:(id)a3 decodeRules:(id)a4 isEncoder:(BOOL)a5
{
  id result;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  float v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id obj;
  void *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v21 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_msgSend(a4, "reverseObjectEnumerator");
  result = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (result)
  {
    v7 = result;
    v23 = 0;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = (void *)objc_msgSend(a3, "reverseObjectEnumerator");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
LABEL_8:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
            v17 = objc_msgSend(v10, "compare:", v16);
            if (v17 == 1)
              break;
            if (!v17)
            {
              objc_msgSend(v10, "fPref");
              if (v21)
                v19 = v16;
              else
                v19 = v10;
              if (v18 != 1.0)
              {
                v20 = v23;
                if (!v23)
                  v20 = v19;
                v23 = v20;
                break;
              }
              return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0);
            }
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
              if (v13)
                goto LABEL_8;
              break;
            }
          }
        }
      }
      v7 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v7);
    if (v23)
      return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0);
    else
      return 0;
  }
  return result;
}

+ (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 videoSettings:(id)a6 localVideoRuleCollection:(id)a7 remoteVideoRuleCollection:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __objc2_class_ro **p_info;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  BOOL v32;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:].cold.1();
    }
    goto LABEL_46;
  }
  v15 = objc_msgSend(a7, "getVideoRulesForTransport:payload:encodingType:", v13, v12, v11);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)buf = 136316418;
      v47 = v34;
      v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      v50 = 1024;
      v51 = 392;
      v52 = 1024;
      v53 = v12;
      v54 = 1024;
      v55 = v13;
      v56 = 1024;
      v57 = v11;
      v36 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  v16 = (void *)v15;
  if ((_DWORD)v11 == 2)
    v17 = 1;
  else
    v17 = 2;
  v18 = objc_msgSend(a8, "getVideoRulesForTransport:payload:encodingType:", v13, v12, v17);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)buf = 136316418;
      v47 = v37;
      v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      v50 = 1024;
      v51 = 396;
      v52 = 1024;
      v53 = v12;
      v54 = 1024;
      v55 = v13;
      v56 = 1024;
      v57 = v11;
      v36 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_45;
    }
LABEL_46:
    v32 = 0;
    goto LABEL_32;
  }
  v19 = (void *)v18;
  p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
  if ((_DWORD)v13 == 2)
  {
    if ((_DWORD)v11 == 1)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
      v22 = v14;
      if (v21)
      {
        v23 = v21;
        v39 = a6;
        v40 = v12 | 0x200000000;
        v24 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(v16);
            v26 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v19, "containsObject:matchingComparison:", v26, sel_compare_, v39, v40))
              objc_msgSend(v14, "addObject:", v26);
          }
          v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
        }
        while (v23);
        v22 = v14;
        v12 = v40;
        v13 = HIDWORD(v40);
        a6 = v39;
      }
    }
    else
    {
      v22 = (id)v18;
    }
    p_info = VCCaptionsReceiver.info;
    +[VCMediaNegotiatorBase applyCellularPreferredRule:](VCMediaNegotiatorBase, "applyCellularPreferredRule:", v22);
    v19 = v22;
  }
  if ((_DWORD)v11 == 1)
    v27 = v16;
  else
    v27 = v19;
  if ((_DWORD)v11 == 1)
    v28 = v19;
  else
    v28 = v16;
  v29 = objc_msgSend(p_info + 476, "negotiateVideoMaxResolutionWithEncodeRules:decodeRules:isEncoder:", v27, v28, (_DWORD)v11 == 1);
  if (!v29)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)buf = 136316418;
      v47 = v38;
      v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      v50 = 1024;
      v51 = 413;
      v52 = 1024;
      v53 = v12;
      v54 = 1024;
      v55 = v13;
      v56 = 1024;
      v57 = v11;
      v36 = " [%s] %s:%d No matching remote rules for payload=%d transport=%d encoding=%d";
LABEL_45:
      _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x2Eu);
      goto LABEL_46;
    }
    goto LABEL_46;
  }
  objc_msgSend(a6, "addVideoRules:transportType:payload:encodingType:", v29, v13, v12, v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v47 = v30;
      v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      v50 = 1024;
      v51 = 416;
      v52 = 1024;
      v53 = v12;
      v54 = 1024;
      v55 = v13;
      v56 = 1024;
      v57 = v11;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated rules added for payloadType=%d, transportType=%d, encodingType=%d", buf, 0x2Eu);
    }
  }
  v32 = 1;
LABEL_32:

  return v32;
}

+ (void)applyCellularPreferredRule:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  int *v13;
  double v14;
  float v15;
  float v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    v8 = -1;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(a3);
        v10 = 0;
        v11 = v8;
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = &dword_1D9109084;
        while (objc_msgSend(v12, "iWidth") != *(v13 - 1)
             || objc_msgSend(v12, "iHeight") != *v13)
        {
          v13 += 3;
          if (++v10 == 5)
          {
            v8 = v11;
            goto LABEL_23;
          }
        }
        if (!v6)
        {
          v8 = v10;
          goto LABEL_22;
        }
        if (v11 == (_DWORD)v10)
        {
          objc_msgSend(v6, "fRate");
          v16 = v15;
          objc_msgSend(v12, "fRate");
          if (v16 < *(float *)&v14)
          {
            v8 = v11;
LABEL_22:
            v6 = v12;
            goto LABEL_23;
          }
        }
        if (v10 <= v11)
          v8 = v11;
        else
          v8 = v10;
        if (v11 < v10)
          v6 = v12;
LABEL_23:
        if (v8 == 4)
          goto LABEL_26;
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (!v5)
      {
LABEL_26:
        if (v6)
        {
          LODWORD(v14) = 1.0;
          objc_msgSend(v6, "setFPref:", v14);
        }
        return;
      }
    }
  }
}

+ (id)newNegotiatedAudioPayloadsWithLocalPayloads:(id)a3 remotePayloads:(id)a4
{
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "intersectSet:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return v6;
  __str = 0;
  if (v6)
  {
    v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
    if (a3)
      goto LABEL_4;
LABEL_7:
    v8 = "<nil>";
    if (a4)
      goto LABEL_5;
    goto LABEL_8;
  }
  v7 = "<nil>";
  if (!a3)
    goto LABEL_7;
LABEL_4:
  v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  if (a4)
  {
LABEL_5:
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    goto LABEL_9;
  }
LABEL_8:
  v9 = "<nil>";
LABEL_9:
  asprintf(&__str, "Negotiated payloads=%s, localSupportedPayloads=%s, remoteSupportedPayloads=%s", v7, v8, v9);
  if (__str)
  {
    __lasts = 0;
    v10 = strtok_r(__str, "\n", &__lasts);
    v11 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v18 = v12;
          v19 = 2080;
          v20 = "+[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:]";
          v21 = 1024;
          v22 = 463;
          v23 = 2080;
          v24 = "";
          v25 = 2080;
          v26 = v10;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v10 = strtok_r(0, "\n", &__lasts);
    }
    while (v10);
    free(__str);
  }
  return v6;
}

+ (void)setupNegotiatedAudioPayloads:(id)a3 negotiatedAudioSettings:(id)a4 primaryPayloadPreference:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "unsignedIntValue");
        if ((_DWORD)v14 == 20)
        {
          objc_msgSend(a4, "setRedPayload:", 20);
          goto LABEL_16;
        }
        v15 = v14;
        if ((_DWORD)v14 == 13)
        {
          objc_msgSend(a4, "setDtxPayload:", 13);
          goto LABEL_16;
        }
        v16 = objc_msgSend(a5, "indexOfObject:", v13);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_11:
          objc_msgSend(a4, "addSecondaryPayload:", v15);
          goto LABEL_16;
        }
        v17 = v16;
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        if (v16 < v11)
        {
          objc_msgSend(a4, "addSecondaryPayload:", objc_msgSend(a4, "primaryPayload"));
LABEL_15:
          objc_msgSend(a4, "setPrimaryPayload:", v15);
          v11 = v17;
          goto LABEL_16;
        }
        if (v16 > v11)
          goto LABEL_11;
LABEL_16:
        ++v12;
      }
      while (v9 != v12);
      v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      v9 = v18;
    }
    while (v18);
  }
}

- (VCMediaNegotiatorLocalConfiguration)localSettings
{
  return self->_localSettings;
}

- (VCMediaNegotiatorResults)negotiatedSettings
{
  return self->_negotiatedSettings;
}

- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings
{
  return self->_negotiatedMediaRecorderSettings;
}

- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings
{
  return self->_negotiatedFaceTimeSettings;
}

- (NSArray)negotiatedStreamGroups
{
  return &self->_negotiatedStreamGroups->super;
}

- (void)setUpU1MediaSettings
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate negotiation screen results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate negotiation results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate negotiation moments results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate FaceTime settings results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the negotiated stream groups array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)featureListStringsRequiredForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)v1FeatureListStringsSupportedForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)featureListStringTypeForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatedResultsForGroupID:(uint64_t)a1 localU1Config:(int)a2 remoteU1Config:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:]";
  v8 = 1024;
  v9 = 305;
  v10 = 2080;
  v11 = FourccToCStr(a2);
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to get negotiated results for stream group groupID=%s", (uint8_t *)&v4, 0x26u);
}

+ (void)preferredPayloadsForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorBase preferredPayloadsForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase preferredPayloadsForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate updatedRules array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
