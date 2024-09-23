@implementation GKVoiceChatSessionMessage

- (GKVoiceChatSessionMessage)init
{
  GKVoiceChatSessionMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionMessage;
  result = -[GKVoiceChatSessionMessage init](&v3, sel_init);
  if (result)
  {
    result->super._type = 1600;
    result->_data = 0;
  }
  return result;
}

- (GKVoiceChatSessionMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  GKVoiceChatSessionMessage *v6;
  GKVoiceChatSessionMessage *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKVoiceChatSessionMessage;
  v6 = -[GKOOBMessage initWithBytes:length:](&v10, sel_initWithBytes_length_);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      if (a4 <= 0xB)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[GKVoiceChatSessionMessage initWithBytes:length:].cold.2();
        }
      }
      else
      {
        v6->super._type = bswap32(*(unsigned __int16 *)a3) >> 16;
        v6->_conferenceID = *((_DWORD *)a3 + 1);
        v6->_subtype = bswap32(*((_DWORD *)a3 + 2));
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3, a4);
        v7->_data = (NSData *)v8;
        if (v8)
          return v7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[GKVoiceChatSessionMessage initWithBytes:length:].cold.3();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKVoiceChatSessionMessage initWithBytes:length:].cold.1();
    }

    return 0;
  }
  return v7;
}

- (GKVoiceChatSessionMessage)initWithPayload:(id)a3 conferenceID:(unsigned int)a4 subtype:(unsigned int)a5
{
  GKVoiceChatSessionMessage *v8;
  GKVoiceChatSessionMessage *v9;
  NSData *v10;
  _DWORD v12[3];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKVoiceChatSessionMessage;
  v8 = -[GKVoiceChatSessionMessage init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->super._type = 1600;
    v8->_conferenceID = a4;
    v8->_subtype = a5;
    v12[0] = -1431683066;
    v12[1] = v8->_conferenceID;
    v12[2] = bswap32(a5);
    v10 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", v12, 12);
    -[NSData appendData:](v10, "appendData:", a3);
    v9->_data = v10;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionMessage;
  -[GKVoiceChatSessionMessage dealloc](&v3, sel_dealloc);
}

- (id)data
{
  return self->_data;
}

- (id)payload
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", -[NSData bytes](self->_data, "bytes") + 12, -[NSData length](self->_data, "length") - 12);
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (BOOL)_checkType:(unsigned __int16)a3
{
  return a3 == 1600;
}

- (BOOL)_checkSize:(unint64_t)a3
{
  return a3 > 5;
}

- (unsigned)conferenceID
{
  return self->_conferenceID;
}

- (void)initWithBytes:length:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Buffer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithBytes:length:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Size is too small", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithBytes:length:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Failed to allocate data buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
