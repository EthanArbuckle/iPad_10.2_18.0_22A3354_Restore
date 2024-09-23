@implementation VCAudioCaptionsBufferInfo

- (VCAudioCaptionsBufferInfo)initWithStreamConfig:(const tagVCAudioCaptionsStreamConfig *)a3 bufferLength:(double)a4
{
  char *v6;
  VCAudioCaptionsBufferInfo *v7;
  __int128 v8;
  __int128 v9;
  int v10;
  __int128 v11;
  __int128 v12;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  objc_super v21;
  _BYTE buf[40];
  VCAudioCaptionsBufferInfo *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VCAudioCaptionsBufferInfo;
  v6 = -[VCAudioCaptionsBufferInfo init](&v21, sel_init);
  v7 = (VCAudioCaptionsBufferInfo *)v6;
  if (v6)
  {
    if (a3)
    {
      *((_QWORD *)v6 + 9) = a3->var0;
      v6[56] = 0;
      v8 = *(_OWORD *)&a3->var1.mSampleRate;
      v9 = *(_OWORD *)&a3->var1.mBytesPerPacket;
      *((_QWORD *)v6 + 5) = *(_QWORD *)&a3->var1.mBitsPerChannel;
      *(_OWORD *)(v6 + 24) = v9;
      *(_OWORD *)(v6 + 8) = v8;
      v6[64] = a3->var2;
      v10 = (*((double *)v6 + 1) * a4);
      v20 = 0xAAAAAAAAAAAAAAAALL;
      v11 = *(_OWORD *)(v6 + 8);
      v12 = *(_OWORD *)(v6 + 24);
      *(_QWORD *)&buf[32] = *((_QWORD *)v6 + 5);
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v12;
      VCAudioBufferList_Allocate((__int128 *)buf, v10, &v20);
      if (v20)
      {
        v7->_buffer = (opaqueVCAudioBufferList *)v20;
        return v7;
      }
      if ((VCAudioCaptionsBufferInfo *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:].cold.2();
        }
        goto LABEL_25;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCAudioCaptionsBufferInfo performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v19 = VRTraceErrorLogLevelToCSTR(),
            v17 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_25:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 41;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v15;
      *(_WORD *)&buf[38] = 2048;
      v23 = v7;
      v18 = " [%s] %s:%d %@(%p) Failed to allocate buffer for buffer info.";
    }
    else
    {
      if ((char *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:].cold.1();
        }
        goto LABEL_25;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCAudioCaptionsBufferInfo performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_25;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 33;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v14;
      *(_WORD *)&buf[38] = 2048;
      v23 = v7;
      v18 = " [%s] %s:%d %@(%p) Stream config is NULL";
    }
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_25;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t *p_buffer;
  opaqueVCAudioBufferList *buffer;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  buffer = self->_buffer;
  p_buffer = (uint64_t *)&self->_buffer;
  if (buffer)
    VCAudioBufferList_Destroy(p_buffer);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioCaptionsBufferInfo;
  -[VCAudioCaptionsBufferInfo dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> streamToken=%ld priority=%d"), NSStringFromClass(v4), self, self->_token, self->_priority);
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  int v6;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[VCAudioCaptionsBufferInfo token](self, "token");
  if (v5 != objc_msgSend(a3, "token"))
    return 0;
  v6 = -[VCAudioCaptionsBufferInfo priority](self, "priority");
  return v6 == objc_msgSend(a3, "priority");
}

- (unint64_t)hash
{
  return (2654435761 * self->_priority) ^ (2654435761 * self->_token);
}

- (int64_t)token
{
  return self->_token;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)countOfLowPrioritySamples
{
  return self->_countOfLowPrioritySamples;
}

- (AudioStreamBasicDescription)format
{
  __int128 v3;

  v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (void)initWithStreamConfig:bufferLength:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream config is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:bufferLength:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate buffer for buffer info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
