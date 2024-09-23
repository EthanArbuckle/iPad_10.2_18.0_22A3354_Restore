@implementation VCModeSpecificHardwareSettings

+ (unsigned)encoderUsageTypeWithHardwareSettingsMode:(unsigned __int8)a3
{
  if ((a3 - 1) > 6)
    return 0;
  else
    return dword_1D9110C70[(char)(a3 - 1)];
}

- (VCModeSpecificHardwareSettings)initWithHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3;
  VCModeSpecificHardwareSettings *v4;
  objc_super v6;
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCModeSpecificHardwareSettings;
  v4 = -[VCModeSpecificHardwareSettings init](&v6, sel_init);
  if (v4)
  {
    v4->_vcpEncoderUsageMode = +[VCModeSpecificHardwareSettings encoderUsageTypeWithHardwareSettingsMode:](VCModeSpecificHardwareSettings, "encoderUsageTypeWithHardwareSettingsMode:", v3);
    v4->_hardwareSettingsMode = v3;
    -[VCModeSpecificHardwareSettings initFeatureListString](v4, "initFeatureListString");
    -[VCModeSpecificHardwareSettings vcpSupportsHEVCDecoder](v4, "vcpSupportsHEVCDecoder");
    -[VCModeSpecificHardwareSettings vcpSupportsHEVCEncoder](v4, "vcpSupportsHEVCEncoder");
    v4->_vcpInitializedForHEVC = 1;
    v4->_tilesPerVideoFrame = -[VCModeSpecificHardwareSettings numTilesPerVideoFrameForHDRMode:](v4, "numTilesPerVideoFrameForHDRMode:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCModeSpecificHardwareSettings;
  -[VCModeSpecificHardwareSettings dealloc](&v3, sel_dealloc);
}

- (unsigned)numTilesPerVideoFrameForHDRMode:(unint64_t)a3
{
  unint64_t hardwareSettingsMode;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  hardwareSettingsMode = (char)self->_hardwareSettingsMode;
  if (hardwareSettingsMode > 8)
    v5 = -1431655766;
  else
    v5 = dword_1D9110C8C[hardwareSettingsMode];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_hardwareSettingsMode;
      v10 = 136316162;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCModeSpecificHardwareSettings numTilesPerVideoFrameForHDRMode:]";
      v14 = 1024;
      v15 = 135;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: tilesPerFrame=%d for hardwareSettingsMode=%hhu", (uint8_t *)&v10, 0x28u);
    }
  }
  return v5;
}

- (BOOL)vcpSupportsHEVCDecoder
{
  int supportVCPDecoderHEVC;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self->_vcpInitializedForHEVC)
  {
    supportVCPDecoderHEVC = self->_supportVCPDecoderHEVC;
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCDecoder__block_invoke;
    v6[3] = &unk_1E9E58BF0;
    v6[4] = self;
    v6[5] = &v7;
    -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:](self, "vcpCodecGetPropertiesForID:block:", 0, v6);
    supportVCPDecoderHEVC = *((unsigned __int8 *)v8 + 24);
    self->_supportVCPDecoderHEVC = supportVCPDecoderHEVC;
  }
  v4 = supportVCPDecoderHEVC != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCDecoder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "BOOLValue");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (-[VCDefaults extraPayloads](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "extraPayloads") & 2) != 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCModeSpecificHardwareSettings vcpSupportsHEVCDecoder]_block_invoke";
      v12 = 1024;
      v13 = 153;
      v14 = 1024;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: VCP support HEVC decoder= %d for mode=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (BOOL)vcpSupportsHEVCEncoder
{
  int supportVCPEncoderHEVC;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self->_vcpInitializedForHEVC)
  {
    supportVCPEncoderHEVC = self->_supportVCPEncoderHEVC;
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCEncoder__block_invoke;
    v6[3] = &unk_1E9E58BF0;
    v6[4] = self;
    v6[5] = &v7;
    -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:](self, "vcpCodecGetPropertiesForID:block:", 2, v6);
    supportVCPEncoderHEVC = *((unsigned __int8 *)v8 + 24);
    self->_supportVCPEncoderHEVC = supportVCPEncoderHEVC;
  }
  v4 = supportVCPEncoderHEVC != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__VCModeSpecificHardwareSettings_vcpSupportsHEVCEncoder__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "BOOLValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCModeSpecificHardwareSettings vcpSupportsHEVCEncoder]_block_invoke";
      v12 = 1024;
      v13 = 170;
      v14 = 1024;
      v15 = v6;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettings: VCP support HEVC encoder=%d for mode=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (void)initFeatureListString
{
  uint64_t v3;
  NSObject *v4;
  unsigned int vcpEncoderUsageMode;
  const char *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_hardwareSettingsMode == 5)
  {
    self->_featureListStringH264 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("FLS;"));
    self->_featureListStringHEVC = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("FLS;"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        vcpEncoderUsageMode = self->_vcpEncoderUsageMode;
        v6 = -[NSString UTF8String](self->_featureListStringHEVC, "UTF8String");
        v7 = -[NSString UTF8String](self->_featureListStringH264, "UTF8String");
        *(_DWORD *)buf = 136316418;
        v12 = v3;
        v13 = 2080;
        v14 = "-[VCModeSpecificHardwareSettings initFeatureListString]";
        v15 = 1024;
        v16 = 184;
        v17 = 1024;
        v18 = vcpEncoderUsageMode;
        v19 = 2080;
        v20 = v6;
        v21 = 2080;
        v22 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] mode=%2d: HEVC=%s ; H264=%s",
          buf,
          0x36u);
      }
    }
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke;
    v10[3] = &unk_1E9E58C18;
    v10[4] = self;
    -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:](self, "vcpCodecGetPropertiesForID:block:", 1, v10);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke_11;
    v9[3] = &unk_1E9E58C18;
    v9[4] = self;
    -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:](self, "vcpCodecGetPropertiesForID:block:", 4, v9);
  }
}

void __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) == 6)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = CFSTR("FLS;SW:1;");
    v4 = CFSTR("FLS;VRAE:0;SW:1;");
    v5 = 16;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(a3, "copy");
    v4 = (__CFString *)objc_msgSend(a2, "copy");
    v5 = 24;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + v5) = v4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_DWORD *)(v9 + 8);
      v11 = objc_msgSend(*(id *)(v9 + 16), "UTF8String");
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "UTF8String");
      v13 = 136316418;
      v14 = v7;
      v15 = 2080;
      v16 = "-[VCModeSpecificHardwareSettings initFeatureListString]_block_invoke";
      v17 = 1024;
      v18 = 196;
      v19 = 1024;
      v20 = v10;
      v21 = 2080;
      v22 = v11;
      v23 = 2080;
      v24 = v12;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] mode=%2d: HEVC=%s ; H264=%s",
        (uint8_t *)&v13,
        0x36u);
    }
  }
}

void __55__VCModeSpecificHardwareSettings_initFeatureListString__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(a2, "copy");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_DWORD *)(v7 + 8);
      v9 = objc_msgSend(*(id *)(v7 + 32), "UTF8String");
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "UTF8String");
      v11 = 136316418;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCModeSpecificHardwareSettings initFeatureListString]_block_invoke";
      v15 = 1024;
      v16 = 202;
      v17 = 1024;
      v18 = v8;
      v19 = 2080;
      v20 = v9;
      v21 = 2080;
      v22 = v10;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] FixedPosition mode=%2d: HEVC=%s ; H264=%s",
        (uint8_t *)&v11,
        0x36u);
    }
  }
}

- (void)vcpCodecGetPropertiesForID:(int)a3 block:(id)a4
{
  if (VCPCodecCopyProperties())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCModeSpecificHardwareSettings vcpCodecGetPropertiesForID:block:].cold.1();
  }

}

- (BOOL)supportVCPDecoderHEVC
{
  return self->_supportVCPDecoderHEVC;
}

- (BOOL)supportVCPEncoderHEVC
{
  return self->_supportVCPEncoderHEVC;
}

- (BOOL)vcpInitializedForHEVC
{
  return self->_vcpInitializedForHEVC;
}

- (unsigned)tilesPerVideoFrame
{
  return self->_tilesPerVideoFrame;
}

- (NSString)featureListStringHEVC
{
  return self->_featureListStringHEVC;
}

- (NSString)featureListStringH264
{
  return self->_featureListStringH264;
}

- (NSString)featureListStringFixedPositionHEVC
{
  return self->_featureListStringFixedPositionHEVC;
}

- (NSString)featureListStringFixedPositionH264
{
  return self->_featureListStringFixedPositionH264;
}

- (void)vcpCodecGetPropertiesForID:block:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d dictAllCodecs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)vcpCodecGetPropertiesForID:block:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory to get VCP Codec properties", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
