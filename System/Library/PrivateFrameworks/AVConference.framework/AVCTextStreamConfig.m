@implementation AVCTextStreamConfig

- (BOOL)isValid
{
  return !-[AVCTextStreamConfig codecType](self, "codecType") && -[AVCTextStreamConfig isRedValid](self, "isRedValid");
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  int v3;
  const __CFString *v5;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 200;
  v3 = a3;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[AVCTextStreamConfig codecTypeWithClientCodecType:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = 136316418;
        v10 = v7;
        v11 = 2080;
        v12 = "+[AVCTextStreamConfig codecTypeWithClientCodecType:]";
        v13 = 1024;
        v14 = 1364;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = a1;
        v19 = 1024;
        v20 = v3;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected codec type: %d", (uint8_t *)&v9, 0x36u);
      }
    }
  }
  return 0;
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return 0;
}

- (BOOL)isRedValid
{
  if (!-[AVCTextStreamConfig numRedundantPayloads](self, "numRedundantPayloads"))
    return 1;
  if (-[AVCTextStreamConfig txRedPayloadType](self, "txRedPayloadType") > 0x7F
    || -[AVCTextStreamConfig txRedPayloadType](self, "txRedPayloadType") < 0x60
    || -[AVCTextStreamConfig rxRedPayloadType](self, "rxRedPayloadType") > 0x7F
    || -[AVCTextStreamConfig rxRedPayloadType](self, "rxRedPayloadType") < 0x60)
  {
    return 0;
  }
  return self->_numRedundantPayloads < 4;
}

- (void)setUpWithDictionary:(id)a3
{
  float v5;

  self->_codecType = +[AVCTextStreamConfig clientCodecTypeWithCodecType:](AVCTextStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextCodecType")), "integerValue"));
  self->_numRedundantPayloads = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextNumRedundantPayloads")), "integerValue");
  self->_txRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextTxRedPayloadType")), "integerValue");
  self->_rxRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextRxRedPayloadType")), "integerValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextTxIntervalMin")), "floatValue");
  self->_txIntervalMin = v5;
}

- (id)dictionary
{
  double v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("vcMediaStreamTextCodecType");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCTextStreamConfig codecTypeWithClientCodecType:](AVCTextStreamConfig, "codecTypeWithClientCodecType:", self->_codecType));
  v5[1] = CFSTR("vcMediaStreamTextNumRedundantPayloads");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numRedundantPayloads);
  v5[2] = CFSTR("vcMediaStreamTextTxRedPayloadType");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_txRedPayloadType);
  v5[3] = CFSTR("vcMediaStreamTextRxRedPayloadType");
  v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rxRedPayloadType);
  v5[4] = CFSTR("vcMediaStreamTextTxIntervalMin");
  *(float *)&v3 = self->_txIntervalMin;
  v6[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (unint64_t)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unint64_t)a3
{
  self->_numRedundantPayloads = a3;
}

- (unint64_t)txRedPayloadType
{
  return self->_txRedPayloadType;
}

- (void)setTxRedPayloadType:(unint64_t)a3
{
  self->_txRedPayloadType = a3;
}

- (unint64_t)rxRedPayloadType
{
  return self->_rxRedPayloadType;
}

- (void)setRxRedPayloadType:(unint64_t)a3
{
  self->_rxRedPayloadType = a3;
}

- (float)txIntervalMin
{
  return self->_txIntervalMin;
}

- (void)setTxIntervalMin:(float)a3
{
  self->_txIntervalMin = a3;
}

+ (void)codecTypeWithClientCodecType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected codec type: %d", v2, v3, v4, 1364);
  OUTLINED_FUNCTION_3();
}

@end
