@implementation VCVideoRuleCollectionsCameraEmbedded

- (double)preferredAspectRatio
{
  double result;

  +[VCHardwareSettings previewPreferredAspectRatio](VCHardwareSettings, "previewPreferredAspectRatio");
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_token_3 != -1)
    dispatch_once(&sharedInstance_token_3, &__block_literal_global_70);
  return (id)sharedInstance__videoRulesCollections_0;
}

- (VCVideoRuleCollectionsCameraEmbedded)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsCameraEmbedded *v4;
  VCVideoRuleCollectionsCameraEmbedded *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsCameraEmbedded;
  v4 = -[VCVideoRuleCollections init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->super._encodeHighDef = a3;
    -[VCVideoRuleCollectionsCameraEmbedded initSupportedPayloads](v4, "initSupportedPayloads");
    if (!-[VCVideoRuleCollectionsCameraEmbedded setupRules](v5, "setupRules"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsCameraEmbedded initWithHardwareSettings:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoRuleCollectionsCameraEmbedded;
  -[VCVideoRuleCollections dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: supportHEVC[%d] vcpSupportsHEVCEncoder[%d] screenSize[%dx%d] deviceClass[%ld] VCHardwareVideoEncoderType[%ld] useSoftFramerateSwitching[%d]"), NSStringFromClass(v4), objc_msgSend(*(id *)&self->super._encodeHighDef, "supportHEVC"), objc_msgSend(*(id *)&self->super._encodeHighDef, "vcpSupportsHEVCEncoder"), objc_msgSend(*(id *)&self->super._encodeHighDef, "screenWidth"), objc_msgSend(*(id *)&self->super._encodeHighDef, "screenHeight"), objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass"), objc_msgSend(*(id *)&self->super._encodeHighDef, "videoEncoderType"), objc_msgSend(*(id *)&self->super._encodeHighDef, "useSoftFramerateSwitching"));
}

- (void)initSupportedPayloads
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(*(id *)&self->super._encodeHighDef, "supportedVideoPayloads");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "unsignedIntValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

VCVideoRuleCollectionsCameraEmbedded *__54__VCVideoRuleCollectionsCameraEmbedded_sharedInstance__block_invoke()
{
  VCVideoRuleCollectionsCameraEmbedded *result;

  result = -[VCVideoRuleCollectionsCameraEmbedded initWithHardwareSettings:]([VCVideoRuleCollectionsCameraEmbedded alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  sharedInstance__videoRulesCollections_0 = (uint64_t)result;
  return result;
}

- (_VCHardwareConfiguration)hardwareConfigurationForPayload:(int)a3 transportType:(unsigned __int8)a4
{
  unint64_t v5;
  _UNKNOWN **v6;
  __int16 v7;
  _VCHardwareConfiguration *i;
  _VCHardwareConfiguration *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  int64_t var0;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 == 100)
  {
    if (a4 == 2)
    {
      v5 = objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass") - 1;
      if (v5 < 8 && ((0x87u >> v5) & 1) != 0)
      {
        v6 = &off_1E9E57210;
        goto LABEL_27;
      }
    }
    else if (a4 == 1)
    {
      v7 = +[GKSConnectivitySettings getAbTestMasterLocalSwitches](GKSConnectivitySettings, "getAbTestMasterLocalSwitches");
      i = 0;
      v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPad;
      v10 = 11;
      switch(objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass"))
      {
        case 1:
          v11 = v7 & 0x800;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v16 = 136315906;
              v17 = v12;
              v18 = 2080;
              v19 = "-[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:]";
              v20 = 1024;
              v21 = 470;
              v22 = 1024;
              v23 = v11 >> 11;
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch hevcWifiTiersEnabled %d", (uint8_t *)&v16, 0x22u);
            }
          }
          if (v11)
            v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPhone;
          else
            v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPhoneNoEncode;
          v10 = 9;
          goto LABEL_28;
        case 2:
          v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPod;
          v10 = 2;
          goto LABEL_28;
        case 3:
          goto LABEL_28;
        case 8:
          v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiWolf;
          v10 = 1;
          goto LABEL_28;
        default:
          return i;
      }
      return i;
    }
    return 0;
  }
  if (a3 != 126 && a3 != 123)
    return 0;
  if (a4 == 2)
  {
    v5 = objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass") - 1;
    if (v5 < 8 && ((0x87u >> v5) & 1) != 0)
    {
      v6 = &off_1E9E571D0;
      goto LABEL_27;
    }
    return 0;
  }
  if (a4 != 1)
    return 0;
  v5 = objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass") - 1;
  if (v5 >= 8 || ((0x87u >> v5) & 1) == 0)
    return 0;
  v6 = &off_1E9E57190;
LABEL_27:
  v9 = (_VCHardwareConfiguration *)v6[v5];
  v10 = qword_1D910F3F0[v5];
LABEL_28:
  for (i = v9; ; ++i)
  {
    var0 = i->var0;
    if (var0 == objc_msgSend(*(id *)&self->super._encodeHighDef, "chipId"))
      break;
    if (!--v10)
      return v9;
  }
  if (!i->var2 && !i->var4)
    return 0;
  return i;
}

- (BOOL)isPreferredVideoRule:(id)a3 preferredFormat:(id)a4
{
  unint64_t v6;
  BOOL v7;
  int *v8;
  int v9;
  int v10;
  int v11;
  float v12;
  int v13;
  int v14;
  int v15;
  float v16;

  if (a4)
  {
    if (objc_msgSend(a3, "compare:", a4))
    {
      v6 = 0;
      v7 = 1;
      v8 = &dword_1D910F39C;
      do
      {
        v9 = *v8;
        if (v9 == objc_msgSend(a3, "iWidth"))
        {
          v10 = v8[1];
          if (v10 == objc_msgSend(a3, "iHeight"))
          {
            v11 = v8[2];
            objc_msgSend(a3, "fRate");
            if (v11 == (int)v12)
            {
              v13 = *(v8 - 3);
              if (v13 == objc_msgSend(a4, "iWidth"))
              {
                v14 = *(v8 - 2);
                if (v14 == objc_msgSend(a4, "iHeight"))
                {
                  v15 = *(v8 - 1);
                  objc_msgSend(a4, "fRate");
                  if (v15 == (int)v16)
                    break;
                }
              }
            }
          }
        }
        v7 = v6 < 3;
        v8 += 6;
        ++v6;
      }
      while (v6 != 4);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)setupVideoRulesForPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5 formatList:(_VCVideoFormat *)a6 formatListCount:(unsigned int)a7 preferredFormat:(id)a8 supportsHighDef:(BOOL *)a9
{
  uint64_t v10;
  unsigned int v12;
  uint64_t v13;
  void *v15;
  _BOOL4 v16;
  VCVideoRule *v17;
  double v18;
  VCVideoRule *v19;
  VCVideoRule *v20;
  double v21;
  VCVideoRule *v22;
  double v23;
  NSObject *v24;
  unsigned int *p_var2;
  VCVideoRule *v26;
  double v27;
  VCVideoRule *v28;
  VCVideoRule *v29;
  int v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  VCVideoRuleCollectionsCameraEmbedded *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t v40;
  _VCVideoFormat *v41;
  unsigned int v42;
  unsigned int v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  unsigned int v53;
  uint64_t v54;

  LODWORD(v10) = a7;
  v12 = a5;
  v43 = a4;
  v13 = *(_QWORD *)&a3;
  v54 = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = +[VCHardwareSettings supportsDecodingSquareCameraVideo](VCHardwareSettings, "supportsDecodingSquareCameraVideo");
  v42 = v12;
  if (v12 == 2 && v16)
  {
    v41 = a6;
    v17 = [VCVideoRule alloc];
    LODWORD(v18) = 30.0;
    v19 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v17, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v13, v18);
    v20 = [VCVideoRule alloc];
    LODWORD(v21) = 1114636288;
    v22 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v20, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v13, v21);
    objc_msgSend(a8, "setToVideoRule:", v19);
    LODWORD(v23) = 1.0;
    -[VCVideoRule setFPref:](v19, "setFPref:", v23);
    objc_msgSend(v15, "addObject:", v19);
    objc_msgSend(v15, "addObject:", v22);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v40 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v45 = v40;
        v46 = 2080;
        v47 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:for"
              "matListCount:preferredFormat:supportsHighDef:]";
        v48 = 1024;
        v49 = 592;
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d supportsDecodingSquareCameraVideo, decode rules added", buf, 0x1Cu);
      }
    }

    a6 = v41;
  }
  if ((_DWORD)v10)
  {
    v10 = v10;
    p_var2 = &a6->var2;
    do
    {
      v26 = [VCVideoRule alloc];
      *(float *)&v27 = (float)*p_var2;
      v28 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v26, "initWithFrameWidth:frameHeight:frameRate:payload:", *(p_var2 - 2), *(p_var2 - 1), v13, v27);
      v29 = v28;
      if (a9)
      {
        v30 = -[VCVideoRule iWidth](v28, "iWidth");
        if (-[VCVideoRule iHeight](v29, "iHeight") * v30 > 307200)
          *a9 = 1;
      }
      if (-[VCVideoRuleCollectionsCameraEmbedded isPreferredVideoRule:preferredFormat:](self, "isPreferredVideoRule:preferredFormat:", v29, a8))
      {
        LODWORD(v31) = 1.0;
        -[VCVideoRule setFPref:](v29, "setFPref:", v31);
      }
      p_var2 += 3;
      objc_msgSend(v15, "addObject:", v29);

      --v10;
    }
    while (v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v45 = v32;
        v46 = 2080;
        v47 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:for"
              "matListCount:preferredFormat:supportsHighDef:]";
        v48 = 1024;
        v49 = 613;
        v50 = 1024;
        v51 = v13;
        v52 = 1024;
        v53 = v43;
        _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d formatList size is zero for payload=%d, transfportType=%d", buf, 0x28u);
      }
    }
    if (a9)
      *a9 = 0;
  }
  objc_msgSend(v15, "sortUsingSelector:", sel_compare_);
  if ((_DWORD)v13 == 100)
  {
    if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100))
    {
LABEL_31:
      LOBYTE(v38) = 1;
      return v38;
    }
    v34 = self;
    v35 = v15;
    v36 = v43;
    v37 = 100;
LABEL_30:
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v34, "addVideoRules:transportType:payload:encodingType:", v35, v36, v37, v42);
    goto LABEL_31;
  }
  if ((_DWORD)v13 == 126 || (_DWORD)v13 == 123)
  {
    if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126))
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v15, v43, 126, v42);
    if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
      goto LABEL_31;
    v34 = self;
    v35 = v15;
    v36 = v43;
    v37 = 123;
    goto LABEL_30;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v38)
      return v38;
    -[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:].cold.1();
  }
  LOBYTE(v38) = 0;
  return v38;
}

- (BOOL)setupH264Rules
{
  _VCHardwareConfiguration *v3;
  _VCHardwareConfiguration *v4;
  VCVideoRule *v5;
  double v6;
  uint64_t v7;
  void *v8;
  _VCHardwareConfiguration *v9;
  _VCHardwareConfiguration *v10;
  VCVideoRule *v11;
  double v12;
  uint64_t v13;
  void *v14;
  BOOL v15;

  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126)
    && !-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    return 1;
  }
  v3 = -[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:](self, "hardwareConfigurationForPayload:transportType:", 123, 1);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = [VCVideoRule alloc];
  *(float *)&v6 = (float)v4->var1.var2;
  v7 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v5, "initWithFrameWidth:frameHeight:frameRate:", v4->var1.var0, v4->var1.var1, v6);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.1();
    }
    return 0;
  }
  v8 = (void *)v7;
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 123, 1, 1, v4->var3, v4->var2, 0, &self->super.super._encodingType + 1))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.6();
    }
    goto LABEL_27;
  }
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 123, 1, 2, v4->var5, v4->var4, v8, &self->super.super._encodingType + 2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.5();
    }
    goto LABEL_27;
  }
  v9 = -[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:](self, "hardwareConfigurationForPayload:transportType:", 123, 2);
  if (!v9)
  {
LABEL_27:

    return 0;
  }
  v10 = v9;
  v11 = [VCVideoRule alloc];
  *(float *)&v12 = (float)v10->var1.var2;
  v13 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v11, "initWithFrameWidth:frameHeight:frameRate:", v10->var1.var0, v10->var1.var1, v12);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.2();
    }
    goto LABEL_27;
  }
  v14 = (void *)v13;
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 123, 2, 1, v10->var3, v10->var2, 0, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.4();
    }
    goto LABEL_35;
  }
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 123, 2, 2, v10->var5, v10->var4, v14, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.3();
    }
LABEL_35:
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 1;
LABEL_12:

  return v15;
}

- (_VCBitrateConfiguration)bitrateConfiguration
{
  BOOL *p_encodeHighDef;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;

  p_encodeHighDef = &self->super._encodeHighDef;
  v3 = objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass") - 1;
  if (v3 < 8 && ((0x87u >> v3) & 1) != 0)
    return (_VCBitrateConfiguration *)((char *)*(&off_1E9E57250 + v3) + 48);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsCameraEmbedded bitrateConfiguration].cold.1(v4, (id *)p_encodeHighDef, v5);
  }
  return 0;
}

- (BOOL)supportsHEVCWifiDecoding
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  if (v3)
  {
    v4 = objc_msgSend(*(id *)&self->super._encodeHighDef, "chipId");
    if ((unint64_t)(v4 - 0x8000) > 0x15)
      LOBYTE(v3) = 0;
    else
      return (0x23000Bu >> v4) & 1;
  }
  return v3;
}

- (BOOL)supportsHEVCWifiEncoding
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100);
  if (v3)
  {
    v4 = objc_msgSend(*(id *)&self->super._encodeHighDef, "chipId");
    if ((unint64_t)(v4 - 32784) > 5)
      LOBYTE(v3) = 0;
    else
      return (0x23u >> (v4 - 16)) & 1;
  }
  return v3;
}

- (BOOL)setupHEVCRules
{
  _VCHardwareConfiguration *v3;
  _VCHardwareConfiguration *v4;
  VCVideoRule *v5;
  double v6;
  VCVideoRule *v7;
  _VCHardwareConfiguration *v8;
  id v9;
  VCVideoRule *v10;
  double v11;
  VCVideoRule *v12;
  VCVideoRule *v13;
  double v14;
  VCVideoRule *v15;
  float v16;
  VCVideoRule *v17;
  double v18;
  VCVideoRule *v19;
  _VCVideoFormat *var5;
  uint64_t var4;
  BOOL v22;

  if (!-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100)
    || !objc_msgSend(*(id *)&self->super._encodeHighDef, "supportHEVC"))
  {
    return 1;
  }
  v3 = -[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:](self, "hardwareConfigurationForPayload:transportType:", 100, 2);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.1();
    }
    return 1;
  }
  v4 = v3;
  v5 = [VCVideoRule alloc];
  *(float *)&v6 = (float)v4->var1.var2;
  v7 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v5, "initWithFrameWidth:frameHeight:frameRate:", v4->var1.var0, v4->var1.var1, v6);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.2();
    }
    goto LABEL_26;
  }
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 100, 2, 1, v4->var3, v4->var2, 0, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.6();
    }
    goto LABEL_26;
  }
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 100, 2, 2, v4->var5, v4->var4, v7, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.5();
    }
LABEL_26:
    v22 = 0;
    v19 = 0;
    goto LABEL_11;
  }
  v8 = -[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:](self, "hardwareConfigurationForPayload:transportType:", 100, 1);
  if (+[VCHardwareSettings supportsDecodingSquareCameraVideo](VCHardwareSettings, "supportsDecodingSquareCameraVideo"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = [VCVideoRule alloc];
    LODWORD(v11) = 30.0;
    v12 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v10, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, 100, v11);
    v13 = [VCVideoRule alloc];
    LODWORD(v14) = 1114636288;
    v15 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v13, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, 100, v14);
    objc_msgSend(v9, "addObject:", v12);
    objc_msgSend(v9, "addObject:", v15);
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v9, 1, 100, 2);

    v8->var1.var0 = -[VCVideoRule iWidth](v12, "iWidth");
    v8->var1.var1 = -[VCVideoRule iHeight](v12, "iHeight");
    -[VCVideoRule fRate](v12, "fRate");
    v8->var1.var2 = v16;
  }
  v17 = [VCVideoRule alloc];
  *(float *)&v18 = (float)v8->var1.var2;
  v19 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v17, "initWithFrameWidth:frameHeight:frameRate:", v8->var1.var0, v8->var1.var1, v18);
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 100, 1, 1, v8->var3, v8->var2, 0, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.4();
    }
    goto LABEL_33;
  }
  var5 = v8->var5;
  var4 = v8->var4;
  v22 = 1;
  if (!-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:](self, "setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:", 100, 1, 2, var5, var4, v19, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.3();
    }
LABEL_33:
    v22 = 0;
  }
LABEL_11:

  return v22;
}

- (BOOL)setupRules
{
  uint64_t v3;
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v3;
      v13 = 2080;
      v14 = "-[VCVideoRuleCollectionsCameraEmbedded setupRules]";
      v15 = 1024;
      v16 = 887;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v11, 0x1Cu);
    }
  }
  if (-[VCVideoRuleCollectionsCameraEmbedded setupH264Rules](self, "setupH264Rules"))
    v5 = -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules](self, "setupHEVCRules");
  else
    v5 = 0;
  if (-[VCDefaults forceDisableVideoRuleWiFi1080](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoRuleWiFi1080"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCVideoRuleCollectionsCameraEmbedded setupRules]";
        v15 = 1024;
        v16 = 894;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleWiFi1080 is set", (uint8_t *)&v11, 0x1Cu);
      }
    }
    -[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:](self, "limitVideoRulesToMaxWidth:maxHeight:transportType:", 1280, 768, 1);
  }
  if (-[VCDefaults forceDisableVideoRuleCell720](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoRuleCell720"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCVideoRuleCollectionsCameraEmbedded setupRules]";
        v15 = 1024;
        v16 = 898;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleCell720 is set", (uint8_t *)&v11, 0x1Cu);
      }
    }
    -[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:](self, "limitVideoRulesToMaxWidth:maxHeight:transportType:", 640, 480, 2);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create camera rules!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:.cold.1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatList"
       "Count:preferredFormat:supportsHighDef:]";
  v6 = 1024;
  v7 = 637;
  v8 = 1024;
  v9 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Failed setupVideoRulesForPayload for unrecognized payload %d!", v3);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup Wifi encoding rules for H264", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)bitrateConfiguration
{
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "deviceClass");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  v10 = "-[VCVideoRuleCollectionsCameraEmbedded bitrateConfiguration]";
  v11 = 1024;
  v12 = 751;
  v13 = 1024;
  v14 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v6, " [%s] %s:%d Couldn't find configuration for _hardwareSettings.deviceClass = %d", (uint8_t *)&v7);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup cell encoding rules for HEVC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
