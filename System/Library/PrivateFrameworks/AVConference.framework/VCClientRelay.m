@implementation VCClientRelay

- (VCClientRelay)initWithIDSSocket:(int)a3
{
  VCClientRelay *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCClientRelay;
  result = -[VCClientRelay init](&v5, sel_init);
  if (result)
  {
    result->_vtpSocket = -1;
    result->_vtpReceiveTID = 0;
    if (a3 != -1)
    {
      result->_idsSocket = a3;
      return result;
    }

  }
  else
  {
    close(a3);
  }
  return 0;
}

- (void)dealloc
{
  int idsSocket;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  idsSocket = self->_idsSocket;
  if (idsSocket != -1)
    close(idsSocket);
  v4.receiver = self;
  v4.super_class = (Class)VCClientRelay;
  -[VCClientRelay dealloc](&v4, sel_dealloc);
}

- (void)setConnectionResult:(tagCONNRESULT *)a3
{
  if (a3)
  {
    memcpy(&self->_connectionResult, a3, sizeof(self->_connectionResult));
    self->_isConnectionResultSet = 1;
  }
}

- (int)setupVTPSocket
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  BOOL v12;
  int ai_family;
  int v14;
  addrinfo *v15;
  addrinfo *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  int v26;
  char iFlags;
  int v28;
  int v29;
  addrinfo *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  int vtpSocket;
  addrinfo *v36;
  addrinfo v37;
  char v38[8];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BYTE v46[24];
  __int16 v47;
  unsigned int v48;
  _OWORD v49[3];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = v4;
        v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        v43 = 1024;
        v44 = 69;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCClientRelay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v40 = v9;
        v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        v43 = 1024;
        v44 = 69;
        v45 = 2112;
        *(_QWORD *)v46 = v3;
        *(_WORD *)&v46[8] = 2048;
        *(_QWORD *)&v46[10] = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v36 = (addrinfo *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49[1] = v11;
  v49[2] = v11;
  v49[0] = v11;
  memset(v38, 170, 6);
  if (self->_isConnectionResultSet)
  {
    v12 = (self->_connectionResult.mbLocal.iFlags & 1) == 0;
    memset(&v37.ai_socktype, 0, 32);
    if (v12)
      ai_family = 2;
    else
      ai_family = 30;
    v37.ai_next = 0;
    v37.ai_flags = 1;
    v37.ai_family = ai_family;
    v37.ai_socktype = 2;
    IPToString();
    __sprintf_chk(v38, 0, 6uLL, "%u", self->_connectionResult.mbLocal.wPort);
    v14 = getaddrinfo((const char *)v49, v38, &v37, &v36);
    if (v14 || (v15 = v36) == 0)
    {
      v17 = v14 | 0xB0270000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v40 = v20;
          v41 = 2080;
          v42 = "-[VCClientRelay setupVTPSocket]";
          v43 = 1024;
          v44 = 96;
          v45 = 1024;
          *(_DWORD *)v46 = 96;
          *(_WORD *)&v46[4] = 2080;
          *(_QWORD *)&v46[6] = v49;
          *(_WORD *)&v46[14] = 2080;
          *(_QWORD *)&v46[16] = v38;
          v47 = 1024;
          v48 = v17;
          v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRela"
                "y.m:%d: getaddrinfo(%s,%s) failed(%08X)";
LABEL_28:
          v23 = v21;
          v24 = 60;
LABEL_29:
          _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
        }
      }
    }
    else
    {
      v16 = v36;
      while (v16->ai_family != ai_family)
      {
        v16 = v16->ai_next;
        if (!v16)
        {
          ai_family = v36->ai_family;
          goto LABEL_31;
        }
      }
      v15 = v16;
LABEL_31:
      v25 = VTP_Socket(ai_family, v15->ai_socktype, v15->ai_protocol);
      self->_vtpSocket = v25;
      if (v25 == -1)
      {
        v17 = *__error() | 0xC0270000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCClientRelay setupVTPSocket].cold.2();
        }
        freeaddrinfo(v36);
        goto LABEL_48;
      }
      VTP_SetSocketMode(v25, 2);
      v26 = VTP_Bind(self->_vtpSocket, (uint64_t)v15->ai_addr, v15->ai_addrlen);
      freeaddrinfo(v36);
      if (v26 != -1)
      {
        iFlags = self->_connectionResult.mbDst.iFlags;
        memset(&v37, 0, sizeof(v37));
        if ((iFlags & 1) != 0)
          v28 = 30;
        else
          v28 = 2;
        v37.ai_family = v28;
        v37.ai_socktype = 2;
        IPToString();
        __sprintf_chk(v38, 0, 6uLL, "%u", self->_connectionResult.mbDst.wPort);
        v29 = getaddrinfo((const char *)v49, v38, &v37, &v36);
        if (v29 != -1)
        {
          v30 = v36;
          if (v36)
          {
            memcpy(&self->_vtpDestination, v36->ai_addr, v36->ai_addrlen);
            self->_vtpDestinationLength = v30->ai_addrlen;
            freeaddrinfo(v30);
            return 0;
          }
        }
        v17 = v29 | 0xB0270000;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_48;
        v33 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        *(_DWORD *)buf = 136316674;
        v40 = v33;
        v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        v43 = 1024;
        v44 = 137;
        v45 = 1024;
        *(_DWORD *)v46 = 137;
        *(_WORD *)&v46[4] = 2080;
        *(_QWORD *)&v46[6] = v49;
        *(_WORD *)&v46[14] = 2080;
        *(_QWORD *)&v46[16] = v38;
        v47 = 1024;
        v48 = v17;
        v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay."
              "m:%d: getaddrinfo(%s,%s) failed(%08X)";
        goto LABEL_28;
      }
      v17 = *__error() | 0xC0270000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v40 = v31;
          v41 = 2080;
          v42 = "-[VCClientRelay setupVTPSocket]";
          v43 = 1024;
          v44 = 124;
          v45 = 1024;
          *(_DWORD *)v46 = 124;
          *(_WORD *)&v46[4] = 2080;
          *(_QWORD *)&v46[6] = v38;
          *(_WORD *)&v46[14] = 1024;
          *(_DWORD *)&v46[16] = v17;
          v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRela"
                "y.m:%d: bind on %s failed(%08X)";
          v23 = v32;
          v24 = 50;
          goto LABEL_29;
        }
      }
    }
LABEL_48:
    vtpSocket = self->_vtpSocket;
    if (vtpSocket != -1)
      VTP_Close(vtpSocket);
    return v17;
  }
  v17 = -2144927727;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCClientRelay setupVTPSocket].cold.1(v18, v19);
  }
  return v17;
}

- (int)startRelay
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  CFDictionaryRef v12;
  int v13;
  unsigned int v14;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v16;
  OS_dispatch_source *v17;
  _QWORD v19[5];
  void *values;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCClientRelay *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = v4;
        v23 = 2080;
        v24 = "-[VCClientRelay startRelay]";
        v25 = 1024;
        v26 = 157;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCClientRelay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v22 = v9;
        v23 = 2080;
        v24 = "-[VCClientRelay startRelay]";
        v25 = 1024;
        v26 = 157;
        v27 = 2112;
        v28 = v3;
        v29 = 2048;
        v30 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v11 = -[VCClientRelay setupVTPSocket](self, "setupVTPSocket");
  if (v11 < 0)
  {
    v14 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCClientRelay startRelay].cold.1();
    }
  }
  else
  {
    self->_stopVTPReceiveThread = 0;
    values = CFSTR("com.apple.videoconference.VCClientRelayVTPReceiveProc");
    v12 = CFDictionaryCreate(0, MEMORY[0x1E0CA52C8], (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v13 = FigThreadCreate();
    if (v12)
      CFRelease(v12);
    if (v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCClientRelay startRelay].cold.5();
      }
      v14 = v13 | 0xA0270000;
    }
    else
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
      v16 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCClientRelay.idsReadQueue", 0, CustomRootQueue);
      self->_idsReadQueue = v16;
      if (v16)
      {
        v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], self->_idsSocket, 0, (dispatch_queue_t)v16);
        self->_idsReadSource = v17;
        if (v17)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __27__VCClientRelay_startRelay__block_invoke;
          v19[3] = &unk_1E9E521C0;
          v19[4] = self;
          dispatch_source_set_event_handler((dispatch_source_t)v17, v19);
          dispatch_resume((dispatch_object_t)self->_idsReadSource);
          if (!VTP_SetClientRelayVFD(self->_connectionResult.dwCallID, self->_vtpSocket))
            return 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCClientRelay startRelay].cold.4();
          }
          v14 = *__error() | 0xC0270000;
        }
        else
        {
          v14 = -2144927740;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCClientRelay startRelay].cold.3();
          }
        }
      }
      else
      {
        v14 = -2144927740;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCClientRelay startRelay].cold.2();
        }
      }
    }
  }
  -[VCClientRelay stopRelay](self, "stopRelay");
  return v14;
}

uint64_t __27__VCClientRelay_startRelay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayIDSPacket");
}

- (int)stopRelay
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  int vtpSocket;
  NSObject *idsReadSource;
  NSObject *v13;
  NSObject *idsReadQueue;
  _BYTE v16[12];
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCClientRelay *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 136315650;
        *(_QWORD *)&v16[4] = v4;
        v17 = 2080;
        v18 = "-[VCClientRelay stopRelay]";
        v19 = 1024;
        v20 = 218;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v16, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCClientRelay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 136316162;
        *(_QWORD *)&v16[4] = v9;
        v17 = 2080;
        v18 = "-[VCClientRelay stopRelay]";
        v19 = 1024;
        v20 = 218;
        v21 = 2112;
        v22 = v3;
        v23 = 2048;
        v24 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(_QWORD *)v16 = 0xAAAAAAAAAAAAAAAALL;
  if (self->_isConnectionResultSet)
    VTP_SetClientRelayVFD(self->_connectionResult.dwCallID, -1);
  vtpSocket = self->_vtpSocket;
  if (vtpSocket != -1)
  {
    VTP_Close(vtpSocket);
    self->_vtpSocket = -1;
  }
  self->_stopVTPReceiveThread = 1;
  if (self->_vtpReceiveTID)
  {
    FigThreadJoin();
    self->_vtpReceiveTID = 0;
  }
  idsReadSource = self->_idsReadSource;
  if (idsReadSource)
  {
    dispatch_source_cancel(idsReadSource);
    v13 = self->_idsReadSource;
    if (v13)
    {
      dispatch_release(v13);
      self->_idsReadSource = 0;
    }
  }
  idsReadQueue = self->_idsReadQueue;
  if (idsReadQueue)
  {
    dispatch_release(idsReadQueue);
    self->_idsReadQueue = 0;
  }
  return 0;
}

- (BOOL)relayIDSPacket
{
  int v3;
  int v4;
  BOOL v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int idsSocket;
  int vtpSocket;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  VCClientRelay *v39;
  _BYTE v40[6];
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  _OWORD v47[20];
  _BYTE __b[1472];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v3 = recv(self->_idsSocket, __b, 0x5C0uLL, 0);
  if (v3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCClientRelay relayIDSPacket].cold.1(v7, v8);
    }
    return 0;
  }
  else
  {
    memset(v47, 0, sizeof(v47));
    v4 = VTP_Sendto(self->_vtpSocket, __b, v3, 0, (uint64_t)&self->_vtpDestination, self->_vtpDestinationLength, (int *)v47);
    v5 = v4 == v3;
    if (v4 != v3)
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCClientRelay relayIDSPacket].cold.2();
      }
      return v5;
    }
    if ((VCClientRelay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return v5;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          return v5;
        vtpSocket = self->_vtpSocket;
        idsSocket = self->_idsSocket;
        v31 = 136316674;
        v32 = v10;
        v33 = 2080;
        v34 = "-[VCClientRelay relayIDSPacket]";
        v35 = 1024;
        v36 = 265;
        v37 = 1024;
        *(_DWORD *)v38 = idsSocket;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v3;
        LOWORD(v39) = 1024;
        *(_DWORD *)((char *)&v39 + 2) = vtpSocket;
        HIWORD(v39) = 1024;
        *(_DWORD *)v40 = v3;
        v15 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
        v16 = v11;
        v17 = 52;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v31, v17);
        return v5;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        return v5;
      v30 = self->_vtpSocket;
      v29 = self->_idsSocket;
      v31 = 136316674;
      v32 = v10;
      v33 = 2080;
      v34 = "-[VCClientRelay relayIDSPacket]";
      v35 = 1024;
      v36 = 265;
      v37 = 1024;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v3;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = v30;
      HIWORD(v39) = 1024;
      *(_DWORD *)v40 = v3;
      v25 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
      v26 = v11;
      v27 = 52;
LABEL_29:
      _os_log_debug_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v31, v27);
      return v5;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCClientRelay performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v20 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          return v5;
        v22 = self->_vtpSocket;
        v21 = self->_idsSocket;
        v31 = 136317186;
        v32 = v18;
        v33 = 2080;
        v34 = "-[VCClientRelay relayIDSPacket]";
        v35 = 1024;
        v36 = 265;
        v37 = 2112;
        *(_QWORD *)v38 = v6;
        *(_WORD *)&v38[8] = 2048;
        v39 = self;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = v21;
        v41 = 1024;
        v42 = v3;
        v43 = 1024;
        v44 = v22;
        v45 = 1024;
        v46 = v3;
        v15 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
        v16 = v19;
        v17 = 72;
        goto LABEL_23;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        return v5;
      v24 = self->_vtpSocket;
      v23 = self->_idsSocket;
      v31 = 136317186;
      v32 = v18;
      v33 = 2080;
      v34 = "-[VCClientRelay relayIDSPacket]";
      v35 = 1024;
      v36 = 265;
      v37 = 2112;
      *(_QWORD *)v38 = v6;
      *(_WORD *)&v38[8] = 2048;
      v39 = self;
      *(_WORD *)v40 = 1024;
      *(_DWORD *)&v40[2] = v23;
      v41 = 1024;
      v42 = v3;
      v43 = 1024;
      v44 = v24;
      v45 = 1024;
      v46 = v3;
      v25 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
      v26 = v19;
      v27 = 72;
      goto LABEL_29;
    }
  }
  return v5;
}

- (BOOL)relayVTPPacket
{
  int vtpSocket;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  ssize_t v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int idsSocket;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[10];
  VCClientRelay *v46;
  _BYTE v47[6];
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int128 v54[8];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  memset(v54, 0, sizeof(v54));
  vtpSocket = self->_vtpSocket;
  if (__darwin_check_fd_set_overflow(vtpSocket, v54, 0))
    *(_DWORD *)((char *)v54 + (((unint64_t)vtpSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpSocket;
  v4 = VTP_Select((self->_vtpSocket + 1), v54, 0, 0, 0);
  if (v4 != -1)
  {
    if (VTP_Recvfrom(self->_vtpSocket, &v37))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCClientRelay relayVTPPacket].cold.2(v5, v6);
      }
      return v4 != -1;
    }
    v9 = send(self->_idsSocket, *((const void **)v37 + 65), *((_QWORD *)v37 + 64), 0);
    v10 = v9;
    if (v9 != *((_QWORD *)v37 + 64) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCClientRelay relayVTPPacket].cold.1();
    }
    if ((VCClientRelay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_31;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *((_QWORD *)v37 + 64);
          v16 = self->_vtpSocket;
          idsSocket = self->_idsSocket;
          *(_DWORD *)buf = 136316674;
          v39 = v12;
          v40 = 2080;
          v41 = "-[VCClientRelay relayVTPPacket]";
          v42 = 1024;
          v43 = 297;
          v44 = 1024;
          *(_DWORD *)v45 = v16;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = v15;
          LOWORD(v46) = 1024;
          *(_DWORD *)((char *)&v46 + 2) = idsSocket;
          HIWORD(v46) = 1024;
          *(_DWORD *)v47 = v10;
          v18 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
          v19 = v13;
          v20 = 52;
LABEL_27:
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
LABEL_31:
        VTP_ReleasePacket(&v37);
        return v4 != -1;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        goto LABEL_31;
      v34 = *((_QWORD *)v37 + 64);
      v35 = self->_vtpSocket;
      v36 = self->_idsSocket;
      *(_DWORD *)buf = 136316674;
      v39 = v12;
      v40 = 2080;
      v41 = "-[VCClientRelay relayVTPPacket]";
      v42 = 1024;
      v43 = 297;
      v44 = 1024;
      *(_DWORD *)v45 = v35;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v34;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = v36;
      HIWORD(v46) = 1024;
      *(_DWORD *)v47 = v10;
      v30 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
      v31 = v13;
      v32 = 52;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCClientRelay performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_31;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      v23 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *((_QWORD *)v37 + 64);
          v25 = self->_vtpSocket;
          v26 = self->_idsSocket;
          *(_DWORD *)buf = 136317186;
          v39 = v21;
          v40 = 2080;
          v41 = "-[VCClientRelay relayVTPPacket]";
          v42 = 1024;
          v43 = 297;
          v44 = 2112;
          *(_QWORD *)v45 = v11;
          *(_WORD *)&v45[8] = 2048;
          v46 = self;
          *(_WORD *)v47 = 1024;
          *(_DWORD *)&v47[2] = v25;
          v48 = 1024;
          v49 = v24;
          v50 = 1024;
          v51 = v26;
          v52 = 1024;
          v53 = v10;
          v18 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
          v19 = v22;
          v20 = 72;
          goto LABEL_27;
        }
        goto LABEL_31;
      }
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        goto LABEL_31;
      v27 = *((_QWORD *)v37 + 64);
      v28 = self->_vtpSocket;
      v29 = self->_idsSocket;
      *(_DWORD *)buf = 136317186;
      v39 = v21;
      v40 = 2080;
      v41 = "-[VCClientRelay relayVTPPacket]";
      v42 = 1024;
      v43 = 297;
      v44 = 2112;
      *(_QWORD *)v45 = v11;
      *(_WORD *)&v45[8] = 2048;
      v46 = self;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = v28;
      v48 = 1024;
      v49 = v27;
      v50 = 1024;
      v51 = v29;
      v52 = 1024;
      v53 = v10;
      v30 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
      v31 = v22;
      v32 = 72;
    }
    _os_log_debug_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEBUG, v30, buf, v32);
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCClientRelay relayVTPPacket].cold.3(v7, v8);
  }
  return v4 != -1;
}

- (BOOL)stopVTPReceiveThread
{
  return self->_stopVTPReceiveThread;
}

- (void)setupVTPSocket
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_4(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: socket failed(%08X)", v1);
  OUTLINED_FUNCTION_3();
}

- (void)startRelay
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_4(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: VTPRecvProcVCCR thread create failed(%d)", v1);
  OUTLINED_FUNCTION_3();
}

- (void)relayIDSPacket
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_2_10(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: relayIDSPacket: VTP_Sendto: sentBytes = %d, errno = %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_1();
}

- (void)relayVTPPacket
{
  uint64_t v3;
  uint8_t v4[40];

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_4(&dword_1D8A54000, a2, v3, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: VCClientRelayVTPReceiveProc: VTP_Select failed(%d)", v4);
  OUTLINED_FUNCTION_3_0();
}

@end
