@implementation VCVideoRuleCollectionsScreenAirplayEmbedded

+ (id)sharedInstance
{
  if (sharedInstance_token_4 != -1)
    dispatch_once(&sharedInstance_token_4, &__block_literal_global_87);
  return (id)sharedInstance__videoRulesCollection;
}

VCVideoRuleCollectionsScreenAirplayEmbedded *__61__VCVideoRuleCollectionsScreenAirplayEmbedded_sharedInstance__block_invoke()
{
  VCVideoRuleCollectionsScreenAirplayEmbedded *result;

  result = -[VCVideoRuleCollectionsScreenAirplayEmbedded initWithHardwareSettings:]([VCVideoRuleCollectionsScreenAirplayEmbedded alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  sharedInstance__videoRulesCollection = (uint64_t)result;
  return result;
}

- (VCVideoRuleCollectionsScreenAirplayEmbedded)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsScreenAirplayEmbedded *v4;
  VCVideoRuleCollectionsScreenAirplayEmbedded *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsScreenAirplayEmbedded;
  v4 = -[VCVideoRuleCollections init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    -[VCVideoRuleCollectionsScreenAirplayEmbedded initSupportedPayloads](v4, "initSupportedPayloads");
    if (!-[VCVideoRuleCollectionsScreenAirplayEmbedded setupRules](v5, "setupRules")
      || (-[VCHardwareSettingsEmbeddedProtocol isPixelFormatAvailable](v5->_hardwareSettings, "isPixelFormatAvailable") & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenAirplayEmbedded initWithHardwareSettings:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (void)initSupportedPayloads
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if ((unint64_t)(v3 - 1) >= 4)
  {
    if (v3 == 6)
    {
      v4 = 123;
      goto LABEL_5;
    }
    if (v3 != 8)
      return;
  }
  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
  v4 = 100;
LABEL_5:
  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", v4);
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
      v23 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:]";
      v24 = 1024;
      v25 = 302;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: Could not find a preferred video rule", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (BOOL)setupRules
{
  _BOOL4 v3;

  v3 = -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules](self, "setupH264Rules");
  if (v3)
    LOBYTE(v3) = -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules](self, "setupHEVCRules");
  return v3;
}

- (BOOL)setupH264Rules
{
  double v3;
  double v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  _BOOL4 v22;
  _BOOL4 v23;
  BOOL v24;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    v3 = 0.0;
    if (-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass") == 4)
    {
      v4 = 0.0;
LABEL_8:
      v8 = -[VCHardwareSettingsEmbeddedProtocol videoEncoderType](self->_hardwareSettings, "videoEncoderType");
      if (v8 != -1)
      {
        v9 = v8;
        v10 = 0;
        v11 = 0;
        switch(-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass"))
        {
          case 1:
            v10 = iPhoneWiFiScreenEncodingRules(v9, 123, v4, v3);
            v16 = iPhoneWiFiScreenDecodingRules(123, v4, v3);
            goto LABEL_35;
          case 2:
            if (v9 == 2)
            {
              v17 = v3 == 640.0 && v4 == 1136.0;
              if (v3 == 640.0 && v4 == 1136.0)
                v18 = &g_AirplayWifiEncodingFormat1136x640AVE;
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
              v17 = 0;
            }
            v10 = videoRulesForFormatList_1((uint64_t)v18, v17, 123);
            v22 = v4 == 1136.0;
            v23 = v3 == 640.0;
            if (v23 && v22)
              v14 = &g_AirplayWifiDecodingFormat1136x640;
            else
              v14 = 0;
            if (v23 && v22)
              v15 = 4;
            else
              v15 = 0;
            goto LABEL_34;
          case 3:
          case 4:
          case 6:
          case 8:
            if (v9 == 1)
              v12 = &g_AirplayWifiEncodingFormatiPadVXE;
            else
              v12 = &g_AirplayWifiEncodingFormatiPadAVE;
            if (v9 == 1)
              v13 = 1;
            else
              v13 = 2;
            v10 = videoRulesForFormatList_1((uint64_t)v12, v13, 123);
            v14 = &g_AirplayWifiDecodingFormatiPad;
            v15 = 12;
LABEL_34:
            v16 = videoRulesForFormatList_1((uint64_t)v14, v15, 123);
LABEL_35:
            v11 = v16;
            if (v10)
              v24 = v16 == 0;
            else
              v24 = 1;
            if (v24)
              goto LABEL_23;
            -[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v10, v4, v3);
            -[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v11, v4, v3);
            v21 = 1;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v10, 1, 123, 1);
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v11, 1, 123, 2);
            goto LABEL_40;
          case 5:
          case 7:
            goto LABEL_23;
          default:
            v11 = 0;
LABEL_23:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v28 = 136315650;
                v29 = v19;
                v30 = 2080;
                v31 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]";
                v32 = 1024;
                v33 = 356;
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v28, 0x1Cu);
              }
            }
            goto LABEL_26;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules].cold.1();
      }
      goto LABEL_53;
    }
    v4 = 0.0;
    if (-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass") == 6)
      goto LABEL_8;
    v5 = -[VCHardwareSettingsEmbeddedProtocol screenWidth](self->_hardwareSettings, "screenWidth");
    if (v5)
    {
      v6 = v5;
      v7 = -[VCHardwareSettingsEmbeddedProtocol screenHeight](self->_hardwareSettings, "screenHeight");
      if (v7)
      {
        v4 = (double)v6;
        v3 = (double)v7;
        goto LABEL_8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315650;
      v29 = v26;
      v30 = 2080;
      v31 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]";
      v32 = 1024;
      v33 = 321;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: no H264 support", (uint8_t *)&v28, 0x1Cu);
    }
  }
LABEL_53:
  v11 = 0;
  v10 = 0;
LABEL_26:
  v21 = 0;
LABEL_40:

  return v21;
}

- (BOOL)setupHEVCRules
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  _BOOL4 v7;
  double v8;
  double v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  unsigned int v34;
  void *v35;
  VCVideoRuleCollectionsScreenAirplayEmbedded *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unsigned int v40;
  void *v41;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCDecodeSupportedForHardwareSettingsMode:", 4);
  v5 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:](VCHardwareSettings, "isHEVCEncodeSupportedForHardwareSettingsMode:", 4);
  v6 = 1;
  if (!v3)
    return v6;
  v7 = v5;
  if (!v4 && !v5)
    return v6;
  v8 = 0.0;
  if (-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass") == 4)
  {
    v9 = 0.0;
    goto LABEL_9;
  }
  v9 = 0.0;
  if (-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass") == 6)
  {
LABEL_9:
    v13 = -[VCHardwareSettingsEmbeddedProtocol videoEncoderType](self->_hardwareSettings, "videoEncoderType");
    if (v13 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules].cold.1();
      }
    }
    else
    {
      v14 = v13;
      switch(-[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass"))
      {
        case 1:
          if (v4)
          {
            v17 = iPhoneWiFiScreenDecodingRules(100, v9, v8);
            if (!v17)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v46 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v53 = 136315650;
                  v54 = v46;
                  v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  v57 = 1024;
                  v58 = 413;
                  v45 = " [%s] %s:%d Airplay Screen rules: No decode rules for this iPhone";
LABEL_106:
                  _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)&v53, 0x1Cu);
                }
              }
              goto LABEL_107;
            }
            v16 = v17;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v17, 1, 100, 2);
            if (!v7)
            {
LABEL_17:
              v18 = 0;
              goto LABEL_71;
            }
          }
          else
          {
            v16 = 0;
            if (!v7)
              goto LABEL_17;
          }
          v30 = iPhoneWiFiScreenEncodingRules(v14, 100, v9, v8);
          if (v30)
          {
            v18 = v30;
            v6 = 1;
LABEL_64:
            v36 = self;
            v37 = v18;
            v38 = 1;
LABEL_65:
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v36, "addVideoRules:transportType:payload:encodingType:", v37, 1, 100, v38);
            goto LABEL_72;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v48 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v53 = 136315650;
              v54 = v48;
              v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              v57 = 1024;
              v58 = 418;
              v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this iPhone";
LABEL_101:
              _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v53, 0x1Cu);
            }
          }
LABEL_102:
          v18 = 0;
          goto LABEL_109;
        case 2:
          if (!v7)
          {
            v18 = 0;
            if (!v4)
              goto LABEL_70;
LABEL_46:
            v31 = v9 == 1136.0;
            v32 = v8 == 640.0;
            if (v32 && v31)
              v33 = &g_AirplayWifiDecodingFormat1136x640;
            else
              v33 = 0;
            if (v32 && v31)
              v34 = 4;
            else
              v34 = 0;
            v35 = videoRulesForFormatList_1((uint64_t)v33, v34, 100);
            if (v35)
            {
              v16 = v35;
              v6 = 1;
              v36 = self;
              v37 = v16;
              v38 = 2;
              goto LABEL_65;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v49 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v53 = 136315650;
                v54 = v49;
                v55 = 2080;
                v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                v57 = 1024;
                v58 = 442;
                _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No HEVC decode rules for this iPod", (uint8_t *)&v53, 0x1Cu);
              }
            }
            goto LABEL_108;
          }
          if (v14 == 2)
          {
            v19 = v8 == 640.0 && v9 == 1136.0;
            if (v8 == 640.0 && v9 == 1136.0)
              v20 = &g_AirplayWifiEncodingFormat1136x640AVE;
            else
              v20 = 0;
          }
          else
          {
            v20 = 0;
            v19 = 0;
          }
          v41 = videoRulesForFormatList_1((uint64_t)v20, v19, 100);
          if (v41)
          {
            v18 = v41;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v41, 1, 100, 1);
            if (!v4)
            {
LABEL_70:
              v16 = 0;
LABEL_71:
              v6 = 1;
              goto LABEL_72;
            }
            goto LABEL_46;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v52 = VRTraceErrorLogLevelToCSTR();
            v44 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v53 = 136315650;
              v54 = v52;
              v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              v57 = 1024;
              v58 = 437;
              v45 = " [%s] %s:%d Airplay Screen rules: No HEVC encode rules for this iPod";
              goto LABEL_106;
            }
          }
          break;
        case 3:
        case 8:
          if (v4)
          {
            v15 = videoRulesForFormatList_1((uint64_t)&g_AirplayWifiDecodingFormatiPad, 0xCu, 100);
            if (!v15)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v43 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v53 = 136315650;
                  v54 = v43;
                  v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  v57 = 1024;
                  v58 = 401;
                  v45 = " [%s] %s:%d Airplay Screen rules: No airplay decode rules for this iPad";
                  goto LABEL_106;
                }
              }
              goto LABEL_107;
            }
            v16 = v15;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v15, 1, 100, 2);
          }
          else
          {
            v16 = 0;
          }
          v6 = 1;
          if (!v7)
            goto LABEL_66;
          if (v14 == 1)
            v24 = &g_AirplayWifiEncodingFormatiPadVXE;
          else
            v24 = &g_AirplayWifiEncodingFormatiPadAVE;
          if (v14 == 1)
            v25 = 1;
          else
            v25 = 2;
          v26 = videoRulesForFormatList_1((uint64_t)v24, v25, 100);
          if (v26)
            goto LABEL_63;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v53 = 136315650;
              v54 = v27;
              v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              v57 = 1024;
              v58 = 406;
              v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this iPad";
              goto LABEL_101;
            }
          }
          goto LABEL_102;
        case 4:
          if (v4)
          {
            v21 = videoRulesForFormatList_1((uint64_t)&g_AirplayWifiDecodingFormatiPad, 0xCu, 100);
            if (!v21)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v47 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v53 = 136315650;
                  v54 = v47;
                  v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  v57 = 1024;
                  v58 = 425;
                  v45 = " [%s] %s:%d Airplay Screen rules: No decode rules for this apple tv";
                  goto LABEL_106;
                }
              }
              goto LABEL_107;
            }
            v16 = v21;
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v21, 1, 100, 2);
          }
          else
          {
            v16 = 0;
          }
          v6 = 1;
          if (!v7)
          {
LABEL_66:
            v18 = 0;
            goto LABEL_72;
          }
          if (v14 == 1)
            v39 = &g_AirplayWifiEncodingFormatiPadVXE;
          else
            v39 = &g_AirplayWifiEncodingFormatiPadAVE;
          if (v14 == 1)
            v40 = 1;
          else
            v40 = 2;
          v26 = videoRulesForFormatList_1((uint64_t)v39, v40, 100);
          if (v26)
          {
LABEL_63:
            v18 = v26;
            goto LABEL_64;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v51 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v53 = 136315650;
              v54 = v51;
              v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              v57 = 1024;
              v58 = 430;
              v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this apple tv";
              goto LABEL_101;
            }
          }
          goto LABEL_102;
        default:
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return 0;
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          v6 = 0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v53 = 136315650;
            v54 = v22;
            v55 = 2080;
            v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
            v57 = 1024;
            v58 = 449;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Airplay Screen rules", (uint8_t *)&v53, 0x1Cu);
            return 0;
          }
          return v6;
      }
    }
    goto LABEL_107;
  }
  v10 = -[VCHardwareSettingsEmbeddedProtocol screenWidth](self->_hardwareSettings, "screenWidth");
  if (v10)
  {
    v11 = v10;
    v12 = -[VCHardwareSettingsEmbeddedProtocol screenHeight](self->_hardwareSettings, "screenHeight");
    if (v12)
    {
      v9 = (double)v11;
      v8 = (double)v12;
      goto LABEL_9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules].cold.3();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules].cold.2();
  }
LABEL_107:
  v18 = 0;
LABEL_108:
  v16 = 0;
LABEL_109:
  v6 = 0;
LABEL_72:

  return v6;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create H264/HEVC rules for Airplay screen!", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen rules: Could not retrieve main screen height", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen rules: Could not retrieve main screen height", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
