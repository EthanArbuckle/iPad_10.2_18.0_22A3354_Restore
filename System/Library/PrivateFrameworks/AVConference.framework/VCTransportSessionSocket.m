@implementation VCTransportSessionSocket

- (VCTransportSessionSocket)initWithSocketDictionary:(id)a3 notificationHandler:(void *)a4 eventHandler:(void *)a5 handlerQueue:(id)a6 context:(void *)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  VCTransportSessionSocket *v17;
  VCTransportSessionSocket *v18;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:].cold.1();
    }
    v18 = 0;
    goto LABEL_8;
  }
  v13 = xpc_dictionary_dup_fd(a3, "avcKeySharedSocket");
  if ((_DWORD)v13 == -1)
  {
    v14 = xpc_dictionary_dup_fd(a3, "avcKeyRTPSocket");
    v16 = xpc_dictionary_dup_fd(a3, "avcKeyRTCPSocket");
    if ((_DWORD)v16 == -1)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:].cold.2();
      }
      v18 = 0;
      v15 = 0xFFFFFFFFLL;
      goto LABEL_10;
    }
    v15 = v16;
    if ((_DWORD)v14 == -1)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:].cold.3();
      }
      v18 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v14 = v13;
    v15 = 0xFFFFFFFFLL;
  }
  v17 = -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:](self, "initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:", v14, v15, a4, a5, a6, a7);
  if (v17)
  {
    v18 = v17;
LABEL_8:
    v15 = 0xFFFFFFFFLL;
LABEL_9:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v22 = 136316162;
      v23 = v20;
      v24 = 2080;
      v25 = "-[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]";
      v26 = 1024;
      v27 = 54;
      v28 = 1024;
      v29 = v14;
      v30 = 1024;
      v31 = v15;
      _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d initWithRTPSocket:%d RTCPSocket:%d failed", (uint8_t *)&v22, 0x28u);
    }
  }
  v18 = 0;
LABEL_10:
  VCCloseSocketIfValid(v14);
  VCCloseSocketIfValid(v15);
  return v18;
}

- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4
{
  return -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:](self, "initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, 0, 0, 0);
}

- (VCTransportSessionSocket)initWithSharedSocket:(int)a3
{
  return -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:](self, "initWithRTPSocket:RTCPSocket:", *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8
{
  uint64_t v8;
  uint64_t v9;
  VCTransportSessionSocket *v10;
  VCTransportSessionSocket *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:].cold.1();
    }
    return 0;
  }
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)VCTransportSessionSocket;
  v10 = -[VCTransportSession initWithNotificationQueue:reportingAgent:notificationHandler:eventHandler:handlerQueue:context:](&v13, sel_initWithNotificationQueue_reportingAgent_notificationHandler_eventHandler_handlerQueue_context_, 0, 0, a5, a6, a7, a8);
  v11 = v10;
  if (v10)
  {
    v10->_rtcpVFD = -1;
    v10->_rtpVFD = -1;
    if ((_DWORD)v8 == -1)
      v10->_isSharedSocket = 1;
    if (-[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:](v10, "createVFD:realSocket:sockAddr:length:isUsable:"))
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:].cold.4();
      }
    }
    else if (!v11->_isSharedSocket
           && -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:](v11, "createVFD:realSocket:sockAddr:length:isUsable:", &v11->_rtcpVFD, v8, &v11->_rtcpIPPort, &v11->_rtcpIPPortLength, &v11->_isRTCPUsable))
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:].cold.3();
      }
    }
    else
    {
      if ((-[VCTransportSessionSocket initializeNetworkInfoWithSocket:](v11, "initializeNetworkInfoWithSocket:", v9) & 0x80000000) == 0)
      {
        -[VCTransportSessionSocket initializeInterfaceTypeWithSocket:](v11, "initializeInterfaceTypeWithSocket:", v9);
        return v11;
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:].cold.2();
      }
    }
    return 0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VCCloseVFDIfValid(self->_rtpVFD);
  VCCloseVFDIfValid(self->_rtcpVFD);

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionSocket;
  -[VCTransportSession dealloc](&v3, sel_dealloc);
}

- (int)createVFD:(int *)a3 realSocket:(int)a4 sockAddr:(sockaddr_storage *)a5 length:(unsigned int *)a6 isUsable:(BOOL *)a7
{
  int v13;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;

  *a7 = 0;
  *a3 = VTP_SocketWithRealSocket(2, 2, 17, a4);
  if (self->_rtpVFD != -1)
  {
    *a6 = 128;
    if (getpeername(a4, (sockaddr *)a5, a6) == -1)
    {
      *a6 = 16;
      *(_QWORD *)&a5->ss_len = 0;
      a5->__ss_align = 0;
      if (VTP_SetSourceDestinationWithIPPort(*a3) != -1)
        return 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:].cold.2(v17, v18);
      }
    }
    else
    {
      if (VTP_SetSourceDestinationWithIPPort(*a3) != -1)
      {
        v13 = 0;
        *a7 = 1;
        return v13;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:].cold.3(v15, v16);
      }
    }
    return -1;
  }
  v13 = -2144665558;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:].cold.1();
  }
  return v13;
}

- (id)streams
{
  _opaque_pthread_mutex_t *p_stateLock;
  id v4;

  p_stateLock = &self->super._stateLock;
  pthread_mutex_lock(&self->super._stateLock);
  v4 = (id)-[NSMutableArray copy](self->super._streams, "copy");
  pthread_mutex_unlock(p_stateLock);
  return v4;
}

- (int)updateTransportStream:(OpaqueVCTransportStream *)a3
{
  uint64_t CMBaseObject;
  uint64_t (*v5)(uint64_t, const __CFString *, _QWORD, id *);
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
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
  v5 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v5)
  {
    v6 = v5(CMBaseObject, CFSTR("UnderlyingVFD"), *MEMORY[0x1E0C9AE00], &v13);
    if (!v6)
    {
      v7 = objc_msgSend(v13, "intValue");
      v12 = 0;
      if (VTP_GetPktType(v7, (uint64_t)&v12) == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportSessionSocket updateTransportStream:].cold.1();
        }
      }
      else
      {
        if (VTP_SetSourceDestinationWithIPPort(v7) != -1)
        {
          v8 = 0;
          goto LABEL_10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportSessionSocket updateTransportStream:].cold.2();
        }
      }
      v8 = -1;
      goto LABEL_10;
    }
    v8 = v6;
  }
  else
  {
    v8 = -12782;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCTransportSessionSocket updateTransportStream:]";
      v18 = 1024;
      v19 = 149;
      v20 = 2112;
      v21 = CFSTR("UnderlyingVFD");
      v22 = 2112;
      v23 = a3;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not get property '%@' for transport stream '%@'", buf, 0x30u);
    }
  }
LABEL_10:

  return v8;
}

- (int)connectSocket:(int)a3 remoteAddress:(id)a4 storage:(sockaddr_storage *)a5
{
  int v6;
  int v7;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v11[0] = 128;
    v6 = objc_msgSend(a4, "getSockaddrStorage:size:", a5, v11);
    if (v6)
    {
      v7 = v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket connectSocket:remoteAddress:storage:].cold.3();
      }
    }
    else if (VTP_SetSourceDestinationWithIPPort(a3) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket connectSocket:remoteAddress:storage:].cold.2(v9, v10);
      }
      return -1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket connectSocket:remoteAddress:storage:].cold.1();
    }
  }
  return v7;
}

- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4
{
  _opaque_pthread_mutex_t *p_stateLock;
  VCNetworkAddress *v8;
  uint64_t rtpVFD;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  VCNetworkAddress *remoteAddress;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  VCNetworkAddress *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->super._stateLock;
  pthread_mutex_lock(&self->super._stateLock);
  if (-[VCNetworkAddress isEqual:](self->_remoteAddress, "isEqual:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v15 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      remoteAddress = self->_remoteAddress;
      v22 = 136315906;
      v23 = v18;
      v24 = 2080;
      v25 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
      v26 = 1024;
      v27 = 191;
      v28 = 2112;
      v29 = remoteAddress;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New configuration matches current one '%@'. Ignoring...", (uint8_t *)&v22, 0x26u);
    }
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }

  v8 = (VCNetworkAddress *)objc_msgSend(a3, "copy");
  self->_remoteAddress = v8;
  rtpVFD = self->_rtpVFD;
  if ((_DWORD)rtpVFD != -1)
  {
    v10 = -[VCTransportSessionSocket connectSocket:remoteAddress:storage:](self, "connectSocket:remoteAddress:storage:", rtpVFD, v8, &self->_rtpIPPort);
    if (v10)
    {
      v15 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:].cold.3();
      }
      goto LABEL_23;
    }
    self->_rtpIPPortLength = self->_rtpIPPort.ss_len;
    self->_isRTPUsable = 1;
  }
  if (self->_isSharedSocket)
    goto LABEL_13;
  v11 = -[VCNetworkAddress port](self->_remoteAddress, "port");
  -[VCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)(-[VCNetworkAddress port](self->_remoteAddress, "port") + 1));
  if ((a4 - 1) <= 0xFFFFFFFD)
    -[VCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[VCNetworkAddress port](self->_remoteAddress, "port");
      v22 = 136315906;
      v23 = v12;
      v24 = 2080;
      v25 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
      v26 = 1024;
      v27 = 206;
      v28 = 1024;
      LODWORD(v29) = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTCP port is set to '%d'", (uint8_t *)&v22, 0x22u);
    }
  }
  v15 = -[VCTransportSessionSocket connectSocket:remoteAddress:storage:](self, "connectSocket:remoteAddress:storage:", self->_rtcpVFD, self->_remoteAddress, &self->_rtcpIPPort);
  -[VCNetworkAddress setPort:](self->_remoteAddress, "setPort:", v11);
  if (!v15)
  {
    self->_rtcpIPPortLength = self->_rtcpIPPort.ss_len;
    self->_isRTCPUsable = 1;
LABEL_13:
    v16 = -[NSMutableArray count](self->super._streams, "count") - 1;
    while ((v16 & 0x80000000) == 0)
    {
      v17 = -[VCTransportSessionSocket updateTransportStream:](self, "updateTransportStream:", -[NSMutableArray objectAtIndexedSubscript:](self->super._streams, "objectAtIndexedSubscript:", v16--));
      if (v17)
      {
        v15 = v17;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:].cold.1();
        }
        goto LABEL_23;
      }
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:].cold.2();
  }
LABEL_23:
  pthread_mutex_unlock(p_stateLock);
  return v15;
}

- (int)setAudioRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *a3 = self->_rtpVFD;
  *a4 = 16;
  v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable)
    return 0;
  else
    return -2144665536;
}

- (int)setAudioRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  int *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;

  if (self->_isSharedSocket)
    v6 = &OBJC_IVAR___VCTransportSessionSocket__rtpVFD;
  else
    v6 = &OBJC_IVAR___VCTransportSessionSocket__rtcpVFD;
  *a3 = *(_DWORD *)((char *)&self->super.super.isa + *v6);
  *a4 = 64;
  v7 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[32];
  v9 = *(_OWORD *)&self->_rtcpIPPort.ss_len;
  v8 = *(_OWORD *)self->_rtcpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v7;
  *(_OWORD *)&a5->ss_len = v9;
  *(_OWORD *)a5->__ss_pad2 = v8;
  v10 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[96];
  v12 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[48];
  v11 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v10;
  *(_OWORD *)&a5->__ss_pad2[48] = v12;
  *(_OWORD *)&a5->__ss_pad2[64] = v11;
  *a6 = self->_rtcpIPPortLength;
  if (self->_isRTCPUsable)
    v13 = 0;
  else
    v13 = -2144665536;
  if (self->_isSharedSocket)
  {
    if (self->_isRTPUsable)
      return 0;
    else
      return -2144665536;
  }
  return v13;
}

- (int)setVideoRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *a3 = self->_rtpVFD;
  *a4 = 32;
  v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable)
    return 0;
  else
    return -2144665536;
}

- (int)setVideoRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  int *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;

  if (self->_isSharedSocket)
    v6 = &OBJC_IVAR___VCTransportSessionSocket__rtpVFD;
  else
    v6 = &OBJC_IVAR___VCTransportSessionSocket__rtcpVFD;
  *a3 = *(_DWORD *)((char *)&self->super.super.isa + *v6);
  *a4 = 128;
  v7 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[32];
  v9 = *(_OWORD *)&self->_rtcpIPPort.ss_len;
  v8 = *(_OWORD *)self->_rtcpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v7;
  *(_OWORD *)&a5->ss_len = v9;
  *(_OWORD *)a5->__ss_pad2 = v8;
  v10 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[96];
  v12 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[48];
  v11 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v10;
  *(_OWORD *)&a5->__ss_pad2[48] = v12;
  *(_OWORD *)&a5->__ss_pad2[64] = v11;
  *a6 = self->_rtcpIPPortLength;
  if (self->_isRTCPUsable)
    v13 = 0;
  else
    v13 = -2144665536;
  if (self->_isSharedSocket)
  {
    if (self->_isRTPUsable)
      return 0;
    else
      return -2144665536;
  }
  return v13;
}

- (int)setBasebandNotificationStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  *a3 = self->_rtpVFD;
  *a4 = 256;
  v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable)
    return 0;
  else
    return -2144665536;
}

- (int)configureParamatersForStreamType:(unsigned int)a3 socket:(int *)a4 packetType:(int *)a5 remoteIP:(sockaddr_storage *)a6 remoteIPLength:(unsigned int *)a7
{
  int v7;
  int v8;

  switch(a3)
  {
    case 1u:
      v7 = -[VCTransportSessionSocket setBasebandNotificationStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:](self, "setBasebandNotificationStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:", a4, a5, a6, a7);
      goto LABEL_13;
    case 3u:
      v7 = -[VCTransportSessionSocket setAudioRTPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:](self, "setAudioRTPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:", a4, a5, a6, a7);
      goto LABEL_13;
    case 4u:
      v7 = -[VCTransportSessionSocket setAudioRTCPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:](self, "setAudioRTCPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:", a4, a5, a6, a7);
      goto LABEL_13;
    case 5u:
      v7 = -[VCTransportSessionSocket setVideoRTPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:](self, "setVideoRTPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:", a4, a5, a6, a7);
      goto LABEL_13;
    case 6u:
      v7 = -[VCTransportSessionSocket setVideoRTCPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:](self, "setVideoRTCPStreamParamatersForSocket:packetType:remoteIP:remoteIPLength:", a4, a5, a6, a7);
LABEL_13:
      v8 = v7;
      if (!v7)
        return v8;
      goto LABEL_6;
    default:
      v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:].cold.2();
      }
LABEL_6:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:].cold.1();
      }
      return v8;
  }
}

- (int)createAndConfigureVFDForSocket:(int)a3 packetType:(int)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int)a6 vfd:(int *)a7
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  v10 = VTP_DuplicateVFD(a3);
  if ((_DWORD)v10 == -1)
  {
    v13 = -2144665558;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:].cold.1();
    }
    goto LABEL_8;
  }
  v11 = v10;
  if (self->_isSharedSocket)
    v12 = 2;
  else
    v12 = 1;
  if (VTP_SetSocketMode(v10, v12) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:].cold.2();
    }
    goto LABEL_19;
  }
  if (VTP_SetPktType(v11, a4) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:].cold.3();
    }
LABEL_19:
    v13 = -1;
    goto LABEL_9;
  }
  v13 = 0;
  *a7 = v11;
LABEL_8:
  v11 = 0xFFFFFFFFLL;
LABEL_9:
  VCCloseVFDIfValid(v11);
  return v13;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  int v6;
  int v7;
  int v8;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  _OWORD v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, sizeof(v14));
  v12 = -1;
  v13 = 0;
  v10 = 0;
  v11 = -1;
  v6 = -[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:](self, "configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:", *(_QWORD *)&a4, &v12, &v10, v14, &v13);
  if (v6)
  {
    v8 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket createVFD:forStreamType:].cold.3();
    }
  }
  else
  {
    v7 = -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:](self, "createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:", v12, v10, v14, v13, &v11);
    if (v7)
    {
      v8 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket createVFD:forStreamType:].cold.2();
      }
    }
    else if (v11 == -1)
    {
      v8 = -2144665558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTransportSessionSocket createVFD:forStreamType:].cold.1();
      }
    }
    else
    {
      v8 = 0;
      *a3 = v11;
      v11 = -1;
    }
  }
  VCCloseVFDIfValid(v11);
  return v8;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *networkInterfaceName;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCTransportSessionSocket start]";
      v9 = 1024;
      v10 = 348;
      v11 = 2080;
      networkInterfaceName = self->_networkInterfaceName;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating NW Connection based on network interface=%s", (uint8_t *)&v5, 0x26u);
    }
  }
  -[VCTransportSession setupNWMonitor](self, "setupNWMonitor");
  -[VCTransportSessionSocket addNetworkAssertion](self, "addNetworkAssertion");
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, 0);
}

- (void)stop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCTransportSession destroyNWMonitor](self, "destroyNWMonitor");
  -[VCTransportSessionSocket removeNetworkAssertion](self, "removeNetworkAssertion");
  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionSocket;
  -[VCTransportSession stop](&v3, sel_stop);
}

- (void)initializeInterfaceTypeWithSocket:(int)a3
{
  int LocalIFFunctionalTypeForBoundSocket;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  LocalIFFunctionalTypeForBoundSocket = GetLocalIFFunctionalTypeForBoundSocket();
  GetLocalIFNameForBoundSocket();
  switch(LocalIFFunctionalTypeForBoundSocket)
  {
    case 1:
      v5 = 5;
      goto LABEL_11;
    case 2:
      v5 = 1;
      goto LABEL_11;
    case 3:
      if (!strcmp(self->_networkInterfaceName, "llw0"))
        v5 = 2;
      else
        v5 = 3;
      goto LABEL_11;
    case 4:
      v5 = 4;
LABEL_11:
      self->_networkInterfaceType = v5;
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCTransportSessionSocket initializeInterfaceTypeWithSocket:]";
          v12 = 1024;
          v13 = 384;
          v14 = 1024;
          v15 = LocalIFFunctionalTypeForBoundSocket;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not setting unexpected transport type %d", (uint8_t *)&v8, 0x22u);
        }
      }
      break;
  }
}

- (int)initializeNetworkInfoWithSocket:(int)a3
{
  sockaddr v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  socklen_t v9;
  sockaddr v10;
  sockaddr v11;
  sockaddr v12;
  sockaddr v13;
  sockaddr v14;
  sockaddr v15;
  sockaddr v16;
  sockaddr v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v16 = v4;
  v17 = v4;
  v14 = v4;
  v15 = v4;
  v12 = v4;
  v13 = v4;
  v10 = v4;
  v11 = v4;
  v9 = 128;
  if (getsockname(a3, &v10, &v9))
  {
    v5 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionSocket initializeNetworkInfoWithSocket:].cold.1();
    }
  }
  else
  {
    v5 = 0;
    v6 = v10.sa_family == 30;
    self->_isIPv6 = v6;
    if (v6)
      v7 = 1280;
    else
      v7 = 1450;
    self->_networkMTU = v7;
  }
  return v5;
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
  char *networkInterfaceName;
  char isIPv6;
  OS_dispatch_queue *v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  networkInterfaceName = self->_networkInterfaceName;
  isIPv6 = self->_isIPv6;
  v5 = -[VCTransportSession nwMonitorEventHandlerQueue](self, "nwMonitorEventHandlerQueue");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__VCTransportSessionSocket_createNWMonitor__block_invoke;
  v7[3] = &unk_1E9E521C0;
  v7[4] = self;
  return (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_CreateWithInterfaceName((uint64_t)networkInterfaceName, 16, isIPv6, (uint64_t)v5, (uint64_t)v7);
}

uint64_t __43__VCTransportSessionSocket_createNWMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupNWMonitorNotificationHandler");
}

- (void)addNetworkAssertion
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCTransportSessionSocket_addNetworkAssertion__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __47__VCTransportSessionSocket_addNetworkAssertion__block_invoke(uint64_t a1)
{
  void *v1;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)VCTransportSessionSocket;
  return objc_msgSendSuper2(&v3, sel_addNetworkAssertionWithInterfaceType_, objc_msgSend(v1, "networkInterfaceType"));
}

- (void)removeNetworkAssertion
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__VCTransportSessionSocket_removeNetworkAssertion__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __50__VCTransportSessionSocket_removeNetworkAssertion__block_invoke(uint64_t a1)
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VCTransportSessionSocket;
  return objc_msgSendSuper2(&v2, sel_removeNetworkAssertion);
}

- (int)networkInterfaceType
{
  return self->_networkInterfaceType;
}

- (unsigned)networkMTU
{
  return self->_networkMTU;
}

- (BOOL)isIPv6
{
  return self->_isIPv6;
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'socketDictionary' may not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 'rtcpSocket' may not be kVCInvalidSocket for regular mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 'rtpSocket' may not be kVCInvalidSocket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid RTP socket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d initializeNetworkMTUWithSocket failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d _rtcpVFD creation failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d _rtpVFD creation failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:realSocket:sockAddr:length:isUsable:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d vfd creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:(uint64_t)a1 realSocket:(NSObject *)a2 sockAddr:length:isUsable:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a2, v3, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed with error '%d'", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)createVFD:(uint64_t)a1 realSocket:(NSObject *)a2 sockAddr:length:isUsable:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a2, v3, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed with error '%d'", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)updateTransportStream:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_GetPktType failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateTransportStream:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectSocket:remoteAddress:storage:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'address' must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)connectSocket:(uint64_t)a1 remoteAddress:(NSObject *)a2 storage:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a2, v3, " [%s] %s:%d connect failed with error '%d'", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)connectSocket:remoteAddress:storage:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket connectSocket:remoteAddress:storage:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d getSockaddrStorage:size: failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket connectSocket:remoteAddress:storage:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
  OUTLINED_FUNCTION_4();
  v4 = 217;
  v5 = 2112;
  v6 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set up remoteAddress on transport stream '%@'", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up remoteAddress on rtcpSocket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up remoteAddress on rtpSocket", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d sourceDestinationInfo has not been set. streamType=%d", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid stream type '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP socket creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetSocketMode failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP_SetPktType failed", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VTP socket creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set vfd parameters for socket '%d'", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)createVFD:forStreamType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure transport stream parameters for socket '%d'", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initializeNetworkInfoWithSocket:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCTransportSessionSocket initializeNetworkInfoWithSocket:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d getsockname(%d) failed", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initializeNetworkInfoWithSocket:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
