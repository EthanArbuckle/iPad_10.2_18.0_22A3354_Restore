@implementation VCMediaControlInfoMultiwayAudio

- (VCMediaControlInfoMultiwayAudio)init
{
  VCMediaControlInfoMultiwayAudio *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoMultiwayAudio;
  result = -[VCMediaControlInfo init](&v3, sel_init);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoMultiwayAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoMultiwayAudio_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoMultiwayAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  VCMediaControlInfoMultiwayAudio *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoMultiwayAudio;
  result = -[VCMediaControlInfo initWithBuffer:length:optionalControlInfo:version:](&v7, sel_initWithBuffer_length_optionalControlInfo_version_, a3, a4, a5, a6);
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoMultiwayAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoMultiwayAudio_SerializeBuffer;
  }
  return result;
}

- (id)description
{
  void *v3;
  unsigned __int16 bitmap;

  v3 = (void *)objc_opt_new();
  bitmap = self->super._bitmap;
  if ((bitmap & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROC %08X size %ld, "), self->_controlInfoROC, 4));
    bitmap = self->super._bitmap;
  }
  if ((bitmap & 2) != 0)
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKI %08X size %ld, "), self->_controlInfoMKI, 4));
  return v3;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  int v6;

  if (!a4)
    return 0;
  v6 = -2144403413;
  if (!a3)
    return -2144403455;
  if (a4 > 7)
  {
    -[VCMediaControlInfoMultiwayAudio setInfo:size:type:](self, "setInfo:size:type:", a3, 4, 19);
    -[VCMediaControlInfoMultiwayAudio setInfo:size:type:](self, "setInfo:size:type:", a3 + 4, 4, 20);
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaControlInfoMultiwayAudio configureWithBuffer:length:optionalControlInfo:].cold.1();
  }
  return v6;
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
  int v5;
  int v7;
  uint64_t v8;

  if (a5 >= 0x16)
  {
    v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoMultiwayAudio setInfo:size:type:].cold.1();
    }
  }
  else
  {
    if (a5 >= 0x13 && a5 != 21)
    {
      if (a5 == 20)
      {
        if (a4 == 4)
        {
          v5 = 0;
          self->super._bitmap |= 0x14u;
          v7 = *(_DWORD *)a3;
          v8 = 68;
          goto LABEL_13;
        }
      }
      else if (a4 == 4)
      {
        v5 = 0;
        self->super._bitmap |= 1u;
        v7 = *(_DWORD *)a3;
        v8 = 64;
LABEL_13:
        *(_DWORD *)((char *)&self->super.super.isa + v8) = v7;
        return v5;
      }
      return -2144403413;
    }
    v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaControlInfoMultiwayAudio setInfo:size:type:].cold.2();
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  __int16 v3;

  if (a3 == 19)
  {
    v3 = 1;
    return (unsigned __int16)(self->super._bitmap & v3) != 0;
  }
  if (a3 == 20)
  {
    v3 = 2;
    return (unsigned __int16)(self->super._bitmap & v3) != 0;
  }
  return 0;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result;
  uint64_t v8;

  result = -2144403455;
  if (a3)
  {
    if (a6 == 20)
    {
      if ((self->super._bitmap & 2) != 0)
      {
        if (a4 >= 4)
        {
          v8 = 68;
LABEL_12:
          *(_DWORD *)a3 = *(_DWORD *)((char *)&self->super.super.isa + v8);
          result = 0;
          if (a5)
            *a5 = 4;
          return result;
        }
        return -2144403442;
      }
    }
    else
    {
      if (a6 != 19)
        return result;
      if ((self->super._bitmap & 1) != 0)
      {
        if (a4 >= 4)
        {
          v8 = 64;
          goto LABEL_12;
        }
        return -2144403442;
      }
    }
    return -2144403434;
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoMultiwayAudio_SerializeBuffer((uint64_t)self, a3, a4, a5);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.1()
{
  uint64_t v0;
  __int16 v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v4 = 1695;
  v5 = 2048;
  v6 = v0;
  v7 = v1;
  v8 = 8;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Bad buffer length(%zu) for Multiway audio media control info, expecting %u", v3, 0x2Cu);
  OUTLINED_FUNCTION_19();
}

- (void)setInfo:size:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]" >> 16, v4);
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
  *(_QWORD *)&v3[6] = "-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
