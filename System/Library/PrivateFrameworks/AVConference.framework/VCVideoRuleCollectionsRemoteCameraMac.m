@implementation VCVideoRuleCollectionsRemoteCameraMac

- (VCVideoRuleCollectionsRemoteCameraMac)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsRemoteCameraMac *v4;
  VCVideoRuleCollectionsRemoteCameraMac *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsRemoteCameraMac;
  v4 = -[VCVideoRuleCollections init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    if (!-[VCVideoRuleCollectionsRemoteCameraMac initSupportedPayloads](v4, "initSupportedPayloads")
      || !-[VCVideoRuleCollectionsRemoteCamera setupHEVCRules](v5, "setupHEVCRules"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsRemoteCameraMac initWithHardwareSettings:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)initSupportedPayloads
{
  uint64_t v3;

  if (-[VCHardwareSettingsMacProtocol canDoHEVC](self->_hardwareSettings, "canDoHEVC"))
    -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 100);
  v3 = -[NSMutableArray count](self->super.super._supportedPayloads, "count");
  if (!v3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsRemoteCameraMac initSupportedPayloads].cold.1();
  }
  return v3 != 0;
}

- (void)initWithHardwareSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create camera rules!", v2, v3, v4, v5, 2u);
}

- (void)initSupportedPayloads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No supportedPayloads for this hardware", v2, v3, v4, v5, 2u);
}

@end
