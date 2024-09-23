@implementation VCVideoRuleCollectionsRemoteCamera

- (BOOL)setupHEVCRules
{
  id v3;
  void *v4;
  VCVideoRule *v5;
  double v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules].cold.3();
    }
    return 0;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules].cold.1();
    }
    return 0;
  }
  v4 = v3;
  v5 = [VCVideoRule alloc];
  LODWORD(v6) = 1114636288;
  v7 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v5, "initWithFrameWidth:frameHeight:frameRate:payload:", 1920, 1440, 100, v6);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules].cold.2();
    }
    return 0;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "addObject:", v7);

  v9 = 1;
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v4, 1, 100, 1);
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v4, 1, 100, 2);
  return v9;
}

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsRemoteCameraEmbedded sharedInstance](VCVideoRuleCollectionsRemoteCameraEmbedded, "sharedInstance");
}

+ (unsigned)tilesPerFrame
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:](VCHardwareSettings, "tilesPerVideoFrameForHardwareSettingsMode:", 5);
}

- (void)setupHEVCRules
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NO HEVC payloades", v2, v3, v4, v5, v6);
}

@end
