@implementation VCMockIDSDatagramChannelSocket

- (id)initRequiresOptions:(BOOL)a3 localIP:(id)a4 localPort:(signed __int16)a5 remoteIP:(id)a6 remotePort:(signed __int16)a7
{
  unsigned int v7;
  uint64_t v9;
  id v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v7 = a7;
  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCMockIDSDatagramChannelSocket;
  v11 = -[VCMockIDSDatagramChannel initRequiresOptions:](&v18, sel_initRequiresOptions_, a3);
  if (!v11)
    return v11;
  *((_BYTE *)v11 + 3322388) = VCDefaults_GetBoolValueForKey(CFSTR("twoWayFaceTimeTestUsingSocketsEnabled"), 0);
  if (!a4)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.1();
    }
    return 0;
  }
  if (!a6)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.2();
    }
    return 0;
  }
  if (!(_DWORD)v9)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.3();
    }
    return 0;
  }
  if (!v7)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.4();
    }
    return 0;
  }
  v12 = +[NetworkUtils socketWithIPAddress:srcPort:shouldConnect:error:](NetworkUtils, "socketWithIPAddress:srcPort:shouldConnect:error:", a4, v9, 0, 0);
  *((_DWORD *)v11 + 8) = v12;
  if (v12 == -1)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.5(v16, v17);
    }
    return 0;
  }
  *((_BYTE *)v11 + 3322357) = 2;
  *((_DWORD *)v11 + 830590) = inet_addr((const char *)objc_msgSend(a6, "UTF8String"));
  *((_WORD *)v11 + 1661179) = bswap32(v7) >> 16;
  *((_BYTE *)v11 + 3322373) = 2;
  *((_DWORD *)v11 + 830594) = inet_addr((const char *)objc_msgSend(a4, "UTF8String"));
  *((_WORD *)v11 + 1661187) = bswap32(v9) >> 16;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v20 = v13;
      v21 = 2080;
      v22 = "-[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]";
      v23 = 1024;
      v24 = 1304;
      v25 = 2112;
      v26 = a4;
      v27 = 1024;
      v28 = v9;
      v29 = 2112;
      v30 = a6;
      v31 = 1024;
      v32 = v7;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setup socket %@:%d to %@:%d", buf, 0x3Cu);
    }
  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCMockIDSDatagramChannelSocket;
  -[VCMockIDSDatagramChannel dealloc](&v2, sel_dealloc);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
  -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:datagramInfo:options:completionHandler:](self, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(unsigned __int16 *)&a5.var4, 0, a6);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:](self, "writeDatagram:datagramSize:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var4, a6);
  -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a7, a4, 0);
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a6 < 1)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = a6;
    do
    {
      v14 = (uint64_t)*a3++;
      -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:](self, "writeDatagram:datagramSize:", v14, *a4, a5);
      LODWORD(v14) = *a4++;
      v12 += v14;
      --v13;
    }
    while (v13);
  }
  -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a8, v12, 0);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4
{
  int v6;
  size_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = 3322356;
    v7 = a4;
    if (!self->_localAddress.sin_zero[4]
      && !-[VCMockIDSDatagramChannel isMediaPacket:length:](self, "isMediaPacket:length:", a3, a4))
    {
      v6 = 3322372;
    }
    if ((sendto(self->super._socket, a3, v7, 0, (const sockaddr *)((char *)self + v6), 0x10u) & 0x80000000) != 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:].cold.1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:]";
      v14 = 1024;
      v15 = 1347;
      v16 = 1024;
      v17 = 0;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignoring datagram with size %d", (uint8_t *)&v10, 0x22u);
    }
  }
}

- (int)readyToRead
{
  ssize_t v3;
  __int128 v5;
  _BYTE __b[1472];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v3 = recv(self->super._socket, __b, 0x5C0uLL, 0);
  if ((v3 & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelSocket readyToRead].cold.1();
    }
  }
  else
  {
    if (-[VCMockIDSDatagramChannel isMediaPacket:length:](self, "isMediaPacket:length:", __b, 1472, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    {
      -[VCMockIDSDatagramChannelSocket setAllSubscribedStreamIDsOnOptions:](self, "setAllSubscribedStreamIDsOnOptions:", &v5);
      -[VCMockIDSDatagramChannelSocket setIsHopByHopEncryptedOnOptions:](self, "setIsHopByHopEncryptedOnOptions:", &v5);
    }
    else
    {
      -[VCMockIDSDatagramChannel setParticipantIDOnOptions:](self, "setParticipantIDOnOptions:", &v5);
    }
    -[VCMockIDSDatagramChannel readDatagram:datagramSize:datagramOptions:](self, "readDatagram:datagramSize:datagramOptions:", __b, v3, &v5);
  }
  return 0;
}

- (void)setAllSubscribedStreamIDsOnOptions:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = -[NSDictionary allValues](self->super._subscribedStreamsByParticipantID, "allValues");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    v19 = v4;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            v14 = 0;
            v15 = v7;
            if (v7 <= 11)
              v16 = 11;
            else
              v16 = v7;
            v17 = (v16 - v7);
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              a3->var5[v15 + v14] = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "intValue");
              if (v17 == v14)
              {
                LOBYTE(v7) = v15 + v14 + 1;
                goto LABEL_23;
              }
              ++v14;
            }
            while (v12 != v14);
            v7 = v15 + v14;
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
            if (v12)
              continue;
            break;
          }
          v7 = v15 + v14;
          v8 = v18;
          v4 = v19;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_23:
  a3->var4 = v7;
  a3->var0 |= 2u;
}

- (void)setIsHopByHopEncryptedOnOptions:(id *)a3
{
  a3->var11 = 1;
  a3->var0 |= 0x400u;
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil localIP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil remoteIP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 0 localPort", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 0 remotePort", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initRequiresOptions:(uint64_t)a1 localIP:(NSObject *)a2 localPort:remoteIP:remotePort:.cold.5(uint64_t a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __error();
  v4 = 136315906;
  v5 = a1;
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Create socket failed %d", (uint8_t *)&v4, 0x22u);
}

- (void)writeDatagram:datagramSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Send failed %d", v2, v3, v4, 1363);
  OUTLINED_FUNCTION_3();
}

- (void)readyToRead
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d recv failed %d", v2, v3, v4, 1373);
  OUTLINED_FUNCTION_3();
}

@end
