@implementation VCMediaControlInfoIPCamera

- (VCMediaControlInfoIPCamera)init
{
  VCMediaControlInfoIPCamera *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoIPCamera;
  result = -[VCMediaControlInfo init](&v3, sel_init);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoIPCamera_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoIPCamera_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoIPCamera)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  VCMediaControlInfoIPCamera *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoIPCamera;
  result = -[VCMediaControlInfo initWithBuffer:length:optionalControlInfo:version:](&v7, sel_initWithBuffer_length_optionalControlInfo_version_, a3, a4, a5, a6);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoIPCamera_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoIPCamera_SerializeBuffer;
  }
  return result;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  int result;

  if (!a4)
    return 0;
  result = -2144403455;
  if (a3)
  {
    if (a4 > 8)
    {
      return -2144403442;
    }
    else
    {
      self->super._bitmap |= 1u;
      memcpy(self->_controlInfoCVO, a3, a4);
      return 0;
    }
  }
  return result;
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
  int v5;

  if (a5 >= 0x16)
  {
    v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoIPCamera setInfo:size:type:].cold.1();
    }
  }
  else if (a5 == 9)
  {
    if (a4 == 8)
    {
      v5 = 0;
      self->super._bitmap |= 1u;
      *(_QWORD *)self->_controlInfoCVO = *(_QWORD *)a3;
    }
    else
    {
      return -2144403413;
    }
  }
  else
  {
    v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoIPCamera setInfo:size:type:].cold.2();
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  __int16 v3;

  if (a3 == 9)
    return self->super._bitmap & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result;

  result = -2144403455;
  if (a3 && a6 == 9)
  {
    if ((self->super._bitmap & 1) != 0)
    {
      if (a4 >= 8)
      {
        *(_QWORD *)a3 = *(_QWORD *)self->_controlInfoCVO;
        result = 0;
        if (a5)
          *a5 = 8;
      }
      else
      {
        return -2144403442;
      }
    }
    else
    {
      return -2144403434;
    }
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoIPCamera_SerializeBuffer((uint64_t)self, a3, a4, a5);
}

- (void)setInfo:size:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoIPCamera setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoIPCamera setInfo:size:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setInfo:size:type:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoIPCamera setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoIPCamera setInfo:size:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
