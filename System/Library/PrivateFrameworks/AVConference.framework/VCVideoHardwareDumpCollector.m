@implementation VCVideoHardwareDumpCollector

- (VCVideoHardwareDumpCollector)init
{
  VCVideoHardwareDumpCollector *v2;
  CFArrayRef HeadersFromCArray;
  CFArrayRef v4;
  CFArrayRef v5;
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v8;
  CFMutableDictionaryRef v9;
  VCVideoHardwareDumpWriter *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoHardwareDumpCollector;
  v2 = -[VCVideoHardwareDumpCollector init](&v12, sel_init);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.1();
    }
    goto LABEL_38;
  }
  HeadersFromCArray = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_EncodingDumpHeaders, 11);
  v2->_txDumpHeaders = HeadersFromCArray;
  if (!HeadersFromCArray)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.2();
    }
    goto LABEL_38;
  }
  v4 = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_DecodingDumpHeaders, 6);
  v2->_rxDumpHeaders = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.3();
    }
    goto LABEL_38;
  }
  v5 = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_CaptureDumpHeaders, 2);
  v2->_captureDumpHeaders = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.4();
    }
    goto LABEL_38;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v2->_txFrameData = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.5();
    }
    goto LABEL_38;
  }
  v8 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v2->_rxFrameData = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.6();
    }
    goto LABEL_38;
  }
  v9 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v2->_captureFrameData = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.7();
    }
    goto LABEL_38;
  }
  v10 = +[VCVideoHardwareDumpWriter sharedInstance](VCVideoHardwareDumpWriter, "sharedInstance");
  v2->_writer = v10;
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.8();
    }
    goto LABEL_38;
  }
  if (!VCVideoHardwareDumpWriter_RegisterSource((uint64_t)v10, v2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpCollector init].cold.9();
    }
LABEL_38:

    return 0;
  }
  return v2;
}

- (void)invalidate
{
  VCVideoHardwareDumpWriter_UnregisterSource((uint64_t)self->_writer, self);
}

- (void)dealloc
{
  __CFArray *txDumpHeaders;
  __CFArray *rxDumpHeaders;
  __CFArray *captureDumpHeaders;
  __CFDictionary *txFrameData;
  __CFDictionary *rxFrameData;
  __CFDictionary *captureFrameData;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  txDumpHeaders = self->_txDumpHeaders;
  if (txDumpHeaders)
    CFRelease(txDumpHeaders);
  rxDumpHeaders = self->_rxDumpHeaders;
  if (rxDumpHeaders)
    CFRelease(rxDumpHeaders);
  captureDumpHeaders = self->_captureDumpHeaders;
  if (captureDumpHeaders)
    CFRelease(captureDumpHeaders);
  txFrameData = self->_txFrameData;
  if (txFrameData)
    CFRelease(txFrameData);
  rxFrameData = self->_rxFrameData;
  if (rxFrameData)
    CFRelease(rxFrameData);
  captureFrameData = self->_captureFrameData;
  if (captureFrameData)
    CFRelease(captureFrameData);
  v9.receiver = self;
  v9.super_class = (Class)VCVideoHardwareDumpCollector;
  -[VCVideoHardwareDumpCollector dealloc](&v9, sel_dealloc);
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register with dump writer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
