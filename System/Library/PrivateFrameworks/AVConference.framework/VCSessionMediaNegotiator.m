@implementation VCSessionMediaNegotiator

- (VCSessionMediaNegotiator)initWithLocalConfiguration:(id)a3
{
  VCSessionMediaNegotiator *v4;
  uint64_t v5;
  VCMediaNegotiator *v6;
  VCMediaNegotiator *v7;
  VCMediaNegotiatorV2 *v8;
  VCMediaNegotiatorV2 *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCSessionMediaNegotiator;
  v4 = -[VCSessionMediaNegotiator init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v4->_mediaNegotiatorMap = (NSMutableDictionary *)v5;
    if (v5)
    {
      v6 = -[VCMediaNegotiator initWithLocalSettings:]([VCMediaNegotiator alloc], "initWithLocalSettings:", a3);
      if (v6)
      {
        v7 = v6;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_mediaNegotiatorMap, "setObject:forKeyedSubscript:", v6, &unk_1E9EF4D90);

        v8 = -[VCMediaNegotiatorBase initWithLocalSettings:]([VCMediaNegotiatorV2 alloc], "initWithLocalSettings:", a3);
        if (v8)
        {
          v9 = v8;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_mediaNegotiatorMap, "setObject:forKeyedSubscript:", v8, &unk_1E9EF4DA8);

          v4->_localSettings = (VCMediaNegotiatorLocalConfiguration *)a3;
          return v4;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionMediaNegotiator initWithLocalConfiguration:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionMediaNegotiator initWithLocalConfiguration:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMediaNegotiator initWithLocalConfiguration:].cold.1();
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
  v3.super_class = (Class)VCSessionMediaNegotiator;
  -[VCSessionMediaNegotiator dealloc](&v3, sel_dealloc);
}

+ (id)mediaBlobForVersion:(int)a3 negotiationData:(id)a4
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&a3;
  v5 = +[VCSessionMediaNegotiator unserializeNegotiationData:](VCSessionMediaNegotiator, "unserializeNegotiationData:", a4);
  return (id)objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
}

+ (id)negotiationDataWithVersion:(int)a3 mediaBlob:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a4, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5));
  return +[VCSessionMediaNegotiator serializeNegotiationData:](VCSessionMediaNegotiator, "serializeNegotiationData:", v6);
}

+ (id)negotiationDataWithVersion1:(id)a3 version2:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, &unk_1E9EF4D90);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a4, &unk_1E9EF4DA8);
  return +[VCSessionMediaNegotiator serializeNegotiationData:](VCSessionMediaNegotiator, "serializeNegotiationData:", v6);
}

- (id)negotiationData
{
  NSMutableDictionary **p_mediaNegotiatorMap;
  NSMutableDictionary *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  p_mediaNegotiatorMap = &self->_mediaNegotiatorMap;
  v16 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_mediaNegotiatorMap, "count"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v3 = *p_mediaNegotiatorMap;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__VCSessionMediaNegotiator_negotiationData__block_invoke;
  v6[3] = &unk_1E9E54F38;
  v6[4] = &v7;
  v6[5] = &v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (*((_BYTE *)v8 + 24))
    v4 = +[VCSessionMediaNegotiator serializeNegotiationData:](VCSessionMediaNegotiator, "serializeNegotiationData:", v12[5]);
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __43__VCSessionMediaNegotiator_negotiationData__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "negotiationData");
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, a2);
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  VCMediaNegotiatorProtocol **p_activeNegotiator;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  p_activeNegotiator = &self->_activeNegotiator;
  if (self->_activeNegotiator)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCSessionMediaNegotiator processRemoteNegotiationData:].cold.4();
    }
  }
  else
  {
    v5 = +[VCSessionMediaNegotiator unserializeNegotiationData:](VCSessionMediaNegotiator, "unserializeNegotiationData:", a3);
    if (objc_msgSend(v5, "count") == 1)
    {
      v6 = objc_msgSend((id)objc_msgSend(v5, "allKeys"), "firstObject");
      v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaNegotiatorMap, "objectForKeyedSubscript:", v6);
      if (v7)
      {
        v8 = v7;
        if ((objc_msgSend(v7, "processRemoteNegotiationData:", objc_msgSend(v5, "objectForKeyedSubscript:", v6)) & 1) != 0)
        {
          *p_activeNegotiator = (VCMediaNegotiatorProtocol *)v8;
          LOBYTE(v9) = 1;
          return v9;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v9)
            return v9;
          -[VCSessionMediaNegotiator processRemoteNegotiationData:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v9)
          return v9;
        -[VCSessionMediaNegotiator processRemoteNegotiationData:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCSessionMediaNegotiator processRemoteNegotiationData:].cold.3();
    }
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (VCMediaNegotiatorResults)negotiatedSettings
{
  return (VCMediaNegotiatorResults *)-[VCMediaNegotiatorProtocol negotiatedSettings](self->_activeNegotiator, "negotiatedSettings");
}

- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings
{
  return (VCMediaNegotiatorResultsAudio *)-[VCMediaNegotiatorProtocol negotiatedAudioSettings](self->_activeNegotiator, "negotiatedAudioSettings");
}

- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings
{
  return (VCMediaNegotiatorResultsVideo *)-[VCMediaNegotiatorProtocol negotiatedVideoSettings](self->_activeNegotiator, "negotiatedVideoSettings");
}

- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings
{
  return (VCMediaNegotiatorResultsVideo *)-[VCMediaNegotiatorProtocol negotiatedScreenSettings](self->_activeNegotiator, "negotiatedScreenSettings");
}

- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings
{
  return (VCMediaNegotiatorResultsMediaRecorder *)-[VCMediaNegotiatorProtocol negotiatedMediaRecorderSettings](self->_activeNegotiator, "negotiatedMediaRecorderSettings");
}

- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings
{
  return (VCMediaNegotiatorResultsFaceTimeSettings *)-[VCMediaNegotiatorProtocol negotiatedFaceTimeSettings](self->_activeNegotiator, "negotiatedFaceTimeSettings");
}

- (NSArray)negotiatedStreamGroups
{
  return (NSArray *)-[VCMediaNegotiatorProtocol negotiatedStreamGroups](self->_activeNegotiator, "negotiatedStreamGroups");
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3
{
  return (id)-[VCMediaNegotiatorProtocol negotiatedResultsForGroupID:](self->_activeNegotiator, "negotiatedResultsForGroupID:", *(_QWORD *)&a3);
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  id v3;
  int v4;
  __objc2_class **v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = +[VCSessionMediaNegotiator unserializeNegotiationData:](VCSessionMediaNegotiator, "unserializeNegotiationData:", a3);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__VCSessionMediaNegotiator_streamGroupIDsWithMediaBlob___block_invoke;
  v8[3] = &unk_1E9E54F60;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (!v10[5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:].cold.1();
    }
    goto LABEL_10;
  }
  v4 = *((_DWORD *)v16 + 6);
  if (!v4)
  {
    v5 = off_1E9E4D640;
    goto LABEL_6;
  }
  if (v4 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:].cold.2();
    }
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v5 = off_1E9E4D648;
LABEL_6:
  v6 = (void *)-[__objc2_class streamGroupIDsWithMediaBlob:](*v5, "streamGroupIDsWithMediaBlob:");
LABEL_11:
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __56__VCSessionMediaNegotiator_streamGroupIDsWithMediaBlob___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a2, "intValue");
  if ((int)result <= 1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if ((int)result > *(_DWORD *)(v6 + 24))
    {
      *(_DWORD *)(v6 + 24) = result;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
    }
  }
  return result;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  return -[VCMediaNegotiatorProtocol remoteMaxBandwidthForArbiterMode:connectionType:](self->_activeNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", a3, *(_QWORD *)&a4);
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  BOOL v14;
  _BOOL4 v15;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = +[VCSessionMediaNegotiator unserializeNegotiationData:](VCSessionMediaNegotiator, "unserializeNegotiationData:", a4);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 1;
    while (1)
    {
      v13 = objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
      if (!v13)
        break;
      if ((v12 & 1) == 0)
      {
        if (+[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:](VCMediaNegotiatorV2, "initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:", a3, v13, v7, v6))
        {
          LOBYTE(v15) = 1;
          return v15;
        }
LABEL_6:
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_18;
        VRTraceErrorLogLevelToCSTR();
        v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v15)
        {
          +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.3();
          goto LABEL_18;
        }
        return v15;
      }
      v14 = +[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:](VCMediaNegotiator, "initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:", a3, v13, v7, v6);
      v12 = 0;
      v11 = 1;
      if (!v14)
        goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_18;
    VRTraceErrorLogLevelToCSTR();
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.2();
      goto LABEL_18;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v15)
        return v15;
      +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.1();
    }
LABEL_18:
    LOBYTE(v15) = 0;
  }
  return v15;
}

+ (id)serializeNegotiationData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a3), 1, 0);
}

+ (id)unserializeNegotiationData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0), a3, 0);
}

- (VCMediaNegotiatorLocalConfiguration)localSettings
{
  return self->_localSettings;
}

- (void)initWithLocalConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator for version 1 of the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalConfiguration:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator for version 2 of the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No negotiator found for media blob version=%@");
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate the media blob with version=%@");
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract the media blob from the negotiation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Active negotiator found, negotiation already performed. ActiveNegotiator=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract the media blob from the negotiation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unknown blob version=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]" >> 16, 169);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the negotiation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the negotiation data for version=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, 190);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the local configuration for version=%u", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, 204);
  OUTLINED_FUNCTION_3();
}

@end
