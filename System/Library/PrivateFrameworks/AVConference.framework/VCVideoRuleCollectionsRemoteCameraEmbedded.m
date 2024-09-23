@implementation VCVideoRuleCollectionsRemoteCameraEmbedded

- (VCVideoRuleCollectionsRemoteCameraEmbedded)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsRemoteCameraEmbedded *v4;
  VCVideoRuleCollectionsRemoteCameraEmbedded *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsRemoteCameraEmbedded;
  v4 = -[VCVideoRuleCollections init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    if (!-[VCVideoRuleCollectionsRemoteCameraEmbedded initSupportedPayloads](v4, "initSupportedPayloads")
      || !-[VCVideoRuleCollectionsRemoteCamera setupHEVCRules](v5, "setupHEVCRules"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsRemoteCameraEmbedded initWithHardwareSettings:].cold.1(v6, v7);
      }

      return 0;
    }
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_token_0 != -1)
    dispatch_once(&sharedInstance_token_0, &__block_literal_global_5);
  return (id)sharedInstance__videoRulesCollections;
}

VCVideoRuleCollectionsRemoteCameraEmbedded *__60__VCVideoRuleCollectionsRemoteCameraEmbedded_sharedInstance__block_invoke()
{
  VCVideoRuleCollectionsRemoteCameraEmbedded *result;

  result = -[VCVideoRuleCollectionsRemoteCameraEmbedded initWithHardwareSettings:]([VCVideoRuleCollectionsRemoteCameraEmbedded alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  sharedInstance__videoRulesCollections = (uint64_t)result;
  return result;
}

- (BOOL)initSupportedPayloads
{
  VCHardwareSettingsEmbeddedProtocol **p_hardwareSettings;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  p_hardwareSettings = &self->_hardwareSettings;
  if (-[VCHardwareSettingsEmbeddedProtocol vcpSupportsHEVCEncoder](self->_hardwareSettings, "vcpSupportsHEVCEncoder"))-[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 100);
  v4 = -[NSMutableArray count](self->super.super._supportedPayloads, "count");
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsRemoteCameraEmbedded initSupportedPayloads].cold.1(v5, (id *)p_hardwareSettings, v6);
  }
  return v4 != 0;
}

- (void)initWithHardwareSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCVideoRuleCollectionsRemoteCameraEmbedded initWithHardwareSettings:]";
  v6 = 1024;
  v7 = 23;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create camera rules!", (uint8_t *)&v2, 0x1Cu);
}

- (void)initSupportedPayloads
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*a2, "deviceClass");
  v7 = objc_msgSend(*a2, "vcpSupportsHEVCEncoder");
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  v11 = "-[VCVideoRuleCollectionsRemoteCameraEmbedded initSupportedPayloads]";
  v12 = 1024;
  v13 = 49;
  v14 = 2048;
  v15 = v6;
  v16 = 1024;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty suppported payload: device classType=%ld, vcpSupportsHEVCEncoder=%d", (uint8_t *)&v8, 0x2Cu);
}

@end
