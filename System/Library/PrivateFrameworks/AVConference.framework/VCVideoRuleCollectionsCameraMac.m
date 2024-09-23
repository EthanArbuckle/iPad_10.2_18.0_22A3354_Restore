@implementation VCVideoRuleCollectionsCameraMac

- (VCVideoRuleCollectionsCameraMac)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsCameraMac *v4;
  VCVideoRuleCollectionsCameraMac *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  unsigned int encodeScore;
  int v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoRuleCollectionsCameraMac;
  v4 = -[VCVideoRuleCollections init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    -[VCVideoRuleCollectionsCameraMac initSupportedPayloads](v4, "initSupportedPayloads");
    -[VCVideoRuleCollectionsCameraMac computeEncodingScore](v5, "computeEncodingScore");
    -[VCVideoRuleCollectionsCameraMac computeDecodingScore](v5, "computeDecodingScore");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_DWORD *)(&v5->super._decodeHighDef + 3);
        v9 = *(&v5->super.super._encodingType + 1);
        encodeScore = v5->_encodeScore;
        v11 = *(&v5->super.super._encodingType + 2);
        *(_DWORD *)buf = 136316674;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac initWithHardwareSettings:]";
        v18 = 1024;
        v19 = 37;
        v20 = 1024;
        v21 = v8;
        v22 = 1024;
        v23 = v9;
        v24 = 1024;
        v25 = encodeScore;
        v26 = 1024;
        v27 = v11;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encode score = %d, encodingHighDef = %d decoding score = %d, decodeHighDef = %d", buf, 0x34u);
      }
    }
    if (!-[VCVideoRuleCollectionsCameraMac setupRules](v5, "setupRules"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsCameraMac initWithHardwareSettings:].cold.1();
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
  v2.super_class = (Class)VCVideoRuleCollectionsCameraMac;
  -[VCVideoRuleCollections dealloc](&v2, sel_dealloc);
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
  v3 = (void *)-[VCHardwareSettingsMacProtocol supportedVideoPayloads](self->_hardwareSettings, "supportedVideoPayloads");
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

+ (id)sharedInstance
{
  return 0;
}

- (double)preferredAspectRatio
{
  return 1.77777778;
}

- (void)computeEncodingScore
{
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[VCDefaults encodingScore](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "encodingScore");
  if (v3 - 1 > 0x1D)
  {
    *(&self->super.super._encodingType + 1) = -[VCHardwareSettingsMacProtocol canDoHiDefEncoding](self->_hardwareSettings, "canDoHiDefEncoding");
    *(_DWORD *)(&self->super._decodeHighDef + 3) = -[VCHardwareSettingsMacProtocol hardwareScore](self->_hardwareSettings, "hardwareScore");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_DWORD *)(&self->super._decodeHighDef + 3);
        v13 = *(&self->super.super._encodingType + 1);
        v14 = 136316162;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac computeEncodingScore]";
        v18 = 1024;
        v19 = 81;
        v20 = 1024;
        v21 = v12;
        v22 = 1024;
        v23 = v13;
        v7 = " [%s] %s:%d Setting encode score to %d, _encodeHighDef=%d";
        v8 = v11;
        v9 = 40;
        goto LABEL_8;
      }
    }
  }
  else
  {
    *(_DWORD *)(&self->super._decodeHighDef + 3) = v3;
    *(&self->super.super._encodingType + 1) = v3 > 0x18;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(&self->super._decodeHighDef + 3);
        v14 = 136315906;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac computeEncodingScore]";
        v18 = 1024;
        v19 = 77;
        v20 = 1024;
        v21 = v6;
        v7 = " [%s] %s:%d Found default encode score setting, setting encode score to %d";
        v8 = v5;
        v9 = 34;
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
      }
    }
  }
}

- (void)computeDecodingScore
{
  int v3;

  self->_encodeScore = *(_DWORD *)(&self->super._decodeHighDef + 3);
  v3 = *(&self->super.super._encodingType + 1);
  *(&self->super.super._encodingType + 2) = v3;
  if (v3 || *(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x16u)
    self->_encodeScore = 30;
  if (-[VCDefaults canDecodeHD](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "canDecodeHD"))
  {
    -[VCHardwareSettingsMacProtocol canDoHiDefDecoding](self->_hardwareSettings, "canDoHiDefDecoding");
  }
  *(&self->super.super._encodingType + 2) = self->_encodeScore > 0x19;
}

- (BOOL)setupH264WifiRules
{
  VCVideoRule *v3;
  double v4;
  VCVideoRule *v5;
  VCVideoRule *v6;
  double v7;
  VCVideoRule *v8;
  double v9;
  VCVideoRule *v10;
  double v11;
  VCVideoRule *v12;
  double v13;
  VCVideoRule *v14;
  double v15;
  VCVideoRule *v16;
  double v17;
  uint64_t v18;
  void *v19;
  VCVideoRule *v20;
  double v21;
  VCVideoRule *v22;
  double v23;
  uint64_t v24;
  void *v25;
  VCVideoRule *v26;
  double v27;
  uint64_t v28;
  void *v29;
  VCVideoRule *v30;
  double v31;
  uint64_t v32;
  void *v33;
  VCVideoRule *v34;
  double v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  VCVideoRule *v44;
  VCVideoRule *v45;
  VCVideoRule *v46;
  VCVideoRule *v47;
  VCVideoRule *v48;
  VCVideoRule *v49;

  v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  v5 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v3, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, 126, v4);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.1();
    }
    goto LABEL_38;
  }
  v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  v49 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v6, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, 126, v7);
  if (!v49)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.2();
    }
LABEL_38:
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    v45 = 0;
    v19 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
LABEL_84:
    v41 = 0;
    v39 = 0;
    goto LABEL_31;
  }
  v8 = [VCVideoRule alloc];
  LODWORD(v9) = 15.0;
  v48 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v8, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 126, v9);
  if (!v48)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.3();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    v45 = 0;
    v19 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    goto LABEL_84;
  }
  v10 = [VCVideoRule alloc];
  LODWORD(v11) = 30.0;
  v46 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v10, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 126, v11);
  if (!v46)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.4();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    v45 = 0;
    v19 = 0;
    v46 = 0;
    v47 = 0;
    goto LABEL_84;
  }
  v12 = [VCVideoRule alloc];
  LODWORD(v13) = 15.0;
  v47 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v12, "initWithFrameWidth:frameHeight:frameRate:payload:", 640, 480, 126, v13);
  if (!v47)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.5();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    v45 = 0;
    v19 = 0;
    v47 = 0;
    goto LABEL_84;
  }
  v14 = [VCVideoRule alloc];
  LODWORD(v15) = 30.0;
  v45 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v14, "initWithFrameWidth:frameHeight:frameRate:payload:", 640, 480, 126, v15);
  if (!v45)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.6();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    v45 = 0;
    goto LABEL_59;
  }
  v16 = [VCVideoRule alloc];
  LODWORD(v17) = 15.0;
  v18 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v16, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, 126, v17);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.7();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
LABEL_59:
    v19 = 0;
    goto LABEL_84;
  }
  v19 = (void *)v18;
  v20 = [VCVideoRule alloc];
  LODWORD(v21) = 30.0;
  v44 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v20, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, 126, v21);
  if (!v44)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.8();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    v44 = 0;
    goto LABEL_84;
  }
  v22 = [VCVideoRule alloc];
  LODWORD(v23) = 15.0;
  v24 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v22, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, 126, v23);
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.9();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    v25 = 0;
    goto LABEL_84;
  }
  v25 = (void *)v24;
  v26 = [VCVideoRule alloc];
  LODWORD(v27) = 30.0;
  v28 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v26, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, 126, v27);
  if (!v28)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.10();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    goto LABEL_84;
  }
  v29 = (void *)v28;
  v30 = [VCVideoRule alloc];
  LODWORD(v31) = 15.0;
  v32 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v30, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, 126, v31);
  if (!v32)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.11();
    }
    v42 = 0;
    v37 = 0;
    v33 = 0;
    goto LABEL_84;
  }
  v33 = (void *)v32;
  v34 = [VCVideoRule alloc];
  LODWORD(v35) = 30.0;
  v36 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v34, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, 126, v35);
  if (!v36)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.12();
    }
    v42 = 0;
    v37 = 0;
    goto LABEL_84;
  }
  v37 = (void *)v36;
  v38 = objc_opt_new();
  if (!v38)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.13();
    }
    v42 = 0;
    goto LABEL_84;
  }
  v39 = (void *)v38;
  v40 = objc_opt_new();
  if (v40)
  {
    v41 = (void *)v40;
    objc_msgSend(v39, "addObject:", v5);
    if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0xBu)
    {
      objc_msgSend(v39, "addObject:", v49);
      objc_msgSend(v39, "addObject:", v48);
      if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x10u)
      {
        objc_msgSend(v39, "addObject:", v47);
        if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x15u)
        {
          objc_msgSend(v39, "addObject:", v46);
          objc_msgSend(v39, "addObject:", v45);
          if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x1Au)
          {
            objc_msgSend(v39, "addObject:", v25);
            objc_msgSend(v39, "addObject:", v33);
            if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x1Du)
            {
              objc_msgSend(v39, "addObject:", v29);
              objc_msgSend(v39, "addObject:", v37);
            }
          }
        }
      }
    }
    objc_msgSend(v41, "addObject:", v5, v44);
    if (self->_encodeScore >= 0xB)
    {
      objc_msgSend(v41, "addObject:", v49);
      objc_msgSend(v41, "addObject:", v48);
      if (self->_encodeScore >= 0x10)
      {
        objc_msgSend(v41, "addObject:", v47);
        if (self->_encodeScore >= 0x15)
        {
          objc_msgSend(v41, "addObject:", v46);
          objc_msgSend(v41, "addObject:", v45);
          objc_msgSend(v41, "addObject:", v44);
          if (self->_encodeScore >= 0x1A)
          {
            objc_msgSend(v41, "addObject:", v33);
            if (self->_encodeScore >= 0x1D)
              objc_msgSend(v41, "addObject:", v37);
          }
        }
      }
    }
    if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126))
    {
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v39, 1, 126, 1);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v41, 1, 126, 2);
    }
    v42 = 1;
    if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
    {
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v39, 1, 123, 1);
      -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v41, 1, 123, 2);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.14();
    }
    v42 = 0;
    v41 = 0;
  }
LABEL_31:

  return v42;
}

- (BOOL)setupHEVCRules
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  VCVideoRule *v8;
  double v9;
  uint64_t v10;
  void *v11;
  VCVideoRule *v12;
  double v13;
  uint64_t v14;
  void *v15;
  VCVideoRule *v16;
  double v17;
  uint64_t v18;
  VCVideoRule *v19;
  double v20;
  VCVideoRule *v21;
  double v22;
  VCVideoRule *v23;
  double v24;
  VCVideoRule *v25;
  double v26;
  VCVideoRule *v27;
  double v28;
  VCVideoRule *v29;
  double v30;
  VCVideoRule *v31;
  double v32;
  VCVideoRule *v33;
  double v34;
  uint64_t v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  VCVideoRule *v49;
  BOOL v50;
  void *v52;
  _BOOL4 v53;
  void *v54;
  VCVideoRule *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  VCVideoRule *v60;
  void *v61;
  void *v62;
  void *v63;
  VCVideoRule *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  VCVideoRule *v72;
  VCVideoRule *v73;
  VCVideoRule *v74;
  VCVideoRule *v75;
  VCVideoRule *v76;
  VCVideoRule *v77;

  if (-[VCHardwareSettingsMacProtocol supportHEVC](self->_hardwareSettings, "supportHEVC")
    && -[VCHardwareSettingsMacProtocol canDoHEVC](self->_hardwareSettings, "canDoHEVC")
    && -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 100))
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = objc_opt_new();
    v7 = (void *)v6;
    if (v3)
    {
      if (v4)
      {
        if (v5)
        {
          if (v6)
          {
            v8 = [VCVideoRule alloc];
            LODWORD(v9) = 15.0;
            v10 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v8, "initWithFrameWidth:frameHeight:frameRate:payload:", 320, 240, 126, v9);
            if (v10)
            {
              v11 = (void *)v10;
              v12 = [VCVideoRule alloc];
              LODWORD(v13) = 15.0;
              v14 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v12, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 126, v13);
              if (v14)
              {
                v15 = (void *)v14;
                v16 = [VCVideoRule alloc];
                LODWORD(v17) = 30.0;
                v18 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v16, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 368, 126, v17);
                v19 = [VCVideoRule alloc];
                LODWORD(v20) = 15.0;
                v73 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v19, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, 100, v20);
                v69 = (void *)v18;
                if (v73)
                {
                  v21 = [VCVideoRule alloc];
                  LODWORD(v22) = 30.0;
                  v68 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v21, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, 100, v22);
                  if (v68)
                  {
                    v23 = [VCVideoRule alloc];
                    LODWORD(v24) = 30.0;
                    v76 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v23, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 768, 100, v24);
                    if (v76)
                    {
                      v25 = [VCVideoRule alloc];
                      LODWORD(v26) = 30.0;
                      v77 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v25, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 576, 100, v26);
                      if (v77)
                      {
                        v27 = [VCVideoRule alloc];
                        LODWORD(v28) = 30.0;
                        v75 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v27, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, 100, v28);
                        if (v75)
                        {
                          v29 = [VCVideoRule alloc];
                          LODWORD(v30) = 1114636288;
                          v74 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v29, "initWithFrameWidth:frameHeight:frameRate:payload:", 1280, 720, 100, v30);
                          if (v74)
                          {
                            objc_msgSend(v5, "addObject:", v11);
                            objc_msgSend(v5, "addObject:", v15);
                            objc_msgSend(v5, "addObject:", v18);
                            objc_msgSend(v5, "addObject:", v76);
                            objc_msgSend(v5, "addObject:", v77);
                            if (-[VCHardwareSettingsMacProtocol vcpSupportsHEVCEncoder](self->_hardwareSettings, "vcpSupportsHEVCEncoder"))-[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v5, 2, 100, 1);
                            v31 = [VCVideoRule alloc];
                            LODWORD(v32) = 30.0;
                            v72 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v31, "initWithFrameWidth:frameHeight:frameRate:payload:", 480, 272, 100, v32);
                            if (v72)
                            {
                              v70 = v4;
                              v33 = [VCVideoRule alloc];
                              LODWORD(v34) = 30.0;
                              v35 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v33, "initWithFrameWidth:frameHeight:frameRate:payload:", 1024, 576, 100, v34);
                              if (v35)
                              {
                                v37 = (void *)v35;
                                v71 = v5;
                                LODWORD(v36) = 1.0;
                                -[VCVideoRule setFPref:](v72, "setFPref:", v36);
                                LODWORD(v38) = 1.0;
                                objc_msgSend(v37, "setFPref:", v38);
                                v39 = v11;
                                objc_msgSend(v7, "addObject:", v11);
                                v67 = v15;
                                objc_msgSend(v7, "addObject:", v15);
                                objc_msgSend(v7, "addObject:", v18);
                                objc_msgSend(v7, "addObject:", v73);
                                objc_msgSend(v7, "addObject:", v72);
                                v66 = v37;
                                objc_msgSend(v7, "addObject:", v37);
                                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v7, 2, 100, 2);
                                objc_msgSend(v3, "addObject:", v77);
                                objc_msgSend(v3, "addObject:", v76);
                                objc_msgSend(v3, "addObject:", v75);
                                v40 = v3;
                                objc_msgSend(v3, "addObject:", v74);
                                if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
                                {
                                  v41 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
                                  v4 = v70;
                                  v42 = v71;
                                  v43 = v39;
                                  if (v41 == 100)
                                  {
                                    v64 = [VCVideoRule alloc];
                                    v65 = v7;
                                    v44 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
                                    v45 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
                                    *(float *)&v46 = (float)-[VCDefaults forceEncodeFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeFramerate");
                                    v41 = 100;
                                    v47 = v44;
                                    v4 = v70;
                                    v42 = v71;
                                    v48 = v45;
                                    v40 = v3;
                                    v49 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v64, "initWithFrameWidth:frameHeight:frameRate:payload:", v47, v48, 100, v46);
                                    objc_msgSend(v3, "addObject:", v49);
                                    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v3, 1, 100, 1);

                                    v7 = v65;
                                  }
                                }
                                else
                                {
                                  v41 = 128;
                                  v4 = v70;
                                  v42 = v71;
                                  v43 = v39;
                                }
                                if (-[VCHardwareSettingsMacProtocol vcpSupportsHEVCEncoder](self->_hardwareSettings, "vcpSupportsHEVCEncoder"))-[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v40, 1, 100, 1);
                                v52 = v40;
                                objc_msgSend(v4, "addObject:", v77);
                                objc_msgSend(v4, "addObject:", v75);
                                objc_msgSend(v4, "addObject:", v74);
                                v53 = -[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI");
                                v5 = v42;
                                v11 = v43;
                                if (v41 == 100 && v53)
                                {
                                  v54 = v7;
                                  v55 = [VCVideoRule alloc];
                                  v56 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
                                  v57 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
                                  *(float *)&v58 = (float)-[VCDefaults forceEncodeFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeFramerate");
                                  v59 = v57;
                                  v11 = v43;
                                  v60 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v55, "initWithFrameWidth:frameHeight:frameRate:payload:", v56, v59, 100, v58);
                                  objc_msgSend(v4, "addObject:", v60);

                                  v7 = v54;
                                  v5 = v71;
                                }
                                v50 = 1;
                                -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", v4, 1, 100, 2);
                                v61 = v67;
                                v62 = (void *)v68;
                                v63 = v66;
                                goto LABEL_32;
                              }
                              v52 = v3;
                              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                              {
                                VRTraceErrorLogLevelToCSTR();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                                  -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.14();
                              }
                              v63 = 0;
                              v50 = 0;
                              goto LABEL_83;
                            }
                            v52 = v3;
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              VRTraceErrorLogLevelToCSTR();
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                                -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.13();
                            }
                            v63 = 0;
                            v72 = 0;
                          }
                          else
                          {
                            v52 = v3;
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              VRTraceErrorLogLevelToCSTR();
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                                -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.12();
                            }
                            v63 = 0;
                            v72 = 0;
                            v74 = 0;
                          }
                        }
                        else
                        {
                          v52 = v3;
                          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                          {
                            VRTraceErrorLogLevelToCSTR();
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                              -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.11();
                          }
                          v63 = 0;
                          v72 = 0;
                          v74 = 0;
                          v75 = 0;
                        }
                      }
                      else
                      {
                        v52 = v3;
                        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                        {
                          VRTraceErrorLogLevelToCSTR();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                            -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.10();
                        }
                        v63 = 0;
                        v72 = 0;
                        v74 = 0;
                        v75 = 0;
                        v77 = 0;
                      }
                    }
                    else
                    {
                      v52 = v3;
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.9();
                      }
                      v63 = 0;
                      v72 = 0;
                      v74 = 0;
                      v75 = 0;
                      v77 = 0;
                      v76 = 0;
                    }
                    v50 = 0;
LABEL_83:
                    v61 = v15;
                    v62 = (void *)v68;
                    goto LABEL_32;
                  }
                  v61 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.8();
                  }
                  v63 = 0;
                  v72 = 0;
                  v74 = 0;
                  v75 = 0;
                  v77 = 0;
                  v76 = 0;
                  v62 = 0;
                }
                else
                {
                  v61 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.7();
                  }
                  v63 = 0;
                  v72 = 0;
                  v74 = 0;
                  v75 = 0;
                  v77 = 0;
                  v76 = 0;
                  v62 = 0;
                  v73 = 0;
                }
              }
              else
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.6();
                }
                v63 = 0;
                v72 = 0;
                v74 = 0;
                v75 = 0;
                v77 = 0;
                v76 = 0;
                v62 = 0;
                v73 = 0;
                v69 = 0;
                v61 = 0;
              }
LABEL_49:
              v50 = 0;
              v52 = v3;
LABEL_32:

              return v50;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.5();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.1();
    }
    v63 = 0;
    v72 = 0;
    v74 = 0;
    v75 = 0;
    v77 = 0;
    v76 = 0;
    v62 = 0;
    v73 = 0;
    v69 = 0;
    v61 = 0;
    v11 = 0;
    goto LABEL_49;
  }
  return 1;
}

- (BOOL)setupH264Rules
{
  _BOOL4 v3;

  if (-[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 126)
    || -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", 123))
  {
    v3 = -[VCVideoRuleCollectionsCameraMac setupH264WifiRules](self, "setupH264WifiRules");
    if (v3)
      LOBYTE(v3) = -[VCVideoRuleCollectionsCamera setupH264CellularRules](self, "setupH264CellularRules");
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)setUp1080pRules:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  VCVideoRule *v9;
  double v10;
  uint64_t v11;
  void *v12;
  VCVideoRule *v13;
  double v14;
  VCVideoRule *v15;
  VCVideoRule *v16;
  double v17;
  uint64_t v18;
  void *v19;
  VCVideoRule *v20;
  double v21;
  VCVideoRule *v22;
  VCVideoRule *v23;
  double v24;
  VCVideoRule *v25;
  uint64_t v26;
  BOOL v27;

  v3 = *(_QWORD *)&a3;
  if ((a3 != 100
     || -[VCHardwareSettingsMacProtocol supportHEVC](self->_hardwareSettings, "supportHEVC")
     && -[VCHardwareSettingsMacProtocol canDoHEVC](self->_hardwareSettings, "canDoHEVC"))
    && -[VCVideoRuleCollections isPayloadSupported:](self, "isPayloadSupported:", v3))
  {
    v5 = (void *)objc_opt_new();
    v6 = objc_opt_new();
    v7 = (void *)v6;
    if (v5)
    {
      if (v6)
      {
        if ((_DWORD)v3 == 123)
          v8 = 126;
        else
          v8 = v3;
        v9 = [VCVideoRule alloc];
        LODWORD(v10) = 30.0;
        v11 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v9, "initWithFrameWidth:frameHeight:frameRate:payload:", 1920, 1080, v8, v10);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [VCVideoRule alloc];
          LODWORD(v14) = 1114636288;
          v15 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v13, "initWithFrameWidth:frameHeight:frameRate:payload:", 1920, 1080, v8, v14);
          v16 = [VCVideoRule alloc];
          LODWORD(v17) = 30.0;
          v18 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v16, "initWithFrameWidth:frameHeight:frameRate:payload:", 1664, 1248, v8, v17);
          if (v18)
          {
            v19 = (void *)v18;
            v20 = [VCVideoRule alloc];
            LODWORD(v21) = 1114636288;
            v22 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v20, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v8, v21);
            v23 = [VCVideoRule alloc];
            LODWORD(v24) = 30.0;
            v25 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v23, "initWithFrameWidth:frameHeight:frameRate:payload:", 1088, 1088, v8, v24);
            if (!-[VCHardwareSettingsMacProtocol supports1080pEncoding](self->_hardwareSettings, "supports1080pEncoding"))goto LABEL_17;
            objc_msgSend(v5, "addObject:", v12);
            objc_msgSend(v5, "addObject:", v19);
            objc_msgSend(v5, "addObject:", v22);
            objc_msgSend(v5, "addObject:", v25);
            v26 = v3;
            if ((_DWORD)v3 == 100)
            {
              if (!-[VCHardwareSettingsMacProtocol vcpSupportsHEVCEncoder](self->_hardwareSettings, "vcpSupportsHEVCEncoder"))goto LABEL_17;
              v26 = 100;
            }
            -[VCVideoRuleCollections appendVideoRules:transportType:payload:encodingType:](self, "appendVideoRules:transportType:payload:encodingType:", v5, 1, v26, 1);
LABEL_17:
            if (-[VCHardwareSettingsMacProtocol supports1080pDecoding](self->_hardwareSettings, "supports1080pDecoding"))
            {
              objc_msgSend(v7, "addObject:", v12);
              objc_msgSend(v7, "addObject:", v15);
              if (+[VCHardwareSettings supportsDecodingSquareCameraVideo](VCHardwareSettings, "supportsDecodingSquareCameraVideo"))
              {
                objc_msgSend(v7, "addObject:", v22);
                objc_msgSend(v7, "addObject:", v25);
              }
              v27 = 1;
              -[VCVideoRuleCollections appendVideoRules:transportType:payload:encodingType:](self, "appendVideoRules:transportType:payload:encodingType:", v7, 1, v3, 2);
            }
            else
            {
              v27 = 1;
            }
            goto LABEL_23;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCVideoRuleCollectionsCameraMac setUp1080pRules:].cold.4();
          }
          v25 = 0;
          v22 = 0;
          v19 = 0;
LABEL_39:
          v27 = 0;
LABEL_23:

          return v27;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoRuleCollectionsCameraMac setUp1080pRules:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollectionsCameraMac setUp1080pRules:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollectionsCameraMac setUp1080pRules:].cold.1();
    }
    v25 = 0;
    v22 = 0;
    v19 = 0;
    v15 = 0;
    v12 = 0;
    goto LABEL_39;
  }
  return 1;
}

- (BOOL)setupRules
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[VCVideoRuleCollectionsCameraMac setupH264Rules](self, "setupH264Rules"))
    v3 = -[VCVideoRuleCollectionsCameraMac setupHEVCRules](self, "setupHEVCRules");
  else
    v3 = 0;
  if (-[VCDefaults forceDisableVideoRuleWiFi1080](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoRuleWiFi1080"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCVideoRuleCollectionsCameraMac setupRules]";
        v14 = 1024;
        v15 = 410;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleWiFi1080 is set", (uint8_t *)&v10, 0x1Cu);
      }
    }
    -[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:](self, "limitVideoRulesToMaxWidth:maxHeight:transportType:", 1280, 720, 1);
  }
  if (-[VCDefaults forceDisableVideoRuleCell720](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoRuleCell720"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCVideoRuleCollectionsCameraMac setupRules]";
        v14 = 1024;
        v15 = 414;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleCell720 is set", (uint8_t *)&v10, 0x1Cu);
      }
    }
    -[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:](self, "limitVideoRulesToMaxWidth:maxHeight:transportType:", 480, 272, 2);
  }
  if (v3)
  {
    v8 = -[VCVideoRuleCollectionsCameraMac setUp1080pRules:](self, "setUp1080pRules:", 126);
    if (v8)
    {
      v8 = -[VCVideoRuleCollectionsCameraMac setUp1080pRules:](self, "setUp1080pRules:", 123);
      if (v8)
        LOBYTE(v8) = -[VCVideoRuleCollectionsCameraMac setUp1080pRules:](self, "setUp1080pRules:", 100);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)useSoftFramerateSwitching
{
  return -[VCHardwareSettingsMacProtocol useSoftFramerateSwitching](self->_hardwareSettings, "useSoftFramerateSwitching");
}

- (void)_addWVGAEncodingRules
{
  VCVideoRule *v3;
  double v4;
  VCVideoRule *v5;
  VCVideoRule *v6;
  double v7;
  void *v8;
  VCVideoRule *v9;

  v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  v5 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v3, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, 126, v4);
  v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  v9 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v6, "initWithFrameWidth:frameHeight:frameRate:payload:", 848, 480, 126, v7);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addObject:", v5);
  objc_msgSend(v8, "addObject:", v9);
  -[VCVideoRuleCollections appendVideoRules:transportType:payload:encodingType:](self, "appendVideoRules:transportType:payload:encodingType:", v8, 1, 126, 1);
  -[VCVideoRuleCollections appendVideoRules:transportType:payload:encodingType:](self, "appendVideoRules:transportType:payload:encodingType:", v8, 1, 123, 1);

}

- (void)_removeRulesGreaterThanVGA
{
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1280, 720, 1, 1);
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1024, 768, 1, 1);
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1920, 1080, 1, 1);
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1664, 1248, 1, 1);
}

- (void)_removeRulesGreaterThan720p
{
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1920, 1080, 1, 1);
  -[VCVideoRuleCollections removeVideoRulesWithWidth:height:transportType:encodingType:](self, "removeVideoRulesWithWidth:height:transportType:encodingType:", 1664, 1248, 1, 1);
}

- (void)_resetJ92EncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a4 || a5 || a3)
  {
    if (a3 && !a5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315650;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VCVideoRuleCollectionsCameraMac _resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:]";
          v14 = 1024;
          v15 = 465;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d 720p camera. removing rules greater than 720p", (uint8_t *)&v10, 0x1Cu);
        }
      }
      -[VCVideoRuleCollectionsCameraMac _removeRulesGreaterThan720p](self, "_removeRulesGreaterThan720p");
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCVideoRuleCollectionsCameraMac _resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:]";
        v14 = 1024;
        v15 = 461;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d built in J92 camera. removing rules greater than VGA. adding WVGA encoding rules", (uint8_t *)&v10, 0x1Cu);
      }
    }
    -[VCVideoRuleCollectionsCameraMac _removeRulesGreaterThanVGA](self, "_removeRulesGreaterThanVGA");
    -[VCVideoRuleCollectionsCameraMac _addWVGAEncodingRules](self, "_addWVGAEncodingRules");
  }
}

- (void)resetEncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136316418;
      v18 = v9;
      v19 = 2080;
      v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
      v21 = 1024;
      v22 = 472;
      v23 = 1024;
      v24 = v7;
      v25 = 1024;
      v26 = v6;
      v27 = 1024;
      v28 = v5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isHD = %d, isWVGA = %d, is1080 = %d", (uint8_t *)&v17, 0x2Eu);
    }
  }
  if (!-[VCVideoRuleCollectionsCameraMac setupRules](self, "setupRules")
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:].cold.1();
  }
  if (-[VCHardwareSettingsMacProtocol isMacBookWVGA](self->_hardwareSettings, "isMacBookWVGA"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v11;
        v19 = 2080;
        v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        v21 = 1024;
        v22 = 478;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resetting encoding rules for J92", (uint8_t *)&v17, 0x1Cu);
      }
    }
    -[VCVideoRuleCollectionsCameraMac _resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:](self, "_resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:", v7, v6, v5);
  }
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        v21 = 1024;
        v22 = 482;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d camera does not support 720p. removing rules greater than VGA", (uint8_t *)&v17, 0x1Cu);
      }
    }
    -[VCVideoRuleCollectionsCameraMac _removeRulesGreaterThanVGA](self, "_removeRulesGreaterThanVGA");
  }
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v15;
        v19 = 2080;
        v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        v21 = 1024;
        v22 = 487;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d camera does not support 1080p. removing rules greater than 720p", (uint8_t *)&v17, 0x1Cu);
      }
    }
    -[VCVideoRuleCollectionsCameraMac _removeRulesGreaterThan720p](self, "_removeRulesGreaterThan720p");
  }
  objc_sync_exit(self);
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

- (void)setupH264WifiRules
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d H264 Wifi rules: failed to allocate video rules array for decoding", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate HEVC XGA 1024*576 30fps rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUp1080pRules:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoRulesWiFiEncoding for HEVC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUp1080pRules:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoRulesWiFiDecoding for HEVC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUp1080pRules:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d H264 Wi-Fi rules: failed to allocate 1920x1080 30 FPS rule", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUp1080pRules:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d H264 Wi-Fi rules: failed to allocate 1664x1248 30 FPS rule", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)resetEncodingRulesForCameraIsHD:isWVGA:is1080:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to Setup Rules", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
