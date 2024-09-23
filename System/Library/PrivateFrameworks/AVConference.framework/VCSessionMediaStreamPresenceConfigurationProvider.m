@implementation VCSessionMediaStreamPresenceConfigurationProvider

+ (id)resourceNameForConfigurationType:(unsigned int)a3
{
  const __CFString *v3;

  v3 = CFSTR("session_config_GFT");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("session_config_presence");
  else
    return (id)v3;
}

+ (id)sessionConfigurationForType:(unsigned int)a3
{
  id v3;
  id result;

  v3 = +[VCSessionMediaStreamPresenceConfigurationProvider resourceNameForConfigurationType:](VCSessionMediaStreamPresenceConfigurationProvider, "resourceNameForConfigurationType:");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:].cold.1();
    }
    return 0;
  }
  result = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "plistForClass:withPath:defaultOverride:", objc_opt_class(), v3, CFSTR("sessionConfigPlist"));
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:].cold.2();
    }
    return 0;
  }
  return result;
}

- (VCSessionMediaStreamPresenceConfigurationProvider)initWithConfigurationType:(unsigned int)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5
{
  uint64_t v7;
  VCSessionMediaStreamPresenceConfigurationProvider *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;

  v7 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCSessionMediaStreamPresenceConfigurationProvider;
  v8 = -[VCSessionMediaStreamPresenceConfigurationProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = (NSDictionary *)+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:](VCSessionMediaStreamPresenceConfigurationProvider, "sessionConfigurationForType:", v7);
    v8->_configuration = v9;
    if (v9)
    {
      v10 = -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations](v8, "newStreamInputConfigurations");
      v8->_streamInputConfigurations = (NSSet *)v10;
      if (v10)
      {
        v11 = -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:](v8, "newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:", a4, a5);
        v8->_streamGroupConfigurations = (NSSet *)v11;
        if (v11)
        {
          v12 = -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupToStreamInputsMapping](v8, "newStreamGroupToStreamInputsMapping");
          v8->_streamGroupToStreamInputMapping = (NSDictionary *)v12;
          if (v12)
            return v8;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:].cold.1();
    }

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaStreamPresenceConfigurationProvider;
  -[VCSessionMediaStreamPresenceConfigurationProvider dealloc](&v3, sel_dealloc);
}

- (id)newStreamGroupToStreamInputsMapping
{
  id v3;
  NSSet *streamGroupConfigurations;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
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
  const __CFString *v26;
  __int16 v27;
  VCSessionMediaStreamPresenceConfigurationProvider *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    streamGroupConfigurations = self->_streamGroupConfigurations;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](streamGroupConfigurations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(streamGroupConfigurations);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("streamInputID")))
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("streamInputID")), objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("streamGroupID")));
          }
        }
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](streamGroupConfigurations, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v6);
    }
  }
  else if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupToStreamInputsMapping].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v12;
        v21 = 2080;
        v22 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupToStreamInputsMapping]";
        v23 = 1024;
        v24 = 232;
        v25 = 2112;
        v26 = v11;
        v27 = 2048;
        v28 = self;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create stream group mapping dictionary", buf, 0x30u);
      }
    }
  }
  return v3;
}

+ (id)screenStreamBaseTierFramerate
{
  return &unk_1E9EF3EA8;
}

+ (id)screenGroupDisabled
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[VCHardwareSettings supportsScreenCapture](VCHardwareSettings, "supportsScreenCapture") ^ 1);
}

+ (id)bdatGroupDisabled
{
  _BOOL8 v2;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

+ (id)ftxtGroupDisabled
{
  _BOOL8 v2;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

+ (id)fdatGroupDisabled
{
  _BOOL8 v2;

  v2 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

+ (id)siriGroupDisabled
{
  _BOOL4 v2;

  v2 = +[VCHardwareSettings isSiriVoiceTapSupported](VCHardwareSettings, "isSiriVoiceTapSupported");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v2);
}

+ (id)sysaGroupDisabled
{
  _BOOL4 v2;

  v2 = +[VCHardwareSettings supportsDedicatedSystemAudioStream](VCHardwareSettings, "supportsDedicatedSystemAudioStream");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v2);
}

+ (id)replaceTag:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return a3;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%FRAMES_PER_SECOND_SCREENSHARE_BASE_TIER%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider screenStreamBaseTierFramerate](VCSessionMediaStreamPresenceConfigurationProvider, "screenStreamBaseTierFramerate");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%SCRE_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider screenGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "screenGroupDisabled");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%SYSA_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider sysaGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "sysaGroupDisabled");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%FTXT_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider ftxtGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "ftxtGroupDisabled");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%BDAT_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider bdatGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "bdatGroupDisabled");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%FDAT_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider fdatGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "fdatGroupDisabled");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("%SIRI_GROUP_DISABLED%")))
    return +[VCSessionMediaStreamPresenceConfigurationProvider siriGroupDisabled](VCSessionMediaStreamPresenceConfigurationProvider, "siriGroupDisabled");
  else
    return a3;
}

+ (id)publicSessionConfigurationForType:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  id obj;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)v4;
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("streamInputs"));
      v8 = +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:](VCSessionMediaStreamPresenceConfigurationProvider, "sessionConfigurationForType:", v3);
      if (v8)
      {
        v18 = v7;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        obj = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("streamInputs"));
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
        if (v20)
        {
          v19 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v23 != v19)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              v11 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ignore")));
              if (v11)
              {
                v12 = v11;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v12, "BOOLValue") & 1) != 0)
                  continue;
              }
              v13 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              if (!v13)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:].cold.4();
                }
                return v16;
              }
              v14 = (void *)v13;
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("streamInputID")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("streamInputID"))), CFSTR("streamInputID"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"))), CFSTR("type"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subtype")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subtype"))), CFSTR("subtype"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxWidth")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxWidth"))), CFSTR("maxWidth"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxHeight")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxHeight"))), CFSTR("maxHeight"));
              if (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxFramerate")))
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxFramerate"))), CFSTR("maxFramerate"));
              objc_msgSend(v18, "addObject:", v14);
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
            if (v20)
              continue;
            break;
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:].cold.1();
  }
  return v16;
}

+ (unsigned)streamSSRCForStreamGroupID:(unsigned int)a3 streamIndex:(int)a4
{
  _BOOL4 v6;
  unsigned int result;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceFixedSSRCsForWebRTCStreams"), 0);
  result = 0;
  if (v6)
  {
    switch(a3)
    {
      case 0x63616D77u:
        return a4 + 32;
      case 0x73697269u:
        return a4 + 48;
      case 0x6D696377u:
        return a4 + 16;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v10)
        return result;
      v11 = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "+[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:streamIndex:]";
      v15 = 1024;
      v16 = 362;
      v17 = 1024;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown stream group ID %u. Using random SSRC", (uint8_t *)&v11, 0x22u);
    }
    return 0;
  }
  return result;
}

+ (unsigned)readUint32WithPList:(id)a3 key:(id)a4 defaultValue:(unsigned int)a5
{
  void *v6;

  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v6, "unsignedIntValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:key:defaultValue:].cold.1();
  }
  return a5;
}

+ (id)defaultOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((int)a3 <= 1835623281)
  {
    switch(a3)
    {
      case 0x62646174u:
        return (id)VCSessionOneToOneBDATTierTable();
      case 0x63616D65u:
        return (id)VCSessionOneToOneCameraTierTable();
      case 0x66747874u:
        if (a4)
          return (id)VCSessionOneToOneFTXTTierTableWithRedundancy();
        else
          return (id)VCSessionOneToOneFTXTTierTable();
    }
    return 0;
  }
  if (a3 != 1835623282)
  {
    if (a3 == 1935897189)
      return (id)VCSessionOneToOneScreenTierTable();
    if (a3 == 1937339233)
      return (id)VCSessionOneToOneSystemAudioTierTable();
    return 0;
  }
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass", *(_QWORD *)&a3, a4, v4, v5) == 8)
    return (id)VCSessionOneToOneFullMicTierTable();
  else
    return (id)VCSessionOneToOneReducedMicTierTable();
}

+ (id)foregroundCameraOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((int)a3 <= 1835623281)
  {
    switch(a3)
    {
      case 0x62646174u:
        return (id)VCSessionOneToOneBDATTierTable();
      case 0x63616D65u:
        return (id)VCSessionOneToOneCameraTierTable();
      case 0x66747874u:
        if (a4)
          return (id)VCSessionOneToOneFTXTTierTableWithRedundancy();
        else
          return (id)VCSessionOneToOneFTXTTierTable();
    }
    return 0;
  }
  if (a3 != 1835623282)
  {
    if (a3 == 1935897189)
      return (id)VCSessionOneToOneScreenTierTableForegroundCamera();
    if (a3 == 1937339233)
      return (id)VCSessionOneToOneSystemAudioTierTable();
    return 0;
  }
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass", *(_QWORD *)&a3, a4, v4, v5) == 8)
    return (id)VCSessionOneToOneFullMicTierTable();
  else
    return (id)VCSessionOneToOneReducedMicTierTable();
}

+ (unsigned)defaultRemainingBitrateSplit:(unsigned int)a3
{
  unsigned int result;
  int v4;

  result = 18;
  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5)
      {
        v4 = 1717854580;
        goto LABEL_17;
      }
      return 0;
    }
    if (a3 == 1650745716 || a3 == 1667329399)
      return 0;
    v4 = 1667330164;
LABEL_17:
    if (a3 != v4)
      return result;
    return 0;
  }
  if ((int)a3 > 1936290408)
  {
    if (a3 - 1986618417 < 4 || a3 == 1936290409)
      return 0;
    v4 = 1937339233;
    goto LABEL_17;
  }
  if (a3 == 1835623282 || a3 == 1835623287)
    return 0;
  if (a3 == 1935897189)
    return 82;
  else
    return 18;
}

+ (unsigned)foregroundCameraRemainingBitrateSplit:(unsigned int)a3
{
  unsigned int result;
  BOOL v4;
  unsigned int v5;
  int v6;

  result = 30;
  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5 && a3 != 1717854580)
      {
        v4 = a3 == 1718909044;
        v5 = 18;
        goto LABEL_10;
      }
      return 0;
    }
    if (a3 == 1650745716 || a3 == 1667329399)
      return 0;
    v6 = 1667330164;
LABEL_19:
    if (a3 != v6)
      return result;
    return 0;
  }
  if ((int)a3 > 1936290408)
  {
    if (a3 - 1986618417 < 4 || a3 == 1936290409)
      return 0;
    v6 = 1937339233;
    goto LABEL_19;
  }
  if (a3 == 1835623282 || a3 == 1835623287)
    return 0;
  v4 = a3 == 1935897189;
  v5 = 70;
LABEL_10:
  if (v4)
    return v5;
  else
    return 30;
}

+ (id)oneToOneTierTableForStreamGroupID:(unsigned int)a3 splitType:(unsigned int)a4 redundancyEnabled:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  void *v8;

  if (a4 == 1)
  {
    v6 = objc_msgSend(a1, "foregroundCameraOneToOneTierTable:redundancyEnabled:", *(_QWORD *)&a3, a5);
  }
  else
  {
    if (a4)
      return 0;
    v6 = objc_msgSend(a1, "defaultOneToOneTierTable:redundancyEnabled:", *(_QWORD *)&a3, a5);
  }
  v7 = (void *)v6;
  if (a3 == 1718909044 && v6 && VCDefaults_GetBoolValueForKey(CFSTR("enableLowerU1VoltusBitrate"), 0))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9EF3EC0, &unk_1E9EF3ED8);
    return v8;
  }
  return v7;
}

+ (unsigned)remainingBitrateSplitQualityIndexForStreamGroup:(unsigned int)a3 splitType:(unsigned int)a4
{
  if (a4 == 1)
    return objc_msgSend(a1, "foregroundCameraRemainingBitrateSplit:", *(_QWORD *)&a3);
  if (a4)
    return 0;
  return objc_msgSend(a1, "defaultRemainingBitrateSplit:", *(_QWORD *)&a3);
}

- (id)defaultEndToEndStreamGroupConfigurationForStreamGroup:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v3 = *(_QWORD *)&a3;
  v9[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8[0] = CFSTR("streamGroupID");
  v8[1] = CFSTR("streamGroupMode");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v9[1] = &unk_1E9EF3EF0;
  v6 = (void *)objc_msgSend(v5, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  if (-[NSDictionary objectForKeyedSubscript:](self->_streamGroupToStreamInputMapping, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_streamGroupToStreamInputMapping, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), CFSTR("streamInputID"));
  }
  if ((_DWORD)v3 == 1718909044 || (_DWORD)v3 == 1667329381)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("streamGroupRedundancyControllerEnabled"));
  return v6;
}

- (id)newStreamInputConfigurations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id obj;
  void *v17;
  int v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  obj = -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", CFSTR("streamInputs"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (!v3)
    return v17;
  v4 = v3;
  v5 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v21 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v18 = 0;
      v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ignore"));
      if (v8)
      {
        v9 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.5();
          }
          goto LABEL_23;
        }
        if ((objc_msgSend(v9, "BOOLValue") & 1) != 0)
          continue;
      }
      if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")), &v18))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.4();
        }
        goto LABEL_23;
      }
      if (v18 == 1835365473)
      {
        v10 = -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:](self, "newDataStreamInputConfigurationWithPList:", v7);
      }
      else
      {
        if (v18 != 1986618469)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.1(v13, v7, v14);
          }
          goto LABEL_23;
        }
        v10 = -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:](self, "newVideoStreamInputConfigurationWithPList:", v7);
      }
      v11 = v10;
      v12 = +[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:key:defaultValue:](VCSessionMediaStreamPresenceConfigurationProvider, "readUint32WithPList:key:defaultValue:", v7, CFSTR("maxFramerate"), 30);
      if (!(_DWORD)v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.2();
        }
        goto LABEL_24;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12), CFSTR("framerate"));
      if (!v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.3();
        }
LABEL_23:
        v11 = 0;
LABEL_24:

        return 0;
      }
      objc_msgSend(v17, "addObject:", v11);

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v4)
      continue;
    return v17;
  }
}

- (id)newVideoStreamInputConfigurationWithPList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v9;
  unsigned int v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = CFSTR("type");
  v12[0] = &unk_1E9EF3F08;
  v5 = (void *)objc_msgSend(v4, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.1();
    }
    goto LABEL_31;
  }
  v10 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamInputID")), &v10))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.7();
    }
    goto LABEL_31;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10), CFSTR("streamInputID"));
  v9 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("subtype")), &v9))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.6();
    }
    goto LABEL_31;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9), CFSTR("subtype"));
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxWidth"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.5();
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(v6, "unsignedIntValue"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.2();
    }
    goto LABEL_31;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("width"));
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxHeight"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.4();
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(v7, "unsignedIntValue"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.3();
    }
LABEL_31:

    return 0;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("height"));
  return v5;
}

- (id)newDataStreamInputConfigurationWithPList:(id)a3
{
  id v4;
  void *v5;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = CFSTR("type");
  v10[0] = &unk_1E9EF3F20;
  v5 = (void *)objc_msgSend(v4, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:].cold.1();
    }
    goto LABEL_15;
  }
  v8 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamInputID")), &v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:].cold.3();
    }
    goto LABEL_15;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8), CFSTR("streamInputID"));
  v7 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("subtype")), &v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:].cold.2();
    }
LABEL_15:

    return 0;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), CFSTR("subtype"));
  return v5;
}

- (id)newVideoMultiwayConfigWithPList:(id)a3 codecType:(int64_t)a4 streamIDGenerator:(id)a5 ssrc:(unsigned int)a6
{
  unint64_t v6;
  VCMediaStreamMultiwayConfigVideo *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char isKindOfClass;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v6 = *(_QWORD *)&a6;
  v47 = *MEMORY[0x1E0C80C00];
  v10 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.1();
    }
    goto LABEL_107;
  }
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxNetworkBitrate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.20();
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v10, "setMaxNetworkBitrate:", objc_msgSend(v11, "unsignedIntValue"));
  if (!-[VCMediaStreamMultiwayConfig maxNetworkBitrate](v10, "maxNetworkBitrate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.2();
    }
    goto LABEL_107;
  }
  v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxMediaBitrate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.19();
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v10, "setMaxMediaBitrate:", objc_msgSend(v12, "unsignedIntValue"));
  if (!-[VCMediaStreamMultiwayConfig maxMediaBitrate](v10, "maxMediaBitrate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.3();
    }
    goto LABEL_107;
  }
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("repairedMaxNetworkBitrate"));
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.18();
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v10, "setRepairedMaxNetworkBitrate:", objc_msgSend(v14, "unsignedIntValue"));
  }
  v15 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("repairedFECLevel"));
  if (v15)
  {
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.17();
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfig setRepairedFECLevel:](v10, "setRepairedFECLevel:", objc_msgSend(v16, "unsignedIntValue"));
  }
  v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("qualityIndex"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.16();
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setQualityIndex:](v10, "setQualityIndex:", objc_msgSend(v17, "unsignedIntValue"));
  v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("onDemand"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.15();
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setStartOnDemand:](v10, "setStartOnDemand:", VCDefaults_GetBoolValueForKey(CFSTR("forceVideoOnDemand"), objc_msgSend(v18, "BOOLValue")));
  v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isTemporalStream"));
  if (v19)
  {
    v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.14();
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfigVideo setIsTemporalStream:](v10, "setIsTemporalStream:", objc_msgSend(v20, "BOOLValue"));
  }
  if (a4 == 300)
  {
    -[VCMediaStreamMultiwayConfigVideo setResolution:](v10, "setResolution:", 11);
    -[VCMediaStreamMultiwayConfigVideo setFramerate:](v10, "setFramerate:", 30);
  }
  else
  {
    v21 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("framesPerSecond")));
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((unint64_t)(a4 - 301) > 1)
    {
      if ((isKindOfClass & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.13();
        }
        goto LABEL_107;
      }
      -[VCMediaStreamMultiwayConfigVideo setFramerate:](v10, "setFramerate:", objc_msgSend(v21, "unsignedIntValue"));
      if (!-[VCMediaStreamMultiwayConfigVideo framerate](v10, "framerate"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.7();
        }
        goto LABEL_107;
      }
      v23 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("width"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.12();
        }
        goto LABEL_107;
      }
      v24 = objc_msgSend(v23, "unsignedIntValue");
      if (!(_DWORD)v24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.8();
        }
        goto LABEL_107;
      }
      v25 = v24;
      v26 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("height"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.11();
        }
        goto LABEL_107;
      }
      v27 = objc_msgSend(v26, "unsignedIntValue");
      if (!(_DWORD)v27)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.9();
        }
        goto LABEL_107;
      }
      v28 = v27;
      v29 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("isVideoResolutionCustom"));
      if (v29 && objc_msgSend(v29, "BOOLValue"))
      {
        -[VCMediaStreamMultiwayConfigVideo setResolution:](v10, "setResolution:", 27);
      }
      else
      {
        -[VCMediaStreamMultiwayConfigVideo setResolution:](v10, "setResolution:", +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", v25, v28));
        if (-[VCMediaStreamMultiwayConfigVideo resolution](v10, "resolution") == 9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v35 = VRTraceErrorLogLevelToCSTR();
            v36 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v37 = 136316162;
              v38 = v35;
              v39 = 2080;
              v40 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:stream"
                    "IDGenerator:ssrc:]";
              v41 = 1024;
              v42 = 713;
              v43 = 1024;
              v44 = v25;
              v45 = 1024;
              v46 = v28;
              _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid resolution: width=%u height=%u", (uint8_t *)&v37, 0x28u);
            }
          }
          goto LABEL_107;
        }
      }
      v30 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("keyFrameInterval"));
      if (v30)
      {
        v31 = (void *)v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.10();
          }
          goto LABEL_107;
        }
        -[VCMediaStreamMultiwayConfigVideo setKeyFrameInterval:](v10, "setKeyFrameInterval:", objc_msgSend(v31, "unsignedIntValue"));
      }
    }
    else
    {
      if ((isKindOfClass & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.6();
        }
        goto LABEL_107;
      }
      -[VCMediaStreamMultiwayConfigVideo setFramerate:](v10, "setFramerate:", objc_msgSend(v21, "unsignedIntValue"));
      if (!-[VCMediaStreamMultiwayConfigVideo framerate](v10, "framerate"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.5();
        }
        goto LABEL_107;
      }
      -[VCMediaStreamMultiwayConfigVideo setResolution:](v10, "setResolution:", 11);
    }
  }
  if (!(_DWORD)v6)
  {
    v6 = objc_msgSend(a5, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 1, -[VCMediaStreamMultiwayConfig repairedMaxNetworkBitrate](v10, "repairedMaxNetworkBitrate") != 0, 0);
    v33 = HIDWORD(v6);
    v32 = HIWORD(v6);
    goto LABEL_40;
  }
  if (-[VCMediaStreamMultiwayConfig repairedMaxNetworkBitrate](v10, "repairedMaxNetworkBitrate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.4();
    }
LABEL_107:

    return 0;
  }
  LOWORD(v32) = v6 + 1;
  LOWORD(v33) = v6;
LABEL_40:
  -[VCMediaStreamMultiwayConfig setSsrc:](v10, "setSsrc:", v6);
  -[VCMediaStreamMultiwayConfig setIdsStreamID:](v10, "setIdsStreamID:", (unsigned __int16)v33);
  -[VCMediaStreamMultiwayConfig setNegotiationProtocolMask:](v10, "setNegotiationProtocolMask:", 2);
  if (-[VCMediaStreamMultiwayConfig repairedMaxNetworkBitrate](v10, "repairedMaxNetworkBitrate"))
    -[VCMediaStreamMultiwayConfig setRepairedStreamID:](v10, "setRepairedStreamID:", (unsigned __int16)v32);
  -[VCMediaStreamMultiwayConfigVideo addPayload:](v10, "addPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", a4));
  return v10;
}

- (void)updateStreamConfig:(id)a3 forPayload:(int)a4 networkPayload:(unsigned int)a5 groupID:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionMediaStreamPresenceConfigurationProvider *v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v13 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", *(_QWORD *)&a6, objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"));
  if (v13)
  {
    objc_msgSend(a3, "addRxPayloadType:networkPayload:", v7, v6);
    objc_msgSend(a3, "addRxCodecFeatureListString:codecType:", objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v7));
    objc_msgSend(a3, "addTxPayloadType:networkPayload:", v7, v6);
    objc_msgSend(a3, "addTxCodecFeatureListString:codecType:", objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v7));

  }
  else if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider updateStreamConfig:forPayload:networkPayload:groupID:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCSessionMediaStreamPresenceConfigurationProvider updateStreamConfig:forPayload:networkPayload:groupID:]";
        v18 = 1024;
        v19 = 747;
        v20 = 2112;
        v21 = v10;
        v22 = 2048;
        v23 = self;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create featureStrings", buf, 0x30u);
      }
    }
  }
}

- (BOOL)checkEncoderSupportForConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL result;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  VCSessionMediaStreamPresenceConfigurationProvider *v30;
  __int16 v31;
  int64_t v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "payloads"), "allObjects");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
      if (+[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", objc_msgSend(v9, "intValue")) == 102&& !+[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
      {
        break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
        if (v6)
          goto LABEL_3;
        return 1;
      }
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v14)
        return result;
      v21 = 136315906;
      v22 = v12;
      v23 = 2080;
      v24 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForConfig:]";
      v25 = 1024;
      v26 = 766;
      v27 = 2048;
      v28 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", objc_msgSend(v9, "intValue"));
      v15 = " [%s] %s:%d Found unsupported codec type=%ld";
      v16 = v13;
      v17 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v20)
        return result;
      v21 = 136316418;
      v22 = v18;
      v23 = 2080;
      v24 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForConfig:]";
      v25 = 1024;
      v26 = 766;
      v27 = 2112;
      v28 = (int64_t)v11;
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", objc_msgSend(v9, "intValue"));
      v15 = " [%s] %s:%d %@(%p) Found unsupported codec type=%ld";
      v16 = v19;
      v17 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
    return 0;
  }
  return 1;
}

- (BOOL)checkEncoderSupportForCodecType:(int64_t)a3
{
  BOOL result;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  VCSessionMediaStreamPresenceConfigurationProvider *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 != 102 || +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
    return 1;
  if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    v15 = 136316418;
    v16 = v12;
    v17 = 2080;
    v18 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForCodecType:]";
    v19 = 1024;
    v20 = 778;
    v21 = 2112;
    v22 = (uint64_t)v5;
    v23 = 2048;
    v24 = self;
    v25 = 2048;
    v26 = 102;
    v9 = " [%s] %s:%d %@(%p) Found unsupported codec type=%ld";
    v10 = v13;
    v11 = 58;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v15 = 136315906;
    v16 = v6;
    v17 = 2080;
    v18 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForCodecType:]";
    v19 = 1024;
    v20 = 778;
    v21 = 2048;
    v22 = 102;
    v9 = " [%s] %s:%d Found unsupported codec type=%ld";
    v10 = v7;
    v11 = 38;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
  }
  return 0;
}

- (id)getVideoCodecConfigFromStreamConfigPList:(id)a3
{
  void *v4;
  void *v5;
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
  VCSessionMediaStreamPresenceConfigurationProvider *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("codecs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v13 = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]";
    v17 = 1024;
    v18 = 788;
    v19 = 2112;
    v20 = v7;
    v21 = 2048;
    v22 = self;
    v11 = " [%s] %s:%d %@(%p) Invalid codecs array";
    goto LABEL_25;
  }
  v5 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v12 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v13 = 136316162;
    v14 = v12;
    v15 = 2080;
    v16 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]";
    v17 = 1024;
    v18 = 792;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = self;
    v11 = " [%s] %s:%d %@(%p) Invalid codec config";
LABEL_25:
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x30u);
    return 0;
  }
  return v5;
}

- (int64_t)getVideoCodecFromStreamCodecPList:(id)a3
{
  void *v4;
  int v5;
  int64_t v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSessionMediaStreamPresenceConfigurationProvider *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("codecType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "intValue");
    v6 = v5;
    if ((v5 - 100) >= 3 && (v5 - 300) >= 3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:].cold.1();
    }
  }
  else
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = 136316162;
          v12 = v9;
          v13 = 2080;
          v14 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]";
          v15 = 1024;
          v16 = 804;
          v17 = 2112;
          v18 = v8;
          v19 = 2048;
          v20 = self;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid codec type class", (uint8_t *)&v11, 0x30u);
        }
      }
    }
    return 0;
  }
  return v6;
}

- (id)newVideoStreamGroupStreamConfigWithPList:(id)a3 streamIDGenerator:(id)a4 ssrc:(unsigned int)a5 groupID:(unsigned int)a6 shouldSkip:(BOOL *)a7
{
  uint64_t v8;
  uint64_t v9;
  VCSessionParticipantVideoStreamConfig *v13;
  id v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  id v19;
  int ErrorLogLevelForModule;
  VCSessionMediaStreamPresenceConfigurationProvider *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  VCMediaStreamRateControlConfig *v41;
  VCMediaStreamRateControlConfig *v42;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 v58;
  _BOOL4 v59;
  double v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  const char *v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint32_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  VCSessionMediaStreamPresenceConfigurationProvider *v99;
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  int64_t v107;
  __int16 v108;
  VCSessionMediaStreamPresenceConfigurationProvider *v109;
  __int16 v110;
  const __CFString *v111;
  uint64_t v112;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v112 = *MEMORY[0x1E0C80C00];
  *a7 = 0;
  v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.1();
    }
    goto LABEL_206;
  }
  v14 = -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:](self, "getVideoCodecConfigFromStreamConfigPList:", a3);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.2();
    }
    goto LABEL_206;
  }
  v15 = v14;
  v16 = -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:](self, "getVideoCodecFromStreamCodecPList:", v14);
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.3();
    }
    goto LABEL_206;
  }
  v17 = v16;
  if (!-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForCodecType:](self, "checkEncoderSupportForCodecType:", v16))
  {
    v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("fallbackStream"));
    if (!v18)
    {
      *a7 = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.20();
      }
      goto LABEL_206;
    }
    a3 = v18;
    v19 = -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:](self, "getVideoCodecConfigFromStreamConfigPList:", v18);
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.21();
      }
      goto LABEL_206;
    }
    v15 = v19;
    v17 = -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:](self, "getVideoCodecFromStreamCodecPList:", v19);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!v17)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.22();
      }
      goto LABEL_206;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      v21 = self;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v101 = v22;
        v102 = 2080;
        v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGene"
               "rator:ssrc:groupID:shouldSkip:]";
        v104 = 1024;
        v105 = 843;
        v106 = 2048;
        v107 = v17;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Falling back to stream config with codecType=%ld", buf, 0x26u);
      }
      self = v21;
    }
  }
  v24 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("encoderUsage"));
  if (v24)
  {
    v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.19();
        }
        goto LABEL_206;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v66 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v66 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_206;
      v83 = VRTraceErrorLogLevelToCSTR();
      v84 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_206;
      *(_DWORD *)buf = 136316162;
      v101 = v83;
      v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      v104 = 1024;
      v105 = 848;
      v106 = 2112;
      v107 = (int64_t)v66;
      v108 = 2048;
      v109 = self;
      v85 = " [%s] %s:%d %@(%p) Invalid encoderUsage class";
LABEL_201:
      v92 = v84;
      v93 = 48;
      goto LABEL_202;
    }
    -[VCVideoStreamConfig setEncoderUsage:](v13, "setEncoderUsage:", objc_msgSend(v25, "unsignedIntValue"));
  }
  v26 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rtpPayload"));
  if (!v26)
    goto LABEL_18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.18();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v67 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v67 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v86 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v86;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 853;
    v106 = 2112;
    v107 = (int64_t)v67;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid rtp payload";
    goto LABEL_201;
  }
  LODWORD(v26) = objc_msgSend(v26, "intValue");
LABEL_18:
  v27 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("profileLevel"));
  if (!v27)
    goto LABEL_21;
  v28 = v27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.17();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v68 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v68 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v87 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v87;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 858;
    v106 = 2112;
    v107 = (int64_t)v68;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid profile level";
    goto LABEL_201;
  }
  -[VCVideoStreamConfig setProfileLevel:](v13, "setProfileLevel:", v28);
LABEL_21:
  v29 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtpTimestampRate"));
  if (!v29)
    goto LABEL_24;
  v30 = (void *)v29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.16();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v69 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v69 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v88 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v88;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 863;
    v106 = 2112;
    v107 = (int64_t)v69;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTP timestamp rate";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtpTimestampRate:](v13, "setRtpTimestampRate:", objc_msgSend(v30, "intValue"));
LABEL_24:
  v31 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpEnabled"));
  if (!v31)
    goto LABEL_27;
  v32 = (void *)v31;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.15();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v70 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v70 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v89 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v89;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 868;
    v106 = 2112;
    v107 = (int64_t)v70;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP enabled";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpEnabled:](v13, "setRtcpEnabled:", objc_msgSend(v32, "BOOLValue"));
LABEL_27:
  v33 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpSendInterval"));
  if (!v33)
    goto LABEL_30;
  v34 = (void *)v33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.14();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v71 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v71 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v90 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v90;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 873;
    v106 = 2112;
    v107 = (int64_t)v71;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP send interval";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpSendInterval:](v13, "setRtcpSendInterval:", (double)(int)objc_msgSend(v34, "intValue"));
LABEL_30:
  v35 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpTimeOutEnabled"));
  if (!v35)
    goto LABEL_33;
  v36 = (void *)v35;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.13();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v72 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v72 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_206;
    v91 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_206;
    *(_DWORD *)buf = 136316162;
    v101 = v91;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 878;
    v106 = 2112;
    v107 = (int64_t)v72;
    v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP timeout enabled";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpTimeOutEnabled:](v13, "setRtcpTimeOutEnabled:", objc_msgSend(v36, "BOOLValue"));
LABEL_33:
  v99 = self;
  v37 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sframeCipherSuite"));
  if (!v37)
    goto LABEL_36;
  v38 = (void *)v37;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.12();
      }
      goto LABEL_206;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v73 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v99, "performSelector:", sel_logPrefix);
    else
      v73 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v94 = VRTraceErrorLogLevelToCSTR(),
          v95 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_206:
      v42 = 0;
      v40 = 0;
      goto LABEL_207;
    }
    *(_DWORD *)buf = 136316418;
    v101 = v94;
    v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    v104 = 1024;
    v105 = 883;
    v106 = 2112;
    v107 = (int64_t)v73;
    v108 = 2048;
    v109 = v99;
    v110 = 2112;
    v111 = CFSTR("sframeCipherSuite");
    v85 = " [%s] %s:%d %@(%p) Invalid %@ class";
    v92 = v95;
    v93 = 58;
LABEL_202:
    _os_log_error_impl(&dword_1D8A54000, v92, OS_LOG_TYPE_ERROR, v85, buf, v93);
    goto LABEL_206;
  }
  -[VCMediaStreamConfig setSframeCipherSuite:](v13, "setSframeCipherSuite:", objc_msgSend(v38, "intValue"));
LABEL_36:
  if (!-[VCMediaStreamConfig sframeCipherSuite](v13, "sframeCipherSuite"))
  {
    -[VCMediaStreamConfig setSRTPCipherSuite:](v13, "setSRTPCipherSuite:", 3);
    -[VCMediaStreamConfig setSRTCPCipherSuite:](v13, "setSRTCPCipherSuite:", 3);
  }
  v39 = -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:](v99, "newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:", a3, v17, a4, v9);
  if (!v39)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.4();
    }
    goto LABEL_206;
  }
  v40 = (void *)v39;
  v41 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v41)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.5();
    }
    v42 = 0;
    goto LABEL_207;
  }
  v42 = v41;
  -[VCMediaStreamConfig setMultiwayConfig:](v13, "setMultiwayConfig:", v40);
  v43 = 1;
  -[VCMediaStreamConfig setDirection:](v13, "setDirection:", 1);
  -[VCVideoStreamConfig setVideoResolution:](v13, "setVideoResolution:", objc_msgSend(v40, "resolution"));
  -[VCVideoStreamConfig setFramerate:](v13, "setFramerate:", objc_msgSend(v40, "framerate"));
  -[VCVideoStreamConfig setKeyFrameInterval:](v13, "setKeyFrameInterval:", objc_msgSend(v40, "keyFrameInterval"));
  if ((_DWORD)v8 != 1935897189)
    v43 = -[VCMediaStreamMultiwayConfig isOneToOne](-[VCMediaStreamConfig multiwayConfig](v13, "multiwayConfig"), "isOneToOne");
  -[VCVideoStreamConfig setUseInBandFEC:](v13, "setUseInBandFEC:", v43);
  if (-[VCVideoStreamConfig useInBandFEC](v13, "useInBandFEC"))
  {
    -[VCVideoStreamConfig setTxMinBitrate:](v13, "setTxMinBitrate:", objc_msgSend(v40, "maxNetworkBitrate"));
    v44 = objc_msgSend(v40, "maxNetworkBitrate");
  }
  else
  {
    -[VCVideoStreamConfig setTxMinBitrate:](v13, "setTxMinBitrate:", objc_msgSend(v40, "maxMediaBitrate"));
    v44 = objc_msgSend(v40, "maxMediaBitrate");
  }
  -[VCVideoStreamConfig setTxMaxBitrate:](v13, "setTxMaxBitrate:", v44);
  -[VCVideoStreamConfig setRxMinBitrate:](v13, "setRxMinBitrate:", objc_msgSend(v40, "maxNetworkBitrate"));
  -[VCVideoStreamConfig setRxMaxBitrate:](v13, "setRxMaxBitrate:", objc_msgSend(v40, "maxNetworkBitrate"));
  -[VCVideoStreamConfig setType:](v13, "setType:", 3);
  -[VCVideoStreamConfig setSourceFramerate:](v13, "setSourceFramerate:", objc_msgSend(v40, "framerate"));
  -[VCVideoStreamConfig setRemoteVideoInitialOrientation:](v13, "setRemoteVideoInitialOrientation:", 0);
  -[VCMediaStreamConfig setRemoteSSRC:](v13, "setRemoteSSRC:", objc_msgSend(a4, "generateSSRC"));
  -[VCMediaStreamConfig setRateControlConfig:](v13, "setRateControlConfig:", v42);
  -[VCVideoStreamConfig setTemporalScalingEnabled:](v13, "setTemporalScalingEnabled:", objc_msgSend(v40, "isTemporalStream"));
  if (-[VCVideoStreamConfig videoResolution](v13, "videoResolution") == 27)
  {
    v45 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("width"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VCVideoStreamConfig setCustomWidth:](v13, "setCustomWidth:", (int)objc_msgSend(v45, "intValue"));
      v46 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("height"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[VCVideoStreamConfig setCustomHeight:](v13, "setCustomHeight:", (int)objc_msgSend(v46, "intValue"));
        goto LABEL_49;
      }
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.10();
        }
        goto LABEL_207;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v75 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v99, "performSelector:", sel_logPrefix);
      else
        v75 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_207;
      v98 = VRTraceErrorLogLevelToCSTR();
      v97 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_207;
      *(_DWORD *)buf = 136316418;
      v101 = v98;
      v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      v104 = 1024;
      v105 = 926;
      v106 = 2112;
      v107 = (int64_t)v75;
      v108 = 2048;
      v109 = v99;
      v110 = 2112;
      v111 = CFSTR("height");
      v81 = " [%s] %s:%d %@(%p) Invalid %@ class";
    }
    else
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.11();
        }
        goto LABEL_207;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v74 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v99, "performSelector:", sel_logPrefix);
      else
        v74 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_207;
      v96 = VRTraceErrorLogLevelToCSTR();
      v97 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_207;
      *(_DWORD *)buf = 136316418;
      v101 = v96;
      v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      v104 = 1024;
      v105 = 922;
      v106 = 2112;
      v107 = (int64_t)v74;
      v108 = 2048;
      v109 = v99;
      v110 = 2112;
      v111 = CFSTR("width");
      v81 = " [%s] %s:%d %@(%p) Invalid %@ class";
    }
    v82 = v97;
    goto LABEL_223;
  }
LABEL_49:
  v47 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpPSFBFIREnabled"));
  if (v47)
  {
    v48 = (void *)v47;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.9();
      }
      goto LABEL_207;
    }
    -[VCVideoStreamConfig setRtcpPSFB_FIREnabled:](v13, "setRtcpPSFB_FIREnabled:", objc_msgSend(v48, "BOOLValue"));
  }
  if ((_DWORD)v8 == 1935897189)
  {
    -[VCMediaStreamConfig setCaptureSource:](v13, "setCaptureSource:", 1);
    -[VCVideoStreamConfig setPixelFormat:](v13, "setPixelFormat:", 875704422);
    v49 = objc_msgSend(v40, "framerate");
    v50 = +[VCHardwareSettings maxFrameRateSupportedScreenShare](VCHardwareSettings, "maxFrameRateSupportedScreenShare");
    v51 = v49 >= v50 ? v50 : v49;
    -[VCVideoStreamConfig setFramerate:](v13, "setFramerate:", v51);
    if (-[VCVideoStreamConfig videoResolution](v13, "videoResolution") == 27)
    {
      v52 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxScreenPixels"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.8();
        }
        goto LABEL_207;
      }
      v53 = objc_msgSend(v52, "unsignedIntValue");
      -[VCVideoStreamConfig setMaxEncoderPixels:](v13, "setMaxEncoderPixels:", v53);
      +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:](VideoUtil, "computeResolutionForMainDisplayWithMaxScreenPixelCount:", v53);
      if (!(int)v54 || (v56 = v55, !(int)v55))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.6();
        }
        goto LABEL_207;
      }
      v57 = v54;
      v58 = +[VCHardwareSettings isDisplayPortrait](VCHardwareSettings, "isDisplayPortrait");
      v59 = v57 > v56;
      if (v58 && v59)
        v60 = v56;
      else
        v60 = v57;
      if (!v58 || !v59)
        v57 = v56;
      -[VCVideoStreamConfig setCustomWidth:](v13, "setCustomWidth:", (unint64_t)v60);
      -[VCVideoStreamConfig setCustomHeight:](v13, "setCustomHeight:", (unint64_t)v57);
    }
  }
  v61 = (void *)objc_msgSend((id)objc_msgSend(v40, "payloads"), "allObjects");
  if (objc_msgSend(v61, "count") != 1)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.7(v76, v61, v77);
      }
      goto LABEL_207;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v65 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v99, "performSelector:", sel_logPrefix);
    else
      v65 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v80 = objc_msgSend(v61, "count");
        *(_DWORD *)buf = 136316418;
        v101 = v78;
        v102 = 2080;
        v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGene"
               "rator:ssrc:groupID:shouldSkip:]";
        v104 = 1024;
        v105 = 958;
        v106 = 2112;
        v107 = (int64_t)v65;
        v108 = 2048;
        v109 = v99;
        v110 = 2048;
        v111 = (const __CFString *)v80;
        v81 = " [%s] %s:%d %@(%p) Invalid payloads, payloadSize: %lu";
        v82 = v79;
LABEL_223:
        _os_log_error_impl(&dword_1D8A54000, v82, OS_LOG_TYPE_ERROR, v81, buf, 0x3Au);
      }
    }
LABEL_207:

    return 0;
  }
  v62 = objc_msgSend((id)objc_msgSend(v61, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
  if ((_DWORD)v26)
    v63 = v26;
  else
    v63 = v62;
  -[VCSessionMediaStreamPresenceConfigurationProvider updateStreamConfig:forPayload:networkPayload:groupID:](v99, "updateStreamConfig:forPayload:networkPayload:groupID:", v13, v62, v63, v8);
  if ((_DWORD)v8 == 1667329399)
  {
    -[VCVideoStreamConfig setParameterSets:](v13, "setParameterSets:", 6);
    -[VCVideoStreamConfig setCvoExtensionID:](v13, "setCvoExtensionID:", 1);
    -[VCVideoStreamConfig setResetSendRTPTimestampOnStop:](v13, "setResetSendRTPTimestampOnStop:", 0);
  }
  else
  {
    -[VCVideoStreamConfig setParameterSets:](v13, "setParameterSets:", VCVideoParamaterSets_DefaultSupportedSets(+[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", -[VCMediaStreamConfig primaryTxCodecType](v13, "primaryTxCodecType"))));
  }

  return v13;
}

- (unsigned)setParentStreamID:(unsigned __int16)a3 videoConfig:(id)a4
{
  uint64_t v5;
  int v6;

  v5 = a3;
  v6 = objc_msgSend(a4, "isTemporalStream");
  if (v6)
  {
    objc_msgSend(a4, "setParentStreamID:", v5);
    LOWORD(v6) = objc_msgSend(a4, "idsStreamID");
  }
  return v6;
}

- (BOOL)setupVideoStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 streamIDGenerator:(id)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void *v23;
  unsigned __int16 v24;
  char v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v8, CFSTR("streamConfigurations"));

    v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntegerValue");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v11)
    {
      v12 = v11;
      v23 = v9;
      v24 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(a3);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ignore"), v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v17, "BOOLValue") & 1) == 0)
          {
            v18 = +[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:streamIndex:](VCSessionMediaStreamPresenceConfigurationProvider, "streamSSRCForStreamGroupID:streamIndex:", v10, v13);
            v26 = 0;
            v19 = -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:](self, "newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:", v16, a5, v18, v10, &v26);
            v20 = v19;
            if (!v26)
            {
              if (!v19)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCSessionMediaStreamPresenceConfigurationProvider setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:].cold.2();
                }
                goto LABEL_20;
              }
              v24 = -[VCSessionMediaStreamPresenceConfigurationProvider setParentStreamID:videoConfig:](self, "setParentStreamID:videoConfig:", v24, objc_msgSend(v19, "multiwayConfig"));
              objc_msgSend(v23, "addObject:", v20);
            }

            v13 = (v13 + 1);
          }
        }
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v12)
          continue;
        break;
      }
    }
    LOBYTE(v21) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v21)
        return v21;
      -[VCSessionMediaStreamPresenceConfigurationProvider setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:].cold.1();
    }
LABEL_20:
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (BOOL)addPayload:(int)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_msgSend(a5, "rules");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (objc_msgSend(v12, "payload") == a3)
        {
          objc_msgSend((id)objc_msgSend(a4, "audioRules"), "addAudioRule:", v12);
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  return v8;
}

- (id)newAudioMultiwayConfigWithPList:(id)a3 audioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7
{
  unint64_t v7;
  uint64_t v9;
  VCMediaStreamMultiwayConfigAudio *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v12 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.1();
    }
    goto LABEL_49;
  }
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxNetworkBitrate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.11();
    }
    goto LABEL_49;
  }
  v14 = objc_msgSend(v13, "unsignedIntValue");
  -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v12, "setRepairedMaxNetworkBitrate:", v14);
  -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v12, "setMaxNetworkBitrate:", v14);
  if (!-[VCMediaStreamMultiwayConfig maxNetworkBitrate](v12, "maxNetworkBitrate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.2();
    }
    goto LABEL_49;
  }
  v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("packetsPerSecond"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.10();
    }
    goto LABEL_49;
  }
  *(float *)&v16 = (float)objc_msgSend(v15, "unsignedIntValue");
  -[VCMediaStreamMultiwayConfig setMaxPacketsPerSecond:](v12, "setMaxPacketsPerSecond:", v16);
  -[VCMediaStreamMultiwayConfig maxPacketsPerSecond](v12, "maxPacketsPerSecond");
  if (v17 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.3();
    }
    goto LABEL_49;
  }
  v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("qualityIndex"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.9();
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setQualityIndex:](v12, "setQualityIndex:", objc_msgSend(v18, "unsignedIntValue"));
  if (!-[VCMediaStreamMultiwayConfig qualityIndex](v12, "qualityIndex"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.4();
    }
    goto LABEL_49;
  }
  v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("onDemand"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.8();
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setStartOnDemand:](v12, "setStartOnDemand:", VCDefaults_GetBoolValueForKey(CFSTR("forceAudioOnDemand"), objc_msgSend(v19, "BOOLValue")));
  v20 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bitrateInfo"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.7();
    }
    goto LABEL_49;
  }
  v21 = (void *)objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("mediaBitrate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.6();
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v12, "setMaxMediaBitrate:", objc_msgSend(v21, "unsignedIntValue"));
  -[VCMediaStreamMultiwayConfigAudio setPreferredMediaBitrate:](v12, "setPreferredMediaBitrate:", objc_msgSend(v21, "unsignedIntValue"));
  if (!-[VCMediaStreamMultiwayConfig maxMediaBitrate](v12, "maxMediaBitrate"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.5();
    }
LABEL_49:

    return 0;
  }
  LOWORD(v22) = v7;
  if (!(_DWORD)v7)
  {
    v7 = objc_msgSend(a6, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 1, 0, 0);
    v22 = HIDWORD(v7);
  }
  -[VCMediaStreamMultiwayConfig setSsrc:](v12, "setSsrc:", v7);
  -[VCMediaStreamMultiwayConfig setIdsStreamID:](v12, "setIdsStreamID:", (unsigned __int16)v22);
  -[VCMediaStreamMultiwayConfigAudio setAudioRules:](v12, "setAudioRules:", a4);
  -[VCMediaStreamMultiwayConfig setMaxIDSStreamIdCount:](v12, "setMaxIDSStreamIdCount:", v9);
  -[VCMediaStreamMultiwayConfig setNegotiationProtocolMask:](v12, "setNegotiationProtocolMask:", 2);
  return v12;
}

- (BOOL)setupRedFactorsWithPList:(id)a3 audioStreamConfig:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCSessionMediaStreamPresenceConfigurationProvider *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(a3);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(a4, "addSupportedNumRedundantPayload:", objc_msgSend(v11, "intValue"));
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v12)
          return v12;
        -[VCSessionMediaStreamPresenceConfigurationProvider setupRedFactorsWithPList:audioStreamConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v12)
          return v12;
        v17 = 136316162;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupRedFactorsWithPList:audioStreamConfig:]";
        v21 = 1024;
        v22 = 1102;
        v23 = 2112;
        v24 = v13;
        v25 = 2048;
        v26 = self;
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid red factir class", (uint8_t *)&v17, 0x30u);
      }
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)setupAudioRedWithPlist:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCSessionMediaStreamPresenceConfigurationProvider *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("redPayload"));
  if (!v9)
    goto LABEL_8;
  v10 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "intValue");
    if ((_DWORD)v11 == 128)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v14)
            return v14;
          -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.1();
        }
        goto LABEL_61;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v14)
          return v14;
        v28 = 136316162;
        v29 = v23;
        v30 = 2080;
        v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
        v32 = 1024;
        v33 = 1119;
        v34 = 2112;
        v35 = v16;
        v36 = 2048;
        v37 = self;
        v22 = " [%s] %s:%d %@(%p) Invalid red payload";
        goto LABEL_60;
      }
    }
    else
    {
      v12 = v11;
      if (-[VCSessionMediaStreamPresenceConfigurationProvider addPayload:audioStreamConfig:supportedAudioRules:](self, "addPayload:audioStreamConfig:supportedAudioRules:", v11, a4, a5))
      {
        objc_msgSend(a4, "setupRedWithRxPayload:txPayload:", v12, v12);
        v13 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("redFactors"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[VCSessionMediaStreamPresenceConfigurationProvider setupRedFactorsWithPList:audioStreamConfig:](self, "setupRedFactorsWithPList:audioStreamConfig:", v13, a4))
          {
            objc_msgSend(a4, "setNumRedundantPayloads:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "supportedNumRedundantPayload"), "objectAtIndexedSubscript:", 0), "intValue"));
LABEL_8:
            LOBYTE(v14) = 1;
            return v14;
          }
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v14)
                return v14;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.2();
            }
            goto LABEL_61;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v19 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v19 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v14)
              return v14;
            v28 = 136316162;
            v29 = v26;
            v30 = 2080;
            v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
            v32 = 1024;
            v33 = 1130;
            v34 = 2112;
            v35 = v19;
            v36 = 2048;
            v37 = self;
            v22 = " [%s] %s:%d %@(%p) Failed to setup red factors";
LABEL_60:
            _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v28, 0x30u);
          }
        }
        else
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v14)
                return v14;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.3();
            }
            goto LABEL_61;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v18 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v18 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v25 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v14)
              return v14;
            v28 = 136316162;
            v29 = v25;
            v30 = 2080;
            v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
            v32 = 1024;
            v33 = 1127;
            v34 = 2112;
            v35 = v18;
            v36 = 2048;
            v37 = self;
            v22 = " [%s] %s:%d %@(%p) Invalid red factors class";
            goto LABEL_60;
          }
        }
      }
      else
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v14)
              return v14;
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.4();
          }
          goto LABEL_61;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v17 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v17 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v14)
            return v14;
          v28 = 136316162;
          v29 = v24;
          v30 = 2080;
          v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
          v32 = 1024;
          v33 = 1122;
          v34 = 2112;
          v35 = v17;
          v36 = 2048;
          v37 = self;
          v22 = " [%s] %s:%d %@(%p) Failed to add payload";
          goto LABEL_60;
        }
      }
    }
  }
  else
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v14)
          return v14;
        -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.5();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      v28 = 136316162;
      v29 = v20;
      v30 = 2080;
      v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
      v32 = 1024;
      v33 = 1117;
      v34 = 2112;
      v35 = v15;
      v36 = 2048;
      v37 = self;
      v22 = " [%s] %s:%d %@(%p) Invalid red payload class";
      goto LABEL_60;
    }
  }
LABEL_61:
  LOBYTE(v14) = 0;
  return v14;
}

- (BOOL)setupAudioRulesWithPList:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  VCAudioStreamCodecConfig *v28;
  VCAudioStreamCodecConfig *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  uint32_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  id obj;
  VCSessionMediaStreamPresenceConfigurationProvider *v66;
  uint64_t v67;
  uint64_t v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  VCSessionMediaStreamPresenceConfigurationProvider *v79;
  __int16 v80;
  int v81;
  _BYTE v82[128];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("codecs"));
  if (!objc_msgSend(v8, "count"))
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.1();
      }
      goto LABEL_138;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v62 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v62 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_138;
    v63 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E0CF2758];
    v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v38)
      return v38;
    *(_DWORD *)buf = 136316162;
    v71 = v63;
    v72 = 2080;
    v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
    v74 = 1024;
    v75 = 1147;
    v76 = 2112;
    v77 = v62;
    v78 = 2048;
    v79 = self;
    v50 = " [%s] %s:%d %@(%p) No payloads listed in config";
    goto LABEL_136;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v69 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
  if (!v69)
    goto LABEL_44;
  v67 = *(_QWORD *)v84;
  obj = v8;
  v66 = self;
  while (2)
  {
    for (i = 0; i != v69; ++i)
    {
      if (*(_QWORD *)v84 != v67)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
      v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("codecType"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          VRTraceErrorLogLevelToCSTR();
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.10();
            goto LABEL_138;
          }
          return v38;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v39 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v39 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_138;
        v48 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E0CF2758];
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        *(_DWORD *)buf = 136316162;
        v71 = v48;
        v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        v74 = 1024;
        v75 = 1156;
        v76 = 2112;
        v77 = v39;
        v78 = 2048;
        v79 = self;
        v50 = " [%s] %s:%d %@(%p) Invalid codec class";
        goto LABEL_136;
      }
      v12 = objc_msgSend(v11, "intValue");
      if (!v12)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          VRTraceErrorLogLevelToCSTR();
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.2();
            goto LABEL_138;
          }
          return v38;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v40 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v40 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_138;
        v51 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E0CF2758];
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        *(_DWORD *)buf = 136316162;
        v71 = v51;
        v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        v74 = 1024;
        v75 = 1158;
        v76 = 2112;
        v77 = v40;
        v78 = 2048;
        v79 = self;
        v50 = " [%s] %s:%d %@(%p) Invalid codec";
        goto LABEL_136;
      }
      v13 = v12;
      v14 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("codecPreferredMode"));
      if (v14)
      {
        v15 = (void *)v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.9();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v43 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v43 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v57 = VRTraceErrorLogLevelToCSTR();
              v49 = *MEMORY[0x1E0CF2758];
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              *(_DWORD *)buf = 136316162;
              v71 = v57;
              v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              v74 = 1024;
              v75 = 1162;
              v76 = 2112;
              v77 = v43;
              v78 = 2048;
              v79 = self;
              v50 = " [%s] %s:%d %@(%p) Invalid preferred codec mode class";
              goto LABEL_136;
            }
          }
          goto LABEL_138;
        }
        v16 = objc_msgSend(v15, "intValue");
        if ((_DWORD)v16 == -1)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.8();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v44 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v44 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v58 = VRTraceErrorLogLevelToCSTR();
              v49 = *MEMORY[0x1E0CF2758];
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              *(_DWORD *)buf = 136316162;
              v71 = v58;
              v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              v74 = 1024;
              v75 = 1164;
              v76 = 2112;
              v77 = v44;
              v78 = 2048;
              v79 = self;
              v50 = " [%s] %s:%d %@(%p) Invalid preferred mode";
              goto LABEL_136;
            }
          }
LABEL_138:
          LOBYTE(v38) = 0;
          return v38;
        }
      }
      else
      {
        v16 = 0xFFFFFFFFLL;
      }
      v17 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rtpPayload"));
      if (v17)
      {
        v18 = (void *)v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.7();
            }
            goto LABEL_138;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v45 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v45 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          v59 = VRTraceErrorLogLevelToCSTR();
          v49 = *MEMORY[0x1E0CF2758];
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v38)
            return v38;
          *(_DWORD *)buf = 136316162;
          v71 = v59;
          v72 = 2080;
          v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
          v74 = 1024;
          v75 = 1169;
          v76 = 2112;
          v77 = v45;
          v78 = 2048;
          v79 = self;
          v50 = " [%s] %s:%d %@(%p) Invalid rtp payload";
          goto LABEL_136;
        }
        v19 = objc_msgSend(v18, "intValue");
      }
      else
      {
        v19 = 0xFFFFLL;
      }
      v20 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pTime"));
      if (v20)
      {
        v21 = (void *)v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
              if (!v38)
                return v38;
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.6();
            }
            goto LABEL_138;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v46 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v46 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          v60 = VRTraceErrorLogLevelToCSTR();
          v49 = *MEMORY[0x1E0CF2758];
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v38)
            return v38;
          *(_DWORD *)buf = 136316162;
          v71 = v60;
          v72 = 2080;
          v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
          v74 = 1024;
          v75 = 1175;
          v76 = 2112;
          v77 = v46;
          v78 = 2048;
          v79 = self;
          v50 = " [%s] %s:%d %@(%p) Invalid pTime";
          goto LABEL_136;
        }
        v22 = (int)objc_msgSend(v21, "intValue");
      }
      else
      {
        v22 = 20;
      }
      v23 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isOpusInBandFecEnabled"));
      if (v23)
      {
        v24 = (void *)v23;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = objc_msgSend(v24, "BOOLValue");
          goto LABEL_26;
        }
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v38)
              return v38;
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.5();
          }
          goto LABEL_138;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v47 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v47 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_138;
        v61 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E0CF2758];
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        *(_DWORD *)buf = 136316162;
        v71 = v61;
        v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        v74 = 1024;
        v75 = 1181;
        v76 = 2112;
        v77 = v47;
        v78 = 2048;
        v79 = self;
        v50 = " [%s] %s:%d %@(%p) Invalid isOpusInBandFecEnabled";
LABEL_136:
        v55 = v49;
        v56 = 48;
LABEL_137:
        _os_log_error_impl(&dword_1D8A54000, v55, OS_LOG_TYPE_ERROR, v50, buf, v56);
        goto LABEL_138;
      }
      v25 = 0;
LABEL_26:
      v26 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", v13);
      if ((_DWORD)v26 == 128)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          VRTraceErrorLogLevelToCSTR();
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.3();
            goto LABEL_138;
          }
          return v38;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v41 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v66, "performSelector:", sel_logPrefix);
        else
          v41 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_138;
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E0CF2758];
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        *(_DWORD *)buf = 136316418;
        v71 = v52;
        v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        v74 = 1024;
        v75 = 1186;
        v76 = 2112;
        v77 = v41;
        v78 = 2048;
        v79 = v66;
        v80 = 1024;
        v81 = v13;
        v50 = " [%s] %s:%d %@(%p) Failed retrieve payload for codec type=%d";
        goto LABEL_100;
      }
      v27 = v26;
      v28 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", v13);
      if (!v28)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_138;
          VRTraceErrorLogLevelToCSTR();
          v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.4();
            goto LABEL_138;
          }
          return v38;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v42 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v66, "performSelector:", sel_logPrefix);
        else
          v42 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_138;
        v54 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E0CF2758];
        v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v38)
          return v38;
        *(_DWORD *)buf = 136316418;
        v71 = v54;
        v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        v74 = 1024;
        v75 = 1189;
        v76 = 2112;
        v77 = v42;
        v78 = 2048;
        v79 = v66;
        v80 = 1024;
        v81 = v13;
        v50 = " [%s] %s:%d %@(%p) Failed to allocate codec config for type=%d";
LABEL_100:
        v55 = v53;
        v56 = 54;
        goto LABEL_137;
      }
      v29 = v28;
      -[VCAudioStreamCodecConfig setPreferredMode:](v28, "setPreferredMode:", v16);
      -[VCAudioStreamCodecConfig setNetworkPayload:](v29, "setNetworkPayload:", v19);
      -[VCAudioStreamCodecConfig setPTime:](v29, "setPTime:", v22);
      -[VCAudioStreamCodecConfig setIsOpusInBandFecEnabled:](v29, "setIsOpusInBandFecEnabled:", v25);
      if ((v27 - 107) <= 4 && ((1 << (v27 - 107)) & 0x13) != 0)
      {
        -[VCAudioStreamCodecConfig setDtxEnabled:](v29, "setDtxEnabled:", 1);
        -[VCAudioStreamCodecConfig setSupportedModes:](v29, "setSupportedModes:", &unk_1E9EF9BC0);
      }
      objc_msgSend(a4, "addCodecConfiguration:", v29);

      self = v66;
      if (!-[VCSessionMediaStreamPresenceConfigurationProvider addPayload:audioStreamConfig:supportedAudioRules:](v66, "addPayload:audioStreamConfig:supportedAudioRules:", v27, a4, a5))
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v71 = v36;
              v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              v74 = 1024;
              v75 = 1206;
              v76 = 1024;
              LODWORD(v77) = v27;
              v33 = v37;
              v34 = " [%s] %s:%d Failed to add payload=%u";
              v35 = 34;
              goto LABEL_41;
            }
          }
        }
        else
        {
          v30 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v30 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](v66, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v31 = VRTraceErrorLogLevelToCSTR();
            v32 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              v71 = v31;
              v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              v74 = 1024;
              v75 = 1206;
              v76 = 2112;
              v77 = v30;
              v78 = 2048;
              v79 = v66;
              v80 = 1024;
              v81 = v27;
              v33 = v32;
              v34 = " [%s] %s:%d %@(%p) Failed to add payload=%u";
              v35 = 54;
LABEL_41:
              _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
              continue;
            }
          }
        }
      }
    }
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
    if (v69)
      continue;
    break;
  }
LABEL_44:
  LOBYTE(v38) = -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:](self, "setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:", a3, a4, a5);
  return v38;
}

- (id)newAudioStreamGroupStreamConfigWithPList:(id)a3 supportedAudioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7 groupID:(unsigned int)a8
{
  uint64_t v9;
  uint64_t v11;
  VCSessionParticipantAudioStreamConfig *v15;
  VCMediaStreamRateControlConfig *v16;
  VCMediaStreamRateControlConfig *v17;
  VCAudioRuleCollection *v18;
  VCAudioRuleCollection *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint32_t v61;
  uint64_t v62;
  NSObject *v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  VCSessionMediaStreamPresenceConfigurationProvider *v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v76 = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.1();
    }
    goto LABEL_81;
  }
  v16 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v16)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v39 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v48 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v64 = 136316162;
          v65 = v48;
          v66 = 2080;
          v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAu"
                "dioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
          v68 = 1024;
          v69 = 1232;
          v70 = 2112;
          v71 = v39;
          v72 = 2048;
          v73 = self;
          _os_log_error_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", (uint8_t *)&v64, 0x30u);
        }
      }
    }
LABEL_81:
    v19 = 0;
    v17 = 0;
LABEL_87:
    v21 = 0;
    goto LABEL_88;
  }
  v17 = v16;
  -[VCMediaStreamConfig setRateControlConfig:](v15, "setRateControlConfig:", v16);
  v18 = objc_alloc_init(VCAudioRuleCollection);
  if (!v18)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v40 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v40 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v64 = 136316162;
          v65 = v50;
          v66 = 2080;
          v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAu"
                "dioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
          v68 = 1024;
          v69 = 1236;
          v70 = 2112;
          v71 = v40;
          v72 = 2048;
          v73 = self;
          _os_log_error_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules collection", (uint8_t *)&v64, 0x30u);
        }
      }
    }
    v19 = 0;
    goto LABEL_87;
  }
  v19 = v18;
  -[VCSessionParticipantAudioStreamConfig setAudioRules:](v15, "setAudioRules:", v18);
  if (!-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:](self, "setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:", a3, v15, a4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.12();
    }
    goto LABEL_87;
  }
  v20 = -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:](self, "newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:", a3, v19, v11, a6, v9);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.4();
    }
    goto LABEL_87;
  }
  v21 = v20;
  -[VCMediaStreamConfig setMultiwayConfig:](v15, "setMultiwayConfig:", v20);
  v22 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtpTimestampRate"));
  if (v22)
  {
    v23 = (void *)v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.11();
        }
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_88;
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_88;
      v64 = 136316162;
      v65 = v52;
      v66 = 2080;
      v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      v68 = 1024;
      v69 = 1252;
      v70 = 2112;
      v71 = v41;
      v72 = 2048;
      v73 = self;
      v54 = " [%s] %s:%d %@(%p) Invalid RTP timestamp rate";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtpTimestampRate:](v15, "setRtpTimestampRate:", objc_msgSend(v23, "intValue"));
  }
  v24 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpEnabled"));
  if (v24)
  {
    v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.10();
        }
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v42 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_88;
      v55 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_88;
      v64 = 136316162;
      v65 = v55;
      v66 = 2080;
      v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      v68 = 1024;
      v69 = 1258;
      v70 = 2112;
      v71 = v42;
      v72 = 2048;
      v73 = self;
      v54 = " [%s] %s:%d %@(%p) Invalid RTCP enabled";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtcpEnabled:](v15, "setRtcpEnabled:", objc_msgSend(v25, "BOOLValue"));
  }
  v26 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpSendInterval"));
  if (v26)
  {
    v27 = (void *)v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.9();
        }
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v43 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v43 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_88;
      v56 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_88;
      v64 = 136316162;
      v65 = v56;
      v66 = 2080;
      v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      v68 = 1024;
      v69 = 1264;
      v70 = 2112;
      v71 = v43;
      v72 = 2048;
      v73 = self;
      v54 = " [%s] %s:%d %@(%p) Invalid RTP send interval";
      goto LABEL_134;
    }
    objc_msgSend(v27, "doubleValue");
    -[VCMediaStreamConfig setRtcpSendInterval:](v15, "setRtcpSendInterval:");
  }
  v28 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("rtcpTimeOutEnabled"));
  if (v28)
  {
    v29 = (void *)v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.8();
        }
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v44 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v44 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_88;
      v57 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_88;
      v64 = 136316162;
      v65 = v57;
      v66 = 2080;
      v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      v68 = 1024;
      v69 = 1270;
      v70 = 2112;
      v71 = v44;
      v72 = 2048;
      v73 = self;
      v54 = " [%s] %s:%d %@(%p) Invalid RTCP timeout enabled";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtcpTimeOutEnabled:](v15, "setRtcpTimeOutEnabled:", objc_msgSend(v29, "BOOLValue"));
  }
  v30 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bundlingScheme"));
  if (v30)
  {
    v31 = (void *)v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.7();
        }
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v45 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v45 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_88;
      v58 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_88;
      v64 = 136316162;
      v65 = v58;
      v66 = 2080;
      v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      v68 = 1024;
      v69 = 1276;
      v70 = 2112;
      v71 = v45;
      v72 = 2048;
      v73 = self;
      v54 = " [%s] %s:%d %@(%p) Invalid bundling scheme";
      goto LABEL_134;
    }
    v32 = objc_msgSend(v31, "intValue");
  }
  else
  {
    v32 = 1;
  }
  -[VCAudioStreamConfig setBundlingScheme:](v15, "setBundlingScheme:", v32);
  v33 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("audioChannelCount"));
  if (v33)
  {
    v34 = (void *)v33;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_msgSend(v34, "intValue");
      goto LABEL_26;
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.6();
      }
      goto LABEL_88;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v46 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v46 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_88;
    v59 = VRTraceErrorLogLevelToCSTR();
    v53 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_88;
    v64 = 136316162;
    v65 = v59;
    v66 = 2080;
    v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRul"
          "es:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
    v68 = 1024;
    v69 = 1284;
    v70 = 2112;
    v71 = v46;
    v72 = 2048;
    v73 = self;
    v54 = " [%s] %s:%d %@(%p) Invalid number of audio channels";
LABEL_134:
    v60 = v53;
    v61 = 48;
LABEL_135:
    _os_log_error_impl(&dword_1D8A54000, v60, OS_LOG_TYPE_ERROR, v54, (uint8_t *)&v64, v61);
    goto LABEL_88;
  }
  v35 = 1;
LABEL_26:
  -[VCAudioStreamConfig setChannelCount:](v15, "setChannelCount:", v35);
  v36 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sframeCipherSuite"));
  if (v36)
  {
    v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VCMediaStreamConfig setSframeCipherSuite:](v15, "setSframeCipherSuite:", objc_msgSend(v37, "intValue"));
      goto LABEL_29;
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.5();
      }
      goto LABEL_88;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v47 = (const __CFString *)-[VCSessionMediaStreamPresenceConfigurationProvider performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v47 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v62 = VRTraceErrorLogLevelToCSTR();
      v63 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v64 = 136316418;
        v65 = v62;
        v66 = 2080;
        v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudi"
              "oRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
        v68 = 1024;
        v69 = 1292;
        v70 = 2112;
        v71 = v47;
        v72 = 2048;
        v73 = self;
        v74 = 2112;
        v75 = CFSTR("sframeCipherSuite");
        v54 = " [%s] %s:%d %@(%p) Invalid %@ class";
        v60 = v63;
        v61 = 58;
        goto LABEL_135;
      }
    }
LABEL_88:

    v15 = 0;
    goto LABEL_34;
  }
LABEL_29:
  if (!-[VCMediaStreamConfig sframeCipherSuite](v15, "sframeCipherSuite"))
  {
    -[VCMediaStreamConfig setSRTPCipherSuite:](v15, "setSRTPCipherSuite:", 3);
    -[VCMediaStreamConfig setSRTCPCipherSuite:](v15, "setSRTCPCipherSuite:", 3);
  }
  if (a8 == 1936290409)
    -[VCAudioStreamConfig setSupportsAdaptation:](v15, "setSupportsAdaptation:", 1);
  -[VCSessionParticipantAudioStreamConfig setAudioRules:](v15, "setAudioRules:", v19);
  -[VCMediaStreamConfig setDirection:](v15, "setDirection:", 1);
  -[VCMediaStreamConfig setJitterBufferMode:](v15, "setJitterBufferMode:", 1);
LABEL_34:

  return v15;
}

- (BOOL)setupAudioStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 supportedAudioRules:(id)a5 streamIDGenerator:(id)a6
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v8, CFSTR("streamConfigurations"));

    v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntegerValue");
    v11 = objc_msgSend(a3, "count");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (!v12)
    {
LABEL_13:
      LOBYTE(v21) = 1;
      return v21;
    }
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v28;
LABEL_4:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(a3);
      v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
      v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ignore"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v18, "BOOLValue") & 1) == 0)
      {
        v19 = -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:](self, "newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:", v17, a5, v11, a6, +[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:streamIndex:](VCSessionMediaStreamPresenceConfigurationProvider, "streamSSRCForStreamGroupID:streamIndex:", v10, v14), v10);
        if (!v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_18;
          VRTraceErrorLogLevelToCSTR();
          v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v21)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:].cold.2();
            goto LABEL_18;
          }
          return v21;
        }
        v20 = v19;
        v14 = (v14 + 1);
        objc_msgSend(v9, "addObject:", v19);

        v11 = (v11 - 1);
      }
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v13)
          goto LABEL_4;
        goto LABEL_13;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v21)
      return v21;
    -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:].cold.1();
  }
LABEL_18:
  LOBYTE(v21) = 0;
  return v21;
}

- (id)newStreamGroupConfigurationWithPList:(id)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.1();
    }
    goto LABEL_26;
  }
  v20 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupID")), &v20))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.9();
    }
    goto LABEL_26;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20), CFSTR("streamGroupID"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyController")))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyController")), CFSTR("streamGroupRedundancyControllerEnabled"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamInputID")))
  {
    v19 = 0;
    if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamInputID")), &v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.8();
      }
      goto LABEL_26;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19), CFSTR("streamInputID"));
  }
  v18 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType")), &v18))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.7();
    }
    goto LABEL_26;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18), CFSTR("streamGroupMediaType"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")))
  {
    v19 = 0;
    if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")), &v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.6();
      }
      goto LABEL_26;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19), CFSTR("streamGroupSyncGroupID"));
  }
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streams"));
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.2();
    }
    goto LABEL_26;
  }
  v11 = v10;
  v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.5();
    }
    goto LABEL_26;
  }
  v13 = objc_msgSend(v12, "unsignedIntValue");
  if (v13 == 1835365473 || (v14 = v13, v13 == 1986618469))
  {
    if (!-[VCSessionMediaStreamPresenceConfigurationProvider setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:](self, "setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:", v11, v9, a5))goto LABEL_20;
  }
  else
  {
    if (v13 != 1936684398)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.3(v15, v14, v16);
      }
      goto LABEL_26;
    }
    if (!-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:](self, "setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:", v11, v9, a4, a5))
    {
LABEL_20:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.4();
      }
LABEL_26:

      return 0;
    }
  }
  return v9;
}

- (id)newStreamGroupConfigurationsWithSupportedAudioRules:(id)a3 streamIDGenerator:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v20;
  void *v24;
  int v25;
  int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", CFSTR("streamGroups"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (!v6)
    return v24;
  v8 = v6;
  v9 = *(_QWORD *)v37;
  *(_QWORD *)&v7 = 136315906;
  v20 = v7;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v12 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ignore"), v20));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v12, "BOOLValue") & 1) == 0)
      {
        v26 = 0;
        if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamGroupID")), &v26))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:].cold.2();
          }
          goto LABEL_30;
        }
        if (objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count")&& +[VCHardwareSettings isVideoRenderingSupported](VCHardwareSettings, "isVideoRenderingSupported")|| (v13 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType")), v25 = 0, +[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", v13, &v25))&& v25 == 1936684398)
        {
          v14 = -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:](self, "newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:", v11, a3, a4);
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v24, "addObject:", v14);

            continue;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:].cold.1();
          }
LABEL_30:

          return 0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          v18 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              v28 = v16;
              v29 = 2080;
              v30 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRu"
                    "les:streamIDGenerator:]";
              v31 = 1024;
              v32 = 1445;
              v33 = 2112;
              v34 = v13;
              _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mediaType=%@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v28 = v16;
            v29 = 2080;
            v30 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRule"
                  "s:streamIDGenerator:]";
            v31 = 1024;
            v32 = 1445;
            v33 = 2112;
            v34 = v13;
            _os_log_debug_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEBUG, " [%s] %s:%d mediaType=%@", buf, 0x26u);
          }
        }
      }
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v8)
      continue;
    return v24;
  }
}

- (NSSet)streamInputConfigurations
{
  return self->_streamInputConfigurations;
}

- (NSSet)streamGroupConfigurations
{
  return self->_streamGroupConfigurations;
}

+ (void)sessionConfigurationForType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d No resource defined for configuration type=%u", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)sessionConfigurationForType:.cold.2()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Failed to load configuration resource=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load the stream input configurations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load the stream group configurations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize streamGroupToStreamInputMapping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupToStreamInputsMapping
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create stream group mapping dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)publicSessionConfigurationForType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate new plist configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)publicSessionConfigurationForType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocated stream input array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)publicSessionConfigurationForType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration is nil for type=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)publicSessionConfigurationForType:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocated stream input dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)readUint32WithPList:key:defaultValue:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "+[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:key:defaultValue:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d '%@' is missing in config", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInputConfigurations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid type for field=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video stream input config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Width is 0!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Height is 0!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Subtype is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamInputID is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDataStreamInputConfigurationWithPList:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the data stream input config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDataStreamInputConfigurationWithPList:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Subtype is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDataStreamInputConfigurationWithPList:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamInputID is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.1()
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

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Max network bitrate is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Max media bitrate is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Using reserved SSRC with un-available repaired stream id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid framerate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Frame rate field should be of numeber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid framerate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Video width is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Height width is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.13()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Frame rate field should be of numeber type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateStreamConfig:forPayload:networkPayload:groupID:.cold.1()
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

- (void)getVideoCodecConfigFromStreamConfigPList:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getVideoCodecConfigFromStreamConfigPList:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codecs array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getVideoCodecFromStreamCodecPList:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]";
  OUTLINED_FUNCTION_4();
  v5 = 808;
  v6 = 2112;
  v7 = CFSTR("codecType");
  v8 = v0;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d '%@'=%d incorrect codecType in config", v3, 0x2Cu);
}

- (void)getVideoCodecFromStreamCodecPList:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec type class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.1()
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

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse codec config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 'Invalid codec type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.4()
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

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.5()
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

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamConfig cannot be generated when encoder resolution is zero", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:(NSObject *)a3 streamIDGenerator:ssrc:groupID:shouldSkip:.cold.7(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[14];
  const char *v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ss"
       "rc:groupID:shouldSkip:]";
  OUTLINED_FUNCTION_4();
  v8 = 958;
  v9 = 2048;
  v10 = v4;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, " [%s] %s:%d Invalid payloads, payloadSize: %lu", v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.13()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTCP timeout enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.14()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTCP send interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.15()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTCP enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.16()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTP timestamp rate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.17()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid profile level", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.18()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid rtp payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.19()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid encoderUsage class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.20()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No fallback stream is provided for an unsupported codec type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.21()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse codec config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.22()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 'Invalid codec type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video stream configuration array!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the video stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.1()
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

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid max network bitrate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid max packets per second", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid quality index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid media bitrate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRedFactorsWithPList:audioStreamConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid red factir class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid red payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup red factors", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid red factors class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid red payload class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No payloads listed in config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:sup"
                      "portedAudioRules:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed retrieve payload for codec type=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:sup"
                      "portedAudioRules:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate codec config for type=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid isOpusInBandFecEnabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid pTime", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid rtp payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid preferred mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid preferred codec mode class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.1()
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

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.2()
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

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.3()
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

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid number of audio channels", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid bundling scheme", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTCP timeout enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTP send interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTCP enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTP timestamp rate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.12()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio stream configuration array!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the audio stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the stream group config dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No streams specified!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:(uint64_t)a1 supportedAudioRules:(int)a2 streamIDGenerator:(NSObject *)a3 .cold.3(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:]";
  v9 = 1024;
  v10 = 1411;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Unsupported media type=%s", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid media type class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve syncGroupID for stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group media type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group stream input ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load stream input configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
