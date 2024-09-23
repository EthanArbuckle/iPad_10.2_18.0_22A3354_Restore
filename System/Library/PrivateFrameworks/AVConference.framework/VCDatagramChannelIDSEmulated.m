@implementation VCDatagramChannelIDSEmulated

- (VCDatagramChannelIDSEmulated)initWithIDSDatagramChannel:(id)a3 mode:(int64_t)a4
{
  VCDatagramChannelIDSEmulated *v6;
  VCDatagramChannelIDSEmulated *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCDatagramChannelIDSEmulated *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCDatagramChannelIDSEmulated;
  v6 = -[VCObject init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mode = a4;
    v6->_idsChannel = (VCDatagramChannelIDS *)a3;
    v7->super._token = VCDatagramChannelIDS_Token((uint64_t)a3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCDatagramChannelIDSEmulated initWithIDSDatagramChannel:mode:]";
        v16 = 1024;
        v17 = 31;
        v18 = 2048;
        v19 = v7;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelIDSEmulated %p created", buf, 0x26u);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  VCDatagramChannelIDS *idsChannel;
  VCEmulatedNetwork *network;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  VCDatagramChannelIDSEmulated *v15;
  __int16 v16;
  VCDatagramChannelIDS *v17;
  __int16 v18;
  VCEmulatedNetwork *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      idsChannel = self->_idsChannel;
      network = self->_network;
      *(_DWORD *)buf = 136316418;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCDatagramChannelIDSEmulated dealloc]";
      v12 = 1024;
      v13 = 37;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = idsChannel;
      v18 = 2048;
      v19 = network;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelIDSEmulated %p dealloc called: _idsChannel %p, _network %p", buf, 0x3Au);
    }
  }
  -[VCDatagramChannelIDSEmulated invalidate](self, "invalidate");

  self->_network = 0;
  v7.receiver = self;
  v7.super_class = (Class)VCDatagramChannelIDSEmulated;
  -[VCDatagramChannelIDS dealloc](&v7, sel_dealloc);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  int64_t mode;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_isStarted)
  {
    mode = self->_mode;
    if (mode == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:].cold.2();
      }
    }
    else if (mode)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:].cold.1();
      }
    }
    else
    {
      -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:](self, "writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(unsigned __int16 *)&a5.var4, a6, a7);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:]";
      v14 = 1024;
      v15 = 51;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The datagramChannel is not started!", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (BOOL)writeToEmulatedNetworkWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6
{
  uint64_t v6;
  _BOOL4 v7;
  __int16 v9;
  uint64_t v10;
  VCEmulatedPacket *v12;
  VCEmulatedPacket *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[1640];
  _BYTE __dst[1640];
  uint64_t v23;

  v6 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  if (a4 < 0x5DD)
  {
    v9 = *(_WORD *)&a5.var4;
    v10 = *(_QWORD *)&a5.var0;
    ++self->_packetCount;
    v12 = -[VCEmulatedPacket initWithPacketID:datagram:datagramSize:]([VCEmulatedPacket alloc], "initWithPacketID:datagram:datagramSize:", self->_packetCount, a3, *(_QWORD *)&a4);
    if (v12)
    {
      v13 = v12;
      memcpy(__dst, &unk_1D910C178, sizeof(__dst));
      -[VCEmulatedPacket metadata](v13, "metadata");
      *(_DWORD *)__dst = v6;
      *(_QWORD *)&__dst[4] = v10;
      *(_WORD *)&__dst[12] = v9;
      if (a6)
      {
        v14 = *(_OWORD *)&a6->var11;
        *(_OWORD *)&__dst[80] = *(_OWORD *)&a6->var9;
        *(_OWORD *)&__dst[96] = v14;
        *(_OWORD *)&__dst[112] = *(_OWORD *)a6->var13;
        *(_QWORD *)&__dst[128] = *(_QWORD *)&a6->var14;
        v15 = *(_OWORD *)&a6->var2;
        *(_OWORD *)&__dst[16] = *(_OWORD *)&a6->var0;
        *(_OWORD *)&__dst[32] = v15;
        v16 = *(_OWORD *)&a6->var8.var0;
        v17 = 1;
        *(_OWORD *)&__dst[48] = *(_OWORD *)&a6->var5[6];
        *(_OWORD *)&__dst[64] = v16;
      }
      else
      {
        v17 = 0;
      }
      __dst[136] = v17;
      -[VCEmulatedPacket setSize:](v13, "setSize:", v6);
      memcpy(v21, __dst, sizeof(v21));
      -[VCEmulatedPacket setMetadata:](v13, "setMetadata:", v21);
      -[VCEmulatedPacket setArrivalTime:](v13, "setArrivalTime:", micro());
      v18 = 3;
      if (WORD1(v10) == 800)
        v18 = 1;
      if (WORD1(v10) == 700)
        v19 = 2;
      else
        v19 = v18;
      -[VCEmulatedPacket setType:](v13, "setType:", v19);
      -[VCEmulatedNetwork push:](self->_network, "push:", v13);

      LOBYTE(v7) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_11;
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v7)
      {
        -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:].cold.2();
        goto LABEL_11;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_11:
      LOBYTE(v7) = 0;
      return v7;
    }
    VRTraceErrorLogLevelToCSTR();
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:].cold.1();
      goto LABEL_11;
    }
  }
  return v7;
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  unint64_t p_mode;
  int64_t mode;
  uint64_t v14;
  unsigned __int8 *p_var4;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_isStarted)
  {
    p_mode = (unint64_t)&self->_mode;
    mode = self->_mode;
    if (mode == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:].cold.2();
      }
    }
    else if (mode)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:].cold.1();
      }
    }
    else if (a6 >= 1)
    {
      v14 = a6;
      p_var4 = &a5->var4;
      do
      {
        v17 = (uint64_t)*a3++;
        v16 = v17;
        LODWORD(v17) = *a4++;
        v18 = v17;
        v20 = (uint64_t)*a7++;
        v19 = v20;
        v21 = *((_QWORD *)p_var4 - 1);
        LODWORD(v20) = *(unsigned __int16 *)p_var4;
        p_var4 += 10;
        p_mode = p_mode & 0xFFFFFFFFFFFF0000 | v20;
        -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:](self, "writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:", v16, v18, v21, p_mode, v19, a8);
        --v14;
      }
      while (v14);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315650;
      v25 = v22;
      v26 = 2080;
      v27 = "-[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:]";
      v28 = 1024;
      v29 = 123;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The datagramChannel is not started!", (uint8_t *)&v24, 0x1Cu);
    }
  }
}

- (void)setEventHandler:(id)a3
{
  -[VCDatagramChannelIDS setEventHandler:](self->_idsChannel, "setEventHandler:", a3);
}

- (void)setChannelPreferences:(id)a3
{
  -[VCDatagramChannelIDS setChannelPreferences:](self->_idsChannel, "setChannelPreferences:", a3);
}

- (void)setWiFiAssist:(BOOL)a3
{
  -[VCDatagramChannelIDS setWiFiAssist:](self->_idsChannel, "setWiFiAssist:", a3);
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  -[VCDatagramChannelIDS requestSessionInfoWithOptions:](self->_idsChannel, "requestSessionInfoWithOptions:", a3);
}

- (void)optInStreamIDs:(id)a3
{
  -[VCDatagramChannelIDS optInStreamIDs:](self->_idsChannel, "optInStreamIDs:", a3);
}

- (void)optOutStreamIDs:(id)a3
{
  -[VCDatagramChannelIDS optOutStreamIDs:](self->_idsChannel, "optOutStreamIDs:", a3);
}

- (void)setupEmulatedNetwork
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;

  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_cold_1(v3, a2, v4);
  }
}

uint64_t __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_6(uint64_t result, void *a2)
{
  uint64_t v3;
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[410];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    memcpy(v7, &unk_1D910C178, sizeof(v7));
    objc_msgSend(a2, "metadata");
    result = objc_msgSend(a2, "isLost");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(a2, "size");
      if ((_DWORD)result == v7[0])
      {
        if (LOBYTE(v7[34]))
          v4 = &v7[4];
        else
          v4 = 0;
        v5 = *(void **)(*(_QWORD *)(v3 + 32) + 224);
        v6 = objc_msgSend(a2, "datagram");
        return objc_msgSend(v5, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", v6, v7[0], *(_QWORD *)&v7[1], LOWORD(v7[3]), v4, *(_QWORD *)(v3 + 40));
      }
    }
  }
  return result;
}

- (int)start
{
  -[VCObject lock](self, "lock");
  if (self->_isStarted)
  {
    -[VCObject unlock](self, "unlock");
    return 0;
  }
  else
  {
    -[VCNetworkSimulator start](+[VCNetworkSimulator sharedInstance](VCNetworkSimulator, "sharedInstance"), "start");
    -[VCDatagramChannelIDSEmulated setupEmulatedNetwork](self, "setupEmulatedNetwork");
    self->_isStarted = 1;
    -[VCObject unlock](self, "unlock");
    return -[VCDatagramChannelIDS start](self->_idsChannel, "start");
  }
}

- (void)invalidate
{
  -[VCObject lock](self, "lock");
  self->_isStarted = 0;
  -[VCObject unlock](self, "unlock");
  -[VCEmulatedNetwork setPopCompletionHandler:](self->_network, "setPopCompletionHandler:", 0);
  -[VCNetworkSimulator stop](+[VCNetworkSimulator sharedInstance](VCNetworkSimulator, "sharedInstance"), "stop");
  -[VCDatagramChannelIDS invalidate](self->_idsChannel, "invalidate");

  self->_idsChannel = 0;
}

- (void)setReadHandler:(id)a3
{
  -[VCDatagramChannelIDS setReadHandler:](self->_idsChannel, "setReadHandler:", a3);
}

- (void)readyToRead
{
  -[VCDatagramChannelIDS readyToRead](self->_idsChannel, "readyToRead");
}

- (void)osChannelInfoLog
{
  -[VCDatagramChannelIDS osChannelInfoLog](self->_idsChannel, "osChannelInfoLog");
}

- (id)connectedLinks
{
  return -[VCDatagramChannelIDS connectedLinks](self->_idsChannel, "connectedLinks");
}

- (id)defaultLink
{
  return -[VCDatagramChannelIDS defaultLink](self->_idsChannel, "defaultLink");
}

- (unsigned)token
{
  return VCDatagramChannelIDS_Token((uint64_t)self->_idsChannel);
}

- (id)destination
{
  return -[VCDatagramChannelIDS destination](self->_idsChannel, "destination");
}

- (int)dataPath
{
  return -[VCDatagramChannelIDS dataPath](self->_idsChannel, "dataPath");
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
  -[VCDatagramChannelIDS setOneToOneModeEnabled:isInitiator:](self->_idsChannel, "setOneToOneModeEnabled:isInitiator:", a3, a4);
}

- (void)writeDatagram:datagramSize:datagramInfo:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d unknown mode %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)writeDatagram:datagramSize:datagramInfo:options:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];

  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "-[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d datagram size too large %d", v3, *(const char **)v4, (unint64_t)"-[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]" >> 16, 72);
  OUTLINED_FUNCTION_3();
}

- (void)writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot create VCEmulatedPacket!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d unknown mode %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_9();
  v10 = 174;
  v11 = v5;
  v12 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to ids datagram channel with error %s", (uint8_t *)&v7, 0x26u);
}

@end
