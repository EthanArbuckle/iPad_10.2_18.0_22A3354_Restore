@implementation VCAudioTierPickerPlistEntry

- (VCAudioTierPickerPlistEntry)initWithDictionary:(id)a3
{
  VCAudioTierPickerPlistEntry *v4;
  VCAudioTierPickerPlistEntry *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioTierPickerPlistEntry;
  v4 = -[VCAudioTierPickerPlistEntry init](&v7, sel_init);
  v5 = v4;
  if (v4 && !-[VCAudioTierPickerPlistEntry configure:](v4, "configure:", a3))
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioTierPickerPlistEntry;
  -[VCAudioTierPickerPlistEntry dealloc](&v3, sel_dealloc);
}

- (BOOL)configure:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("payload"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCAudioTierPickerPlistEntry configure:].cold.1();
    }
LABEL_18:
    LOBYTE(v9) = 0;
    return v9;
  }
  self->_payload = objc_msgSend(v5, "integerValue");
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("codecBitrate"));
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCAudioTierPickerPlistEntry configure:].cold.2();
    }
    goto LABEL_18;
  }
  self->_codecBitrate = objc_msgSend(v6, "unsignedIntegerValue");
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("packetsPerBundle"));
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCAudioTierPickerPlistEntry configure:].cold.3();
    }
    goto LABEL_18;
  }
  self->_packetsPerBundle = objc_msgSend(v7, "unsignedIntegerValue");
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("redNumPayloads"));
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCAudioTierPickerPlistEntry configure:].cold.4();
    }
    goto LABEL_18;
  }
  self->_redNumPayloads = objc_msgSend(v8, "unsignedIntegerValue");
  self->_featureFlag = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("featureFlag"));
  LOBYTE(v9) = 1;
  return v9;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

- (unint64_t)codecBitrate
{
  return self->_codecBitrate;
}

- (void)setCodecBitrate:(unint64_t)a3
{
  self->_codecBitrate = a3;
}

- (unint64_t)packetsPerBundle
{
  return self->_packetsPerBundle;
}

- (void)setPacketsPerBundle:(unint64_t)a3
{
  self->_packetsPerBundle = a3;
}

- (unint64_t)redNumPayloads
{
  return self->_redNumPayloads;
}

- (void)setRedNumPayloads:(unint64_t)a3
{
  self->_redNumPayloads = a3;
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)configure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Missing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
