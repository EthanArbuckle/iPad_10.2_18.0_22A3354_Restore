@implementation VCMediaNegotiatorV2

- (id)negotiationData
{
  VCMediaNegotiationBlobV2 *v3;
  id v4;

  v3 = objc_alloc_init(VCMediaNegotiationBlobV2);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 negotiationData].cold.1();
    }
    goto LABEL_20;
  }
  if (!-[VCMediaNegotiatorV2 appendGeneralInfoToMediaBlob:](self, "appendGeneralInfoToMediaBlob:", v3)
    || !-[VCMediaNegotiatorV2 appendBandwidthSettingsToMediaBlob:](self, "appendBandwidthSettingsToMediaBlob:", v3)
    || !-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:](self, "appendCodecFeaturesToMediaBlob:", v3)
    || !-[VCMediaNegotiatorV2 appendMicrophoneOneToOneSettingsToMediaBlob:](self, "appendMicrophoneOneToOneSettingsToMediaBlob:", v3)|| !-[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:](self, "appendCameraOneToOneSettingsToMediaBlob:", v3)|| !-[VCMediaNegotiatorV2 appendMomentsSettingsToMediaBlob:](self, "appendMomentsSettingsToMediaBlob:", v3)|| !-[VCMediaNegotiatorV2 appendStreamGroupsToMediaBlob:](self, "appendStreamGroupsToMediaBlob:", v3))
  {
LABEL_20:
    v4 = 0;
    goto LABEL_16;
  }
  if (VCDefaults_GetBoolValueForKey(CFSTR("mediaNegotiatorV2CompressionEnabled"), 0))
  {
    v4 = +[VCMediaNegotiatorV2 newCompressedBlob:](VCMediaNegotiatorV2, "newCompressedBlob:", -[VCMediaNegotiationBlobV2 data](v3, "data"));
    if (!v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorV2 negotiationData].cold.2();
      }
      goto LABEL_20;
    }
  }
  else
  {
    v4 = (id)objc_msgSend((id)-[VCMediaNegotiationBlobV2 data](v3, "data"), "copy");
  }
  -[VCMediaNegotiationBlobV2 printWithTitle:logFile:](v3, "printWithTitle:logFile:", CFSTR("Created invite media blob (version 2)"), 0);
LABEL_16:

  return v4;
}

+ (id)newCompressedBlob:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "length");
  v4 = malloc_type_calloc(1uLL, v9, 0x739AACE0uLL);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 newCompressedBlob:].cold.1();
    }
    goto LABEL_3;
  }
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  if (CompressionUtils_CompressWithZLib())
  {
LABEL_3:
    v5 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = v6;
      v12 = 2080;
      v13 = "+[VCMediaNegotiatorV2 newCompressedBlob:]";
      v14 = 1024;
      v15 = 87;
      v16 = 1024;
      v17 = objc_msgSend(a3, "length");
      v18 = 1024;
      v19 = v9;
      v20 = 2048;
      v21 = (float)((float)v9 / (float)(int)objc_msgSend(a3, "length"));
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob v2 size=%d -> %d bytes with ratio %f", buf, 0x32u);
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, v9);
LABEL_8:
  free(v4);
  return v5;
}

+ (id)newDecompressedBlob:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = (int)((double)(int)objc_msgSend(a3, "length") * 1.5);
  v4 = malloc_type_calloc(1uLL, v9, 0x3B10B78FuLL);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 newDecompressedBlob:].cold.1();
    }
    goto LABEL_3;
  }
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  if (CompressionUtils_DecompressWithZlib())
  {
LABEL_3:
    v5 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v11 = v6;
      v12 = 2080;
      v13 = "+[VCMediaNegotiatorV2 newDecompressedBlob:]";
      v14 = 1024;
      v15 = 101;
      v16 = 1024;
      v17 = objc_msgSend(a3, "length");
      v18 = 1024;
      v19 = v9;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size=%d -> %d bytes", buf, 0x28u);
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, v9);
LABEL_8:
  free(v4);
  return v5;
}

+ (id)newUnserializedMediaBlob:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    if (!VCDefaults_GetBoolValueForKey(CFSTR("mediaNegotiatorV2CompressionEnabled"), 0))
      return -[VCMediaNegotiationBlobV2 initWithData:]([VCMediaNegotiationBlobV2 alloc], "initWithData:", v3);
    v3 = +[VCMediaNegotiatorV2 newDecompressedBlob:](VCMediaNegotiatorV2, "newDecompressedBlob:", v3);
    if (v3)
      return -[VCMediaNegotiationBlobV2 initWithData:]([VCMediaNegotiationBlobV2 alloc], "initWithData:", v3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 newUnserializedMediaBlob:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCMediaNegotiatorV2 newUnserializedMediaBlob:].cold.1();
  }
  return 0;
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.1();
    }
    goto LABEL_14;
  }
  +[VCMediaNegotiatorV2 dumpRemoteNegotiationData:forceFileDump:](VCMediaNegotiatorV2, "dumpRemoteNegotiationData:forceFileDump:", a3, 0);
  v5 = +[VCMediaNegotiatorV2 newUnserializedMediaBlob:](VCMediaNegotiatorV2, "newUnserializedMediaBlob:", a3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.2();
    }
LABEL_14:
    v7 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend(v5, "printWithTitle:logFile:", CFSTR("Received invite media blob (version 2)"), 0);
  if (!-[VCMediaNegotiatorV2 setupNegotiatedResultsWithRemoteMediaBlob:](self, "setupNegotiatedResultsWithRemoteMediaBlob:", v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.5();
    }
    goto LABEL_24;
  }
  -[VCMediaNegotiatorV2 setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:](self, "setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:", v6);
  if (!-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:](self, "setupNegotiatedMomentsResultsWithRemoteMediaBlob:", v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.4();
    }
    goto LABEL_24;
  }
  if (!-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:](self, "setupStreamGroupsWithRemoteMediaBlob:", v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.3();
    }
LABEL_24:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  VCMediaNegotiationBlobV2 *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  VCMediaNegotiatorAudioConfiguration *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VCMediaNegotiatorAudioConfiguration *v19;
  VCMediaNegotiatorAudioConfiguration *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  BOOL v27;
  NSMutableArray *obj;
  char v30;
  VCMediaNegotiationBlobV2 *v31;
  id v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = -[VCMediaNegotiationBlobV2 initWithData:]([VCMediaNegotiationBlobV2 alloc], "initWithData:", a4);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.1();
    }
    v27 = 0;
    goto LABEL_36;
  }
  objc_msgSend(a3, "resetStreamGroups");
  objc_msgSend(a3, "setOneToOneAuthTagEnabled:", 1);
  v8 = (void *)objc_msgSend(a3, "mediaConfigurationForMediaType:", 1);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = v7;
  obj = -[VCMediaNegotiationBlobV2 streamGroups](v7, "streamGroups");
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (!v9)
    goto LABEL_18;
  v10 = v9;
  v30 = 0;
  v11 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      v32 = 0;
      if ((objc_msgSend(v13, "getStreamGroupConfig:", &v32) & 0x80000000) != 0 || !v32)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.2();
        }
        goto LABEL_34;
      }
      objc_msgSend(a3, "addStreamGroupConfig:");
      v14 = (void *)objc_msgSend(a3, "mediaConfigurationForMediaType:", 2);
      +[VCMediaNegotiatorV2 updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", v32, objc_msgSend(v32, "groupID"), v31, v13, objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads"), objc_msgSend(a3, "isOneToOneAuthTagEnabled"));
      if (objc_msgSend(v32, "groupID") == 1937339233 && objc_msgSend(v32, "u1Config"))
      {
        v15 = [VCMediaNegotiatorAudioConfiguration alloc];
        v16 = objc_msgSend(v8, "allowAudioSwitching");
        v17 = objc_msgSend(v8, "allowAudioRecording");
        v18 = objc_msgSend(v8, "useSBR");
        v19 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:](v15, "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", v16, v17, v18, objc_msgSend((id)objc_msgSend(v32, "u1Config"), "ssrc"), objc_msgSend(v8, "audioUnitNumber"));
        if (v19)
        {
          v20 = v19;
          -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v19, "addAudioPayload:isSecondary:", 101, 0);
          objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v20, 4);

          continue;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.3();
        }
LABEL_34:
        v27 = 0;
        goto LABEL_35;
      }
      if (objc_msgSend(v32, "groupID") == 1935897189)
        v30 |= objc_msgSend(v32, "u1Config") != 0;
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v10)
      continue;
    break;
  }
  if ((v30 & 1) == 0)
  {
LABEL_18:
    objc_msgSend(a3, "setMediaConfiguration:forMediaType:", 0, 4);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = (void *)objc_msgSend(a3, "streamGroupConfigs");
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if (objc_msgSend(v26, "groupID") == 1937339233)
            objc_msgSend(v26, "setU1Config:", 0);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v23);
    }
  }
  v27 = 1;
  objc_msgSend(a3, "setOneToOneModeSupported:", 1);
LABEL_35:
  v7 = v31;
LABEL_36:

  return v27;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = -[VCMediaNegotiatorResults bandwidthConfigurations](self->super._negotiatedSettings, "bandwidthConfigurations");
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v12, "connectionType") == a4)
        {
          if (objc_msgSend(v12, "mode") == v5)
          {
            v9 = objc_msgSend(v12, "maxBandwidth");
            if (v9)
              return v9;
            goto LABEL_15;
          }
          if (objc_msgSend(v12, "isDefaultMode"))
            v9 = objc_msgSend(v12, "maxBandwidth");
        }
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v8)
        continue;
      break;
    }
    if (v9)
      return v9;
  }
LABEL_15:
  if ((int)VRTraceGetErrorLogLevelForModule() < 5)
    return 0;
  v13 = VRTraceErrorLogLevelToCSTR();
  v14 = *MEMORY[0x1E0CF2758];
  v9 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316162;
    v17 = v13;
    v18 = 2080;
    v19 = "-[VCMediaNegotiatorV2 remoteMaxBandwidthForArbiterMode:connectionType:]";
    v20 = 1024;
    v21 = 232;
    v22 = 1024;
    v23 = v5;
    v24 = 1024;
    v25 = a4;
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Max bandwidth not found for operatingMode=%hhu connectionType=%d", (uint8_t *)&v16, 0x28u);
    return 0;
  }
  return v9;
}

- (BOOL)appendGeneralInfoToMediaBlob:(id)a3
{
  VCMediaNegotiationBlobV2GeneralInfo *v4;

  v4 = -[VCMediaNegotiationBlobV2GeneralInfo initWithCreationTime:screenResolution:abSwitches:]([VCMediaNegotiationBlobV2GeneralInfo alloc], "initWithCreationTime:screenResolution:abSwitches:", -[VCMediaNegotiatorLocalConfiguration creationTime](self->super._localSettings, "creationTime"), -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches"), (double)+[VCHardwareSettings screenWidth](VCHardwareSettings, "screenWidth"), (double)+[VCHardwareSettings screenHeight](VCHardwareSettings, "screenHeight"));
  if (v4)
  {
    objc_msgSend(a3, "setGeneralInfo:", v4);

  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 appendGeneralInfoToMediaBlob:].cold.1();
  }
  return v4 != 0;
}

- (BOOL)appendBandwidthSettingsToMediaBlob:(id)a3
{
  VCMediaNegotiationBlobV2BandwidthSettings *v4;
  VCMediaNegotiationBlobV2BandwidthSettings *v5;

  v4 = -[VCMediaNegotiationBlobV2BandwidthSettings initWithBandwidthConfigurations:]([VCMediaNegotiationBlobV2BandwidthSettings alloc], "initWithBandwidthConfigurations:", -[VCMediaNegotiatorLocalConfiguration bandwidthConfigurations](self->super._localSettings, "bandwidthConfigurations"));
  v5 = v4;
  if (v4)
  {
    if (!-[VCMediaNegotiationBlobV2BandwidthSettings isDefaultSettings](v4, "isDefaultSettings"))
      objc_msgSend(a3, "setBandwidthSettings:", v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 appendBandwidthSettingsToMediaBlob:].cold.1();
  }

  return v5 != 0;
}

- (BOOL)appendCodecFeaturesToMediaBlob:(id)a3
{
  unsigned int v5;
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  VCMediaNegotiationBlobV2CodecFeatures *v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v5 = +[VCModeSpecificHardwareSettings encoderUsageTypeWithHardwareSettingsMode:](VCModeSpecificHardwareSettings, "encoderUsageTypeWithHardwareSettingsMode:", 1);
    v6 = VCPCodecCopyProperties();
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:].cold.2();
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]";
        v16 = 1024;
        v17 = 278;
        v18 = 2112;
        v19 = 0;
        v20 = 1024;
        v21 = v5;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] kVCPCodecProperty_FeatureBitField=%@ for encoderUsage=%d", buf, 0x2Cu);
      }
    }
  }
  v10 = -[VCMediaNegotiationBlobV2CodecFeatures initWithAllowAudioRecording:videoFeatures:]([VCMediaNegotiationBlobV2CodecFeatures alloc], "initWithAllowAudioRecording:videoFeatures:", objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1), "allowAudioRecording"), 0);
  if (v10)
  {
    objc_msgSend(a3, "setCodecSupport:", v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:].cold.1();
  }

  return v10 != 0;
}

- (BOOL)appendMicrophoneOneToOneSettingsToMediaBlob:(id)a3
{
  id v5;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *v6;
  VCMediaNegotiationBlobV2MicrophoneSettingsU1 *v7;
  BOOL v8;

  if (!-[VCMediaNegotiatorLocalConfiguration oneToOneModeSupported](self->super._localSettings, "oneToOneModeSupported"))
  {
    v7 = 0;
    goto LABEL_4;
  }
  v5 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1);
  v6 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 initWithSSRC:audioPayloads:u1AuthTagEnabled:]([VCMediaNegotiationBlobV2MicrophoneSettingsU1 alloc], "initWithSSRC:audioPayloads:u1AuthTagEnabled:", objc_msgSend(v5, "ssrc"), objc_msgSend(v5, "audioPayloads"), -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](self->super._localSettings, "isOneToOneAuthTagEnabled"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(a3, "setMicrophoneU1:", v6);
LABEL_4:
    v8 = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 appendMicrophoneOneToOneSettingsToMediaBlob:].cold.1();
  }
  v7 = 0;
  v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)appendCameraOneToOneSettingsToMediaBlob:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  VCMediaNegotiationBlobV2CameraSettingsU1 *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  NSObject *v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!-[VCMediaNegotiatorLocalConfiguration oneToOneModeSupported](self->super._localSettings, "oneToOneModeSupported"))
  {
    v27 = 0;
    goto LABEL_8;
  }
  v5 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2);
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "videoRuleCollections"), "videoRulesCollectionsByRemovingPayload:andPayload:removeCellular:", 126, 128, 1);
  if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
  {
    v7 = objc_msgSend(v5, "videoFeatureStringsFixedPosition");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136315906;
        v33 = v8;
        v34 = 2080;
        v35 = "-[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:]";
        v36 = 1024;
        v37 = 328;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoFeatureStringsFixedPosition=%@", (uint8_t *)&v32, 0x26u);
      }
    }
    v10 = [VCMediaNegotiationBlobV2CameraSettingsU1 alloc];
    v11 = objc_msgSend(v5, "ssrc");
    -[VCMediaNegotiatorLocalConfiguration screenSize](self->super._localSettings, "screenSize");
    v13 = v12;
    v15 = v14;
    -[VCMediaNegotiatorLocalConfiguration aspectRatioPortrait](self->super._localSettings, "aspectRatioPortrait");
    v17 = v16;
    v19 = v18;
    -[VCMediaNegotiatorLocalConfiguration aspectRatioLandscape](self->super._localSettings, "aspectRatioLandscape");
    v21 = v20;
    v23 = v22;
    -[VCMediaNegotiatorLocalConfiguration orientationMismatchAspectRatioLandscape](self->super._localSettings, "orientationMismatchAspectRatioLandscape");
    v26 = -[VCMediaNegotiationBlobV2CameraSettingsU1 initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:](v10, "initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:", v11, v6, v7, -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](self->super._localSettings, "isOneToOneAuthTagEnabled"), v13, v15, v17, v19, v21, v23, v24, v25);
    if (!v26)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:].cold.1();
      }
      v27 = 0;
      v28 = 0;
      goto LABEL_9;
    }
    v27 = (void *)v26;
    objc_msgSend(a3, "setCameraU1:", v26);
LABEL_8:
    v28 = 1;
LABEL_9:

    return v28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136315650;
      v33 = v29;
      v34 = 2080;
      v35 = "-[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:]";
      v36 = 1024;
      v37 = 324;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No supported payloads for the device", (uint8_t *)&v32, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)appendMomentsSettingsToMediaBlob:(id)a3
{
  VCMediaNegotiationBlobV2MomentsSettings *v5;
  VCMediaNegotiationBlobV2MomentsSettings *v6;
  BOOL v7;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults momentsUserPreferenceEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "momentsUserPreferenceEnabled"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCMediaNegotiatorV2 appendMomentsSettingsToMediaBlob:]";
        v15 = 1024;
        v16 = 350;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference not enabled.", (uint8_t *)&v11, 0x1Cu);
      }
    }
    goto LABEL_11;
  }
  if (!-[VCMediaNegotiatorLocalConfiguration mediaRecorderVideoCodecs](self->super._localSettings, "mediaRecorderVideoCodecs")&& !-[VCMediaNegotiatorLocalConfiguration mediaRecorderImageTypes](self->super._localSettings, "mediaRecorderImageTypes"))
  {
LABEL_11:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = -[VCMediaNegotiationBlobV2MomentsSettings initWithVideoCodecs:imageTypes:capabilitiesOneToOne:capabilitiesMultiway:]([VCMediaNegotiationBlobV2MomentsSettings alloc], "initWithVideoCodecs:imageTypes:capabilitiesOneToOne:capabilitiesMultiway:", -[VCMediaNegotiatorLocalConfiguration mediaRecorderVideoCodecs](self->super._localSettings, "mediaRecorderVideoCodecs"), -[VCMediaNegotiatorLocalConfiguration mediaRecorderImageTypes](self->super._localSettings, "mediaRecorderImageTypes"), -[VCVideoRuleCollectionsMediaRecorder mediaRecorderCapabilities](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderCapabilities"), -[VCVideoRuleCollectionsMediaRecorder mediaRecorderCapabilities](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderCapabilities"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "setMomentsSettings:", v5);
LABEL_6:
    v7 = 1;
    goto LABEL_7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 appendMomentsSettingsToMediaBlob:].cold.1();
  }
  v6 = 0;
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)appendStreamGroupsToMediaBlob:(id)a3
{
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCMediaNegotiationBlobV2StreamGroup *v9;
  VCMediaNegotiationBlobV2StreamGroup *v10;
  _BOOL4 v11;
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
  v4 = -[VCMediaNegotiatorLocalConfiguration streamGroupConfigs](self->super._localSettings, "streamGroupConfigs");
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = -[VCMediaNegotiationBlobV2StreamGroup initWithStreamGroupConfig:]([VCMediaNegotiationBlobV2StreamGroup alloc], "initWithStreamGroupConfig:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8));
      if (!v9)
        break;
      v10 = v9;
      objc_msgSend(a3, "addStreamGroups:", v9);

      if (v6 == ++v8)
      {
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      -[VCMediaNegotiatorV2 appendStreamGroupsToMediaBlob:].cold.1();
    }
    LOBYTE(v11) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 1;
  }
  return v11;
}

+ (void)dumpRemoteNegotiationData:(id)a3 forceFileDump:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  FILE **v8;
  uint8_t buf[12];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults dumpMediaBlob](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "dumpMediaBlob")|| v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v6;
        v10 = 2080;
        v11 = "+[VCMediaNegotiatorV2 dumpRemoteNegotiationData:forceFileDump:]";
        v12 = 1024;
        v13 = 383;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob dump enabled !!", buf, 0x1Cu);
      }
    }
    memset(buf, 170, sizeof(buf));
    __sprintf_chk((char *)buf, 0, 0xCuLL, "%010u", 0);
    v8 = VRLogfileAlloc(0, (uint64_t)buf, (uint64_t)"mediablob_invite_remote", (uint64_t)".blob", "com.apple.VideoConference.MediaBlob", 9);
    VRLogfileWrite(v8, objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
    VRLogfileFree((uint64_t *)&v8);
  }
}

- (BOOL)setupNegotiatedResultsWithRemoteMediaBlob:(id)a3
{
  VCMediaNegotiationBlobV2BandwidthSettings *v5;
  VCMediaNegotiationBlobV2BandwidthSettings *v6;

  if (objc_msgSend(a3, "bandwidthSettings"))
    v5 = (VCMediaNegotiationBlobV2BandwidthSettings *)(id)objc_msgSend(a3, "bandwidthSettings");
  else
    v5 = objc_alloc_init(VCMediaNegotiationBlobV2BandwidthSettings);
  v6 = v5;
  if (v5)
  {
    -[VCMediaNegotiatorResults addBandwidthConfigurations:](self->super._negotiatedSettings, "addBandwidthConfigurations:", -[VCMediaNegotiationBlobV2BandwidthSettings bandwidthConfigurations](v5, "bandwidthConfigurations"));

    -[VCMediaNegotiatorResults setMediaControlInfoVersion:](self->super._negotiatedSettings, "setMediaControlInfoVersion:", 2);
    -[VCMediaNegotiatorResults setRemoteBlobVersion:](self->super._negotiatedSettings, "setRemoteBlobVersion:", 2);
    -[VCMediaNegotiatorResults setControlChannelVersion:](self->super._negotiatedSettings, "setControlChannelVersion:", 2);
    -[VCMediaNegotiatorResults setSupportsDynamicMaxBitrate:](self->super._negotiatedSettings, "setSupportsDynamicMaxBitrate:", 1);
    -[VCMediaNegotiatorResults setRemoteBlobCreationTime:](self->super._negotiatedSettings, "setRemoteBlobCreationTime:", objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "creationTime"));
    -[VCMediaNegotiatorResults setAccessNetworkType:](self->super._negotiatedSettings, "setAccessNetworkType:", 2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 setupNegotiatedResultsWithRemoteMediaBlob:].cold.1();
  }
  return v6 != 0;
}

- (void)setupNegotiatedAudioResultsWithRemoteMediaBlob:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF33F8);
  v7 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1);
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "rtpSSRC"));
  objc_msgSend(v6, "setAudioUnitModel:", 65792);
  objc_msgSend(v6, "setUseSBR:", 1);
  if (objc_msgSend(v7, "allowAudioRecording"))
    v8 = objc_msgSend((id)objc_msgSend(a3, "codecSupport"), "allowAudioRecording");
  else
    v8 = 0;
  objc_msgSend(v6, "setAllowRecording:", v8);
  objc_msgSend(v6, "setAllowSwitching:", (_DWORD)v5 == 128);
  if ((_DWORD)v5 == 128)
  {
    v9 = +[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:](VCMediaNegotiatorBase, "newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:", objc_msgSend(v7, "audioPayloads"), objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "audioPayloads"));
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", v9, v6, &unk_1E9EF99C8);

  }
  else
  {
    objc_msgSend(v6, "setPrimaryPayload:", v5);
  }
}

- (void)setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:(id)a3
{
  uint64_t v5;
  id v6;
  VCMediaNegotiatorStreamGroupU1Configuration *v7;

  v5 = objc_msgSend(-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:](self, "negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:", 1937339233, -[NSSet allObjects](-[VCMediaNegotiatorLocalConfiguration streamGroupConfigs](-[VCMediaNegotiatorBase localSettings](self, "localSettings"), "streamGroupConfigs"), "allObjects")), "u1Config");
  v7 = objc_alloc_init(VCMediaNegotiatorStreamGroupU1Configuration);
  -[VCMediaNegotiatorStreamGroupU1Configuration setSupportedCipherSuites:](v7, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", +[VCMediaNegotiatorV2 filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:](VCMediaNegotiatorV2, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "cipherSuites"), -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](self->super._localSettings, "isOneToOneAuthTagEnabled"))));
  -[VCMediaNegotiatorStreamGroupU1Configuration setSupportedDirection:](v7, "setSupportedDirection:", 2);
  v6 = -[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:](self, "negotiatedResultsForGroupID:localU1Config:remoteU1Config:", 1937339233, v5, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(1937339233)));

}

- (BOOL)selectBestDecodeVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 localVideoRuleCollection:(id)a5 remoteVideoRuleCollection:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  float v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  _BOOL4 v25;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = objc_msgSend(a5, "getVideoRulesForTransport:payload:encodingType:", a3, *(_QWORD *)&a4, 2);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v13) = 0;
      if (!v22)
        return v13;
      *(_DWORD *)buf = 136316418;
      v33 = v20;
      v34 = 2080;
      v35 = "-[VCMediaNegotiatorV2 selectBestDecodeVideoRuleForTransport:payload:localVideoRuleCollection:remoteVideoRuleCollection:]";
      v36 = 1024;
      v37 = 460;
      v38 = 1024;
      v39 = v7;
      v40 = 1024;
      v41 = v8;
      v42 = 1024;
      v43 = 2;
      v23 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_21;
    }
LABEL_22:
    LOBYTE(v13) = 0;
    return v13;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_msgSend(a6, "getVideoRulesForTransport:payload:encodingType:", 1, v7, 2);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v13) = 0;
      if (!v25)
        return v13;
      *(_DWORD *)buf = 136316418;
      v33 = v24;
      v34 = 2080;
      v35 = "-[VCMediaNegotiatorV2 selectBestDecodeVideoRuleForTransport:payload:localVideoRuleCollection:remoteVideoRuleCollection:]";
      v36 = 1024;
      v37 = 464;
      v38 = 1024;
      v39 = v7;
      v40 = 1024;
      v41 = v8;
      v42 = 1024;
      v43 = 2;
      v23 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
LABEL_21:
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x2Eu);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF3470);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "fPref");
          if (v19 == 1.0)
          {
            objc_msgSend(v14, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18), v8, v7, 2);
            LOBYTE(v13) = 1;
            return v13;
          }
        }
        v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        LOBYTE(v13) = 0;
        if (v15)
          continue;
        break;
      }
    }
  }
  return v13;
}

+ (id)featureStringWithMediaBlob:(id)a3
{
  void *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "hasCameraU1") & 1) == 0)
    return +[VCVideoFeatureListStringHelper newEmptyFeatureString](VCVideoFeatureListStringHelper, "newEmptyFeatureString");
  v12 = NAN;
  v13 = NAN;
  v10 = NAN;
  v11 = NAN;
  v8 = NAN;
  v9 = NAN;
  v6 = NAN;
  v7 = NAN;
  v4 = (void *)objc_msgSend(a3, "cameraU1");
  objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "screenResolution");
  objc_msgSend(v4, "aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:", &v12, &v10, &v8, &v6);
  return +[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:](VCVideoFeatureListStringHelper, "deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:", v12, v13, v10, v11, v6, v7, v8, v9);
}

- (BOOL)setupNegotiatedVideoSettingsWithRemoteMediaBlob:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF3470);
  objc_msgSend(v5, "setIsSupported:", 0);
  v6 = (void *)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  if (!objc_msgSend((id)objc_msgSend(v6, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_DWORD *)buf = 136315650;
    v39 = v22;
    v40 = 2080;
    v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    v42 = 1024;
    v43 = 513;
    v24 = " [%s] %s:%d Skipping negotiating video settings, as this device does not support video";
    goto LABEL_39;
  }
  if ((objc_msgSend(a3, "hasCameraU1") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v25 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_DWORD *)buf = 136315650;
    v39 = v25;
    v40 = 2080;
    v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    v42 = 1024;
    v43 = 514;
    v24 = " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video";
    goto LABEL_39;
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "videoRuleCollections");
  if (!objc_msgSend((id)objc_msgSend(v7, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v26 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    *(_DWORD *)buf = 136315650;
    v39 = v26;
    v40 = 2080;
    v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    v42 = 1024;
    v43 = 516;
    v24 = " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video";
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x1Cu);
    return 1;
  }
  v8 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", 1, +[VCMediaNegotiatorV2 featureStringWithMediaBlob:](VCMediaNegotiatorV2, "featureStringWithMediaBlob:", a3), 1);
  objc_msgSend(v5, "setFeatureStrings:", v8);

  if (!objc_msgSend(v5, "featureStrings"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:].cold.1();
    }
    return 0;
  }
  obj = +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend(v7, "supportedPayloads"), objc_msgSend(v6, "supportedPayloads"), 2);
  if (!objc_msgSend(obj, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:].cold.2();
    }
    return 0;
  }
  objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "rtpSSRC"));
  objc_msgSend(v5, "setIsRTCPFBEnabled:", 0);
  objc_msgSend(v5, "setTilesPerFrame:", 1);
  objc_msgSend(v5, "setLtrpEnabled:", 1);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "payloads");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "addParameterSet:payload:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "videoParameterSupport")), objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "payload"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v11);
  }
  v14 = 1;
  while (2)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (!v15)
    {
LABEL_25:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:].cold.3();
      }
      return 0;
    }
    v16 = v15;
    v17 = *(_QWORD *)v30;
LABEL_16:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v17)
        objc_enumerationMutation(obj);
      v19 = v14;
      if (+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:](VCMediaNegotiatorV2, "selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:", 1, objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18), "unsignedIntValue"), v14, v5, v6, v7))
      {
        break;
      }
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v16)
          goto LABEL_16;
        goto LABEL_25;
      }
    }
    ++v14;
    if (v19 < 2)
      continue;
    break;
  }
  v20 = 1;
  objc_msgSend(v5, "setIsSupported:", 1);
  return v20;
}

+ (unsigned)capabilitiesWithMomentSettings:(id)a3
{
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = objc_msgSend(a3, "capabilitiesMultiway");
  v5 = (void *)objc_msgSend(a3, "videoCodecs");
  if ((v4 & 2) != 0)
    v6 = 2 * (objc_msgSend(v5, "count") != 0);
  else
    v6 = 0;
  if ((v4 & 3) != 0)
  {
    v7 = (void *)objc_msgSend(a3, "imageTypes");
    v6 |= objc_msgSend(v7, "count") != 0;
    if (objc_msgSend(v7, "containsObject:", &unk_1E9EF3488))
      v6 |= 4u;
  }
  return v6;
}

- (BOOL)setupNegotiatedMomentsResultsWithRemoteMediaBlob:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL result;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "hasMomentsSettings") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v21 = 136315650;
    v22 = v11;
    v23 = 2080;
    v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    v25 = 1024;
    v26 = 575;
    v13 = " [%s] %s:%d Moments not supported";
LABEL_22:
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x1Cu);
    return 1;
  }
  if (!-[VCDefaults momentsUserPreferenceEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "momentsUserPreferenceEnabled"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return 1;
    v14 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v21 = 136315650;
    v22 = v14;
    v23 = 2080;
    v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    v25 = 1024;
    v26 = 576;
    v13 = " [%s] %s:%d Moments user preference Not Enabled.";
    goto LABEL_22;
  }
  v5 = (void *)objc_msgSend(a3, "momentsSettings");
  v6 = (void *)objc_msgSend(v5, "videoCodecs");
  if (objc_msgSend(v6, "containsObject:", &unk_1E9EF34A0)
    && +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
  {
    v7 = 100;
LABEL_8:
    -[VCMediaNegotiatorResultsMediaRecorder setVideoCodec:](self->super._negotiatedMediaRecorderSettings, "setVideoCodec:", v7);
    v8 = (void *)objc_msgSend(v5, "imageTypes");
    if (objc_msgSend(v8, "containsObject:", &unk_1E9EF3488)
      && +[VCHardwareSettings supportsHEIFEncoding](VCHardwareSettings, "supportsHEIFEncoding"))
    {
      v9 = 1;
LABEL_13:
      -[VCMediaNegotiatorResultsMediaRecorder setImageType:](self->super._negotiatedMediaRecorderSettings, "setImageType:", v9);
      -[VCMediaNegotiatorResultsMediaRecorder setCapabilities:](self->super._negotiatedMediaRecorderSettings, "setCapabilities:", +[VCMediaNegotiatorV2 capabilitiesWithMomentSettings:](VCMediaNegotiatorV2, "capabilitiesWithMomentSettings:", v5));
      return 1;
    }
    if ((objc_msgSend(v8, "containsObject:", &unk_1E9EF34D0) & 1) != 0)
    {
      v9 = 0;
      goto LABEL_13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v20)
      {
        v21 = 136315906;
        v22 = v19;
        v23 = 2080;
        v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
        v25 = 1024;
        v26 = 593;
        v27 = 2112;
        v28 = v8;
        v18 = " [%s] %s:%d No supported moments image types. imageTypes=%@";
        goto LABEL_29;
      }
      return result;
    }
    return 0;
  }
  if ((objc_msgSend(v6, "containsObject:", &unk_1E9EF34B8) & 1) != 0)
  {
    v7 = 123;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    return 0;
  v15 = VRTraceErrorLogLevelToCSTR();
  v16 = *MEMORY[0x1E0CF2758];
  v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v17)
  {
    v21 = 136315906;
    v22 = v15;
    v23 = 2080;
    v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    v25 = 1024;
    v26 = 584;
    v27 = 2112;
    v28 = v6;
    v18 = " [%s] %s:%d No supported moments payload. videoCodecs=%@";
LABEL_29:
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0x26u);
    return 0;
  }
  return result;
}

- (BOOL)mediaBlobHasFLSPerCodec:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  LODWORD(v4) = objc_msgSend(a3, "hasCameraU1");
  if ((_DWORD)v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "payloads");
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "hasEncodeDecodeFeatures") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        LOBYTE(v4) = 0;
        if (v6)
          continue;
        break;
      }
    }
  }
  return v4;
}

- (BOOL)negotiateStreamGroupConfig:(id)a3 remoteInviteBlob:(id)a4
{
  VCMediaNegotiatorV2 *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  char **v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  char *v38;
  NSObject *v39;
  const char *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  _BOOL4 v45;
  const __CFString *v46;
  uint64_t v47;
  NSObject *v48;
  _BOOL4 v49;
  char *v50;
  char *v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  char *v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  const __CFString *v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  _BOOL4 v66;
  __int128 v68;
  int v69;
  char *v70;
  id obj;
  uint64_t v73;
  uint64_t v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  __int16 v96;
  char *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  char *v101;
  __int16 v102;
  char *v103;
  uint64_t v104;

  v5 = self;
  v104 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "mediaType") != 1835365473
    && objc_msgSend(a3, "mediaType") != 1986618469
    && objc_msgSend(a3, "mediaType") != 1936684398)
  {
    if ((VCMediaNegotiatorV2 *)objc_opt_class() != v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v62 = (const __CFString *)-[VCMediaNegotiatorV2 performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v62 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_79;
      v65 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E0CF2758];
      v66 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v45) = 0;
      if (!v66)
        return v45;
      *(_DWORD *)buf = 136316674;
      v91 = v65;
      v92 = 2080;
      v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
      v94 = 1024;
      v95 = 621;
      v96 = 2112;
      v97 = (char *)v62;
      v98 = 2048;
      v99 = self;
      v100 = 2080;
      v101 = FourccToCStr(objc_msgSend(a3, "mediaType"));
      v102 = 2080;
      v103 = FourccToCStr(objc_msgSend(a3, "groupID"));
      v52 = " [%s] %s:%d %@(%p) Unsupported media type (%s). Ignoring streamGroup groupID=%s";
LABEL_77:
      v53 = v56;
      v54 = 68;
      goto LABEL_78;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_79;
    v63 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x1E0CF2758];
    v64 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v45) = 0;
    if (!v64)
      return v45;
    *(_DWORD *)buf = 136316162;
    v91 = v63;
    v92 = 2080;
    v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
    v94 = 1024;
    v95 = 621;
    v96 = 2080;
    v97 = FourccToCStr(objc_msgSend(a3, "mediaType"));
    v98 = 2080;
    v99 = FourccToCStr(objc_msgSend(a3, "groupID"));
    v52 = " [%s] %s:%d Unsupported media type (%s). Ignoring streamGroup groupID=%s";
LABEL_72:
    v53 = v48;
    v54 = 48;
LABEL_78:
    _os_log_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
    goto LABEL_79;
  }
  if (!objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count")&& objc_msgSend(a3, "mediaType") == 1986618469)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v60 = VRTraceErrorLogLevelToCSTR();
      v61 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v91 = v60;
        v92 = 2080;
        v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
        v94 = 1024;
        v95 = 624;
        v96 = 2080;
        v97 = FourccToCStr(objc_msgSend(a3, "groupID"));
        _os_log_impl(&dword_1D8A54000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating streamGroup=%s, as this device is audio only", buf, 0x26u);
      }
    }
    LOBYTE(v45) = 1;
    return v45;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = (id)objc_msgSend(a3, "streamConfigs");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
  if (!v6)
    goto LABEL_59;
  v8 = v6;
  v9 = 0;
  v10 = &selRef_load;
  v74 = *(_QWORD *)v87;
  *(_QWORD *)&v7 = 136315906;
  v68 = v7;
LABEL_8:
  v11 = 0;
  v12 = v9;
  v70 = v10[73];
  v69 = v9 + v8;
  v73 = v8;
  while (1)
  {
    if (*(_QWORD *)v87 != v74)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v11);
    if (!objc_msgSend((id)objc_msgSend(v13, "codecs", v68), "count")
      && !objc_msgSend((id)objc_msgSend(v13, "payloads"), "count"))
    {
      if ((VCMediaNegotiatorV2 *)objc_opt_class() != v5)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v46 = (const __CFString *)-[VCMediaNegotiatorV2 performSelector:](v5, "performSelector:", v70);
        else
          v46 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_79;
        v55 = VRTraceErrorLogLevelToCSTR();
        v56 = *MEMORY[0x1E0CF2758];
        v57 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        LOBYTE(v45) = 0;
        if (!v57)
          return v45;
        v58 = FourccToCStr(objc_msgSend(a3, "mediaType"));
        v59 = FourccToCStr(objc_msgSend(a3, "mediaSubtype"));
        *(_DWORD *)buf = 136316674;
        v91 = v55;
        v92 = 2080;
        v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
        v94 = 1024;
        v95 = 627;
        v96 = 2112;
        v97 = (char *)v46;
        v98 = 2048;
        v99 = v5;
        v100 = 2080;
        v101 = v58;
        v102 = 2080;
        v103 = v59;
        v52 = " [%s] %s:%d %@(%p) Missing codecs or payloads for mediaType=%s mediaSubtype=%s";
        goto LABEL_77;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
LABEL_79:
        LOBYTE(v45) = 0;
        return v45;
      }
      v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E0CF2758];
      v49 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v45) = 0;
      if (!v49)
        return v45;
      v50 = FourccToCStr(objc_msgSend(a3, "mediaType"));
      v51 = FourccToCStr(objc_msgSend(a3, "mediaSubtype"));
      *(_DWORD *)buf = 136316162;
      v91 = v47;
      v92 = 2080;
      v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
      v94 = 1024;
      v95 = 627;
      v96 = 2080;
      v97 = v50;
      v98 = 2080;
      v99 = v51;
      v52 = " [%s] %s:%d Missing codecs or payloads for mediaType=%s mediaSubtype=%s";
      goto LABEL_72;
    }
    if (!+[VCHardwareSettings supportsHEVCDecoding](VCHardwareSettings, "supportsHEVCDecoding"))
    {
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v14 = (void *)objc_msgSend(v13, "codecs");
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
      if (!v15)
        goto LABEL_34;
      v16 = v15;
      v17 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v82 != v17)
            objc_enumerationMutation(v14);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "integerValue")), "codecType") == 102)
          {
            v5 = self;
            if ((VCMediaNegotiatorV2 *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                v26 = VRTraceErrorLogLevelToCSTR();
                v27 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v28 = FourccToCStr(objc_msgSend(a3, "groupID"));
                  *(_DWORD *)buf = v68;
                  v91 = v26;
                  v92 = 2080;
                  v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
                  v94 = 1024;
                  v95 = 633;
                  v96 = 2080;
                  v97 = v28;
                  v23 = v27;
                  v24 = " [%s] %s:%d HEVC codec not supported, removing all higher quality streams from streamGroup=%s";
                  v25 = 38;
LABEL_32:
                  _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
                }
              }
            }
            else
            {
              v19 = &stru_1E9E58EE0;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v19 = (const __CFString *)-[VCMediaNegotiatorV2 performSelector:](self, "performSelector:", v70);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                v20 = VRTraceErrorLogLevelToCSTR();
                v21 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v22 = FourccToCStr(objc_msgSend(a3, "groupID"));
                  *(_DWORD *)buf = 136316418;
                  v91 = v20;
                  v92 = 2080;
                  v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
                  v94 = 1024;
                  v95 = 633;
                  v96 = 2112;
                  v97 = (char *)v19;
                  v98 = 2048;
                  v99 = self;
                  v100 = 2080;
                  v101 = v22;
                  v23 = v21;
                  v24 = " [%s] %s:%d %@(%p) HEVC codec not supported, removing all higher quality streams from streamGroup=%s";
                  v25 = 58;
                  goto LABEL_32;
                }
              }
            }
            v8 = v73;
            if (v12 == -1)
              goto LABEL_34;
LABEL_58:
            objc_msgSend(a3, "removeStreamConfigs:", v12, objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count") - v12);
LABEL_59:
            if (objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count"))
              -[NSMutableArray addObject:](v5->super._negotiatedStreamGroups, "addObject:", a3);
            LOBYTE(v45) = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count") != 0;
            return v45;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
        v5 = self;
        v8 = v73;
      }
      while (v16);
LABEL_34:
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v29 = (void *)objc_msgSend(v13, "payloads");
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      if (v30)
        break;
    }
LABEL_55:
    ++v12;
    if (++v11 == v8)
    {
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
      v9 = v69;
      v10 = &selRef_load;
      if (!v8)
        goto LABEL_59;
      goto LABEL_8;
    }
  }
  v31 = v30;
  v32 = *(_QWORD *)v77;
LABEL_36:
  v33 = 0;
  while (1)
  {
    if (*(_QWORD *)v77 != v32)
      objc_enumerationMutation(v29);
    v34 = +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:](VCMediaNegotiationBlobV2VideoPayload, "rtpPayloadWithPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v33), "intValue"));
    if (v34 == 100)
    {
      v5 = self;
      if ((VCMediaNegotiatorV2 *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v42 = VRTraceErrorLogLevelToCSTR();
          v43 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v44 = FourccToCStr(objc_msgSend(a3, "groupID"));
            *(_DWORD *)buf = v68;
            v91 = v42;
            v92 = 2080;
            v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
            v94 = 1024;
            v95 = 645;
            v96 = 2080;
            v97 = v44;
            v39 = v43;
            v40 = " [%s] %s:%d HEVC payload not supported, removing all higher quality streams from streamGroup=%s";
            v41 = 38;
            goto LABEL_53;
          }
        }
      }
      else
      {
        v35 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v35 = (const __CFString *)-[VCMediaNegotiatorV2 performSelector:](self, "performSelector:", v70);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v38 = FourccToCStr(objc_msgSend(a3, "groupID"));
            *(_DWORD *)buf = 136316418;
            v91 = v36;
            v92 = 2080;
            v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
            v94 = 1024;
            v95 = 645;
            v96 = 2112;
            v97 = (char *)v35;
            v98 = 2048;
            v99 = self;
            v100 = 2080;
            v101 = v38;
            v39 = v37;
            v40 = " [%s] %s:%d %@(%p) HEVC payload not supported, removing all higher quality streams from streamGroup=%s";
            v41 = 58;
LABEL_53:
            _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
          }
        }
      }
      v8 = v73;
      if (v12 != -1)
        goto LABEL_58;
      goto LABEL_55;
    }
    if (v34 == 128)
      break;
    if (v31 == ++v33)
    {
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      v5 = self;
      if (v31)
        goto LABEL_36;
      goto LABEL_55;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_79;
  VRTraceErrorLogLevelToCSTR();
  v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v45)
  {
    -[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:].cold.1();
    goto LABEL_79;
  }
  return v45;
}

- (BOOL)setupStreamGroupsWithRemoteMediaBlob:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  BOOL v14;
  BOOL v15;
  int ErrorLogLevelForModule;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  int v28;
  int v29;
  char v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  VCMediaNegotiatorV2 *v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  char *v51;
  _BYTE v52[128];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "streamGroups"), "count"))
  {
    v41 = objc_msgSend((id)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections"), "supportedPayloads");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v5 = (void *)objc_msgSend(v3, "streamGroups");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
    if (v6)
    {
      v42 = self;
      v40 = 0;
      v39 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v54;
      *(_QWORD *)&v7 = 136315906;
      v38 = v7;
      v10 = v3;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v11);
        v43 = 0;
        v13 = objc_msgSend(v12, "getStreamGroupConfig:", &v43, v38);
        if (v43)
          v14 = 0;
        else
          v14 = v13 == -2142961648;
        if (v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v25 = VRTraceErrorLogLevelToCSTR();
            v26 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v45 = v25;
              v46 = 2080;
              v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
              v48 = 1024;
              v49 = 679;
              _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping unknown stream group", buf, 0x1Cu);
            }
            v3 = v10;
          }
        }
        else
        {
          if (!v43)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:].cold.2();
            }
LABEL_68:
            self = v42;
            if (v8)
              return 1;
            goto LABEL_69;
          }
          if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8
            || objc_msgSend(v43, "groupID") != 1650745716
            && objc_msgSend(v43, "groupID") != 1717854580
            && objc_msgSend(v43, "groupID") != 1718909044)
          {
            v15 = -[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:](v42, "negotiateStreamGroupConfig:remoteInviteBlob:", v43, v3);
            ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (!v15)
            {
              if (ErrorLogLevelForModule >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:].cold.3();
              }
              goto LABEL_68;
            }
            if (ErrorLogLevelForModule >= 7)
            {
              v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v19 = FourccToCStr(objc_msgSend(v43, "groupID"));
                *(_DWORD *)buf = v38;
                v45 = v17;
                v46 = 2080;
                v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
                v48 = 1024;
                v49 = 691;
                v50 = 2080;
                v51 = v19;
                _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setup U1 config for stream group for groupID=%s", buf, 0x26u);
              }
            }
            v20 = v43;
            v21 = objc_msgSend(v43, "groupID");
            v22 = -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](v42->super._localSettings, "isOneToOneAuthTagEnabled");
            v23 = v20;
            v3 = v10;
            +[VCMediaNegotiatorV2 updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", v23, v21, v10, v12, v41, v22);
            v24 = -[VCMediaNegotiatorV2 negotiateU1SettingsForStreamGroup:](v42, "negotiateU1SettingsForStreamGroup:", v43);
            if (objc_msgSend(v43, "groupID") == 1667329381 && v24)
            {
              v8 = 0;
              LOBYTE(v40) = 1;
            }
            else if (objc_msgSend(v43, "groupID") == 1835623282 && v24)
            {
              v8 = 0;
              v39 = 1;
            }
            else
            {
              v28 = objc_msgSend(v43, "groupID");
              v8 = v28 != 1937339233 && v24;
              if (v28 == 1937339233 && v24)
                v29 = 1;
              else
                v29 = HIDWORD(v40);
              HIDWORD(v40) = v29;
            }
          }
        }
        if (v6 == ++v11)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
          if (v6)
            goto LABEL_4;
          v30 = v40;
          if ((v40 & 0x100000000) == 0)
          {
            LOBYTE(v6) = v39;
            self = v42;
            goto LABEL_46;
          }
          self = v42;
          if ((v39 & 1) == 0)
            goto LABEL_50;
          goto LABEL_54;
        }
      }
    }
    v30 = 0;
  }
  else
  {
    v30 = 0;
    LOBYTE(v6) = 0;
  }
LABEL_46:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v45 = v31;
      v46 = 2080;
      v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
      v48 = 1024;
      v49 = 716;
      _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote end does not support system audio settings, update system audio settings", buf, 0x1Cu);
    }
  }
  -[VCMediaNegotiatorV2 setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:](self, "setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:", v3);
  if ((v6 & 1) == 0)
  {
LABEL_50:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v45 = v33;
        v46 = 2080;
        v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
        v48 = 1024;
        v49 = 721;
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiate for audio settings using microphoneU1", buf, 0x1Cu);
      }
    }
    -[VCMediaNegotiatorV2 setupNegotiatedAudioResultsWithRemoteMediaBlob:](self, "setupNegotiatedAudioResultsWithRemoteMediaBlob:", v3);
  }
LABEL_54:
  if ((v30 & 1) != 0)
    return 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v45 = v35;
      v46 = 2080;
      v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
      v48 = 1024;
      v49 = 726;
      _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiate for video settings using cameraU1", buf, 0x1Cu);
    }
  }
  if (-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:](self, "setupNegotiatedVideoSettingsWithRemoteMediaBlob:", v3))
  {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:].cold.1();
  }
LABEL_69:
  -[NSMutableArray removeAllObjects](self->super._negotiatedStreamGroups, "removeAllObjects");
  return 0;
}

- (BOOL)negotiateU1SettingsForStreamGroup:(id)a3
{
  uint64_t v5;
  int v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "groupID");
  v6 = objc_msgSend((id)objc_opt_class(), "isU1StreamGroup:", v5);
  if (v6)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = -[VCMediaNegotiatorLocalConfiguration streamGroupConfigs](self->super._localSettings, "streamGroupConfigs");
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        if (objc_msgSend(v12, "groupID") == (_DWORD)v5)
          break;
        if (v9 == ++v11)
        {
          v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v12 = 0;
    }
    v13 = -[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:](self, "negotiatedResultsForGroupID:localU1Config:remoteU1Config:", v5, objc_msgSend(v12, "u1Config"), objc_msgSend(a3, "u1Config"));
    v14 = v13;
    v15 = (_DWORD)v5 == 1667329381 || (_DWORD)v5 == 1835623282;
    if (!v15 || v13)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(v5)));
      if (v14)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_20;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[VCMediaNegotiatorV2 negotiateU1SettingsForStreamGroup:].cold.1(v16, v5, v17);
LABEL_20:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:(id)a3
{
  -[VCMediaNegotiatorResultsFaceTimeSettings setOneToOneModeSupported:](self->super._negotiatedFaceTimeSettings, "setOneToOneModeSupported:", objc_msgSend(a3, "hasMicrophoneU1"));
  -[VCMediaNegotiatorResultsFaceTimeSettings setSecureMessagingRequired:](self->super._negotiatedFaceTimeSettings, "setSecureMessagingRequired:", 0);
  -[VCMediaNegotiatorResultsFaceTimeSettings setSIPDisabled:](self->super._negotiatedFaceTimeSettings, "setSIPDisabled:", 0);
  -[VCMediaNegotiatorResultsFaceTimeSettings setFaceTimeSwitches:](self->super._negotiatedFaceTimeSettings, "setFaceTimeSwitches:", objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "abSwitches"));
  -[VCMediaNegotiatorResultsFaceTimeSettings setRemoteFaceTimeSwitchesAvailable:](self->super._negotiatedFaceTimeSettings, "setRemoteFaceTimeSwitchesAvailable:", -[VCMediaNegotiatorResultsFaceTimeSettings faceTimeSwitches](self->super._negotiatedFaceTimeSettings, "faceTimeSwitches") != 0);
  -[VCMediaNegotiatorResultsFaceTimeSettings setMediaControlInfoFECFeedbackVersion:](self->super._negotiatedFaceTimeSettings, "setMediaControlInfoFECFeedbackVersion:", 0);
  -[VCMediaNegotiatorResultsFaceTimeSettings setRemoteLinkProbingCapabilityVersion:](self->super._negotiatedFaceTimeSettings, "setRemoteLinkProbingCapabilityVersion:", 0);
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 streamGroupIDsWithMediaBlob:].cold.1();
    }
    goto LABEL_21;
  }
  v5 = +[VCMediaNegotiatorV2 newUnserializedMediaBlob:](VCMediaNegotiatorV2, "newUnserializedMediaBlob:", a3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 streamGroupIDsWithMediaBlob:].cold.2();
    }
LABEL_21:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = v5;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_msgSend(v5, "streamGroups");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "streamGroup"));
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v6, "hasMicrophoneU1"))
    objc_msgSend(v4, "addObject:", &unk_1E9EF34E8);
  if (objc_msgSend(v6, "hasCameraU1"))
    objc_msgSend(v4, "addObject:", &unk_1E9EF3500);
LABEL_14:

  return v4;
}

+ (int)filteredCipherSuitesFromNegotiatedCipherSuites:(int)a3 u1AuthTagEnabled:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (!a4 || (VCFeatureFlagManager_U1AuthTagEnabled() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v5;
        v10 = 2080;
        v11 = "+[VCMediaNegotiatorV2 filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:]";
        v12 = 1024;
        v13 = 813;
        v14 = 2112;
        v15 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v4, objc_msgSend(MEMORY[0x1E0CB37A0], "string"));
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning negotiatedCipherSuites=%@ down to CipherAES128AuthNoneRCCM3 because U1AuthTag is NOT enabled", (uint8_t *)&v8, 0x26u);
      }
    }
    LODWORD(v4) = 1;
  }
  return v4;
}

+ (BOOL)updateStreamGroupU1Config:(id)a3 forGroupId:(unsigned int)a4 withNegotiationBlob:(id)a5 streamGroupBlob:(id)a6 localSupportedVideoPayloads:(id)a7 u1AuthTagEnabled:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  BOOL result;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v8 = a8;
  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315906;
      v21 = v15;
      v22 = 2080;
      v23 = "+[VCMediaNegotiatorV2 updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupporte"
            "dVideoPayloads:u1AuthTagEnabled:]";
      v24 = 1024;
      v25 = 830;
      v26 = 2080;
      v27 = FourccToCStr(a4);
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Update stream group U1 config for groupID=%s", (uint8_t *)&v20, 0x26u);
    }
  }
  v17 = (void *)objc_msgSend(a3, "u1Config");
  result = 0;
  if ((int)a4 > 1835623281)
  {
    switch(a4)
    {
      case 0x73797361u:
        objc_msgSend(v17, "setAllowAudioRecording:", objc_msgSend((id)objc_msgSend(a5, "codecSupport"), "allowAudioRecording"));
        objc_msgSend(v17, "setAudioPayloads:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9EF99F8));
        v19 = &unk_1E9EF9A10;
        break;
      case 0x73637265u:
        return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", a3, a5, a6, a7, v8);
      case 0x6D696372u:
        objc_msgSend(v17, "setAllowAudioRecording:", objc_msgSend((id)objc_msgSend(a5, "codecSupport"), "allowAudioRecording"));
        objc_msgSend(v17, "setAudioPayloads:", objc_msgSend((id)objc_msgSend(a5, "microphoneU1"), "audioPayloads"));
        v19 = &unk_1E9EF99E0;
        break;
      default:
        return result;
    }
    objc_msgSend(v17, "setPayloadPreference:", v19);
    objc_msgSend(v17, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(a1, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(a5, "microphoneU1"), "cipherSuites"), v8)));
    return 1;
  }
  switch(a4)
  {
    case 0x62646174u:
      return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", a3, a5, a6, a7, v8);
    case 0x63616D65u:
      return +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", v17, a5, a7, v8);
    case 0x66747874u:
      return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", a3, a5, a6, a7, v8);
  }
  return result;
}

+ (BOOL)updateCameraU1Config:(id)a3 forNegotiationBlob:(id)a4 localSupportedVideoPayloads:(id)a5 u1AuthTagEnabled:(BOOL)a6
{
  uint64_t v6;
  id v9;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  BOOL v25;
  uint64_t v27;
  NSObject *v28;
  id v29;
  unsigned int v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v6 = a6;
  v9 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setVideoRuleCollections:", objc_msgSend((id)objc_msgSend(a4, "cameraU1"), "videoRuleCollections"));
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v41 = v27;
        v42 = 2080;
        v43 = "+[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]";
        v44 = 1024;
        v45 = 861;
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video", buf, 0x1Cu);
      }
    }
    goto LABEL_29;
  }
  objc_msgSend(v9, "setPayloadPreference:", +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend((id)objc_msgSend(v9, "videoRuleCollections"), "supportedPayloads"), a5, 2));
  if (!objc_msgSend((id)objc_msgSend(v9, "payloadPreference"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.1();
    }
    goto LABEL_29;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.2();
    }
LABEL_29:
    v14 = 0;
    v12 = 0;
LABEL_34:
    v25 = 0;
    goto LABEL_19;
  }
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.3();
    }
    v14 = 0;
    goto LABEL_34;
  }
  v14 = v13;
  v33 = a1;
  v15 = +[VCMediaNegotiatorV2 featureStringWithMediaBlob:](VCMediaNegotiatorV2, "featureStringWithMediaBlob:", a4);
  v16 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", 1, v15, 1);
  objc_msgSend(v9, "setVideoFeatureStrings:", v16);

  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = a4;
  v17 = (void *)objc_msgSend((id)objc_msgSend(a4, "cameraU1"), "payloads");
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (v18)
  {
    v19 = v18;
    v29 = v15;
    v30 = v6;
    v31 = v9;
    v20 = v14;
    v21 = 0;
    v22 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v24, "payload", v29)));
        objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v24, "parameterSet")));
        if (objc_msgSend(v24, "hasEncodeDecodeFeatures"))
        {
          objc_msgSend(v24, "encodeDecodeFeatures");
          objc_msgSend(v34, "setObject:forKeyedSubscript:", (id)VCPCreateDecompressedFLS(), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v24, "payload")));
          v21 = 1;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    }
    while (v19);
    v14 = v20;
    v9 = v31;
    v6 = v30;
    if ((v21 & 1) != 0)
    {
      objc_msgSend(v31, "setVideoFeatureStringsFixedPosition:", +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithVCP:aspectRatioFLS:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithVCP:aspectRatioFLS:", v34, v29));

    }
  }
  if (!objc_msgSend(v9, "videoFeatureStrings") && !objc_msgSend(v9, "videoFeatureStringsFixedPosition"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.4();
    }
    goto LABEL_34;
  }
  objc_msgSend(v9, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(v33, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(v32, "cameraU1"), "cipherSuites"), v6)));
  objc_msgSend(v9, "setVideoPayloads:", v12);
  objc_msgSend(v9, "setVideoParameterSet:", v14);
  v25 = 1;
LABEL_19:

  return v25;
}

+ (CGSize)resolutionForStreamGroupConfig:(id)a3
{
  int v4;
  void *v5;
  double v6;
  double v7;
  int ErrorLogLevelForModule;
  _BOOL4 v9;
  CGSize result;

  v4 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(objc_msgSend(a3, "groupID"));
  switch(v4)
  {
    case 6:
      v6 = 480.0;
      v7 = 480.0;
      break;
    case 5:
      v7 = 768.0;
      v6 = 256.0;
      break;
    case 3:
      v5 = (void *)objc_msgSend(a3, "u1Config");
      objc_msgSend(v5, "setScreenPixelCount:", 5603328);
      +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:](VideoUtil, "computeResolutionForMainDisplayWithMaxScreenPixelCount:", objc_msgSend(v5, "screenPixelCount"));
      break;
    default:
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v6 = 0.0;
      v7 = 0.0;
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        v6 = 0.0;
        v7 = 0.0;
        if (v9)
        {
          +[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:].cold.1();
          v6 = 0.0;
          v7 = 0.0;
        }
      }
      break;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

+ (BOOL)addV1FeatureListStringsToStreamGroupConfig:(id)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;

  v4 = a4;
  v5 = (void *)objc_msgSend(a3, "u1Config");
  if (!+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:](VCMediaNegotiatorBase, "v1FeatureListStringsSupportedForMediaType:", v4))return 1;
  v6 = 1;
  v7 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", +[VCMediaNegotiatorBase featureListStringTypeForMediaType:](VCMediaNegotiatorBase, "featureListStringTypeForMediaType:", v4), 0, 1);
  objc_msgSend(v5, "setVideoFeatureStrings:", v7);

  if (!objc_msgSend(v5, "videoFeatureStrings"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 addV1FeatureListStringsToStreamGroupConfig:mediaType:].cold.1();
    }
    return 0;
  }
  return v6;
}

+ (BOOL)addV2FeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "u1Config");
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "settingsU1"), "encodeDecodeFeatures");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "encodeDecodeFeatures");
        v13 = (void *)VCPCreateDecompressedFLS();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "rtpPayload")));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v7, "count")
    && (objc_msgSend(v5, "setVideoFeatureStringsFixedPosition:", v6),
        !objc_msgSend(v5, "videoFeatureStringsFixedPosition")))
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      +[VCMediaNegotiatorV2 addV2FeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:].cold.1();
    }
    LOBYTE(v14) = 0;
  }
  else
  {

    LOBYTE(v14) = 1;
  }
  return v14;
}

+ (BOOL)addFeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(objc_msgSend(a3, "groupID"));
  if (!+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:](VCMediaNegotiatorBase, "featureListStringsRequiredForMediaType:", v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "+[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:]";
        v16 = 1024;
        v17 = 986;
        v18 = 1024;
        v19 = v7;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping FLS string add for mediaType=%hhu because it isn't needed", (uint8_t *)&v12, 0x22u);
      }
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(a1, "addV1FeatureListStringsToStreamGroupConfig:mediaType:", a3, v7) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      +[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:].cold.2();
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(a1, "addV2FeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:", a3, a4) & 1) != 0)
  {
LABEL_10:
    LOBYTE(v8) = 1;
    return v8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v8)
      return v8;
    +[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:].cold.1();
  }
LABEL_15:
  LOBYTE(v8) = 0;
  return v8;
}

+ (float)frameRateForMediaType:(unsigned __int8)a3
{
  float v3;

  v3 = 30.0;
  if ((a3 - 5) >= 2)
  {
    if (a3 == 3)
    {
      return (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare](VCHardwareSettings, "maxFrameRateSupportedScreenShare");
    }
    else
    {
      v3 = 0.0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCMediaNegotiatorV2 frameRateForMediaType:].cold.1();
      }
    }
  }
  return v3;
}

+ (id)u1RemoteSupportedCipherSuitesForBlob:(id)a3 mediaType:(unsigned __int8)a4 u1AuthTagEnabled:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;

  if (a4 <= 6u)
  {
    v5 = a5;
    if (((1 << a4) & 0x6C) != 0)
    {
      v7 = (void *)objc_msgSend(a3, "cameraU1");
      return +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(a1, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend(v7, "cipherSuites"), v5));
    }
    if (((1 << a4) & 0x12) != 0)
    {
      v7 = (void *)objc_msgSend(a3, "microphoneU1");
      return +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(a1, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend(v7, "cipherSuites"), v5));
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:].cold.1();
  }
  return 0;
}

+ (BOOL)updateVideoU1ConfigWithStreamGroupConfig:(id)a3 forNegotiationBlob:(id)a4 streamGroupBlob:(id)a5 localSupportedVideoPayloads:(id)a6 u1AuthTagEnabled:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  BOOL v20;
  int v21;
  VCVideoRuleCollections *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  VCVideoRule *v32;
  double v33;
  VCVideoRule *v34;
  uint64_t v35;
  uint64_t v36;
  VCVideoRule *v37;
  double v38;
  VCVideoRule *v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  uint64_t v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  _BOOL4 v58;
  id v59;
  unsigned int v60;
  id v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  _BYTE v80[128];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v7 = a7;
  v11 = a3;
  v90 = *MEMORY[0x1E0C80C00];
  v13 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(objc_msgSend(a3, "groupID"));
  v14 = (void *)objc_msgSend(v11, "u1Config");
  objc_msgSend(a1, "resolutionForStreamGroupConfig:", v11);
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "frameRateForMediaType:", v13);
  if ((int)v16)
    v20 = (int)v18 == 0;
  else
    v20 = 1;
  if (v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.1();
    }
    goto LABEL_35;
  }
  v21 = v19;
  v61 = a5;
  v57 = a4;
  v58 = v7;
  v22 = objc_alloc_init(VCVideoRuleCollections);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = (id)objc_msgSend(v11, "streamConfigs");
  v66 = v11;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
  v60 = v13;
  v59 = a1;
  if (v63)
  {
    v64 = *(_QWORD *)v87;
    v55 = a6;
    v56 = v14;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v87 != v64)
          objc_enumerationMutation(obj);
        v65 = v23;
        v24 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v23);
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v25 = (void *)objc_msgSend(v24, "codecs", v55, v56);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v82;
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v82 != v28)
                objc_enumerationMutation(v25);
              v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "codecConfigs"), "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "integerValue")), "rtpPayload");
              if ((_DWORD)v30 == 128)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.7();
                }
                goto LABEL_35;
              }
              v31 = v30;
              v32 = [VCVideoRule alloc];
              LODWORD(v33) = v21;
              v34 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v32, "initWithFrameWidth:frameHeight:frameRate:payload:", (int)v16, (int)v18, v31, v33);
              v35 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v34);
              -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v22, "addVideoRules:transportType:payload:encodingType:", v35, 1, v31, 1);
              v36 = v35;
              v11 = v66;
              -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v22, "addVideoRules:transportType:payload:encodingType:", v36, 1, v31, 2);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
            if (v27)
              continue;
            break;
          }
        }
        v23 = v65 + 1;
      }
      while (v65 + 1 != v63);
      v13 = v60;
      a6 = v55;
      v14 = v56;
      a1 = v59;
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
    }
    while (v63);
  }
  if ((_DWORD)v13 == 3
    && +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
  {
    v37 = [VCVideoRule alloc];
    *(float *)&v38 = (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare](VCHardwareSettings, "maxFrameRateSupportedScreenShare");
    v39 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v37, "initWithFrameWidth:frameHeight:frameRate:payload:", (int)v16, (int)v18, 100, v38);
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v22, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v39), 1, 100, 2);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v73 = v40;
        v74 = 2080;
        v75 = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSup"
              "portedVideoPayloads:u1AuthTagEnabled:]";
        v76 = 1024;
        v77 = 1069;
        _os_log_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding HEVC decode video rule for kTransportTypeWifi explicitly for screen stream group", buf, 0x1Cu);
      }
    }

  }
  objc_msgSend(v14, "setVideoRuleCollections:", v22);

  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v53 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v73 = v53;
        v74 = 2080;
        v75 = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSup"
              "portedVideoPayloads:u1AuthTagEnabled:]";
        v76 = 1024;
        v77 = 1074;
        v78 = 1024;
        v79 = v13;
        _os_log_impl(&dword_1D8A54000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating settings, as the local device does not support mediaType=%hhu", buf, 0x22u);
      }
    }
    v44 = 0;
    v43 = 0;
LABEL_48:
    v45 = 1;
    goto LABEL_49;
  }
  if ((objc_msgSend(a1, "addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:", v66, v61) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.6();
    }
    goto LABEL_35;
  }
  objc_msgSend(v14, "setPayloadPreference:", +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads"), a6, v13));
  if (!objc_msgSend((id)objc_msgSend(v14, "payloadPreference"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.2();
    }
    goto LABEL_35;
  }
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v42)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.3();
    }
LABEL_35:
    v44 = 0;
    v43 = 0;
    goto LABEL_36;
  }
  v43 = v42;
  if ((_DWORD)v13 == 6)
  {
    v44 = 0;
LABEL_38:
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v46 = (void *)objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads");
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v69;
      while (2)
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v69 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          if (objc_msgSend(v51, "unsignedIntValue") == 128)
          {

            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.4();
            }
            goto LABEL_36;
          }
          objc_msgSend(v43, "addObject:", v51);
          objc_msgSend(v44, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(objc_msgSend(v51, "unsignedIntValue"))));
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
        if (v48)
          continue;
        break;
      }
    }
    objc_msgSend(v14, "setSupportedCipherSuites:", objc_msgSend(v59, "u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:", v57, v60, v58));
    objc_msgSend(v14, "setVideoPayloads:", v43);
    if (objc_msgSend(v44, "count"))
      objc_msgSend(v14, "setVideoParameterSet:", v44);
    goto LABEL_48;
  }
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v44)
    goto LABEL_38;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.5();
  }
  v44 = 0;
LABEL_36:
  v45 = 0;
LABEL_49:

  return v45;
}

- (void)negotiationData
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to compress the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newCompressedBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for v2 blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newDecompressedBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for v2 blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newUnserializedMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Compressed media blob is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newUnserializedMediaBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decompress the media blob v2", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newUnserializedMediaBlob:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[VCMediaNegotiatorV2 newUnserializedMediaBlob:]";
  OUTLINED_FUNCTION_4();
  v4 = 128;
  v5 = 2112;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Exception occurred while parsing remote invite blob: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Remote invite blob is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to deserialize the remote invite blob", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generated negotiated stream groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generated negotiated moments results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generated negotiated results", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse the negotiation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve stream group. status=%x", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate system audio configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendGeneralInfoToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) general info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendBandwidthSettingsToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) banwidth settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendCodecFeaturesToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) codec features", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendCodecFeaturesToMediaBlob:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory to get VCP Codec properties. encoderUsage=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)appendMicrophoneOneToOneSettingsToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) microphone U+1 settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendCameraOneToOneSettingsToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) camera U+1 settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendMomentsSettingsToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) moments settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendStreamGroupsToMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNegotiatedResultsWithRemoteMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrive the bandwdith settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Video features not successfully negotiated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.3()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
  OUTLINED_FUNCTION_4();
  v5 = 545;
  v6 = v0;
  v7 = 1;
  v8 = v0;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find video rule for transportType=%d encodingType=%d", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateStreamGroupConfig:remoteInviteBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generated negotiated video results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve stream group. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate stream groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateU1SettingsForStreamGroup:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  FourccToCStr(a2);
  v8 = 136315906;
  v9 = a1;
  v10 = 2080;
  OUTLINED_FUNCTION_9();
  v11 = 759;
  v12 = v5;
  v13 = v6;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v7, " [%s] %s:%d Failed to negotiate stream group config for groupID=%s", (uint8_t *)&v8);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream group set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Video features are not successfully updated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)resolutionForStreamGroupConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)addV1FeatureListStringsToStreamGroupConfig:mediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Features not successfully negotiated for mediaType=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)addV2FeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen features V2 not successfully negotiated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add V2 feature list strings to streamGroupConfig for mediaType=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add V1 feature list strings to streamGroupConfig for mediaType=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)frameRateForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorV2 frameRateForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 frameRateForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d mediaType=%hhu U1 settings failed to calculate resolution", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:"
                      "localSupportedVideoPayloads:u1AuthTagEnabled:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add featureListStrings for mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
