@implementation VCVideoRuleCollectionsScreen

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedInstance__videoRulesCollection_0)
    sharedInstance__videoRulesCollection_0 = -[VCVideoRuleCollectionsScreen initWithHardwareSettings:]([VCVideoRuleCollectionsScreen alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  objc_sync_exit(v2);
  return (id)sharedInstance__videoRulesCollection_0;
}

- (VCVideoRuleCollectionsScreen)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsScreen *v4;
  VCVideoRuleCollectionsScreen *v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreen;
  v4 = -[VCVideoRuleCollections init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    -[VCVideoRuleCollectionsScreen initSupportedPayloads](v4, "initSupportedPayloads");
    if ((-[VCVideoRuleCollections isPayloadSupported:](v5, "isPayloadSupported:", 126)
       || -[VCVideoRuleCollections isPayloadSupported:](v5, "isPayloadSupported:", 123))
      && !-[VCVideoRuleCollectionsScreen setupH264Rules](v5, "setupH264Rules"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v11 = v6;
          v12 = 2080;
          v13 = "-[VCVideoRuleCollectionsScreen initWithHardwareSettings:]";
          v14 = 1024;
          v15 = 292;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: Failed to create H264 rules", buf, 0x1Cu);
        }
      }

      return 0;
    }
  }
  return v5;
}

- (id)initForMacDecodingOnly
{
  VCVideoRuleCollectionsScreen *v2;
  VCVideoRuleCollectionsScreen *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsScreen;
  v2 = -[VCVideoRuleCollections init](&v5, sel_init);
  v3 = v2;
  if (v2 && !-[VCVideoRuleCollectionsScreen setupMacDecodingOnlyRules](v2, "setupMacDecodingOnlyRules"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreen initForMacDecodingOnly].cold.1();
    }

    return 0;
  }
  return v3;
}

+ (void)updateScreenRuleCollections:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  VCVideoRule *v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  height = a4.height;
  width = a4.width;
  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(&unk_1E9EFAE08, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v7)
    return;
  v8 = v7;
  v9 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(&unk_1E9EFAE08);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue");
      v12 = [VCVideoRule alloc];
      *(float *)&v13 = (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare](VCHardwareSettings, "maxFrameRateSupportedScreenShare");
      v14 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v12, "initWithFrameWidth:frameHeight:frameRate:payload:", (int)width, (int)height, v11, v13);
      if (!v14)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCVideoRuleCollectionsScreen updateScreenRuleCollections:size:].cold.1();
        }
        return;
      }
      v15 = (void *)v14;
      v16 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
      if ((_DWORD)v11 != 100)
      {
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v16, 1, v11, 1);
LABEL_13:
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v16, 1, v11, 2);
        goto LABEL_14;
      }
      if (+[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
        objc_msgSend(a3, "addVideoRules:transportType:payload:encodingType:", v16, 1, 100, 1);
      if (+[VCHardwareSettings supportsHEVCDecoding](VCHardwareSettings, "supportsHEVCDecoding"))
        goto LABEL_13;
LABEL_14:

    }
    v8 = objc_msgSend(&unk_1E9EFAE08, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v8)
      continue;
    break;
  }
}

+ (void)addRulesForU1ToCollection:(id)a3
{
  double v5;
  double v6;
  BOOL v7;

  +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:](VideoUtil, "computeResolutionForMainDisplayWithMaxScreenPixelCount:", 5603328);
  if ((int)v6)
    v7 = (int)v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoRuleCollectionsScreen addRulesForU1ToCollection:].cold.1();
    }
  }
  else
  {
    objc_msgSend(a1, "updateScreenRuleCollections:size:", a3);
  }
}

- (void)initSupportedPayloads
{
  unint64_t v3;

  v3 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if (v3 <= 8 && ((1 << v3) & 0x14E) != 0)
    -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
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
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    v11 = 1.0;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
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
          v9 = v13;
          v11 = v16;
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
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
    }
  }
}

- (BOOL)setupH264Rules
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  NSObject *v23;
  BOOL v24;
  BOOL v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = 136315650;
        v42 = v37;
        v43 = 2080;
        v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
        v45 = 1024;
        v46 = 406;
        _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: no H264 support", (uint8_t *)&v41, 0x1Cu);
      }
    }
    goto LABEL_116;
  }
  v3 = -[VCHardwareSettingsEmbeddedProtocol screenWidth](self->_hardwareSettings, "screenWidth");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreen setupH264Rules].cold.1();
    }
    goto LABEL_116;
  }
  v4 = v3;
  v5 = -[VCHardwareSettingsEmbeddedProtocol screenHeight](self->_hardwareSettings, "screenHeight");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreen setupH264Rules].cold.2();
    }
    goto LABEL_116;
  }
  v6 = v5;
  v7 = -[VCHardwareSettingsEmbeddedProtocol videoEncoderType](self->_hardwareSettings, "videoEncoderType");
  if (v7 <= 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsScreen setupH264Rules].cold.3();
    }
LABEL_116:
    v15 = 0;
    v16 = 0;
    v32 = 0;
    v14 = 0;
    goto LABEL_117;
  }
  v8 = v7;
  v9 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if ((unint64_t)(v9 - 1) < 2)
  {
    if (v8 == 1)
    {
      v19 = 1;
      v20 = &g_WifiEncodingFormat1136x640VXE;
    }
    else if (v4 == 1136 && v6 == 640)
    {
      v19 = 1;
      v20 = &g_WifiEncodingFormat1136x640AVE;
    }
    else if (v4 == 1334 && v6 == 750)
    {
      v19 = 2;
      v20 = &g_WifiEncodingFormat1334x750AVE;
    }
    else
    {
      v20 = &g_WifiEncodingFormat1920x1080AVE;
      if (v4 == 1920 && v6 == 1080)
      {
        v19 = 3;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        v19 = 4;
        v20 = &g_WifiEncodingFormat2436x1125AVE;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        v19 = 4;
        v20 = &g_WifiEncodingFormat2436x1125AVE;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        v20 = &g_WifiEncodingFormat2436x1125AVE;
        v19 = 4;
      }
      else
      {
        v19 = 3;
      }
    }
    v14 = newVideoRulesForFormatList((uint64_t)v20, v19);
    if (v4 == 1136 && v6 == 640)
    {
      v15 = newVideoRulesForFormatList((uint64_t)&g_CellEncodingFormat1136x640, 1);
      v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormat1136x640, 4);
      v18 = 2;
      v17 = &g_CellDecodingFormat1136x640;
    }
    else if (v4 == 1334 && v6 == 750)
    {
      v15 = newVideoRulesForFormatList((uint64_t)&g_CellEncodingFormat1334x750, 2);
      v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormat1334x750, 6);
      v18 = 3;
      v17 = &g_CellDecodingFormat1334x750;
    }
    else
    {
      v25 = v4 == 1920 && v6 == 1080;
      v26 = v25;
      v27 = &g_CellEncodingFormat1920x1080;
      if (v25)
      {
        v28 = 3;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        v28 = 4;
        v27 = &g_CellEncodingFormat2436x1125AVE;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        v28 = 4;
        v27 = &g_CellEncodingFormat2436x1125AVE;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        v27 = &g_CellEncodingFormat2436x1125AVE;
        v28 = 4;
      }
      else
      {
        v28 = 3;
      }
      v15 = newVideoRulesForFormatList((uint64_t)v27, v28);
      v29 = &g_WifiDecodingFormat1920x1080;
      if ((v26 & 1) != 0)
      {
        v30 = 8;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        v30 = 10;
        v29 = &g_WifiDecodingFormat2436x1125;
      }
      else
      {
        v30 = 10;
        if (v4 == 2688 && v6 == 1242)
        {
          v29 = &g_WifiDecodingFormat2436x1125;
        }
        else if (v4 == 1792 && v6 == 828)
        {
          v29 = &g_WifiDecodingFormat2436x1125;
          v30 = 10;
        }
        else
        {
          v30 = 8;
        }
      }
      v16 = newVideoRulesForFormatList((uint64_t)v29, v30);
      v17 = &g_CellDecodingFormat1920x1080;
      if ((v26 & 1) != 0)
      {
        v18 = 4;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        v18 = 5;
        v17 = &g_CellDecodingFormat2436x1125;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        v18 = 5;
        v17 = &g_CellDecodingFormat2436x1125;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        v17 = &g_CellDecodingFormat2436x1125;
        v18 = 5;
      }
      else
      {
        v18 = 4;
      }
    }
    goto LABEL_91;
  }
  if (v9 == 3 || v9 == 8)
  {
    if (v8 == 1)
      v11 = &g_WifiEncodingFormatiPadVXE;
    else
      v11 = &g_WifiEncodingFormatiPadAVE;
    if (v8 == 1)
      v12 = 1;
    else
      v12 = 2;
    if (v8 == 1)
      v13 = &g_CellEncodingFormatiPadVXE;
    else
      v13 = &g_CellEncodingFormatiPadAVE;
    v14 = newVideoRulesForFormatList((uint64_t)v11, v12);
    v15 = newVideoRulesForFormatList((uint64_t)v13, v12);
    v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormatiPad, 12);
    v17 = &g_CellDecodingFormatiPad;
    v18 = 6;
LABEL_91:
    v31 = newVideoRulesForFormatList((uint64_t)v17, v18);
    v32 = v31;
    if (v14)
      v33 = v15 == 0;
    else
      v33 = 1;
    if (!v33 && v16 != 0 && v31 != 0)
    {
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v14, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v16, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v15, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v32, (double)v4, (double)v6);
      v24 = 1;
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v14, 1, 123, 1);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v16, 1, 123, 2);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v15, 2, 123, 1);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v32, 2, 123, 2);
LABEL_102:

      return v24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = 136315650;
        v42 = v39;
        v43 = 2080;
        v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
        v45 = 1024;
        v46 = 436;
        _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: No suitable rules for this device", (uint8_t *)&v41, 0x1Cu);
      }
    }
LABEL_117:
    v24 = 0;
    goto LABEL_102;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule < 7)
    return 0;
  v22 = VRTraceErrorLogLevelToCSTR();
  v23 = *MEMORY[0x1E0CF2758];
  v24 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
  {
    v41 = 136315650;
    v42 = v22;
    v43 = 2080;
    v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
    v45 = 1024;
    v46 = 433;
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no screen sharing rules", (uint8_t *)&v41, 0x1Cu);
    return 0;
  }
  return v24;
}

- (BOOL)setupMacDecodingOnlyRules
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", 123);
  v3 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormatiPad, 12);
  v4 = newVideoRulesForFormatList((uint64_t)&g_CellDecodingFormatiPad, 6);
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (!v6)
  {
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 1, 123, 2);
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v5, 2, 123, 2);
  }

  return v7;
}

- (void)initForMacDecodingOnly
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen sharing rules: Failed to create Mac Decoding only rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)updateScreenRuleCollections:size:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCVideoRuleCollectionsScreen updateScreenRuleCollections:size:]";
  v6 = 1024;
  v7 = 322;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate rule for ruleCollections=%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

+ (void)addRulesForU1ToCollection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen U1 settings failed to calculate resolution", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Screen sharing rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
