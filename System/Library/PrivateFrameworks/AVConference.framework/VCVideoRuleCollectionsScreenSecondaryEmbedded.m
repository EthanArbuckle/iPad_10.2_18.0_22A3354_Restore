@implementation VCVideoRuleCollectionsScreenSecondaryEmbedded

+ (id)sharedInstance
{
  if (sharedInstance_token_6 != -1)
    dispatch_once(&sharedInstance_token_6, &__block_literal_global_105);
  return (id)sharedInstance__videoRulesCollection_1;
}

VCVideoRuleCollectionsScreenSecondaryEmbedded *__63__VCVideoRuleCollectionsScreenSecondaryEmbedded_sharedInstance__block_invoke()
{
  VCVideoRuleCollectionsScreenSecondaryEmbedded *result;

  result = -[VCVideoRuleCollectionsScreenSecondaryEmbedded initWithHardwareSettings:]([VCVideoRuleCollectionsScreenSecondaryEmbedded alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  sharedInstance__videoRulesCollection_1 = (uint64_t)result;
  return result;
}

- (VCVideoRuleCollectionsScreenSecondaryEmbedded)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsScreenSecondaryEmbedded *v4;
  VCVideoRuleCollectionsScreenSecondaryEmbedded *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsScreenSecondaryEmbedded;
  v4 = -[VCVideoRuleCollections init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    -[VCVideoRuleCollectionsScreenSecondaryEmbedded initSupportedPayloads](v4, "initSupportedPayloads");
    if (!-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupRules](v5, "setupRules")
      || (-[VCHardwareSettingsEmbeddedProtocol isPixelFormatAvailable](v5->_hardwareSettings, "isPixelFormatAvailable") & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenSecondaryEmbedded initWithHardwareSettings:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (void)initSupportedPayloads
{
  uint64_t v3;

  v3 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if (v3 == 8 || v3 == 3)
  {
    -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
    -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 100);
  }
}

- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4
{
  double height;
  double width;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  height = a4.height;
  width = a4.width;
  v31 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    v11 = 1.0;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (width == (double)(int)objc_msgSend(v13, "iWidth"))
        {
          v14 = (double)(int)objc_msgSend(v13, "iHeight");
          if (height == v14)
          {
            LODWORD(v14) = 1.0;
            v17 = v13;
            goto LABEL_22;
          }
        }
        v15 = height * (double)(int)objc_msgSend(v13, "iWidth");
        if (v15 == width * (double)(int)objc_msgSend(v13, "iHeight")
          && (!v9 || objc_msgSend(v9, "compare:", v13) == -1))
        {
          v11 = 0.0;
          v9 = v13;
        }
        v16 = vabdd_f64((float)((float)(int)objc_msgSend(v13, "iWidth") / (float)(int)objc_msgSend(v13, "iHeight")), width / height);
        if (v16 < v11 || v16 == v11 && (!v9 || objc_msgSend(v9, "compare:", v13) == -1))
        {
          v11 = v16;
          v9 = v13;
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v8)
        continue;
      break;
    }
    if (v9)
    {
      LODWORD(v14) = 1.0;
      v17 = v9;
LABEL_22:
      objc_msgSend(v17, "setFPref:", v14);
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315650;
      v21 = v18;
      v22 = 2080;
      v23 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:]";
      v24 = 1024;
      v25 = 184;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secondary Screen rules: Could not find a preferred video rule", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (BOOL)setupRules
{
  _BOOL4 v3;

  v3 = -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules](self, "setupH264Rules");
  if (v3)
    LOBYTE(v3) = -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules](self, "setupHEVCRules");
  return v3;
}

- (BOOL)setupH264Rules
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315650;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
        v28 = 1024;
        v29 = 203;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secondary Screen rules: no H264 support", (uint8_t *)&v24, 0x1Cu);
      }
    }
    goto LABEL_45;
  }
  v3 = -[VCHardwareSettingsEmbeddedProtocol screenWidth](self->_hardwareSettings, "screenWidth");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules].cold.1();
    }
    goto LABEL_45;
  }
  v4 = v3;
  v5 = -[VCHardwareSettingsEmbeddedProtocol screenHeight](self->_hardwareSettings, "screenHeight");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules].cold.2();
    }
    goto LABEL_45;
  }
  v6 = v5;
  if (-[VCHardwareSettingsEmbeddedProtocol videoEncoderType](self->_hardwareSettings, "videoEncoderType") == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules].cold.3();
    }
LABEL_45:
    v18 = 0;
    v11 = 0;
    goto LABEL_46;
  }
  v7 = (double)v4;
  v8 = (double)v6;
  v9 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if (v9 == 8)
  {
    v11 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 123);
    v12 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 123);
LABEL_28:
    v18 = v12;
    if (v11 && v12)
    {
      -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v11, v7, v8);
      -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v18, v7, v8);
      v15 = 1;
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v11, 1, 123, 1);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v18, 1, 123, 2);
LABEL_31:

      return v15;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315650;
        v25 = v22;
        v26 = 2080;
        v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
        v28 = 1024;
        v29 = 229;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v24, 0x1Cu);
      }
    }
LABEL_46:
    v15 = 0;
    goto LABEL_31;
  }
  if (v9 == 3)
  {
    if (v4 == 2732 && v6 == 2048)
    {
      v10 = &g_EncodingFormatiPadWiFi2732x2048;
    }
    else if (v4 == 2224 && v6 == 1668)
    {
      v10 = &g_EncodingFormatiPadWiFi2224x1668;
    }
    else if (v4 == 2388 && v6 == 1668)
    {
      v10 = &g_EncodingFormatiPadWiFi2388x1668;
    }
    else
    {
      if ((v4 != 2048 || v6 != 1536) && (int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136316162;
          v25 = v16;
          v26 = 2080;
          v27 = "iPadWiFiScreenEncodingRules";
          v28 = 1024;
          v29 = 75;
          v30 = 2048;
          v31 = v7;
          v32 = 2048;
          v33 = v8;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Resolution(%f x %f)  not supported. Defaulting to 2048x1536", (uint8_t *)&v24, 0x30u);
        }
      }
      v10 = &g_EncodingFormatiPadWiFi2048x1536;
    }
    v11 = videoRulesForFormatList_2((uint64_t)v10, 1u, 123);
    v12 = iPadWiFiScreenDecodingRules(123, v7, v8);
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 0;
  v13 = VRTraceErrorLogLevelToCSTR();
  v14 = *MEMORY[0x1E0CF2758];
  v15 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136315650;
    v25 = v13;
    v26 = 2080;
    v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
    v28 = 1024;
    v29 = 226;
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Secondary Screen rules", (uint8_t *)&v24, 0x1Cu);
    return 0;
  }
  return v15;
}

- (BOOL)setupHEVCRules
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCDecodeSupportedForHardwareSettingsMode:", 3);
  v5 = 1;
  if (v3 && v4)
  {
    v6 = -[VCHardwareSettingsEmbeddedProtocol screenWidth](self->_hardwareSettings, "screenWidth");
    if (v6)
    {
      v7 = v6;
      v8 = -[VCHardwareSettingsEmbeddedProtocol screenHeight](self->_hardwareSettings, "screenHeight");
      if (v8)
      {
        v9 = v8;
        if (-[VCHardwareSettingsEmbeddedProtocol videoEncoderType](self->_hardwareSettings, "videoEncoderType") == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules].cold.3();
          }
        }
        else
        {
          v10 = (double)v7;
          v11 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
          if (v11 == 8)
          {
            v12 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 100);
          }
          else
          {
            if (v11 != 3)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v14 = VRTraceErrorLogLevelToCSTR();
                v15 = *MEMORY[0x1E0CF2758];
                v5 = 0;
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  return v5;
                v19 = 136315650;
                v20 = v14;
                v21 = 2080;
                v22 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]";
                v23 = 1024;
                v24 = 277;
                _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Secondary Screen rules", (uint8_t *)&v19, 0x1Cu);
              }
              return 0;
            }
            v12 = iPadWiFiScreenDecodingRules(100, (double)v7, (double)v9);
          }
          v13 = v12;
          if (v12)
          {
            -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v12, v10, (double)v9);
            v5 = 1;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v13, 1, 100, 2);
LABEL_12:

            return v5;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v19 = 136315650;
              v20 = v17;
              v21 = 2080;
              v22 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]";
              v23 = 1024;
              v24 = 280;
              _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v19, 0x1Cu);
            }
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules].cold.1();
    }
    v13 = 0;
    v5 = 0;
    goto LABEL_12;
  }
  return v5;
}

- (void)initWithHardwareSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create rules for secondary screen!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupH264Rules
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Secondary Screen rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Secondary Screen rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
