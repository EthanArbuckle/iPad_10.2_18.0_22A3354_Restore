@implementation VCVideoRuleCollectionsScreenSecondaryMac

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  objc_sync_exit(v2);
  return 0;
}

- (VCVideoRuleCollectionsScreenSecondaryMac)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsScreenSecondaryMac *v4;
  VCVideoRuleCollectionsScreenSecondaryMac *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreenSecondaryMac;
  v4 = -[VCVideoRuleCollections init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    -[VCVideoRuleCollectionsScreenSecondaryMac initSupportedPayloads](v4, "initSupportedPayloads");
    if (!-[VCVideoRuleCollectionsScreenSecondaryMac setupRules](v5, "setupRules")
      || (-[VCHardwareSettingsMacProtocol isPixelFormatAvailable](v5->_hardwareSettings, "isPixelFormatAvailable") & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenSecondaryMac initWithHardwareSettings:].cold.1(v6, v7);
      }

      return 0;
    }
  }
  return v5;
}

- (void)initSupportedPayloads
{
  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
  if (-[VCHardwareSettingsMacProtocol canDoHEVC](self->_hardwareSettings, "canDoHEVC"))
    -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 100);
}

- (BOOL)setupRules
{
  _BOOL4 v3;

  v3 = -[VCVideoRuleCollectionsScreenSecondaryMac setupH264Rules](self, "setupH264Rules");
  if (v3)
    LOBYTE(v3) = -[VCVideoRuleCollectionsScreenSecondaryMac setupHEVCRules](self, "setupHEVCRules");
  return v3;
}

- (BOOL)setupH264Rules
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
  v3 = videoRulesForFormatList_0((uint64_t)&g_EncodingFormatMacWiFi, 123);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v5 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_4;
      v11 = 136315650;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupH264Rules]";
      v15 = 1024;
      v16 = 117;
      v9 = " [%s] %s:%d Screen rules: No suitable rules for this device";
      goto LABEL_11;
    }
LABEL_12:
    v5 = 0;
    goto LABEL_4;
  }
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 1, 123, 1);
  v4 = videoRulesForFormatList_0((uint64_t)&g_DecodingFormatMacWiFi, 123);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v5 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_4;
      v11 = 136315650;
      v12 = v10;
      v13 = 2080;
      v14 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupH264Rules]";
      v15 = 1024;
      v16 = 121;
      v9 = " [%s] %s:%d Screen rules: No suitable decode rules for this device";
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x1Cu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v5 = 1;
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v4, 1, 123, 2);
LABEL_4:

  return v5;
}

- (BOOL)setupHEVCRules
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  v4 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCEncodeSupportedForHardwareSettingsMode:", 3);
  v5 = 1;
  if (v3 && v4)
  {
    v6 = videoRulesForFormatList_0((uint64_t)&g_EncodingFormatMacWiFi, 100);
    if (v6)
    {
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v6, 1, 100, 1);
      v7 = videoRulesForFormatList_0((uint64_t)&g_DecodingFormatMacWiFi, 100);
      if (v7)
      {
        v8 = v7;
        -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v7, 1, 100, 2);
LABEL_6:

        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v13 = VRTraceErrorLogLevelToCSTR(),
            v11 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        v8 = 0;
        v5 = 0;
        goto LABEL_6;
      }
      v14 = 136315650;
      v15 = v13;
      v16 = 2080;
      v17 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupHEVCRules]";
      v18 = 1024;
      v19 = 146;
      v12 = " [%s] %s:%d Screen rules: No suitable decode rules for this device";
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v14 = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupHEVCRules]";
      v18 = 1024;
      v19 = 142;
      v12 = " [%s] %s:%d Screen rules: No suitable rules for this device";
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x1Cu);
    goto LABEL_15;
  }
  return v5;
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
  v5 = "-[VCVideoRuleCollectionsScreenSecondaryMac initWithHardwareSettings:]";
  v6 = 1024;
  v7 = 86;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create screen secondary rules!", (uint8_t *)&v2, 0x1Cu);
}

@end
