@implementation VCTransportSessionProxy

- (VCTransportSessionProxy)initWithTransportSessionID:(unsigned int)a3
{
  VCTransportSessionProxy *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionProxy;
  result = -[VCTransportSession initWithNotificationQueue:reportingAgent:](&v5, sel_initWithNotificationQueue_reportingAgent_, 0, 0);
  if (result)
  {
    if (a3)
    {
      *(_DWORD *)(&result->super._shouldIgnoreConnectionRefusedError + 2) = a3;
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionProxy initWithTransportSessionID:].cold.1();
      }
      return 0;
    }
  }
  return result;
}

- (void)start
{
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, 0);
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  int v6;
  int v7;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = -1;
  if (a3)
  {
    v6 = +[VCTransportSession vtpPacketTypeForStreamType:](VCTransportSession, "vtpPacketTypeForStreamType:", *(_QWORD *)&a4);
    if (v6)
    {
      v7 = VCCreateVFDForIDS(v6, 43, (int *)&v9);
      if ((v7 & 0x80000000) == 0)
      {
        if (VTP_SetTransportSessionID(v9, *(_DWORD *)(&self->super._shouldIgnoreConnectionRefusedError + 2)) == -1)
        {
          v7 = *__error() | 0xC02B0000;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCTransportSessionProxy createVFD:forStreamType:].cold.2();
          }
        }
        else
        {
          *a3 = v9;
          v9 = -1;
        }
      }
    }
    else
    {
      v7 = -2144665599;
    }
  }
  else
  {
    v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionProxy createVFD:forStreamType:].cold.1();
    }
  }
  VCCloseVFDIfValid(v9);
  return v7;
}

- (int)networkInterfaceType
{
  return 3;
}

- (unsigned)networkMTU
{
  return 1280;
}

- (BOOL)isIPv6
{
  return 1;
}

- (void)initWithTransportSessionID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid transportSessionID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NULL vfd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.2()
{
  __int16 v0;
  int v1;
  os_log_t v2;
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
  v5 = "-[VCTransportSessionProxy createVFD:forStreamType:]";
  v6 = 1024;
  v7 = 53;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTP_SetTransportSessionID failed %x", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

@end
