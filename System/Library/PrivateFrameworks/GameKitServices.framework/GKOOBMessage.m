@implementation GKOOBMessage

- (GKOOBMessage)initWithMessageType:(unsigned __int16)a3
{
  GKOOBMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKOOBMessage;
  result = -[GKOOBMessage init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (GKOOBMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v7;
  NSObject *v8;
  GKOOBMessage *v9;
  GKOOBMessage *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v20 = v7;
      v21 = 2080;
      v22 = "-[GKOOBMessage initWithBytes:length:]";
      v23 = 1024;
      v24 = 25;
      v25 = 2048;
      v26 = a3;
      v27 = 1024;
      v28 = a4;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKOOBMessage initWithBytes (%p, %d)", buf, 0x2Cu);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)GKOOBMessage;
  v9 = -[GKOOBMessage init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKOOBMessage initWithBytes:length:].cold.1(v11, v12);
      }
      goto LABEL_25;
    }
    if (a4 <= 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKOOBMessage initWithBytes:length:].cold.2();
      }
LABEL_25:

      return 0;
    }
    v13 = bswap32(*(unsigned __int16 *)a3) >> 16;
    if (!-[GKOOBMessage _checkType:](v9, "_checkType:", v13))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x24BDFDC28];
        v16 = *MEMORY[0x24BDFDC28];
        if (*MEMORY[0x24BDFDC18])
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v20 = v14;
            v21 = 2080;
            v22 = "-[GKOOBMessage initWithBytes:length:]";
            v23 = 1024;
            v24 = 53;
            v25 = 1024;
            LODWORD(v26) = v13;
            _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKOOBMessage init: Message type mismatch - type = %d", buf, 0x22u);
          }
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[GKOOBMessage initWithBytes:length:].cold.4(v14, v13, v15);
        }
      }
      goto LABEL_25;
    }
    if (!-[GKOOBMessage _checkSize:](v10, "_checkSize:", (int)a4))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKOOBMessage initWithBytes:length:].cold.3();
      }
      goto LABEL_25;
    }
    v10->_type = v13;
  }
  return v10;
}

- (id)data
{
  __int16 v3;

  v3 = bswap32(self->_type) >> 16;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v3, 2);
}

- (BOOL)_checkType:(unsigned __int16)a3
{
  return a3 == 1500;
}

- (BOOL)_checkSize:(unint64_t)a3
{
  return a3 == 2;
}

- (unsigned)type
{
  return self->_type;
}

- (void)initWithBytes:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[GKOOBMessage initWithBytes:length:]";
  v6 = 1024;
  v7 = 30;
  _os_log_error_impl(&dword_215C5C000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKOOBMessage init: null buffer", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_12();
}

- (void)initWithBytes:length:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_0();
  *(_QWORD *)&v3[6] = "-[GKOOBMessage initWithBytes:length:]";
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d GKOOBMessage init: size is too small %d", v2, *(const char **)v3, (unint64_t)"-[GKOOBMessage initWithBytes:length:]" >> 16, 36);
  OUTLINED_FUNCTION_12();
}

- (void)initWithBytes:length:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_0();
  *(_QWORD *)&v3[6] = "-[GKOOBMessage initWithBytes:length:]";
  OUTLINED_FUNCTION_0_2(&dword_215C5C000, v0, v1, " [%s] %s:%d GKOOBMessage is the wrong size: %u", v2, *(const char **)v3, (unint64_t)"-[GKOOBMessage initWithBytes:length:]" >> 16, 46);
  OUTLINED_FUNCTION_12();
}

- (void)initWithBytes:(os_log_t)log length:.cold.4(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[GKOOBMessage initWithBytes:length:]";
  v7 = 1024;
  v8 = 53;
  v9 = 1024;
  v10 = a2;
  _os_log_debug_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKOOBMessage init: Message type mismatch - type = %d", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_12();
}

@end
