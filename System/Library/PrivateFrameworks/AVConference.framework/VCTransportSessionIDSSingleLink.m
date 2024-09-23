@implementation VCTransportSessionIDSSingleLink

- (VCTransportSessionIDSSingleLink)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionIDSSingleLink;
  return -[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:](&v5, sel_initWithCallID_requireEncryptionInfo_reportingAgent_notificationQueue_, 0, 0, a4, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionIDSSingleLink;
  -[VCTransportSessionIDS dealloc](&v3, sel_dealloc);
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v5;
      v14 = 2080;
      v15 = "-[VCTransportSessionIDSSingleLink handleLinkConnectedWithInfo:]";
      v16 = 1024;
      v17 = 37;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS channel connected", (uint8_t *)&v12, 0x1Cu);
    }
  }
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E60]);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "firstObject");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
          v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        else
          v11 = "<nil>";
        v12 = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCTransportSessionIDSSingleLink handleLinkConnectedWithInfo:]";
        v16 = 1024;
        v17 = 42;
        v18 = 2080;
        v19 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new link established with link context=%s", (uint8_t *)&v12, 0x26u);
      }
    }
    if (v8)
      self->_connection = -[VCConnectionIDS initWithLinkContext:dataChannelToken:]([VCConnectionIDS alloc], "initWithLinkContext:dataChannelToken:", v8, VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel));
  }
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCTransportSessionIDSSingleLink handleLinkDisconnectedWithInfo:]";
      v9 = 1024;
      v10 = 51;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS channel disconnected", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (int)onStart
{
  _opaque_pthread_mutex_t *p_stateLock;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  p_stateLock = &self->super.super._stateLock;
  pthread_mutex_lock(&self->super.super._stateLock);
  v4 = -[NSMutableArray count](self->super.super._streams, "count");
  if (v4 < 1)
  {
    v7 = 0;
LABEL_7:
    -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, 0);
  }
  else
  {
    v5 = 0;
    v6 = v4;
    while (1)
    {
      v7 = -[VCTransportSessionIDSSingleLink updateTransportStream:](self, "updateTransportStream:", -[NSMutableArray objectAtIndexedSubscript:](self->super.super._streams, "objectAtIndexedSubscript:", v5));
      if (v7 < 0)
        break;
      if (v6 == ++v5)
        goto LABEL_7;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionIDSSingleLink onStart].cold.1();
    }
  }
  pthread_mutex_unlock(p_stateLock);
  return v7;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = -1;
  if (a3)
  {
    v6 = +[VCTransportSession vtpPacketTypeForStreamType:](VCTransportSession, "vtpPacketTypeForStreamType:", *(_QWORD *)&a4);
    if (v6)
    {
      v7 = VCCreateVFDForIDS(v6, 43, (int *)&v13);
      if ((v7 & 0x80000000) == 0)
      {
        v8 = v13;
        v9 = VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel);
        if (VTP_SetSourceDestinationWithToken(v8, v9) == -1)
        {
          v7 = *__error() | 0xC02B0000;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCTransportSessionIDSSingleLink createVFD:forStreamType:].cold.2();
          }
        }
        else
        {
          *a3 = v13;
          v13 = -1;
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
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionIDSSingleLink createVFD:forStreamType:].cold.1(v11, v12);
    }
  }
  VCCloseVFDIfValid(v13);
  return v7;
}

- (int)updateTransportStream:(OpaqueVCTransportStream *)a3
{
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, _QWORD, id *);
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  OpaqueVCTransportStream *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  CMBaseObject = VCPacketFilterGetCMBaseObject(a3, a2);
  v6 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v6)
  {
    v7 = v6(CMBaseObject, CFSTR("UnderlyingVFD"), *MEMORY[0x1E0C9AE00], &v13);
    if ((v7 & 0x80000000) == 0)
    {
      v8 = objc_msgSend(v13, "intValue");
      v9 = VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel);
      if (VTP_SetSourceDestinationWithToken(v8, v9) == -1)
      {
        v7 = *__error() | 0xC02B0000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportSessionIDSSingleLink updateTransportStream:].cold.1();
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
    v7 = -12782;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCTransportSessionIDSSingleLink updateTransportStream:]";
      v18 = 1024;
      v19 = 96;
      v20 = 2112;
      v21 = CFSTR("UnderlyingVFD");
      v22 = 2112;
      v23 = a3;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not get property '%@' for transport stream '%@'", buf, 0x30u);
    }
  }
LABEL_11:

  return v7;
}

- (id)copyActiveConnection
{
  return -[VCTransportSessionIDSSingleLink connection](self, "connection");
}

- (VCConnectionIDS)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (void)onStart
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 62;
  v4 = 2112;
  v5 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update transport stream '%@'", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:(uint64_t)a1 forStreamType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCTransportSessionIDSSingleLink createVFD:forStreamType:]";
  v6 = 1024;
  v7 = 75;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d NULL vfd", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithToken failed %x", v2, v3, v4, 84);
  OUTLINED_FUNCTION_3();
}

- (void)updateTransportStream:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithToken failed %x", v2, v3, v4, 100);
  OUTLINED_FUNCTION_3();
}

@end
