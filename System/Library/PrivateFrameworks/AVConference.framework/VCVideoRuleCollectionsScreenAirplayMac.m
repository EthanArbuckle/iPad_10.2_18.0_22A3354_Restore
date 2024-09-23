@implementation VCVideoRuleCollectionsScreenAirplayMac

+ (id)sharedInstance
{
  return 0;
}

- (VCVideoRuleCollectionsScreenAirplayMac)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsScreenAirplayMac *v4;
  VCVideoRuleCollectionsScreenAirplayMac *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreenAirplayMac;
  v4 = -[VCVideoRuleCollections init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    -[VCVideoRuleCollectionsScreenAirplayMac initSupportedPayloads](v4, "initSupportedPayloads");
    if (!-[VCVideoRuleCollectionsScreenAirplayMac setupRules](v5, "setupRules")
      || (-[VCHardwareSettingsMacProtocol isPixelFormatAvailable](v5->_hardwareSettings, "isPixelFormatAvailable") & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenAirplayMac initWithHardwareSettings:].cold.1(v6, v7);
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

  v3 = -[VCVideoRuleCollectionsScreenAirplayMac setupH264Rules](self, "setupH264Rules");
  if (v3)
    LOBYTE(v3) = -[VCVideoRuleCollectionsScreenAirplayMac setupHEVCRules](self, "setupHEVCRules");
  return v3;
}

- (BOOL)setupH264Rules
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
  v3 = videoRulesForFormatList((uint64_t)&g_EncodingFormatMacWiFiAirplay, 123);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = 136315650;
    v13 = v8;
    v14 = 2080;
    v15 = "-[VCVideoRuleCollectionsScreenAirplayMac setupH264Rules]";
    v16 = 1024;
    v17 = 142;
    v10 = " [%s] %s:%d Airplay Screen rules: No suitable H264 encode rules for this mac";
    goto LABEL_11;
  }
  v4 = videoRulesForFormatList((uint64_t)&g_DecodingFormatMacWiFiAirplay, 123);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v11 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = 136315650;
    v13 = v11;
    v14 = 2080;
    v15 = "-[VCVideoRuleCollectionsScreenAirplayMac setupH264Rules]";
    v16 = 1024;
    v17 = 145;
    v10 = " [%s] %s:%d Airplay Screen rules: No suitable H264 decode rules for this mac";
LABEL_11:
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x1Cu);
LABEL_12:
    v5 = 0;
    v6 = 0;
    goto LABEL_4;
  }
  v5 = v4;
  v6 = 1;
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 1, 123, 1);
  -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v5, 1, 123, 2);
LABEL_4:

  return v6;
}

- (BOOL)setupHEVCRules
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCDecodeSupportedForHardwareSettingsMode:", 4);
  v5 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCEncodeSupportedForHardwareSettingsMode:", 4);
  v6 = 1;
  if (v3 && (v4 || v5))
  {
    if (v5)
    {
      v7 = videoRulesForFormatList((uint64_t)&g_EncodingFormatMacWiFiAirplay, 100);
      if (!v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v16 = 136315650;
            v17 = v12;
            v18 = 2080;
            v19 = "-[VCVideoRuleCollectionsScreenAirplayMac setupHEVCRules]";
            v20 = 1024;
            v21 = 171;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No suitable hevc encode rules for this mac", (uint8_t *)&v16, 0x1Cu);
          }
        }
        v9 = 0;
        v8 = 0;
        goto LABEL_20;
      }
      v8 = v7;
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v7, 1, 100, 1);
      if (!v4)
      {
LABEL_6:
        v9 = 0;
LABEL_10:

        return v6;
      }
    }
    else
    {
      v8 = 0;
      if (!v4)
        goto LABEL_6;
    }
    v10 = videoRulesForFormatList((uint64_t)&g_DecodingFormatMacWiFiAirplay, 100);
    if (v10)
    {
      v9 = v10;
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v10, 1, 100, 2);
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = v14;
        v18 = 2080;
        v19 = "-[VCVideoRuleCollectionsScreenAirplayMac setupHEVCRules]";
        v20 = 1024;
        v21 = 176;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No suitable hevc decode rules for this mac", (uint8_t *)&v16, 0x1Cu);
      }
    }
    v9 = 0;
LABEL_20:
    v6 = 0;
    goto LABEL_10;
  }
  return v6;
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
  v5 = "-[VCVideoRuleCollectionsScreenAirplayMac initWithHardwareSettings:]";
  v6 = 1024;
  v7 = 110;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create Airplay screen rules!", (uint8_t *)&v2, 0x1Cu);
}

@end
