@implementation VCMediaStream

+ (BOOL)isSameSRTPKey:(id)a3 newKey:(id)a4
{
  if (a3)
    return objc_msgSend(a3, "isEqualToData:", a4);
  else
    return a4 == 0;
}

- (VCMediaStreamDelegate)delegate
{
  return (VCMediaStreamDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (id)copyDelegate
{
  JUMPOUT(0x1DF086F1CLL);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VCMomentsCollectorDelegate)momentsCollectorDelegate
{
  return (VCMomentsCollectorDelegate *)objc_loadWeak((id *)&self->_momentsCollectorDelegate);
}

- (void)setMomentsCollectorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_momentsCollectorDelegate, a3);
}

- (VCMediaStreamConfig)defaultStreamConfig
{
  if (-[NSMutableArray count](self->_transportArray, "count"))
    return (VCMediaStreamConfig *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_transportArray, "objectAtIndexedSubscript:", 0), "streamConfig");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream defaultStreamConfig].cold.1();
  }
  return 0;
}

- (VCMediaStreamConfig)oneToOneStreamConfig
{
  NSMutableArray *transportArray;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  transportArray = self->_transportArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(transportArray);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "streamConfig"), "multiwayConfig"), "isOneToOne") & 1) != 0)
          return (VCMediaStreamConfig *)objc_msgSend(v7, "streamConfig");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      if (v4)
        continue;
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream oneToOneStreamConfig].cold.1();
  }
  return 0;
}

- (BOOL)isSendingMedia
{
  VCMediaStreamConfig *v2;
  uint64_t v3;

  v2 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  v3 = -[VCMediaStreamConfig direction](v2, "direction");
  if (v3 != 1)
    LOBYTE(v3) = -[VCMediaStreamConfig direction](v2, "direction") == 3;
  return v3;
}

- (void)decryptionStatusChanged:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  VCMediaStream *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if (v3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      v8 = 136316674;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCMediaStream decryptionStatusChanged:]";
      v12 = 1024;
      v13 = 165;
      v14 = 2080;
      v15 = v7;
      v16 = 2048;
      v17 = self;
      v18 = 2080;
      v19 = "-[VCMediaStream decryptionStatusChanged:]";
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s canDecrypt[%d]", (uint8_t *)&v8, 0x40u);
    }
  }
  if (v3)
    self->_decryptionErrorStartTime = NAN;
  pthread_mutex_unlock(&self->_streamLock);
}

- (id)setupRTPWithSocketDictionary:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v7;
        v14 = 2080;
        v15 = "-[VCMediaStream setupRTPWithSocketDictionary:error:]";
        v16 = 1024;
        v17 = 183;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForSockets feature flag set", buf, 0x1Cu);
      }
    }
    if (!-[VCMediaStream initializeTransportSessionWithSocketDictionary:error:](self, "initializeTransportSessionWithSocketDictionary:error:", a3, a4))return 0;
  }
  else
  {
    -[VCMediaStream initializeTransportSetupInfoWithSocketDictionary:](self, "initializeTransportSetupInfoWithSocketDictionary:", a3);
  }
  v11[0] = -[VCMediaStream supportedPayloads](self, "supportedPayloads", CFSTR("avcKeySupportedCodecs"));
  v10[1] = CFSTR("avcKeyRTPLocalSSRC");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_localSSRC);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
}

- (BOOL)initializeTransportSetupInfoWithTransportSession:(id *)a3
{
  VCTransportSession *transportSession;
  uint64_t v5;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  transportSession = self->_transportSession;
  if (transportSession)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__VCMediaStream_initializeTransportSetupInfoWithTransportSession___block_invoke;
    v8[3] = &unk_1E9E56298;
    v8[4] = v5;
    -[VCTransportSession setEventHandler:](self->_transportSession, "setEventHandler:", v8);
    self->_transportSetupInfo.setupType = 5;
    self->_transportSetupInfo.var0.transportStreamInfo.context = self->_transportSession;
    self->_transportSetupInfo.var0.transportStreamInfo.creationCallback = _VCMediaStream_TransportStreamCreationCallback;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream initializeTransportSetupInfoWithTransportSession:].cold.1();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 203), CFSTR("Transport session creation failed"), CFSTR("Invalid parameter"));
  }
  return transportSession != 0;
}

void __66__VCMediaStream_initializeTransportSetupInfoWithTransportSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = (id)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
  objc_msgSend(v5, "handleTransportSessionEvent:info:", a2, a3);

}

- (void)handleTransportSessionEvent:(unsigned int)a3 info:(id)a4
{
  VCMediaStream *v7;
  uint64_t v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  _BYTE v18[24];
  __int128 v19;
  VCMediaStream *v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if (a3 == 1)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_20;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)v18 = 136315906;
      *(_QWORD *)&v18[4] = v11;
      *(_WORD *)&v18[12] = 2080;
      *(_QWORD *)&v18[14] = "-[VCMediaStream handleTransportSessionEvent:info:]";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 230;
      WORD2(v19) = 2112;
      *(_QWORD *)((char *)&v19 + 6) = a4;
      v13 = "VCMediaStream [%s] %s:%d Attempting to connect link=%@";
      v14 = v12;
      v15 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_20;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)v18 = 136316418;
      *(_QWORD *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2080;
      *(_QWORD *)&v18[14] = "-[VCMediaStream handleTransportSessionEvent:info:]";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 230;
      WORD2(v19) = 2112;
      *(_QWORD *)((char *)&v19 + 6) = v10;
      HIWORD(v19) = 2048;
      v20 = self;
      LOWORD(v21) = 2112;
      *(_QWORD *)((char *)&v21 + 2) = a4;
      v13 = "VCMediaStream [%s] %s:%d %@(%p) Attempting to connect link=%@";
      v14 = v17;
      v15 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v18, v15);
LABEL_20:
    v7 = self;
    v8 = 1;
    v9 = 0;
    goto LABEL_21;
  }
  if (a3 != 7)
    goto LABEL_22;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream handleTransportSessionEvent:info:].cold.1();
  }
  v7 = self;
  v8 = 0;
  v9 = a4;
LABEL_21:
  -[VCMediaStream handleStartDidSucceed:withError:](v7, "handleStartDidSucceed:withError:", v8, v9, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, v20, v21);
LABEL_22:
  if (self)
    pthread_mutex_unlock(&self->_streamLock);
}

- (BOOL)initializeTransportSessionWithSocketDictionary:(id)a3 error:(id *)a4
{
  self->_transportSession = (VCTransportSession *)-[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]([VCTransportSessionSocket alloc], "initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:", a3, self->_notificationHandler, self->_packetEventHandler, +[VCVTPWrapper targetQueue](VCVTPWrapper, "targetQueue"), self);
  return -[VCMediaStream initializeTransportSetupInfoWithTransportSession:](self, "initializeTransportSetupInfoWithTransportSession:", a4);
}

- (void)initializeTransportSetupInfoWithSocketDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = xpc_dictionary_dup_fd(a3, "avcKeySharedSocket");
  v6 = v5;
  if ((_DWORD)v5 == -1)
  {
    v5 = xpc_dictionary_dup_fd(a3, "avcKeyRTPSocket");
    v6 = xpc_dictionary_dup_fd(a3, "avcKeyRTCPSocket");
  }
  -[VCMediaStream initializeTransportSetupInfoWithRTPSocket:RTCPSocket:](self, "initializeTransportSetupInfoWithRTPSocket:RTCPSocket:", v5, v6);
}

- (void)initializeTransportSetupInfoWithRTPSocket:(int)a3 RTCPSocket:(int)a4
{
  _VCMediaStreamTransportSetupInfo *p_transportSetupInfo;
  uint64_t v7;
  NSObject *v8;
  int rtpSocket;
  int rtcpSocket;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 1;
  self->_transportSetupInfo.var0.socketInfo.rtpSocket = a3;
  self->_transportSetupInfo.var0.socketInfo.rtcpSocket = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      rtpSocket = p_transportSetupInfo->var0.socketInfo.rtpSocket;
      rtcpSocket = p_transportSetupInfo->var0.socketInfo.rtcpSocket;
      v11 = 136316418;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VCMediaStream initializeTransportSetupInfoWithRTPSocket:RTCPSocket:]";
      v15 = 1024;
      v16 = 266;
      v17 = 1024;
      v18 = a3 == a4;
      v19 = 1024;
      v20 = rtpSocket;
      v21 = 1024;
      v22 = rtcpSocket;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d isShared:%d sockets rtp(%d) rtcp(%d)", (uint8_t *)&v11, 0x2Eu);
    }
  }
}

- (void)cleanupNWConnection:(id *)a3
{
  if (a3)
  {
    if (*a3)
    {
      nw_connection_cancel((nw_connection_t)*a3);
      nw_connection_set_state_changed_handler((nw_connection_t)*a3, 0);
      nw_release(*a3);
      *a3 = 0;
    }
  }
}

- (BOOL)shouldUseNWConnectionBackingSocket
{
  return 1;
}

- (BOOL)initializeTransportSessionWithRTPNWConnectionID:(id)a3 rtcpNWConnectionID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  VCTransportSession *transportSession;
  uint64_t v10;
  VCTransportSessionSocket *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_transportSession = (VCTransportSession *)-[VCTransportSessionNW initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:]([VCTransportSessionNW alloc], "initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:", a3, a4, +[VCVTPWrapper targetQueue](VCVTPWrapper, "targetQueue"), self, self->_notificationHandler, self->_packetEventHandler);
  if (-[VCMediaStream shouldUseNWConnectionBackingSocket](self, "shouldUseNWConnectionBackingSocket"))
  {
    v7 = -[VCTransportSession dupRTPNWConnectionBackingSocket](self->_transportSession, "dupRTPNWConnectionBackingSocket");
    transportSession = self->_transportSession;
    if (transportSession && (_DWORD)v7 != -1)
    {
      v10 = -[VCTransportSession dupRTCPNWConnectionBackingSocket](transportSession, "dupRTCPNWConnectionBackingSocket");

      v11 = -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:]([VCTransportSessionSocket alloc], "initWithRTPSocket:RTCPSocket:", v7, v10);
      self->_transportSession = &v11->super;
      if (!v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v15 = 136316162;
            v16 = v12;
            v17 = 2080;
            v18 = "-[VCMediaStream initializeTransportSessionWithRTPNWConnectionID:rtcpNWConnectionID:error:]";
            v19 = 1024;
            v20 = 296;
            v21 = 1024;
            v22 = v7;
            v23 = 1024;
            v24 = v10;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Failed to create VCTransportSessionSocket with backingRTPSocket=%d, backingRTCPSocket=%d", (uint8_t *)&v15, 0x28u);
          }
        }
        VCCloseSocketIfValid(v7);
        VCCloseSocketIfValid(v10);
      }
    }
  }
  return -[VCMediaStream initializeTransportSetupInfoWithTransportSession:](self, "initializeTransportSetupInfoWithTransportSession:", a5);
}

- (id)setupRTPWithNWConnection:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id result;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamConnectionClientID")))
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamConnectionClientID"));
  else
    v7 = 0;
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPConnectionClientID")))
  {
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPConnectionClientID"));
    if (v7)
      goto LABEL_6;
LABEL_14:
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 320);
    v13 = CFSTR("Invalid Parameter");
    v14 = CFSTR("connectionID should not be nil");
    v15 = a4;
    v16 = 32016;
    v17 = 105;
LABEL_18:
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v15, v16, v17, v12, v13, v14);
    return 0;
  }
  v8 = 0;
  if (!v7)
    goto LABEL_14;
LABEL_6:
  if (self->_transportSetupInfo.setupType == 4)
    -[VCMediaStream cleanupNWConnection:](self, "cleanupNWConnection:", &self->_transportSetupInfo.var0);
  if (_os_feature_enabled_impl())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = v9;
        v25 = 2080;
        v26 = "-[VCMediaStream setupRTPWithNWConnection:error:]";
        v27 = 1024;
        v28 = 332;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForNW feature flag set", buf, 0x1Cu);
      }
    }
    v11 = -[VCMediaStream initializeTransportSessionWithRTPNWConnectionID:rtcpNWConnectionID:error:](self, "initializeTransportSessionWithRTPNWConnectionID:rtcpNWConnectionID:error:", v7, v8, a4);
  }
  else
  {
    v11 = -[VCMediaStream setupNWConnectionWithID:](self, "setupNWConnectionWithID:", v7);
  }
  v18 = v11;
  v21[0] = CFSTR("avcKeySupportedCodecs");
  v22[0] = -[VCMediaStream supportedPayloads](self, "supportedPayloads");
  v21[1] = CFSTR("avcKeyRTPLocalSSRC");
  v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_localSSRC);
  result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  if (!v18)
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 345);
    v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrieve NWConnection for clientID '%@'"), v7);
    v14 = CFSTR("No NWConnection matching clientID found");
    v15 = a4;
    v16 = 32002;
    v17 = 116;
    v12 = v20;
    goto LABEL_18;
  }
  return result;
}

- (void)dupNWConnectionBackingSocket:(int *)a3
{
  _VCMediaStreamTransportSetupInfo *p_transportSetupInfo;
  int connected_socket;
  int v6;
  int v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  void *context;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *a3 = -1;
  p_transportSetupInfo = &self->_transportSetupInfo;
  if (self->_transportSetupInfo.var0.transportStreamInfo.context)
  {
    connected_socket = nw_connection_get_connected_socket();
    if (connected_socket == -1)
      return;
    v6 = connected_socket;
    v7 = dup(connected_socket);
    *a3 = v7;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7 == -1)
    {
      if (ErrorLogLevelForModule >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          context = p_transportSetupInfo->var0.transportStreamInfo.context;
          v19 = 136316162;
          v20 = v16;
          v21 = 2080;
          v22 = "-[VCMediaStream dupNWConnectionBackingSocket:]";
          v23 = 1024;
          v24 = 363;
          v25 = 2048;
          v26 = context;
          v27 = 1024;
          v28 = v6;
          v13 = "VCMediaStream [%s] %s:%d nw_connection %p is backed by socket %d. Failed to dup";
          v14 = v17;
          v15 = 44;
          goto LABEL_10;
        }
      }
    }
    else if (ErrorLogLevelForModule >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = p_transportSetupInfo->var0.transportStreamInfo.context;
        v12 = *a3;
        v19 = 136316418;
        v20 = v9;
        v21 = 2080;
        v22 = "-[VCMediaStream dupNWConnectionBackingSocket:]";
        v23 = 1024;
        v24 = 361;
        v25 = 2048;
        v26 = v11;
        v27 = 1024;
        v28 = v6;
        v29 = 1024;
        v30 = v12;
        v13 = "VCMediaStream [%s] %s:%d nw_connection %p is backed by socket %d duped to %d";
        v14 = v10;
        v15 = 50;
LABEL_10:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream dupNWConnectionBackingSocket:].cold.1();
  }
}

- (BOOL)setupNWConnectionWithID:(id)a3
{
  _VCMediaStreamTransportSetupInfo *p_transportSetupInfo;
  void *v5;
  void *v6;
  NSObject *v7;
  nw_connection_t *p_var0;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  BOOL v13;
  _QWORD handler[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -1;
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a3);
  v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setupNWConnectionWithID:].cold.1();
    }
    goto LABEL_20;
  }
  v24[0] = 0;
  v24[1] = 0;
  objc_msgSend(v5, "getUUIDBytes:", v24);
  +[VCVTPWrapper connectionContext](VCVTPWrapper, "connectionContext");
  v7 = nw_connection_create_with_client_id();
  p_transportSetupInfo->var0.transportStreamInfo.context = v7;
  p_var0 = (nw_connection_t *)&p_transportSetupInfo->var0;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setupNWConnectionWithID:].cold.2();
    }
LABEL_20:
    v13 = 0;
    goto LABEL_10;
  }
  nw_connection_set_queue(v7, (dispatch_queue_t)+[VCVTPWrapper targetQueue](VCVTPWrapper, "targetQueue"));
  v9 = dispatch_semaphore_create(0);
  v10 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v11 = *p_var0;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__VCMediaStream_setupNWConnectionWithID___block_invoke;
  handler[3] = &unk_1E9E56B90;
  handler[6] = &v16;
  handler[7] = &v20;
  handler[4] = v10;
  handler[5] = v9;
  nw_connection_set_state_changed_handler(v11, handler);
  nw_connection_start(*p_var0);
  v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v9, v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setupNWConnectionWithID:].cold.5();
    }
LABEL_30:
    v13 = 0;
    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!*((_BYTE *)v21 + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setupNWConnectionWithID:].cold.3();
    }
    goto LABEL_30;
  }
  if (*((_DWORD *)v17 + 6) != -1)
  {
    -[VCMediaStream cleanupNWConnection:](self, "cleanupNWConnection:", &p_transportSetupInfo->var0);
    -[VCMediaStream initializeTransportSetupInfoWithRTPSocket:RTCPSocket:](self, "initializeTransportSetupInfoWithRTPSocket:RTCPSocket:", *((unsigned int *)v17 + 6), *((unsigned int *)v17 + 6));
    goto LABEL_8;
  }
  if ((VTP_ScheduleReceiveForNWConnection() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setupNWConnectionWithID:].cold.4();
    }
    goto LABEL_30;
  }
LABEL_8:
  v13 = 1;
  if (v9)
LABEL_9:
    dispatch_release(v9);
LABEL_10:

  if (!v13 && p_transportSetupInfo->setupType == 4)
    -[VCMediaStream cleanupNWConnection:](self, "cleanupNWConnection:", &p_transportSetupInfo->var0);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

void __41__VCMediaStream_setupNWConnectionWithID___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCMediaStream setupNWConnectionWithID:]_block_invoke";
      v16 = 1024;
      v17 = 394;
      v18 = 1024;
      LODWORD(v19) = a2;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Get nw connection state %d", (uint8_t *)&v12, 0x22u);
    }
  }
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v12 = 136316162;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCMediaStream setupNWConnectionWithID:]_block_invoke";
        v16 = 1024;
        v17 = 396;
        v18 = 2112;
        v19 = a3;
        v20 = 1024;
        v21 = a2;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Get error %@ from nw connection with state: %d!", (uint8_t *)&v12, 0x2Cu);
      }
    }
  }
  if (a2 != 4)
  {
    if (a2 != 3)
      return;
    v10 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "dupNWConnectionBackingSocket:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setupCallbacksWithNWConnectionMonitor:(tagVCNWConnectionMonitor *)a3
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    v5 = VTP_NWConnectionQueue();
    VCNWConnectionMonitor_SetNotificationHandler(a3, v5, (uint64_t)self, (uint64_t)self->_notificationHandler);
    v6 = VTP_NWConnectionQueue();
    VCNWConnectionMonitor_SetPacketEventHandler(a3, v6, (uint64_t)self, (uint64_t)self->_packetEventHandler);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream setupCallbacksWithNWConnectionMonitor:].cold.1();
  }
}

- (id)setupRTPWithLocalParticipantInfo:(id)a3 error:(id *)a4
{
  NSString *v8;

  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamConnectionClientID")))
    return -[VCMediaStream setupRTPWithNWConnection:error:](self, "setupRTPWithNWConnection:error:", a3, a4);
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestID")))
  {
    v8 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestID"));
    self->_idsDestination = v8;
    return -[VCMediaStream setupRTPWithIDSDestination:error:](self, "setupRTPWithIDSDestination:error:", v8, a4);
  }
  else if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIP")))
  {
    return -[VCMediaStream setupRTPWithIPInfo:error:](self, "setupRTPWithIPInfo:error:", a3, a4);
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 467), CFSTR("Invalid Parameter"), CFSTR("No IDS destination or IP Address specified"));
    return 0;
  }
}

- (id)setupRTPForIDS
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[2];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (!_os_feature_enabled_impl())
  {
    self->_transportSetupInfo.setupType = 2;
LABEL_11:
    v8[0] = CFSTR("avcKeySupportedCodecs");
    v9[0] = -[VCMediaStream supportedPayloads](self, "supportedPayloads");
    v8[1] = CFSTR("avcKeyRTPLocalSSRC");
    v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_localSSRC);
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCMediaStream setupRTPForIDS]";
      v14 = 1024;
      v15 = 479;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForProxy feature flag set", buf, 0x1Cu);
    }
  }
  self->_transportSession = (VCTransportSession *)-[VCTransportSessionProxy initWithTransportSessionID:]([VCTransportSessionProxy alloc], "initWithTransportSessionID:", self->_transportSessionID);
  if (-[VCMediaStream initializeTransportSetupInfoWithTransportSession:](self, "initializeTransportSetupInfoWithTransportSession:", &v7))
  {
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaStream setupRTPForIDS].cold.1(v5);
  }
  return 0;
}

- (id)setupRTPWithIDSDestination:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (_os_feature_enabled_impl())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCMediaStream setupRTPWithIDSDestination:error:]";
          v16 = 1024;
          v17 = 508;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d UseTransportStreamsForIDS feature flag set", buf, 0x1Cu);
        }
      }
      if (!-[VCMediaStream initializeTransportSessionWithIDSDestination:error:](self, "initializeTransportSessionWithIDSDestination:error:", a3, a4))return 0;
LABEL_10:
      v10[0] = CFSTR("avcKeySupportedCodecs");
      v11[0] = -[VCMediaStream supportedPayloads](self, "supportedPayloads");
      v10[1] = CFSTR("avcKeyRTPLocalSSRC");
      v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_localSSRC);
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    }
    if (-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:](self, "initializeTransportSetupInfoWithIDSDestination:error:", a3, a4))
    {
      goto LABEL_10;
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 501), CFSTR("Invalid Parameter"), CFSTR("No IDS destination"));
  }
  return 0;
}

- (BOOL)initializeTransportSessionWithIDSDestination:(id)a3 error:(id *)a4
{
  VCTransportSessionIDSSingleLink *v7;

  v7 = -[VCTransportSessionIDSSingleLink initWithNotificationQueue:reportingAgent:]([VCTransportSessionIDSSingleLink alloc], "initWithNotificationQueue:reportingAgent:", 0, 0);
  self->_transportSession = &v7->super.super;
  -[VCTransportSessionIDS setDestination:](v7, "setDestination:", a3);
  return -[VCMediaStream initializeTransportSetupInfoWithTransportSession:](self, "initializeTransportSetupInfoWithTransportSession:", a4);
}

- (BOOL)initializeTransportSetupInfoWithIDSDestination:(id)a3 error:(id *)a4
{
  _VCMediaStreamTransportSetupInfo *p_transportSetupInfo;
  VCDatagramChannelIDS *v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  VCMediaStream *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_transportSetupInfo = &self->_transportSetupInfo;
  self->_transportSetupInfo.setupType = 2;
  v7 = (VCDatagramChannelIDS *)-[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:error:](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "addDatagramChannelWithDestination:eventHandler:error:", a3, &__block_literal_global_62, a4);
  self->_datagramChannel = v7;
  if (!v7 || !VCDatagramChannelIDS_Token((uint64_t)v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      if (objc_opt_class())
        v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v12 = "<nil>";
      if (a4)
      {
        if (*a4)
          v14 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        else
          v14 = "<nil>";
      }
      else
      {
        v14 = "nil";
      }
      *(_DWORD *)buf = 136316418;
      v17 = v10;
      v18 = 2080;
      v19 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
      v20 = 1024;
      v21 = 546;
      v22 = 2080;
      v23 = v12;
      v24 = 2048;
      v25 = self;
      v26 = 2080;
      v27 = v14;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p]: Create datagram channel failed with error %s", buf, 0x3Au);
    }
LABEL_16:
    LOBYTE(v9) = 0;
    return v9;
  }
  v8 = -[VCDatagramChannelIDS start](self->_datagramChannel, "start");
  if (v8 < 0)
  {
    v13 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32002, 1301, v13, 0, CFSTR("Could not start setup RTP"), CFSTR("datagramChannel start failed"));
    goto LABEL_16;
  }
  p_transportSetupInfo->datagramChannelToken = VCDatagramChannelIDS_Token((uint64_t)self->_datagramChannel);
  LOBYTE(v9) = 1;
  return v9;
}

void __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EB8]);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, "unsignedIntValue") == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315650;
          v9 = v4;
          v10 = 2080;
          v11 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]_block_invoke";
          v12 = 1024;
          v13 = 538;
          v6 = "VCMediaStream [%s] %s:%d IDS channel connected";
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
    else if (objc_msgSend(v3, "unsignedIntValue") == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v7;
        v10 = 2080;
        v11 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]_block_invoke";
        v12 = 1024;
        v13 = 540;
        v6 = "VCMediaStream [%s] %s:%d IDS channel disconnected";
        goto LABEL_13;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke_cold_1();
  }
}

- (id)setupRTPWithIPInfo:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIP"));
  if (objc_msgSend(v7, "length"))
  {
    self->_transportSetupInfo.setupType = 3;
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceInterfaceName"));
    objc_msgSend(v7, "UTF8String");
    MakeIPPORT();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "UTF8String");
      __strlcpy_chk();
    }
    v10[0] = CFSTR("avcKeySourcePort");
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_transportSetupInfo.var0.ipInfo.srcRTPIPPort.wPort);
    v10[1] = CFSTR("avcKeySupportedCodecs");
    v11[1] = -[VCMediaStream supportedPayloads](self, "supportedPayloads");
    v10[2] = CFSTR("avcKeyRTPLocalSSRC");
    v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_localSSRC);
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 574), CFSTR("Invalid Parameter"), CFSTR("No IP Address specified"));
    return 0;
  }
}

- (void)reportTransportInfo
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStream shouldReportNetworkInterfaceType](self, "shouldReportNetworkInterfaceType"))
  {
    if (-[VCTransportSession networkInterfaceType](self->_transportSession, "networkInterfaceType"))
    {
      v3 = CFSTR("TransportType");
      v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCTransportSession networkInterfaceType](self->_transportSession, "networkInterfaceType"));
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
      -[VCObject reportingAgent](self, "reportingAgent");
      reportingGenericEvent();
    }
    else
    {
      -[VCObject reportingAgent](self, "reportingAgent");
      reportingSymptom();
    }
  }
}

- (void)updateTransportsWithConstantConnectionOverhead:(unsigned int)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!VCDefaults_GetBoolValueForKey(CFSTR("disableDynamicMediaPacketHeaderCalculations"), 0))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    transportArray = self->_transportArray;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(transportArray);
          RTPUpdateConstantTransportOverhead(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "rtpHandle"), a3);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
}

- (void)collectChannelSequenceMetrics:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[VCTransportSession networkInterfaceType](self->_transportSession, "networkInterfaceType") == 4
    || -[VCTransportSession networkInterfaceType](self->_transportSession, "networkInterfaceType") == 2)
  {
    v9 = 0;
    v10 = 0;
    v8 = 0;
    if (+[VCWiFiUtils copyAWDLChannelSequence:twoPtFourGhzChannelCount:fiveGhzChannelCount:dfsChannelCount:inactiveSlotCount:](VCWiFiUtils, "copyAWDLChannelSequence:twoPtFourGhzChannelCount:fiveGhzChannelCount:dfsChannelCount:inactiveSlotCount:", &v8, &v10, (char *)&v10 + 4, (char *)&v9 + 4, &v9))
    {
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")), CFSTR("ChannelSequence"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v10)), CFSTR("Unique5GhzChannelCount"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10), CFSTR("Unique2pt4GhzChannelCount"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v9)), CFSTR("UniqueDFSChannelCount"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9), CFSTR("InactiveSlotCount"));
      if ((_DWORD)v9)
      {
        ++self->_channelSequenceCountWithInactiveSlots;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            if (objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")))
              v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",")), "description"), "UTF8String");
            else
              v7 = "<nil>";
            *(_DWORD *)buf = 136315906;
            v12 = v5;
            v13 = 2080;
            v14 = "-[VCMediaStream collectChannelSequenceMetrics:]";
            v15 = 1024;
            v16 = 636;
            v17 = 2080;
            v18 = v7;
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Channel sequence has inactive slots %s", buf, 0x26u);
          }
        }
        if (self->_channelSequenceCountWithInactiveSlots == 2)
        {
          -[VCObject reportingAgent](self, "reportingAgent");
          reportingSymptom();
        }
      }

    }
  }
}

- (VCMediaStream)init
{
  VCMediaStream *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStream;
  v2 = -[VCObject init](&v4, sel_init);
  if (v2)
  {
    v2->_localSSRC = RTPGenerateSSRC();
    v2->_streamToken = VCUniqueIDGenerator_GenerateID();
    -[VCMediaStream setupMediaStream](v2, "setupMediaStream");
  }
  return v2;
}

- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3
{
  VCMediaStream *v4;
  VCMediaStream *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStream;
  v4 = -[VCObject init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_transportSessionID = a3;
    v4->_localSSRC = RTPGenerateSSRC();
    v5->_streamToken = VCUniqueIDGenerator_GenerateID();
    -[VCMediaStream setupMediaStream](v5, "setupMediaStream");
  }
  return v5;
}

- (VCMediaStream)initWithTransportSessionID:(unsigned int)a3 localSSRC:(unsigned int)a4 streamToken:(int64_t)a5
{
  VCMediaStream *v8;
  VCMediaStream *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCMediaStream;
  v8 = -[VCObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_transportSessionID = a3;
    v8->_localSSRC = a4;
    v8->_streamToken = a5;
    v8->_isQoSReportingDisabled = 1;
    -[VCMediaStream setupMediaStream](v8, "setupMediaStream");
  }
  return v9;
}

- (void)setupMediaStream
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  int64_t streamTokenUplink;
  int64_t streamTokenDownlink;
  NSObject *CustomRootQueue;
  uint64_t v9;
  NSObject *v10;
  pthread_mutexattr_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCMediaStream *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_streamTokenUplink = VCUniqueIDGenerator_GenerateID();
  self->_streamTokenDownlink = VCUniqueIDGenerator_GenerateID();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      streamTokenUplink = self->_streamTokenUplink;
      streamTokenDownlink = self->_streamTokenDownlink;
      *(_DWORD *)buf = 136316674;
      v13 = v3;
      v14 = 2080;
      v15 = "-[VCMediaStream setupMediaStream]";
      v16 = 1024;
      v17 = 681;
      v18 = 2048;
      v19 = self;
      v20 = 1024;
      v21 = streamToken;
      v22 = 1024;
      v23 = streamTokenUplink;
      v24 = 1024;
      v25 = streamTokenDownlink;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d (%p) Generated _streamToken=%u streamTokenUplink=%u streamTokenDownlink=%u", buf, 0x38u);
    }
  }
  v11.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v11.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v11);
  pthread_mutexattr_settype(&v11, 2);
  pthread_mutex_init(&self->_streamLock, &v11);
  pthread_mutexattr_destroy(&v11);
  self->_nwMonitorLock._os_unfair_lock_opaque = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaStream.delegateNotificationQueue", 0, CustomRootQueue);
  self->_vcMediaCallback = VCMediaCallback;
  self->_transportArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_transportSetupInfo.isSessionIDValid = self->_transportSessionID != 0;
  if ((VCFeatureFlagManager_SkipNonInfraWiFiAssertion() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCMediaStream setupMediaStream]";
        v16 = 1024;
        v17 = 697;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d NetworkAgent is being asserted by setupMediaStream", buf, 0x1Cu);
      }
    }
    -[VCNetworkAgent addAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "addAssertion");
  }
  +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
  -[VCMediaStream setState:](self, "setState:", 0);
  self->_useRandomTS = 1;
  self->_decryptionErrorStartTime = NAN;
  self->_decryptionTimeoutEnabledTime = NAN;
  self->_rtpTimeoutEnabledTime = NAN;
  self->_rtcpTimeoutEnabledTime = NAN;
  self->_isNWMonitorSignalEnabled = _os_feature_enabled_impl();
  self->_isRTTBasedFIRThrottlingEnabled = VCDefaults_GetBoolValueForKey(CFSTR("useRTTForFIRThrottling"), 0);
  self->_nwMonitorHandlerIndex = -1;
  self->_rttMonitorHandlerIndex = -1;
  -[VCMediaStream registerQoSReportingSource](self, "registerQoSReportingSource");
  self->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E0CF2690]);
  -[VCQoSMonitorManager registerQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "registerQoSReportingSourceForToken:", self->_streamToken);
}

- (void)dealloc
{
  tagVCMediaQueue *mediaQueue;
  uint64_t v4;
  NSObject *v5;
  NSString *callID;
  NSString *idsDestination;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_transportSetupInfo.setupType == 4)
    -[VCMediaStream cleanupNWConnection:](self, "cleanupNWConnection:", &self->_transportSetupInfo.var0);
  -[VCMediaStream destroyNWMonitor](self, "destroyNWMonitor");

  -[VCMediaStream unregisterWRMCallback](self, "unregisterWRMCallback");
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_momentsCollectorDelegate, 0);
  -[VCDatagramChannelManager removeDatagramChannel:](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "removeDatagramChannel:", self->_datagramChannel);

  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
    CFRelease(mediaQueue);

  pthread_mutex_destroy(&self->_streamLock);
  dispatch_release((dispatch_object_t)self->_delegateNotificationQueue);
  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  if ((VCFeatureFlagManager_SkipNonInfraWiFiAssertion() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v10 = v4;
        v11 = 2080;
        v12 = "-[VCMediaStream dealloc]";
        v13 = 1024;
        v14 = 743;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d NetworkAgent is being un-asserted by VCMediaStream's dealloc", buf, 0x1Cu);
      }
    }
    -[VCNetworkAgent removeAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "removeAssertion");
  }
  callID = self->_callID;
  if (callID)

  idsDestination = self->_idsDestination;
  if (idsDestination)

  -[VCTransportSession stop](self->_transportSession, "stop");
  -[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:](+[VCRateControllerManager sharedInstance](VCRateControllerManager, "sharedInstance"), "cleanupRateControllerSharingGroupWithConnection:usePolicy:", self->_connection, 1);

  -[VCMediaStream unregisterQoSReportingSource](self, "unregisterQoSReportingSource");
  -[VCMediaStream unregisterMediaControlInfoGenerator](self, "unregisterMediaControlInfoGenerator");
  if (self->_isReportingAgentOwner)
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    VCReporting_finalizeAggregation();
  }

  v8.receiver = self;
  v8.super_class = (Class)VCMediaStream;
  -[VCObject dealloc](&v8, sel_dealloc);
}

- (void)lock
{
  if (self)
    pthread_mutex_lock(&self->_streamLock);
}

- (void)unlock
{
  if (self)
    pthread_mutex_unlock(&self->_streamLock);
}

- (char)streamStateToString:(int)a3
{
  if ((a3 - 1) > 3)
    return "kVCMediaStreamStateStopped";
  else
    return off_1E9E56CC0[a3 - 1];
}

- (tagHANDLE)createRTPHandleWithStreamConfig:(id)a3 payloadType:(int)a4 localSSRC:(unsigned int)a5
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  tagVCMediaQueue *mediaQueue;
  uint64_t v15;
  int v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCMediaStream *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = 0xFFFFFFFFLL;
  v7 = RTPCreateHandle(&v25, a4, 1, self->_useRandomTS, self->_transportSessionID, (uint64_t)self->_vcMediaCallback, (uint64_t)self, a5);
  if (v7 < 0)
  {
    v17 = v7;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v27 = v21;
          v28 = 2080;
          v29 = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
          v30 = 1024;
          v31 = 822;
          v32 = 2112;
          v33 = v18;
          v34 = 2048;
          v35 = self;
          v36 = 1024;
          v37 = v17;
          v23 = "VCMediaStream [%s] %s:%d %@(%p) Failed to create RTP extension. Error=%d";
LABEL_34:
          _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x36u);
        }
      }
    }
  }
  else
  {
    v8 = RTPSetSendTimestampRate(v25, objc_msgSend(a3, "rtpTimestampRate"));
    if ((v8 & 0x80000000) == 0)
    {
      if (objc_msgSend(a3, "rateControlConfig"))
      {
        v9 = objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueue");
        if (v9 != 0xFFFFFFFFLL)
        {
          v10 = v9;
          v11 = v25;
          objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaQueueThrottlingInterval");
          RTPSetMediaQueue(v12, v11, v10);
          goto LABEL_11;
        }
      }
      if (objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "vcMediaQueue"))
      {
        v13 = v25;
        mediaQueue = (tagVCMediaQueue *)objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "vcMediaQueue");
        v15 = v13;
      }
      else
      {
        mediaQueue = self->_mediaQueue;
        if (!mediaQueue)
          goto LABEL_11;
        v15 = v25;
      }
      RTPSetVCMediaQueue(v15, mediaQueue);
LABEL_11:
      if (objc_msgSend(a3, "securityKeyHolder"))
        RTPSetVCSecurityKeyHolder(v25, (const void *)objc_msgSend(a3, "securityKeyHolder"));
      return (tagHANDLE *)v25;
    }
    v19 = v8;
    RTPCloseHandle();
    v25 = 0xFFFFFFFFLL;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v27 = v24;
          v28 = 2080;
          v29 = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
          v30 = 1024;
          v31 = 825;
          v32 = 2112;
          v33 = v20;
          v34 = 2048;
          v35 = self;
          v36 = 1024;
          v37 = v19;
          v23 = "VCMediaStream [%s] %s:%d %@(%p) Failed to set rtp timestamp rate. Error=%d";
          goto LABEL_34;
        }
      }
    }
  }
  return (tagHANDLE *)v25;
}

- (id)createTransportWithStreamConfig:(id)a3 ssrc:(unsigned int)a4
{
  uint64_t v4;
  tagHANDLE *v6;
  VCMediaStreamTransport *v7;
  VCMediaStreamTransport *v8;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCMediaStream *v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = -[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:](self, "createRTPHandleWithStreamConfig:payloadType:localSSRC:", a3, 1, *(_QWORD *)&a4);
  if (v6 == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream createTransportWithStreamConfig:ssrc:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = 136316162;
          v17 = v12;
          v18 = 2080;
          v19 = "-[VCMediaStream createTransportWithStreamConfig:ssrc:]";
          v20 = 1024;
          v21 = 846;
          v22 = 2112;
          v23 = v10;
          v24 = 2048;
          v25 = self;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to create RTP handle", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    goto LABEL_26;
  }
  v7 = -[VCMediaStreamTransport initWithHandle:localSSRC:]([VCMediaStreamTransport alloc], "initWithHandle:localSSRC:", v6, v4);
  if (!v7)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream createTransportWithStreamConfig:ssrc:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = 136316162;
          v17 = v14;
          v18 = 2080;
          v19 = "-[VCMediaStream createTransportWithStreamConfig:ssrc:]";
          v20 = 1024;
          v21 = 849;
          v22 = 2112;
          v23 = v11;
          v24 = 2048;
          v25 = self;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to create media stream transport", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    RTPCloseHandle();
LABEL_26:
    v8 = 0;
    return v8;
  }
  v8 = v7;
  -[NSMutableArray addObject:](self->_transportArray, "addObject:", v7);
  return v8;
}

- (void)unregisterStatistics
{
  AVCStatisticsCollector *statisticsCollector;

  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector)
  {
    if (self->_nwMonitorHandlerIndex < 0
      || (-[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 11), (statisticsCollector = self->_statisticsCollector) != 0))
    {
      if ((self->_rttMonitorHandlerIndex & 0x80000000) == 0)
        -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 3);
    }
  }
  self->_areStatisticsRegistered = 0;
}

- (int)registerStatisticsHandler:(id)a3 statisticType:(int)a4
{
  int v4;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = self->_statisticsHandler;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = __Block_byref_object_copy__22;
  v7[4] = __Block_byref_object_dispose__22;
  v7[5] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__VCMediaStream_registerStatisticsHandler_statisticType___block_invoke;
  v6[3] = &unk_1E9E56BD8;
  v6[4] = v8;
  v6[5] = v7;
  v4 = objc_msgSend(a3, "registerStatisticsChangeHandlerWithType:handler:", *(_QWORD *)&a4, v6);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v8, 8);
  return v4;
}

uint64_t __57__VCMediaStream_registerStatisticsHandler_statisticType___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, _OWORD *);
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
    v4 = *(_OWORD *)(a2 + 176);
    v10[10] = *(_OWORD *)(a2 + 160);
    v10[11] = v4;
    v11 = *(_QWORD *)(a2 + 192);
    v5 = *(_OWORD *)(a2 + 112);
    v10[6] = *(_OWORD *)(a2 + 96);
    v10[7] = v5;
    v6 = *(_OWORD *)(a2 + 144);
    v10[8] = *(_OWORD *)(a2 + 128);
    v10[9] = v6;
    v7 = *(_OWORD *)(a2 + 48);
    v10[2] = *(_OWORD *)(a2 + 32);
    v10[3] = v7;
    v8 = *(_OWORD *)(a2 + 80);
    v10[4] = *(_OWORD *)(a2 + 64);
    v10[5] = v8;
    v9 = *(_OWORD *)(a2 + 16);
    v10[0] = *(_OWORD *)a2;
    v10[1] = v9;
    return v2(v3, v10);
  }
  return result;
}

- (void)registerStatistics:(id)a3
{
  if (a3)
  {
    if (self->_areStatisticsRegistered)
      -[VCMediaStream unregisterStatistics](self, "unregisterStatistics");
    if (self->_isNWMonitorSignalEnabled
      || self->_isRTTBasedFIRThrottlingEnabled
      || self->_isServerPacketRetransmissionEnabled)
    {

      self->_statisticsCollector = (AVCStatisticsCollector *)a3;
      if (self->_isNWMonitorSignalEnabled)
        self->_nwMonitorHandlerIndex = -[VCMediaStream registerStatisticsHandler:statisticType:](self, "registerStatisticsHandler:statisticType:", a3, 11);
      if (self->_isRTTBasedFIRThrottlingEnabled || self->_isServerPacketRetransmissionEnabled)
        self->_rttMonitorHandlerIndex = -[VCMediaStream registerStatisticsHandler:statisticType:](self, "registerStatisticsHandler:statisticType:", a3, 3);
      self->_areStatisticsRegistered = 1;
    }
  }
}

- (void)initializeWRMUsingRtpHandle:(tagHANDLE *)a3
{
  WRMInitialize((uint64_t)-[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo"), (uint64_t)a3);
  RTPSetWRMInfo((uint64_t)a3, (uint64_t)-[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo"));
  RTPSetWRMMetricsCallback((uint64_t)a3, (uint64_t)_VCMediaStream_WRMReportMetricsCallback, (__int128 *)-[VCNetworkFeedbackController wrmContext](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmContext"));
  RTPSetWRMCallId((uint64_t)a3, -[VCNetworkFeedbackController callID](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "callID"));
}

- (void)unregisterWRMCallback
{
  if (self->_isWRMinitialized && -[VCMediaStream networkFeedbackController](self, "networkFeedbackController"))
  {
    if (-[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo"))
    {
      WRMSetReportingCallback((uint64_t)-[VCNetworkFeedbackController wrmInfo](-[VCMediaStream networkFeedbackController](self, "networkFeedbackController"), "wrmInfo"), 0, 0);
    }
  }
}

- (BOOL)shouldStopReportingTimer
{
  return (self->_operatingMode > 6u) | (0x39u >> self->_operatingMode) & 1;
}

- (void)registerQoSReportingSource
{
  if (!self->_isQoSReportingDisabled)
    -[VCQoSMonitorManager registerQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "registerQoSReportingSourceForToken:", self->_streamToken);
}

- (void)unregisterQoSReportingSource
{
  if (!self->_isQoSReportingDisabled)
    -[VCQoSMonitorManager unregisterQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "unregisterQoSReportingSourceForToken:", self->_streamToken);
}

- (void)registerAggregationHandlers
{
  if (!self->_isQoSReportingDisabled)
  {
    objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingSetPeriodicAggregationOccuredHandler();
    -[VCObject reportingAgent](self, "reportingAgent");
    ReportingVC_SetEventDrivenAggregationOccurredHandler();
  }
}

uint64_t __44__VCMediaStream_registerAggregationHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[VCQoSMonitorManager updateQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateQoSReport:toClientsWithToken:", a2, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "streamToken"));
}

uint64_t __44__VCMediaStream_registerAggregationHandlers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VCQoSMonitorManager updateEventDrivenQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateEventDrivenQoSReport:toClientsWithToken:", a3, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "streamToken"));
}

- (void)deregisterAggregationHandlers
{
  if (!self->_isQoSReportingDisabled)
  {
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingSetPeriodicAggregationOccuredHandler();
    -[VCObject reportingAgent](self, "reportingAgent");
    ReportingVC_SetEventDrivenAggregationOccurredHandler();
  }
}

- (void)registerMediaControlInfoGeneratorWithConfigs:(id)a3
{
  id v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  void *mediaControlInfoGenerator;
  int Type;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint32_t v43;
  uint64_t v44;
  NSObject *v45;
  void *oneToOneControlInfoGenerator;
  int v47;
  uint64_t v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  _BYTE v65[18];
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream getMediaStreamConfigForControlInfoGenerator:](self, "getMediaStreamConfigForControlInfoGenerator:");
  v50 = a3;
  if (!v5)
    goto LABEL_31;
  v6 = v5;
  v7 = (const void *)objc_msgSend((id)objc_msgSend(v5, "rateControlConfig"), "mediaControlInfoGenerator");
  self->_mediaControlInfoGeneratorType = objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoGeneratorType");
  if (objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "shouldCreateMediaControlInfoGenerator"))
  {
    -[VCMediaStream createLocalMediaControlInfoGeneratorWithType:version:](self, "createLocalMediaControlInfoGeneratorWithType:version:", self->_mediaControlInfoGeneratorType, objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoVersion"));
  }
  else if (v7)
  {
    self->_mediaControlInfoGenerator = (void *)CFRetain(v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v10 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v57 = v8;
        v58 = 2080;
        v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
        v60 = 1024;
        v61 = 973;
        v62 = 2080;
        v63 = (void *)v10;
        v64 = 2048;
        *(_QWORD *)v65 = self;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Using Media Control Info Generator from multiway config", buf, 0x30u);
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "feedbackController"))
  {
    self->_feedbackController = (AVCRateControlFeedbackController *)(id)objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "feedbackController");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v13 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v57 = v11;
        v58 = 2080;
        v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
        v60 = 1024;
        v61 = 977;
        v62 = 2080;
        v63 = (void *)v13;
        v64 = 2048;
        *(_QWORD *)v65 = self;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Using Feedback Controller from multiway config", buf, 0x30u);
      }
    }
  }
  a3 = v50;
  if (!objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "shouldRegisterMediaControlInfoGeneratorCallbacks"))goto LABEL_31;
  -[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:](self, "registerCallbacksForMediaControlInfoGenerator:forDirection:options:", self->_mediaControlInfoGenerator, objc_msgSend(v6, "direction"), objc_msgSend((id)objc_msgSend(v6, "rateControlConfig"), "mediaControlInfoGeneratorOptions"));
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_30;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    Type = VCMediaControlInfoGeneratorGetType(mediaControlInfoGenerator);
    v19 = objc_msgSend(v6, "direction");
    *(_DWORD *)buf = 136316418;
    v57 = v15;
    v58 = 2080;
    v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
    v60 = 1024;
    v61 = 983;
    v62 = 2048;
    v63 = mediaControlInfoGenerator;
    v64 = 1024;
    *(_DWORD *)v65 = Type;
    *(_WORD *)&v65[4] = 2048;
    *(_QWORD *)&v65[6] = v19;
    v20 = "VCMediaStream [%s] %s:%d Registered callbacks for MediaControlInfoGenerator[%p], type=%d, direction=%ld";
    v21 = v16;
    v22 = 54;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_30;
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v25 = self->_mediaControlInfoGenerator;
    v26 = VCMediaControlInfoGeneratorGetType(v25);
    v27 = objc_msgSend(v6, "direction");
    *(_DWORD *)buf = 136316930;
    v57 = v23;
    v58 = 2080;
    v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
    v60 = 1024;
    v61 = 983;
    v62 = 2112;
    v63 = (void *)v14;
    v64 = 2048;
    *(_QWORD *)v65 = self;
    *(_WORD *)&v65[8] = 2048;
    *(_QWORD *)&v65[10] = v25;
    v66 = 1024;
    v67 = v26;
    v68 = 2048;
    v69 = v27;
    v20 = "VCMediaStream [%s] %s:%d %@(%p) Registered callbacks for MediaControlInfoGenerator[%p], type=%d, direction=%ld";
    v21 = v24;
    v22 = 74;
  }
  _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_30:
  self->_mediaControlInfoCallbacksRegistered = 1;
  a3 = v50;
LABEL_31:
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (!v28)
    return;
  v30 = v28;
  v31 = *(_QWORD *)v53;
  *(_QWORD *)&v29 = 136316418;
  v49 = v29;
  do
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v53 != v31)
        objc_enumerationMutation(a3);
      v33 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v33, "multiwayConfig", v49), "isOneToOne")
        && objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "shouldRegisterMediaControlInfoGeneratorCallbacks"))
      {
        -[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:](self, "registerCallbacksForMediaControlInfoGenerator:forDirection:options:", objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGenerator"), objc_msgSend(v33, "direction"), objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGeneratorOptions"));
        self->_oneToOneFeedbackController = (AVCRateControlFeedbackController *)(id)objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "feedbackController");
        v34 = (void *)objc_msgSend((id)objc_msgSend(v33, "rateControlConfig"), "mediaControlInfoGenerator");
        if (v34)
          v34 = (void *)CFRetain(v34);
        self->_oneToOneControlInfoGenerator = v34;
        if ((VCMediaStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v44 = VRTraceErrorLogLevelToCSTR();
            v45 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
              v47 = VCMediaControlInfoGeneratorGetType(oneToOneControlInfoGenerator);
              v48 = objc_msgSend(v33, "direction");
              *(_DWORD *)buf = v49;
              v57 = v44;
              v58 = 2080;
              v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
              v60 = 1024;
              v61 = 994;
              v62 = 2048;
              v63 = oneToOneControlInfoGenerator;
              v64 = 1024;
              *(_DWORD *)v65 = v47;
              a3 = v50;
              *(_WORD *)&v65[4] = 2048;
              *(_QWORD *)&v65[6] = v48;
              v41 = v45;
              v42 = "VCMediaStream [%s] %s:%d Registered callbacks for oneToOne MediaControlInfoGenerator[%p], type=%d, direction=%ld";
              v43 = 54;
LABEL_49:
              _os_log_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, v43);
            }
          }
        }
        else
        {
          v35 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v35 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v38 = self->_oneToOneControlInfoGenerator;
              v39 = VCMediaControlInfoGeneratorGetType(v38);
              v40 = objc_msgSend(v33, "direction");
              *(_DWORD *)buf = 136316930;
              v57 = v36;
              v58 = 2080;
              v59 = "-[VCMediaStream registerMediaControlInfoGeneratorWithConfigs:]";
              v60 = 1024;
              v61 = 994;
              v62 = 2112;
              v63 = (void *)v35;
              v64 = 2048;
              *(_QWORD *)v65 = self;
              *(_WORD *)&v65[8] = 2048;
              *(_QWORD *)&v65[10] = v38;
              a3 = v50;
              v66 = 1024;
              v67 = v39;
              v68 = 2048;
              v69 = v40;
              v41 = v37;
              v42 = "VCMediaStream [%s] %s:%d %@(%p) Registered callbacks for oneToOne MediaControlInfoGenerator[%p], typ"
                    "e=%d, direction=%ld";
              v43 = 74;
              goto LABEL_49;
            }
          }
        }
        self->_mediaControlInfoCallbacksRegistered = 1;
        continue;
      }
    }
    v30 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  }
  while (v30);
}

- (id)getMediaStreamConfigForControlInfoGenerator:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(a3);
    v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
    if (objc_msgSend((id)objc_msgSend(v8, "rateControlConfig"), "mediaControlInfoGenerator")
      || (objc_msgSend((id)objc_msgSend(v8, "rateControlConfig"), "shouldCreateMediaControlInfoGenerator") & 1) != 0)
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v8 = 0;
      if (v5)
        goto LABEL_3;
      return v8;
    }
  }
}

- (void)createLocalMediaControlInfoGeneratorWithType:(unsigned int)a3 version:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *mediaControlInfoGenerator;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  VCMediaStream *v20;
  uint64_t v21;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (self->_mediaControlInfoGenerator)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v9 = "<nil>";
        v11 = 136316162;
        v12 = v7;
        v13 = 2080;
        v14 = "-[VCMediaStream createLocalMediaControlInfoGeneratorWithType:version:]";
        v15 = 1024;
        v16 = 1011;
        v17 = 2080;
        v18 = v9;
        v19 = 2048;
        v20 = self;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Api usage error. Overriding generator from multiway config with a locally created generator", (uint8_t *)&v11, 0x30u);
      }
    }
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    if (mediaControlInfoGenerator)
      CFRelease(mediaControlInfoGenerator);
  }
  self->_mediaControlInfoGenerator = 0;
  self->_mediaControlInfoGenerator = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(v5, v4);
}

- (void)registerCallbacksForMediaControlInfoGenerator:(void *)a3 forDirection:(int64_t)a4 options:(unsigned int)a5
{
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  VCMediaStream *v13;
  void (*v14)(uint64_t, uint64_t, void *);
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  VCMediaStream *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a5)
      VCMediaControlInfoGeneratorAddOptions(a3, *(const char **)&a5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v10 = "<nil>";
        v15 = 136316418;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCMediaStream registerCallbacksForMediaControlInfoGenerator:forDirection:options:]";
        v19 = 1024;
        v20 = 1027;
        v21 = 2080;
        v22 = v10;
        v23 = 2048;
        v24 = self;
        v25 = 2048;
        v26 = a4;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] Registering Media Control Info Generator Callbacks for direction %ld", (uint8_t *)&v15, 0x3Au);
      }
    }
    switch(a4)
    {
      case 3:
        v11 = VCMediaStreamFillMediaControlInfoCallback;
        v14 = VCMediaStreamProcessMediaControlInfoCallback;
        v12 = a3;
        v13 = self;
        break;
      case 2:
        v14 = VCMediaStreamProcessMediaControlInfoCallback;
        v12 = a3;
        v13 = self;
        v11 = 0;
        break;
      case 1:
        v11 = VCMediaStreamFillMediaControlInfoCallback;
        v12 = a3;
        v13 = self;
        v14 = 0;
        break;
      default:
        return;
    }
    VCMediaControlInfoGeneratorRegisterCallbacks(v12, (const char *)v13, (uint64_t)v11, (uint64_t)v14);
  }
}

- (void)unregisterMediaControlInfoGenerator
{
  void *mediaControlInfoGenerator;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *oneToOneControlInfoGenerator;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  AVCRateControlFeedbackController *feedbackController;
  AVCRateControlFeedbackController *oneToOneFeedbackController;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCMediaStream *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
  {
    if (!self->_mediaControlInfoCallbacksRegistered)
    {
LABEL_15:
      CFRelease(mediaControlInfoGenerator);
      self->_mediaControlInfoGenerator = 0;
      goto LABEL_16;
    }
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = (const __CFString *)self->_mediaControlInfoGenerator;
          v27 = 136315906;
          v28 = v5;
          v29 = 2080;
          v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          v31 = 1024;
          v32 = 1046;
          v33 = 2048;
          v34 = v7;
          v8 = "VCMediaStream [%s] %s:%d Deregistering callbacks for MediaControlInfoGenerator[%p]";
          v9 = v6;
          v10 = 38;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v27, v10);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = self->_mediaControlInfoGenerator;
          v27 = 136316418;
          v28 = v11;
          v29 = 2080;
          v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          v31 = 1024;
          v32 = 1046;
          v33 = 2112;
          v34 = v4;
          v35 = 2048;
          v36 = self;
          v37 = 2048;
          v38 = v13;
          v8 = "VCMediaStream [%s] %s:%d %@(%p) Deregistering callbacks for MediaControlInfoGenerator[%p]";
          v9 = v12;
          v10 = 58;
          goto LABEL_13;
        }
      }
    }
    VCMediaControlInfoGeneratorDeregisterCallbacks(self->_mediaControlInfoGenerator, (const char *)self);
    mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
    if (!mediaControlInfoGenerator)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_16:
  oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
  if (!oneToOneControlInfoGenerator)
    goto LABEL_31;
  if (self->_mediaControlInfoCallbacksRegistered)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = (const __CFString *)self->_oneToOneControlInfoGenerator;
          v27 = 136315906;
          v28 = v16;
          v29 = 2080;
          v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          v31 = 1024;
          v32 = 1053;
          v33 = 2048;
          v34 = v18;
          v19 = "VCMediaStream [%s] %s:%d Deregistering callbacks for oneToOne MediaControlInfoGenerator[%p]";
          v20 = v17;
          v21 = 38;
LABEL_28:
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v27, v21);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = self->_oneToOneControlInfoGenerator;
          v27 = 136316418;
          v28 = v22;
          v29 = 2080;
          v30 = "-[VCMediaStream unregisterMediaControlInfoGenerator]";
          v31 = 1024;
          v32 = 1053;
          v33 = 2112;
          v34 = v15;
          v35 = 2048;
          v36 = self;
          v37 = 2048;
          v38 = v24;
          v19 = "VCMediaStream [%s] %s:%d %@(%p) Deregistering callbacks for oneToOne MediaControlInfoGenerator[%p]";
          v20 = v23;
          v21 = 58;
          goto LABEL_28;
        }
      }
    }
    VCMediaControlInfoGeneratorDeregisterCallbacks(self->_oneToOneControlInfoGenerator, (const char *)self);
    oneToOneControlInfoGenerator = self->_oneToOneControlInfoGenerator;
    if (!oneToOneControlInfoGenerator)
      goto LABEL_31;
  }
  CFRelease(oneToOneControlInfoGenerator);
  self->_oneToOneControlInfoGenerator = 0;
LABEL_31:
  feedbackController = self->_feedbackController;
  if (feedbackController)
  {

    self->_feedbackController = 0;
  }
  oneToOneFeedbackController = self->_oneToOneFeedbackController;
  if (oneToOneFeedbackController)
  {

    self->_oneToOneFeedbackController = 0;
  }
  self->_mediaControlInfoCallbacksRegistered = 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v34;
  NSMutableArray *obj;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[10];
  VCMediaStream *v45;
  __int16 v46;
  _BYTE v47[10];
  int v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex"));
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v5 = -[VCMediaKeyIndex isEqual:](self->_lastReceivedMKI, "isEqual:", v4);
  v6 = !v5;
  if (!v5)
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_lastReceivedMKI, v4);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = self->_transportArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v49, 16, 544);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v51;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((v5 & objc_msgSend(v12, "encryptionInfoReceived") & 1) == 0)
        {
          if ((VCMediaStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v20 = VRTraceErrorLogLevelToCSTR();
              v21 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v22 = objc_msgSend(v12, "idsStreamId");
                *(_DWORD *)buf = 136316162;
                v38 = v20;
                v39 = 2080;
                v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
                v41 = 1024;
                v42 = 1131;
                v43 = 2048;
                *(_QWORD *)v44 = v12;
                *(_WORD *)&v44[8] = 1024;
                LODWORD(v45) = v22;
                v17 = v21;
                v18 = "VCMediaStream [%s] %s:%d Propagating MKM to transport=%p streamID=%d";
                v19 = 44;
LABEL_20:
                _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
              }
            }
          }
          else
          {
            v13 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v13 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v14 = VRTraceErrorLogLevelToCSTR();
              v15 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v16 = objc_msgSend(v12, "idsStreamId");
                *(_DWORD *)buf = 136316674;
                v38 = v14;
                v39 = 2080;
                v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
                v41 = 1024;
                v42 = 1131;
                v43 = 2112;
                *(_QWORD *)v44 = v13;
                *(_WORD *)&v44[8] = 2048;
                v45 = self;
                v46 = 2048;
                *(_QWORD *)v47 = v12;
                *(_WORD *)&v47[8] = 1024;
                v48 = v16;
                v17 = v15;
                v18 = "VCMediaStream [%s] %s:%d %@(%p) Propagating MKM to transport=%p streamID=%d";
                v19 = 64;
                goto LABEL_20;
              }
            }
          }
          objc_msgSend(v12, "handleEncryptionInfoChange:", a3);
          v9 = 1;
          continue;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
      if (!v8)
      {
        v6 = !v5;
        if ((v9 & 1) == 0)
          break;
LABEL_36:
        if (self)
          goto LABEL_37;
        return v6;
      }
    }
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v26 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v34), "count");
    *(_DWORD *)buf = 136316162;
    v38 = v24;
    v39 = 2080;
    v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
    v41 = 1024;
    v42 = 1137;
    v43 = 1024;
    *(_DWORD *)v44 = v6;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v26;
    v27 = "VCMediaStream [%s] %s:%d MKM not updated on media stream transports. shouldHandle=%d isTransportArrayCount=%u";
    v28 = v25;
    v29 = 40;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v32 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v34), "count");
    *(_DWORD *)buf = 136316674;
    v38 = v30;
    v39 = 2080;
    v40 = "-[VCMediaStream handleEncryptionInfoChange:]";
    v41 = 1024;
    v42 = 1137;
    v43 = 2112;
    *(_QWORD *)v44 = v23;
    *(_WORD *)&v44[8] = 2048;
    v45 = self;
    v46 = 1024;
    *(_DWORD *)v47 = v6;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = v32;
    v27 = "VCMediaStream [%s] %s:%d %@(%p) MKM not updated on media stream transports. shouldHandle=%d isTransportArrayCount=%u";
    v28 = v31;
    v29 = 60;
  }
  _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_37:
  pthread_mutex_unlock(&self->_streamLock);
  return v6;
}

- (void)resetDecryptionTimeout
{
  uint64_t v3;
  NSObject *v4;
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v3;
      v17 = 2080;
      v18 = "-[VCMediaStream resetDecryptionTimeout]";
      v19 = 1024;
      v20 = 1144;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Resetting decryption status", buf, 0x1Cu);
    }
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  transportArray = self->_transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "rtpHandle");
        RTPResetDecryptionStatus();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
  -[VCMediaStream decryptionStatusChanged:](self, "decryptionStatusChanged:", 1);
}

- (int)updateConnectionWithConfig:(id)a3
{
  VCConnectionLegacy *v5;
  VCRateSharingGroup *v6;
  VCRateSharingGroup *v7;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCMediaStream *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[60];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  _DWORD v38[7];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "localAddress"), "ip"), "UTF8String");
  objc_msgSend((id)objc_msgSend(a3, "localAddress"), "port");
  MakeIPPORT();
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip"), "UTF8String");
  objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port");
  MakeIPPORT();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  memset(v29, 0, sizeof(v29));
  v30 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0;
  v31 = 0u;
  v32 = 0u;
  v33 = 0;
  v37 = 0u;
  memset(v38, 0, sizeof(v38));

  v5 = -[VCConnectionLegacy initWithConnectionResult:type:]([VCConnectionLegacy alloc], "initWithConnectionResult:type:", v29, 0);
  self->_connection = &v5->super;
  if (!v5)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream updateConnectionWithConfig:].cold.1();
      }
      return 1;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 1;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 1;
    v15 = 136316674;
    v16 = v11;
    v17 = 2080;
    v18 = "-[VCMediaStream updateConnectionWithConfig:]";
    v19 = 1024;
    v20 = 1171;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = objc_msgSend(a3, "localAddress");
    v27 = 2112;
    v28 = objc_msgSend(a3, "remoteAddress");
    v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to create connection with localAddress=%@ and remoteAddress=%@";
    goto LABEL_26;
  }

  v6 = -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:](+[VCRateControllerManager sharedInstance](VCRateControllerManager, "sharedInstance"), "getRateControllerSharingGroupWithConnection:usePolicy:", self->_connection, 1);
  self->_rateSharingGroup = v6;
  if (!v6)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream updateConnectionWithConfig:].cold.2();
      }
      return 1;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 1;
    v14 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 1;
    v15 = 136316674;
    v16 = v14;
    v17 = 2080;
    v18 = "-[VCMediaStream updateConnectionWithConfig:]";
    v19 = 1024;
    v20 = 1175;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = objc_msgSend(a3, "localAddress");
    v27 = 2112;
    v28 = objc_msgSend(a3, "remoteAddress");
    v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to retrieve rate sharing group for connection with localAddress=%@ and "
          "remoteAddress=%@";
LABEL_26:
    _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x44u);
    return 1;
  }
  v7 = v6;
  return 0;
}

- (BOOL)updateRemoteAddressWithConfig:(id)a3 error:(id *)a4
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char IsOSFaultDisabled;
  NSObject *v12;
  const char *v13;
  const char *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  VCMediaStream *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "remoteAddress"))
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[VCTransportSession setRemoteAddress:remoteRTCPPort:](self->_transportSession, "setRemoteAddress:remoteRTCPPort:", objc_msgSend(a3, "remoteAddress"), objc_msgSend(a3, "rtcpRemotePort"));
LABEL_7:
      v9 = v8;
      if ((v8 & 0x80000000) == 0)
        return v9 >= 0;
      goto LABEL_8;
    }
LABEL_13:
    v9 = 0;
    return v9 >= 0;
  }
  v7 = -[VCTransportSession setRemoteAddress:remoteRTCPPort:](self->_transportSession, "setRemoteAddress:remoteRTCPPort:", objc_msgSend(a3, "remoteAddress"), objc_msgSend(a3, "rtcpRemotePort"));
  if ((v7 & 0x80000000) == 0)
  {
    v8 = -[VCMediaStream updateConnectionWithConfig:](self, "updateConnectionWithConfig:", a3);
    goto LABEL_7;
  }
  v9 = v7;
LABEL_8:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    v12 = *MEMORY[0x1E0CF2758];
    if ((IsOSFaultDisabled & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (objc_opt_class())
          v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v13 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v17 = v10;
        v18 = 2080;
        v19 = "-[VCMediaStream updateRemoteAddressWithConfig:error:]";
        v20 = 1024;
        v21 = 1200;
        v22 = 2080;
        v23 = v13;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = v9;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] Failed to setRemoteAddress on transportSession %d", buf, 0x36u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      if (objc_opt_class())
        v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v15 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v17 = v10;
      v18 = 2080;
      v19 = "-[VCMediaStream updateRemoteAddressWithConfig:error:]";
      v20 = 1024;
      v21 = 1200;
      v22 = 2080;
      v23 = v15;
      v24 = 2048;
      v25 = self;
      v26 = 1024;
      v27 = v9;
      _os_log_fault_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] Failed to setRemoteAddress on transportSession %d", buf, 0x36u);
    }
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1204), CFSTR("Stream configuration failed"), CFSTR("Could not set remote address on transport session"));
  return v9 >= 0;
}

- (id)getSharingGroupWithPolicy:(unsigned int)a3
{
  return -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:](+[VCRateControllerManager sharedInstance](VCRateControllerManager, "sharedInstance"), "getRateControllerSharingGroupWithConnection:usePolicy:", self->_connection, *(_QWORD *)&a3);
}

- (void)setMediaQueueInRateControlConfig:(id)a3
{
  if (a3)
    objc_msgSend(a3, "setVcMediaQueue:", objc_msgSend(-[VCMediaStream getSharingGroupWithPolicy:](self, "getSharingGroupWithPolicy:", 1), "mediaQueue"));
}

- (void)setMediaQueueInStreamConfig:(id)a3
{
  int v5;
  VCMediaStreamRateControlConfig *v6;
  VCMediaStreamRateControlConfig *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCMediaStream *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "accessNetworkType");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a3, "audioStreamMode") != 9)
      return;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(a3, "type") != 5)
      return;
  }
  if (v5 != 2)
    return;
  if (objc_msgSend(a3, "rateControlConfig"))
    goto LABEL_10;
  v6 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(a3, "setRateControlConfig:", v6);

LABEL_10:
    -[VCMediaStream setMediaQueueInRateControlConfig:](self, "setMediaQueueInRateControlConfig:", objc_msgSend(a3, "rateControlConfig"));
    return;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315650;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCMediaStream setMediaQueueInStreamConfig:]";
        v20 = 1024;
        v21 = 1243;
        v11 = "VCMediaStream [%s] %s:%d Could not allocate memory for creating VCMediaStreamRateControlConfig object";
        v12 = v10;
        v13 = 28;
LABEL_21:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316162;
        v17 = v14;
        v18 = 2080;
        v19 = "-[VCMediaStream setMediaQueueInStreamConfig:]";
        v20 = 1024;
        v21 = 1243;
        v22 = 2112;
        v23 = v8;
        v24 = 2048;
        v25 = self;
        v11 = "VCMediaStream [%s] %s:%d %@(%p) Could not allocate memory for creating VCMediaStreamRateControlConfig object";
        v12 = v15;
        v13 = 48;
        goto LABEL_21;
      }
    }
  }
}

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  int *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  char IsOSFaultDisabled;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  VCNetworkFeedbackController *v18;
  uint64_t v19;
  NSObject *v20;
  VCNetworkFeedbackController *networkFeedbackController;
  uint64_t v22;
  BOOL v23;
  const char *v25;
  const char *v26;
  const char *v27;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  VCMediaStream *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v36 = v6;
      v37 = 2080;
      v38 = "-[VCMediaStream setStreamConfig:withError:]";
      v39 = 1024;
      v40 = 1255;
      v41 = 2080;
      v42 = (void *)v8;
      v43 = 2048;
      v44 = self;
      v45 = 2080;
      v46 = "-[VCMediaStream setStreamConfig:withError:]";
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  if (self->_state)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1260), CFSTR("Bad API usage"), CFSTR("setStreamConfig called while media stream is running"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v11 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          if (objc_opt_class())
            v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
          else
            v12 = "<nil>";
          if (*a4)
            v26 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v26 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v36 = v9;
          v37 = 2080;
          v38 = "-[VCMediaStream setStreamConfig:withError:]";
          v39 = 1024;
          v40 = 1263;
          v41 = 2080;
          v42 = (void *)v12;
          v43 = 2048;
          v44 = self;
          v45 = 2080;
          v46 = v26;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] error[%s]", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        if (objc_opt_class())
          v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v25 = "<nil>";
        if (*a4)
          v27 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
        else
          v27 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v36 = v9;
        v37 = 2080;
        v38 = "-[VCMediaStream setStreamConfig:withError:]";
        v39 = 1024;
        v40 = 1263;
        v41 = 2080;
        v42 = (void *)v25;
        v43 = 2048;
        v44 = self;
        v45 = 2080;
        v46 = v27;
        _os_log_fault_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] error[%s]", buf, 0x3Au);
      }
    }
    v23 = 0;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(a3);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v17, "localSSRC"))
            self->_localSSRC = objc_msgSend(v17, "localSSRC");
          if (!self->_networkFeedbackController)
          {
            v18 = (VCNetworkFeedbackController *)objc_msgSend(v17, "networkFeedbackController");
            self->_networkFeedbackController = v18;
            if (v18)
              CFRetain(v18);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                networkFeedbackController = self->_networkFeedbackController;
                v22 = objc_opt_class();
                *(_DWORD *)buf = 136316162;
                v36 = v19;
                v37 = 2080;
                v38 = "-[VCMediaStream setStreamConfig:withError:]";
                v39 = 1024;
                v40 = 1273;
                v41 = 2048;
                v42 = networkFeedbackController;
                v43 = 2112;
                v44 = (VCMediaStream *)v22;
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d Setting stream config with networkFeedbackController=%p type=%@", buf, 0x30u);
              }
            }
          }
          if (!-[VCMediaStream updateRemoteAddressWithConfig:error:](self, "updateRemoteAddressWithConfig:error:", v17, a4))
          {
            v23 = 0;
            goto LABEL_37;
          }
          self->_isServerPacketRetransmissionEnabled |= objc_msgSend(v17, "isServerPacketRetransmissionEnabled");
          self->_isUplinkRetransmissionEnabled |= objc_msgSend(v17, "isUplinkRetransmissionEnabled");
          -[VCMediaStream setMediaQueueInStreamConfig:](self, "setMediaQueueInStreamConfig:", v17);
        }
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
        if (v14)
          continue;
        break;
      }
    }
    -[VCMediaStream unregisterMediaControlInfoGenerator](self, "unregisterMediaControlInfoGenerator");
    v23 = -[VCMediaStream onConfigureStreamWithConfiguration:error:](self, "onConfigureStreamWithConfiguration:error:", a3, a4);
    if (v23)
    {
LABEL_37:
      v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
    }
    else
    {
      v5 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaStream setStreamConfig:withError:].cold.1();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCMediaStream setStreamConfig:withError:].cold.2();
        }
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v5[252]));
  return v23;
}

- (id)start
{
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__22;
  v13 = __Block_byref_object_dispose__22;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  -[TimingCollection startTimingForKey:](self->_perfTimers, "startTimingForKey:", 19);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__VCMediaStream_start__block_invoke;
  v8[3] = &unk_1E9E56570;
  v8[5] = v3;
  v8[6] = &v9;
  v8[4] = self;
  -[VCMediaStream startWithCompletionHandler:](self, "startWithCompletionHandler:", v8);
  v4 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream start].cold.1();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v10 + 5, 32029, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1315), CFSTR("Media stream start time out"), CFSTR("Time out"));
    VCUtil_GenerateDiagnostics(0, 1, "Media stream start time out", 1u);
    v5 = (id)v10[5];
    -[VCMediaStream stopWithError:](self, "stopWithError:", v10[5]);
  }
  dispatch_release(v3);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

intptr_t __22__VCMediaStream_start__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 136316418;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCMediaStream start]_block_invoke";
      v15 = 1024;
      v16 = 1303;
      v17 = 2080;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2080;
      v22 = "-[VCMediaStream start]_block_invoke";
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", (uint8_t *)&v11, 0x3Au);
    }
  }
  if ((a2 & 1) == 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int state;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  NSString *v22;
  int64_t streamToken;
  int operatingMode;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[6];
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  VCMediaStream *v40;
  __int16 v41;
  _WORD v42[15];

  *(_QWORD *)&v42[11] = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v32 = v5;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1329;
      v37 = 2080;
      v38 = (void *)v7;
      v39 = 2048;
      v40 = self;
      v41 = 2080;
      *(_QWORD *)v42 = "-[VCMediaStream startWithCompletionHandler:]";
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  v30 = 0;
  if (self->_state)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1336), CFSTR("Bad API usage"), CFSTR("Start called while media stream is running or starting"));
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_36;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      state = self->_state;
      *(_DWORD *)buf = 136315906;
      v32 = v10;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1339;
      v37 = 1024;
      LODWORD(v38) = state;
      v13 = "VCMediaStream [%s] %s:%d Start called while media stream is running (state=%d)";
      v14 = v11;
      v15 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_36;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v18 = self->_state;
      *(_DWORD *)buf = 136316418;
      v32 = v16;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1339;
      v37 = 2112;
      v38 = (void *)v8;
      v39 = 2048;
      v40 = self;
      v41 = 1024;
      *(_DWORD *)v42 = v18;
      v13 = "VCMediaStream [%s] %s:%d %@(%p) Start called while media stream is running (state=%d)";
      v14 = v17;
      v15 = 54;
    }
LABEL_35:
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_36:
    pthread_mutex_unlock(&self->_streamLock);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v30);
    return;
  }
  -[VCMediaStream startMediaTransportsWithError:](self, "startMediaTransportsWithError:", &v30);
  if (v30)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_36;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_DWORD *)buf = 136315650;
      v32 = v25;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1347;
      v13 = "VCMediaStream [%s] %s:%d Failed to start media stream transports";
      v14 = v26;
      v15 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_36;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_DWORD *)buf = 136316162;
      v32 = v27;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1347;
      v37 = 2112;
      v38 = (void *)v9;
      v39 = 2048;
      v40 = self;
      v13 = "VCMediaStream [%s] %s:%d %@(%p) Failed to start media stream transports";
      v14 = v28;
      v15 = 48;
    }
    goto LABEL_35;
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__VCMediaStream_startWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E9E53C70;
  v29[4] = self;
  v29[5] = a3;
  -[VCMediaStream setState:](self, "setState:", 1);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaStream-onStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      streamToken = self->_streamToken;
      operatingMode = self->_operatingMode;
      *(_DWORD *)buf = 136316674;
      v32 = v19;
      v33 = 2080;
      v34 = "-[VCMediaStream startWithCompletionHandler:]";
      v35 = 1024;
      v36 = 1378;
      v37 = 2112;
      v38 = v22;
      v39 = 2048;
      v40 = self;
      v41 = 1024;
      *(_DWORD *)v42 = streamToken;
      v42[2] = 1024;
      *(_DWORD *)&v42[3] = operatingMode;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d @:@ VCMediaStream-onStart %@ (%p) streamToken=%d, operatingMode=%d", buf, 0x3Cu);
    }
  }
  -[VCMediaStream registerQoSReportingSource](self, "registerQoSReportingSource");
  -[VCMediaStream onStartWithCompletionHandler:](self, "onStartWithCompletionHandler:", v29);
  pthread_mutex_unlock(&self->_streamLock);
}

uint64_t __44__VCMediaStream_startWithCompletionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 176));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(v6 + 408);
  if (v7 == 3 || v7 == 0)
    return pthread_mutex_unlock((pthread_mutex_t *)(v6 + 176));
  if (a2)
  {
    if (*(_QWORD *)(v6 + 584))
    {
      objc_msgSend(*(id *)(v6 + 584), "start");
    }
    else
    {
      objc_msgSend((id)v6, "createNWMonitor");
      objc_msgSend(*(id *)(a1 + 32), "handleStartDidSucceed:withError:", 1, 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "reportTransportInfo");
  }
  else
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __44__VCMediaStream_startWithCompletionHandler___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = 136316162;
          v16 = v11;
          v17 = 2080;
          v18 = "-[VCMediaStream startWithCompletionHandler:]_block_invoke";
          v19 = 1024;
          v20 = 1369;
          v21 = 2112;
          v22 = v10;
          v23 = 2048;
          v24 = v14;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to start media", (uint8_t *)&v15, 0x30u);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "handleStartDidSucceed:withError:", 0, a3);
  }
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    return pthread_mutex_unlock((pthread_mutex_t *)(v13 + 176));
  return result;
}

- (void)setState:(int)a3
{
  uint64_t state;
  uint64_t v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[24];
  __int128 v15;
  char *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if ((_DWORD)state != a3)
  {
    v4 = *(_QWORD *)&a3;
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v14 = 136316162;
      *(_QWORD *)&v14[4] = v7;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCMediaStream setState:]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 1389;
      WORD2(v15) = 2080;
      *(_QWORD *)((char *)&v15 + 6) = -[VCMediaStream streamStateToString:](self, "streamStateToString:", state);
      HIWORD(v15) = 2080;
      v16 = -[VCMediaStream streamStateToString:](self, "streamStateToString:", v4);
      v9 = "VCMediaStream [%s] %s:%d Exiting state:%s Entering state:%s";
      v10 = v8;
      v11 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v14 = 136316674;
      *(_QWORD *)&v14[4] = v12;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCMediaStream setState:]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 1389;
      WORD2(v15) = 2112;
      *(_QWORD *)((char *)&v15 + 6) = v6;
      HIWORD(v15) = 2048;
      v16 = (char *)self;
      *(_WORD *)v17 = 2080;
      *(_QWORD *)&v17[2] = -[VCMediaStream streamStateToString:](self, "streamStateToString:", state);
      *(_WORD *)&v17[10] = 2080;
      *(_QWORD *)&v17[12] = -[VCMediaStream streamStateToString:](self, "streamStateToString:", v4);
      v9 = "VCMediaStream [%s] %s:%d %@(%p) Exiting state:%s Entering state:%s";
      v10 = v13;
      v11 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
LABEL_13:
    -[VCMediaStream willExitState:newState:](self, "willExitState:newState:", state, v4, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
    self->_state = v4;
    -[VCMediaStream didEnterState:oldState:](self, "didEnterState:oldState:", v4, state);
  }
}

- (void)handleStartDidSucceed:(BOOL)a3 withError:(id)a4
{
  _BOOL4 v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *state;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCMediaStream *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  VCMediaStream *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_state == 1)
  {
    v6 = a3;

    if (v6)
    {
      -[VCMediaStream startRTCPSendHeartbeat](self, "startRTCPSendHeartbeat");
      -[VCMediaStream startTimeoutHeartbeat](self, "startTimeoutHeartbeat");
      -[VCMediaStream setState:](self, "setState:", 2);
    }
    else
    {
      self->_stopError = (NSError *)a4;
      -[VCMediaStream stopInternalWithHandler:](self, "stopInternalWithHandler:", 0);
    }
    return;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        state = (const __CFString *)self->_state;
        v17 = 136316162;
        v18 = v8;
        v19 = 2080;
        v20 = "-[VCMediaStream handleStartDidSucceed:withError:]";
        v21 = 1024;
        v22 = 1407;
        v23 = 2048;
        v24 = state;
        v25 = 2112;
        v26 = self;
        v11 = "VCMediaStream [%s] %s:%d Ignoring Link connected event on stream with _state=%lu self=%@";
        v12 = v9;
        v13 = 48;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_state;
        v17 = 136316674;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCMediaStream handleStartDidSucceed:withError:]";
        v21 = 1024;
        v22 = 1407;
        v23 = 2112;
        v24 = v7;
        v25 = 2048;
        v26 = self;
        v27 = 2048;
        v28 = v16;
        v29 = 2112;
        v30 = self;
        v11 = "VCMediaStream [%s] %s:%d %@(%p) Ignoring Link connected event on stream with _state=%lu self=%@";
        v12 = v15;
        v13 = 68;
        goto LABEL_15;
      }
    }
  }
}

- (void)notifyDelegateDidReceiveRTCPPackets:(_RTCPPacketList *)a3
{
  id v5;
  id v6;
  int v7;
  tagRTCPPACKET *v8;
  void *v9;
  NSObject *delegateNotificationQueue;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream copyDelegate](self, "copyDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3->var1)
    {
      v7 = 0;
      do
      {
        v8 = a3->var2[(char)v7];
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, RTCPPacketByteSize((uint64_t)v8));
        objc_msgSend(v6, "addObject:", v9);

        ++v7;
      }
      while (a3->var1 > (char)v7);
    }
    delegateNotificationQueue = self->_delegateNotificationQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__VCMediaStream_notifyDelegateDidReceiveRTCPPackets___block_invoke;
    v11[3] = &unk_1E9E527D0;
    v11[4] = v5;
    v11[5] = self;
    v11[6] = v6;
    dispatch_async(delegateNotificationQueue, v11);

  }
}

uint64_t __53__VCMediaStream_notifyDelegateDidReceiveRTCPPackets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "vcMediaStream:didReceiveRTCPPackets:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)startMediaTransportsWithError:(id *)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  transportArray = self->_transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(transportArray);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "onStart");
        if (v10 < 0)
        {
          +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32013, v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1453), CFSTR("Unable to start media stream transport"), CFSTR("Internal error"));
          -[VCMediaStream stopMediaTransports](self, "stopMediaTransports");
          return 0;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 1;
}

- (void)stopMediaTransports
{
  NSMutableArray *transportArray;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  transportArray = self->_transportArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "onStop");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (id)stop
{
  return -[VCMediaStream stopWithError:](self, "stopWithError:", 0);
}

- (id)stopWithError:(id)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__22;
  v14 = __Block_byref_object_dispose__22;
  v15 = 0;
  self->_stopError = (NSError *)a3;
  v4 = dispatch_semaphore_create(0);
  -[VCObject startTimeoutTimer](self, "startTimeoutTimer");
  pthread_mutex_lock(&self->_streamLock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__VCMediaStream_stopWithError___block_invoke;
  v9[3] = &unk_1E9E56570;
  v9[5] = v4;
  v9[6] = &v10;
  v9[4] = self;
  -[VCMediaStream stopInternalWithHandler:](self, "stopInternalWithHandler:", v9);
  pthread_mutex_unlock(&self->_streamLock);
  v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream stopWithError:].cold.1();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v11 + 5, 32037, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1490), CFSTR("Media stream stop time out"), CFSTR("Time out"));
    VCUtil_GenerateDiagnostics(0, 1, "Media stream stop time out", 1u);
    v6 = (id)v11[5];
  }
  dispatch_release(v4);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __31__VCMediaStream_stopWithError___block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v9 = "<nil>";
        v18 = *(_QWORD *)(a1 + 32);
        v20 = 136316674;
        v21 = v7;
        v22 = 2080;
        v23 = "-[VCMediaStream stopWithError:]_block_invoke";
        v24 = 1024;
        v25 = 1479;
        v26 = 2080;
        v27 = (void *)v9;
        v28 = 2048;
        v29 = v18;
        v30 = 1024;
        *(_DWORD *)v31 = a2;
        *(_WORD *)&v31[4] = 2112;
        *(_QWORD *)&v31[6] = a3;
        v15 = "VCMediaStream [%s] %s:%d %s[%p] Executing stop completion handler, succeeded=%d error=%@";
        v16 = v8;
        v17 = 64;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        if (objc_opt_class())
          v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v13 = "<nil>";
        v14 = *(_QWORD *)(a1 + 32);
        v20 = 136317186;
        v21 = v10;
        v22 = 2080;
        v23 = "-[VCMediaStream stopWithError:]_block_invoke";
        v24 = 1024;
        v25 = 1479;
        v26 = 2112;
        v27 = (void *)v6;
        v28 = 2048;
        v29 = v12;
        v30 = 2080;
        *(_QWORD *)v31 = v13;
        *(_WORD *)&v31[8] = 2048;
        *(_QWORD *)&v31[10] = v14;
        v32 = 1024;
        v33 = a2;
        v34 = 2112;
        v35 = a3;
        v15 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Executing stop completion handler, succeeded=%d error=%@";
        v16 = v11;
        v17 = 84;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)stopInternalWithHandler:(id)a3
{
  int state;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  _QWORD v21[6];
  int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  VCMediaStream *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v24 = v6;
      v25 = 2080;
      v26 = "-[VCMediaStream stopInternalWithHandler:]";
      v27 = 1024;
      v28 = 1504;
      v29 = 2080;
      v30 = (void *)v8;
      v31 = 2048;
      v32 = self;
      v33 = 2080;
      v34 = "-[VCMediaStream stopInternalWithHandler:]";
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s", buf, 0x3Au);
    }
  }
  v9 = self->_state;
  if (v9 != 3 && v9 != 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__VCMediaStream_stopInternalWithHandler___block_invoke;
    v21[3] = &unk_1E9E56C50;
    v22 = state;
    v21[4] = self;
    v21[5] = a3;
    -[VCMediaStream setState:](self, "setState:", 3);
    -[VCMediaStream stopRTCPSendHeartbeat](self, "stopRTCPSendHeartbeat");
    -[VCMediaStream stopTimeoutHeartbeat](self, "stopTimeoutHeartbeat");
    -[VCMediaStream destroyNWMonitor](self, "destroyNWMonitor");
    -[VCMediaStream onStopWithCompletionHandler:](self, "onStopWithCompletionHandler:", v21);
    -[VCMediaStream unregisterStatistics](self, "unregisterStatistics");
    return;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_23;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v14 = self->_state;
    *(_DWORD *)buf = 136315906;
    v24 = v12;
    v25 = 2080;
    v26 = "-[VCMediaStream stopInternalWithHandler:]";
    v27 = 1024;
    v28 = 1506;
    v29 = 1024;
    LODWORD(v30) = v14;
    v15 = "VCMediaStream [%s] %s:%d Stop called while media stream is already stopped (state=%d)";
    v16 = v13;
    v17 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_23;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v20 = self->_state;
    *(_DWORD *)buf = 136316418;
    v24 = v18;
    v25 = 2080;
    v26 = "-[VCMediaStream stopInternalWithHandler:]";
    v27 = 1024;
    v28 = 1506;
    v29 = 2112;
    v30 = (void *)v11;
    v31 = 2048;
    v32 = self;
    v33 = 1024;
    LODWORD(v34) = v20;
    v15 = "VCMediaStream [%s] %s:%d %@(%p) Stop called while media stream is already stopped (state=%d)";
    v16 = v19;
    v17 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_23:
  -[VCObject stopTimeoutTimer](self, "stopTimeoutTimer");
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

uint64_t __41__VCMediaStream_stopInternalWithHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t result;
  _BYTE v40[24];
  __int128 v41;
  uint64_t v42;
  _BYTE v43[32];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v9 = "<nil>";
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v40 = 136316418;
        *(_QWORD *)&v40[4] = v7;
        *(_WORD *)&v40[12] = 2080;
        *(_QWORD *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1514;
        WORD2(v41) = 2080;
        *(_QWORD *)((char *)&v41 + 6) = v9;
        HIWORD(v41) = 2048;
        v42 = v18;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = a2;
        v15 = "VCMediaStream [%s] %s:%d %s[%p] Executing stop completion handler, stop succeeded[%d]";
        v16 = v8;
        v17 = 54;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        if (objc_opt_class())
          v13 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v13 = "<nil>";
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v40 = 136316930;
        *(_QWORD *)&v40[4] = v10;
        *(_WORD *)&v40[12] = 2080;
        *(_QWORD *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1514;
        WORD2(v41) = 2112;
        *(_QWORD *)((char *)&v41 + 6) = v6;
        HIWORD(v41) = 2048;
        v42 = v12;
        *(_WORD *)v43 = 2080;
        *(_QWORD *)&v43[2] = v13;
        *(_WORD *)&v43[10] = 2048;
        *(_QWORD *)&v43[12] = v14;
        *(_WORD *)&v43[20] = 1024;
        *(_DWORD *)&v43[22] = a2;
        v15 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Executing stop completion handler, stop succeeded[%d]";
        v16 = v11;
        v17 = 74;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, v40, v17);
      }
    }
  }
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    pthread_mutex_lock((pthread_mutex_t *)(v19 + 176));
  if ((_DWORD)a2)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_48;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      if (objc_opt_class())
        v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v24 = "<nil>";
      v36 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v40 = 136316162;
      *(_QWORD *)&v40[4] = v22;
      *(_WORD *)&v40[12] = 2080;
      *(_QWORD *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      LODWORD(v41) = 1518;
      WORD2(v41) = 2080;
      *(_QWORD *)((char *)&v41 + 6) = v24;
      HIWORD(v41) = 2048;
      v42 = v36;
      v33 = "VCMediaStream [%s] %s:%d %s[%p] Stopping stream transports";
      v34 = v23;
      v35 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_48;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_48;
      v27 = *(_QWORD *)(a1 + 32);
      if (objc_opt_class())
        v28 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v28 = "<nil>";
      v32 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v40 = 136316674;
      *(_QWORD *)&v40[4] = v25;
      *(_WORD *)&v40[12] = 2080;
      *(_QWORD *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      LODWORD(v41) = 1518;
      WORD2(v41) = 2112;
      *(_QWORD *)((char *)&v41 + 6) = v20;
      HIWORD(v41) = 2048;
      v42 = v27;
      *(_WORD *)v43 = 2080;
      *(_QWORD *)&v43[2] = v28;
      *(_WORD *)&v43[10] = 2048;
      *(_QWORD *)&v43[12] = v32;
      v33 = "VCMediaStream [%s] %s:%d %@(%p) %s[%p] Stopping stream transports";
      v34 = v26;
      v35 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, v40, v35);
LABEL_48:
    objc_msgSend(*(id *)(a1 + 32), "stopMediaTransports", *(_OWORD *)v40, *(_QWORD *)&v40[16], v41, v42, *(_OWORD *)v43, *(_OWORD *)&v43[16]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "stop");
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
    goto LABEL_49;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", *(unsigned int *)(a1 + 48));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __41__VCMediaStream_stopInternalWithHandler___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v40 = 136316162;
        *(_QWORD *)&v40[4] = v29;
        *(_WORD *)&v40[12] = 2080;
        *(_QWORD *)&v40[14] = "-[VCMediaStream stopInternalWithHandler:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        LODWORD(v41) = 1524;
        WORD2(v41) = 2112;
        *(_QWORD *)((char *)&v41 + 6) = v21;
        HIWORD(v41) = 2048;
        v42 = v31;
        _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to stop media", v40, 0x30u);
      }
    }
  }
LABEL_49:
  v37 = *(_QWORD *)(a1 + 32);
  if (v37)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v37 + 176));
    v38 = *(void **)(a1 + 32);
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(v38, "stopTimeoutTimer", *(_QWORD *)v40, *(_OWORD *)&v40[8], v41, v42);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (id)setPause:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  id v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__22;
  v16 = __Block_byref_object_dispose__22;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__VCMediaStream_setPause___block_invoke;
  v10[3] = &unk_1E9E56C78;
  v11 = v3;
  v10[5] = v5;
  v10[6] = &v12;
  v10[4] = self;
  -[VCMediaStream setPause:withCompletionHandler:](self, "setPause:withCompletionHandler:", v3, v10);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream setPause:].cold.1();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v13 + 5, 32037, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1557), CFSTR("Media stream pause time out"), CFSTR("Time out"));
    VCUtil_GenerateDiagnostics(0, 1, "Media stream pause time out", 1u);
    v7 = (id)v13[5];
  }
  dispatch_release(v5);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

intptr_t __26__VCMediaStream_setPause___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(unsigned __int8 *)(a1 + 56);
      v12 = 136316930;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCMediaStream setPause:]_block_invoke";
      v16 = 1024;
      v17 = 1546;
      v18 = 2080;
      v19 = v8;
      v20 = 2048;
      v21 = v9;
      v22 = 1024;
      v23 = v10;
      v24 = 1024;
      v25 = a2;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] setPause=%d completed success=%d error=%@", (uint8_t *)&v12, 0x46u);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getInvalidParamErrorForSetPause:(BOOL)a3 didSucceed:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int state;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  VCMediaStream *v33;
  __int16 v34;
  _WORD v35[15];

  v4 = a3;
  *(_QWORD *)&v35[11] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  if (a4)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return v24;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v24;
      state = self->_state;
      *(_DWORD *)buf = 136316162;
      v26 = v15;
      v27 = 2080;
      v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
      v29 = 1024;
      v30 = 1570;
      v31 = 1024;
      *(_DWORD *)v32 = v4;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = state;
      v18 = "VCMediaStream [%s] %s:%d setPause=%d called while in same state=%d already";
      v19 = v16;
      v20 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return v24;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v24;
      v23 = self->_state;
      *(_DWORD *)buf = 136316674;
      v26 = v21;
      v27 = 2080;
      v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
      v29 = 1024;
      v30 = 1570;
      v31 = 2112;
      *(_QWORD *)v32 = v14;
      *(_WORD *)&v32[8] = 2048;
      v33 = self;
      v34 = 1024;
      *(_DWORD *)v35 = v4;
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = v23;
      v18 = "VCMediaStream [%s] %s:%d %@(%p) setPause=%d called while in same state=%d already";
      v19 = v22;
      v20 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    return v24;
  }
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m", 1574);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v24, 32016, 115, v6, CFSTR("Bad API usage"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to set pause=%d while the media stream is in state=%d"), v4, self->_state));
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:].cold.1(v8, &v24, v9);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (v24)
          v13 = (const char *)objc_msgSend((id)objc_msgSend(v24, "description"), "UTF8String");
        else
          v13 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v26 = v10;
        v27 = 2080;
        v28 = "-[VCMediaStream getInvalidParamErrorForSetPause:didSucceed:]";
        v29 = 1024;
        v30 = 1577;
        v31 = 2112;
        *(_QWORD *)v32 = v7;
        *(_WORD *)&v32[8] = 2048;
        v33 = self;
        v34 = 2080;
        *(_QWORD *)v35 = v13;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) error=%s", buf, 0x3Au);
      }
    }
  }
  return v24;
}

- (void)setPause:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _BOOL4 v10;
  int state;
  BOOL v12;
  NSObject *delegateNotificationQueue;
  _QWORD *v14;
  BOOL v15;
  _QWORD v16[6];
  _QWORD block[6];
  char v18;
  BOOL v19;
  _QWORD v20[6];
  _QWORD v21[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  VCMediaStream *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v9 = "<nil>";
      v10 = self->_state == 4;
      *(_DWORD *)buf = 136316674;
      v25 = v7;
      v26 = 2080;
      v27 = "-[VCMediaStream setPause:withCompletionHandler:]";
      v28 = 1024;
      v29 = 1584;
      v30 = 2080;
      v31 = v9;
      v32 = 2048;
      v33 = self;
      v34 = 1024;
      v35 = v10;
      v36 = 1024;
      v37 = v5;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] setPause (was %d is %d)", buf, 0x3Cu);
    }
  }
  state = self->_state;
  if (v5)
  {
    if ((state - 1) < 2)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2;
      v20[3] = &unk_1E9E53C70;
      v20[4] = self;
      v20[5] = a4;
      -[VCMediaStream onPauseWithCompletionHandler:](self, "onPauseWithCompletionHandler:", v20);
LABEL_14:
      pthread_mutex_unlock(&self->_streamLock);
      return;
    }
    v12 = state == 4;
    pthread_mutex_unlock(&self->_streamLock);
    delegateNotificationQueue = self->_delegateNotificationQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E9E56CA0;
    v22 = v5;
    v23 = v12;
    v21[4] = self;
    v21[5] = a4;
    v14 = v21;
  }
  else
  {
    if (state == 4)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_135;
      v16[3] = &unk_1E9E53C70;
      v16[4] = self;
      v16[5] = a4;
      -[VCMediaStream onResumeWithCompletionHandler:](self, "onResumeWithCompletionHandler:", v16);
      goto LABEL_14;
    }
    v15 = state == 2;
    pthread_mutex_unlock(&self->_streamLock);
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_134;
    block[3] = &unk_1E9E56CA0;
    v18 = 0;
    v19 = v15;
    block[4] = self;
    block[5] = a4;
    v14 = block;
  }
  dispatch_async(delegateNotificationQueue, v14);
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "getInvalidParamErrorForSetPause:didSucceed:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 136316162;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCMediaStream setPause:withCompletionHandler:]_block_invoke";
        v15 = 1024;
        v16 = 1600;
        v17 = 2112;
        v18 = v5;
        v19 = 2048;
        v20 = v10;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Error pausing media", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 176));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_134(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "getInvalidParamErrorForSetPause:didSucceed:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_135(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v5, "setState:", 2);
  }
  else
  {
    objc_msgSend(v5, "setState:", 4);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_135_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = 136316162;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCMediaStream setPause:withCompletionHandler:]_block_invoke";
          v16 = 1024;
          v17 = 1623;
          v18 = 2112;
          v19 = v6;
          v20 = 2048;
          v21 = v11;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Error resuming media", (uint8_t *)&v12, 0x30u);
        }
      }
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 176));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)setLocalParticipantInfo:(id)a3 networkSockets:(id)a4 withError:(id *)a5
{
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  NSString *callID;
  const char *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  VCMediaStream *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  self->_callID = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCallID"));
  -[VCMediaStream onCallIDChanged](self, "onCallIDChanged");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientPID")))
    self->_clientPID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientPID")), "intValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteEndpointInfo")))
    self->_remoteEndpointInfo = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteEndpointInfo")));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientName")))
    self->_clientName = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientName"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientSessionID")))
    self->_clientSessionID = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamClientSessionID"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
      {
        v11 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        if (a3)
          goto LABEL_13;
      }
      else
      {
        v11 = "<nil>";
        if (a3)
        {
LABEL_13:
          v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
          if (a4)
          {
LABEL_14:
            v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_18:
            callID = self->_callID;
            if (callID)
              v15 = -[NSString UTF8String](-[NSString description](callID, "description"), "UTF8String");
            else
              v15 = "<nil>";
            v17 = 136316930;
            v18 = v9;
            v19 = 2080;
            v20 = "-[VCMediaStream setLocalParticipantInfo:networkSockets:withError:]";
            v21 = 1024;
            v22 = 1655;
            v23 = 2080;
            v24 = v11;
            v25 = 2048;
            v26 = self;
            v27 = 2080;
            v28 = v12;
            v29 = 2080;
            v30 = v13;
            v31 = 2080;
            v32 = v15;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] infoDict = %s networkSockets = %s callID = %s", (uint8_t *)&v17, 0x4Eu);
            goto LABEL_22;
          }
LABEL_17:
          v13 = "<nil>";
          goto LABEL_18;
        }
      }
      v12 = "<nil>";
      if (a4)
        goto LABEL_14;
      goto LABEL_17;
    }
  }
LABEL_22:
  if (a4)
    return -[VCMediaStream setupRTPWithSocketDictionary:error:](self, "setupRTPWithSocketDictionary:error:", a4, a5);
  else
    return -[VCMediaStream setupRTPWithLocalParticipantInfo:error:](self, "setupRTPWithLocalParticipantInfo:error:", a3, a5);
}

- (void)setStreamDirection:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  VCMediaStream *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316930;
      v19 = v5;
      v20 = 2080;
      v21 = "-[VCMediaStream setStreamDirection:]";
      v22 = 1024;
      v23 = 1668;
      v24 = 2080;
      v25 = v7;
      v26 = 2048;
      v27 = self;
      v28 = 2080;
      v29 = "-[VCMediaStream setStreamDirection:]";
      v30 = 1024;
      v31 = -[VCMediaStreamTransport streamDirection](-[VCMediaStream defaultTransport](self, "defaultTransport"), "streamDirection");
      v32 = 1024;
      v33 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s was[%d] now[%d]", buf, 0x46u);
    }
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(transportArray);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setStreamDirection:", a3);
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  }
  while (v10);
  if (self)
LABEL_17:
    pthread_mutex_unlock(&self->_streamLock);
}

- (int64_t)streamDirection
{
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  VCMediaStream *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v3 = -[VCMediaStreamTransport streamDirection](-[VCMediaStream defaultTransport](self, "defaultTransport"), "streamDirection");
  if (self)
    pthread_mutex_unlock(&self->_streamLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v6 = "<nil>";
      v8 = 136316674;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCMediaStream streamDirection]";
      v12 = 1024;
      v13 = 1684;
      v14 = 2080;
      v15 = v6;
      v16 = 2048;
      v17 = self;
      v18 = 2080;
      v19 = "-[VCMediaStream streamDirection]";
      v20 = 2048;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s streamDirection[%ld]", (uint8_t *)&v8, 0x44u);
    }
  }
  return v3;
}

- (void)sendControlPacketWithParameters:(_RTCP_SEND_CONTROL_PARAMETERS *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 v10;
  uint64_t var18;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaStream compoundStreamIDs](self, "compoundStreamIDs");
  a3->var18 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "unsignedShortValue");
      var18 = a3->var18;
      a3->var18 = var18 + 1;
      a3->var17[var18] = v10;
      if ((var18 + 1) == 12)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  -[VCMediaStreamTransport sendControlPacketWithParameters:](-[VCMediaStream defaultTransport](self, "defaultTransport"), "sendControlPacketWithParameters:", a3);
}

- (void)setRtcpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int state;
  BOOL v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  VCMediaStream *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCMediaStream setRtcpEnabled:]";
      v24 = 1024;
      v25 = 1702;
      v26 = 2080;
      v27 = v7;
      v28 = 2048;
      v29 = self;
      v30 = 2080;
      v31 = "-[VCMediaStream setRtcpEnabled:]";
      v32 = 1024;
      v33 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpEnabled[%d]", buf, 0x40u);
    }
  }
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setRtcpEnabled:", v3);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v10);
  }
  state = self->_state;
  if (state)
    v14 = state == 3;
  else
    v14 = 1;
  if (!v14)
  {
    if (v3)
      -[VCMediaStream startRTCPSendHeartbeat](self, "startRTCPSendHeartbeat");
    else
      -[VCMediaStream stopRTCPSendHeartbeat](self, "stopRTCPSendHeartbeat");
  }
  pthread_mutex_unlock(&self->_streamLock);
}

- (BOOL)isRTPTimeoutEnabled
{
  return -[VCMediaStreamTransport isRTPTimeoutEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isRTPTimeoutEnabled");
}

- (BOOL)isRTCPTimeoutEnabled
{
  return -[VCMediaStreamTransport isRTCPTimeoutEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isRTCPTimeoutEnabled");
}

- (BOOL)isDecryptionTimeoutEnabled
{
  return -[VCMediaStreamTransport isDecryptionTimeoutEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isDecryptionTimeoutEnabled");
}

- (BOOL)isRTCPSendEnabled
{
  return -[VCMediaStreamTransport isRTCPSendEnabled](-[VCMediaStream defaultTransport](self, "defaultTransport"), "isRTCPSendEnabled");
}

- (void)processRTPTimeoutSettingChange
{
  _BOOL4 v3;
  int state;
  BOOL v5;

  v3 = -[VCMediaStream isRTPTimeoutEnabled](self, "isRTPTimeoutEnabled");
  state = self->_state;
  if (state)
    v5 = state == 3;
  else
    v5 = 1;
  if (!v5)
  {
    if (v3)
      -[VCMediaStream startTimeoutHeartbeat](self, "startTimeoutHeartbeat");
    else
      -[VCMediaStream stopTimeoutHeartbeat](self, "stopTimeoutHeartbeat");
  }
}

- (void)processRTCPTimeoutSettingChange
{
  _BOOL4 v3;
  int state;
  BOOL v5;

  v3 = -[VCMediaStream isRTCPTimeoutEnabled](self, "isRTCPTimeoutEnabled");
  state = self->_state;
  if (state)
    v5 = state == 3;
  else
    v5 = 1;
  if (!v5)
  {
    if (v3)
      -[VCMediaStream startTimeoutHeartbeat](self, "startTimeoutHeartbeat");
    else
      -[VCMediaStream stopTimeoutHeartbeat](self, "stopTimeoutHeartbeat");
  }
}

- (void)processDecryptionTimeoutSettingChange
{
  _BOOL4 v3;
  int state;
  BOOL v5;

  v3 = -[VCMediaStream isDecryptionTimeoutEnabled](self, "isDecryptionTimeoutEnabled");
  state = self->_state;
  if (state)
    v5 = state == 3;
  else
    v5 = 1;
  if (!v5)
  {
    if (v3)
      -[VCMediaStream startTimeoutHeartbeat](self, "startTimeoutHeartbeat");
    else
      -[VCMediaStream stopTimeoutHeartbeat](self, "stopTimeoutHeartbeat");
  }
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int *v8;
  NSMutableArray *transportArray;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  int v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  VCMediaStream *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v23 = v5;
      v24 = 2080;
      v25 = "-[VCMediaStream setRtpTimeOutEnabled:]";
      v26 = 1024;
      v27 = 1770;
      v28 = 2080;
      v29 = v7;
      v30 = 2048;
      v31 = self;
      v32 = 2080;
      v33 = "-[VCMediaStream setRtpTimeOutEnabled:]";
      v34 = 1024;
      v35 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtpTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  transportArray = self->_transportArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v10)
  {
    -[VCMediaStream processRTPTimeoutSettingChange](self, "processRTPTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[252]));
    return;
  }
  v11 = v10;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(transportArray);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "isRTPTimeoutEnabled");
      objc_msgSend(v14, "setRtpTimeoutEnabled:", v3);
      v16 = objc_msgSend(v14, "isRTPTimeoutEnabled");
      if ((v15 & 1) == 0)
      {
        if (v16)
          self->_rtpTimeoutEnabledTime = NAN;
      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  }
  while (v11);
  -[VCMediaStream processRTPTimeoutSettingChange](self, "processRTPTimeoutSettingChange");
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    goto LABEL_22;
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int *v8;
  NSMutableArray *transportArray;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  int v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  VCMediaStream *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v23 = v5;
      v24 = 2080;
      v25 = "-[VCMediaStream setRtcpTimeOutEnabled:]";
      v26 = 1024;
      v27 = 1793;
      v28 = 2080;
      v29 = v7;
      v30 = 2048;
      v31 = self;
      v32 = 2080;
      v33 = "-[VCMediaStream setRtcpTimeOutEnabled:]";
      v34 = 1024;
      v35 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  transportArray = self->_transportArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v10)
  {
    -[VCMediaStream processRTCPTimeoutSettingChange](self, "processRTCPTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[252]));
    return;
  }
  v11 = v10;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(transportArray);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "isRTCPTimeoutEnabled");
      objc_msgSend(v14, "setRtcpTimeoutEnabled:", v3);
      v16 = objc_msgSend(v14, "isRTCPTimeoutEnabled");
      if ((v15 & 1) == 0)
      {
        if (v16)
          self->_rtcpTimeoutEnabledTime = NAN;
      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  }
  while (v11);
  -[VCMediaStream processRTCPTimeoutSettingChange](self, "processRTCPTimeoutSettingChange");
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    goto LABEL_22;
}

- (void)setDecryptionTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int *v8;
  NSMutableArray *transportArray;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  int v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  VCMediaStream *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v23 = v5;
      v24 = 2080;
      v25 = "-[VCMediaStream setDecryptionTimeOutEnabled:]";
      v26 = 1024;
      v27 = 1816;
      v28 = 2080;
      v29 = v7;
      v30 = 2048;
      v31 = self;
      v32 = 2080;
      v33 = "-[VCMediaStream setDecryptionTimeOutEnabled:]";
      v34 = 1024;
      v35 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s decryptionTimeOutEnabled[%d]", buf, 0x40u);
    }
  }
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  transportArray = self->_transportArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v10)
  {
    -[VCMediaStream processDecryptionTimeoutSettingChange](self, "processDecryptionTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock((pthread_mutex_t *)((char *)self + v8[252]));
    return;
  }
  v11 = v10;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(transportArray);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "isDecryptionTimeoutEnabled");
      objc_msgSend(v14, "setDecryptionTimeoutEnabled:", v3);
      v16 = objc_msgSend(v14, "isDecryptionTimeoutEnabled");
      if ((v15 & 1) == 0)
      {
        if (v16)
          self->_decryptionTimeoutEnabledTime = NAN;
      }
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  }
  while (v11);
  -[VCMediaStream processDecryptionTimeoutSettingChange](self, "processDecryptionTimeoutSettingChange");
  v8 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (self)
    goto LABEL_22;
}

- (void)setRtpTimeOutInterval:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  int v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  VCMediaStream *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v22 = v5;
      v23 = 2080;
      v24 = "-[VCMediaStream setRtpTimeOutInterval:]";
      v25 = 1024;
      v26 = 1839;
      v27 = 2080;
      v28 = v7;
      v29 = 2048;
      v30 = self;
      v31 = 2080;
      v32 = "-[VCMediaStream setRtpTimeOutInterval:]";
      v33 = 2048;
      v34 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtpTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v9)
  {
    -[VCMediaStream processRTPTimeoutSettingChange](self, "processRTPTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  v10 = v9;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(transportArray);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "isRTPTimeoutEnabled");
      objc_msgSend(v13, "setRtpTimeoutInterval:", a3);
      v15 = objc_msgSend(v13, "isRTPTimeoutEnabled");
      if ((v14 & 1) == 0)
      {
        if (v15)
          self->_rtpTimeoutEnabledTime = NAN;
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  }
  while (v10);
  -[VCMediaStream processRTPTimeoutSettingChange](self, "processRTPTimeoutSettingChange");
  if (self)
    goto LABEL_22;
}

- (void)setRtcpTimeOutInterval:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  int v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  VCMediaStream *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v22 = v5;
      v23 = 2080;
      v24 = "-[VCMediaStream setRtcpTimeOutInterval:]";
      v25 = 1024;
      v26 = 1862;
      v27 = 2080;
      v28 = v7;
      v29 = 2048;
      v30 = self;
      v31 = 2080;
      v32 = "-[VCMediaStream setRtcpTimeOutInterval:]";
      v33 = 2048;
      v34 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v9)
  {
    -[VCMediaStream processRTCPTimeoutSettingChange](self, "processRTCPTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  v10 = v9;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(transportArray);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "isRTCPTimeoutEnabled");
      objc_msgSend(v13, "setRtcpTimeoutInterval:", a3);
      v15 = objc_msgSend(v13, "isRTCPTimeoutEnabled");
      if ((v14 & 1) == 0)
      {
        if (v15)
          self->_rtcpTimeoutEnabledTime = NAN;
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  }
  while (v10);
  -[VCMediaStream processRTCPTimeoutSettingChange](self, "processRTCPTimeoutSettingChange");
  if (self)
    goto LABEL_22;
}

- (void)setDecryptionTimeOutInterval:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  int v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  VCMediaStream *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v22 = v5;
      v23 = 2080;
      v24 = "-[VCMediaStream setDecryptionTimeOutInterval:]";
      v25 = 1024;
      v26 = 1885;
      v27 = 2080;
      v28 = v7;
      v29 = 2048;
      v30 = self;
      v31 = 2080;
      v32 = "-[VCMediaStream setDecryptionTimeOutInterval:]";
      v33 = 2048;
      v34 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s decryptionTimeOutInterval[%f]", buf, 0x44u);
    }
  }
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (!v9)
  {
    -[VCMediaStream processDecryptionTimeoutSettingChange](self, "processDecryptionTimeoutSettingChange");
LABEL_22:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  v10 = v9;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(transportArray);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "isDecryptionTimeoutEnabled");
      VCMediaStreamTransport_SetDecryptionTimeoutInterval((uint64_t)v13, a3);
      v15 = objc_msgSend(v13, "isDecryptionTimeoutEnabled");
      if ((v14 & 1) == 0)
      {
        if (v15)
          self->_decryptionTimeoutEnabledTime = NAN;
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  }
  while (v10);
  -[VCMediaStream processDecryptionTimeoutSettingChange](self, "processDecryptionTimeoutSettingChange");
  if (self)
    goto LABEL_22;
}

- (void)setRtcpSendInterval:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int state;
  BOOL v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  VCMediaStream *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_opt_class())
        v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCMediaStream setRtcpSendInterval:]";
      v24 = 1024;
      v25 = 1907;
      v26 = 2080;
      v27 = v7;
      v28 = 2048;
      v29 = self;
      v30 = 2080;
      v31 = "-[VCMediaStream setRtcpSendInterval:]";
      v32 = 2048;
      v33 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d %s[%p] %s rtcpSendInterval[%f]", buf, 0x44u);
    }
  }
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "setRtcpSendInterval:", a3);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v10);
  }
  state = self->_state;
  if (state)
    v14 = state == 3;
  else
    v14 = 1;
  if (!v14)
  {
    if (-[VCMediaStream isRTCPSendEnabled](self, "isRTCPSendEnabled"))
    {
      if (self->_rtcpSendHeartbeat)
        -[VCMediaStream resetRTCPSendHeartbeatTimer:](self, "resetRTCPSendHeartbeatTimer:", 0);
      else
        -[VCMediaStream startRTCPSendHeartbeat](self, "startRTCPSendHeartbeat");
    }
    else
    {
      -[VCMediaStream stopRTCPSendHeartbeat](self, "stopRTCPSendHeartbeat");
    }
  }
  pthread_mutex_unlock(&self->_streamLock);
}

- (void)setBasebandCongestionDetector:(id)a3
{
  NSMutableArray *transportArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];

  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  transportArray = self->_transportArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(transportArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setBasebandCongestionDetector:", self->_basebandCongestionDetector);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  tagVCMediaQueue *mediaQueue;
  tagVCMediaQueue *v6;
  NSMutableArray *transportArray;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
    CFRelease(mediaQueue);
  if (a3)
    v6 = (tagVCMediaQueue *)CFRetain(a3);
  else
    v6 = 0;
  self->_mediaQueue = v6;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  transportArray = self->_transportArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(transportArray);
        RTPSetVCMediaQueue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "rtpHandle"), self->_mediaQueue);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (void)applyClientSessionID:(int)a3 clientUserInfo:(id)a4
{
  if (a3 <= 0x14 && ((1 << a3) & 0x1CE000) != 0)
    objc_msgSend(a4, "setObject:forKeyedSubscript:", self->_clientSessionID, CFSTR("CLID"));
}

- (RTCPReportProvider)rtcpReportProvider
{
  return (RTCPReportProvider *)-[VCWeakObjectHolder strong](self->_rtcpReportProvider, "strong");
}

- (void)setRtcpReportProvider:(id)a3
{

  self->_rtcpReportProvider = (VCWeakObjectHolder *)(id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", a3);
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  char v7;
  NSMutableArray *transportArray;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned __int8 v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v22;
  NSMutableArray *v23;
  BOOL v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCMediaStream *v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = *a4;
  *a4 = 0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  transportArray = self->_transportArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v9)
  {
    v11 = v9;
    v24 = 0;
    v12 = *(_QWORD *)v38;
    *(_QWORD *)&v10 = 136315650;
    v22 = v10;
    v23 = transportArray;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(transportArray);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v25 = v7;
        if ((objc_msgSend(v14, "generateReceptionReport:reportCount:", a3, &v25, v22) & 1) != 0)
        {
          v15 = v25;
          a3 += v25;
          *a4 += v25;
          v7 -= v15;
          v24 = 1;
          continue;
        }
        if ((VCMediaStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            continue;
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v27 = v19;
            v28 = 2080;
            v29 = "-[VCMediaStream generateReceptionReportList:reportCount:]";
            v30 = 1024;
            v31 = 1995;
            _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d Failed to generate reception report.", buf, 0x1Cu);
          }
          goto LABEL_18;
        }
        v16 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v27 = v17;
            v28 = 2080;
            v29 = "-[VCMediaStream generateReceptionReportList:reportCount:]";
            v30 = 1024;
            v31 = 1995;
            v32 = 2112;
            v33 = v16;
            v34 = 2048;
            v35 = self;
            _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %@(%p) Failed to generate reception report.", buf, 0x30u);
          }
LABEL_18:
          transportArray = v23;
          continue;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      if (!v11)
        return v24;
    }
  }
  return 0;
}

- (unsigned)getRTCPReportNTPTimeMiddle32ForReportId:(unsigned __int8)a3
{
  return -[VCMediaStreamTransport getRTCPReportNTPTimeMiddle32ForReportId:](-[VCMediaStream defaultTransport](self, "defaultTransport"), "getRTCPReportNTPTimeMiddle32ForReportId:", a3);
}

- (unsigned)getExtendedSequenceNumberForSequenceNumber:(unsigned __int16)a3
{
  return -[VCMediaStreamTransport getExtendedSequenceNumberForSequenceNumber:](-[VCMediaStream defaultTransport](self, "defaultTransport"), "getExtendedSequenceNumberForSequenceNumber:", a3);
}

- (void)resetRTCPSendHeartbeatTimer:(unint64_t)a3
{
  NSObject *rtcpSendHeartbeat;
  double v6;
  uint64_t v7;
  double v8;

  rtcpSendHeartbeat = self->_rtcpSendHeartbeat;
  if (rtcpSendHeartbeat)
  {
    -[VCMediaStreamTransport rtcpSendInterval](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtcpSendInterval");
    v7 = (unint64_t)(v6 * 1000000000.0);
    -[VCMediaStream rtcpHeartbeatLeeway](self, "rtcpHeartbeatLeeway");
    dispatch_source_set_timer(rtcpSendHeartbeat, a3, v7, (unint64_t)(v8 * 1000000000.0));
  }
}

- (void)rtcpSendHeartbeat
{
  int state;
  const __CFString *v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[18];
  __int16 v32;
  int v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 3 || state == 0)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315650;
      v25 = v8;
      v26 = 2080;
      v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      v28 = 1024;
      v29 = 2024;
      v10 = "VCMediaStream [%s] %s:%d RTCP send heartbeat called while the stream has already stopped.";
      v11 = v9;
      v12 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v25 = v13;
      v26 = 2080;
      v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      v28 = 1024;
      v29 = 2024;
      v30 = 2112;
      *(_QWORD *)v31 = v5;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)&v31[10] = self;
      v10 = "VCMediaStream [%s] %s:%d %@(%p) RTCP send heartbeat called while the stream has already stopped.";
      v11 = v14;
      v12 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return;
  }
  v23 = 0;
  v22 = NAN;
  if (-[VCMediaStreamTransport sendIntervalDidElapse:remainingTime:](-[VCMediaStream defaultTransport](self, "defaultTransport"), "sendIntervalDidElapse:remainingTime:", &v23, &v22))
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_29;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 136316162;
      v25 = v15;
      v26 = 2080;
      v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      v28 = 1024;
      v29 = 2035;
      v30 = 1024;
      *(_DWORD *)v31 = v23;
      *(_WORD *)&v31[4] = 2048;
      *(double *)&v31[6] = v22;
      v17 = "VCMediaStream [%s] %s:%d RTCP HeartBeat intervalElapsed:%d remainingInterval:%.5f";
      v18 = v16;
      v19 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_29;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 136316674;
      v25 = v20;
      v26 = 2080;
      v27 = "-[VCMediaStream rtcpSendHeartbeat]";
      v28 = 1024;
      v29 = 2035;
      v30 = 2112;
      *(_QWORD *)v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)&v31[10] = self;
      v32 = 1024;
      v33 = v23;
      v34 = 2048;
      v35 = v22;
      v17 = "VCMediaStream [%s] %s:%d %@(%p) RTCP HeartBeat intervalElapsed:%d remainingInterval:%.5f";
      v18 = v21;
      v19 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_29:
    if (v23)
      -[VCMediaStream onSendRTCPPacket](self, "onSendRTCPPacket");
    else
      -[VCMediaStream resetRTCPSendHeartbeatTimer:](self, "resetRTCPSendHeartbeatTimer:", dispatch_time(0, (uint64_t)(v22 * 1000000000.0)));
  }
}

- (void)startRTCPSendHeartbeat
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Error already started", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __39__VCMediaStream_startRTCPSendHeartbeat__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 176));
    result = *(_QWORD *)(a1 + 32);
  }
  else
  {
    result = 0;
  }
  if (*(_BYTE *)(result + 352))
    return pthread_mutex_unlock((pthread_mutex_t *)(result + 176));
  objc_msgSend((id)result, "rtcpSendHeartbeat");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return pthread_mutex_unlock((pthread_mutex_t *)(result + 176));
  return result;
}

- (void)stopRTCPSendHeartbeat
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *rtcpSendHeartbeat;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCMediaStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_rtcpSendHeartbeat)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = 136315650;
      v13 = v4;
      v14 = 2080;
      v15 = "-[VCMediaStream stopRTCPSendHeartbeat]";
      v16 = 1024;
      v17 = 2073;
      v6 = "VCMediaStream [%s] %s:%d Tearing down rtcp heartbeat!";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCMediaStream stopRTCPSendHeartbeat]";
      v16 = 1024;
      v17 = 2073;
      v18 = 2112;
      v19 = v3;
      v20 = 2048;
      v21 = self;
      v6 = "VCMediaStream [%s] %s:%d %@(%p) Tearing down rtcp heartbeat!";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v12, v8);
LABEL_13:
    self->_rtcpHeartbeatCancelled = 1;
    dispatch_source_cancel((dispatch_source_t)self->_rtcpSendHeartbeat);
    rtcpSendHeartbeat = self->_rtcpSendHeartbeat;
    if (rtcpSendHeartbeat)
    {
      dispatch_release(rtcpSendHeartbeat);
      self->_rtcpSendHeartbeat = 0;
    }
  }
}

- (void)createNWMonitor
{
  os_unfair_lock_s *p_nwMonitorLock;
  tagVCNWConnectionMonitor *v4;

  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  if (self->_transportSetupInfo.setupType == 4 && !self->_nwMonitor)
  {
    v4 = (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_Create(&self->_transportSetupInfo.var0.transportStreamInfo.context);
    self->_nwMonitor = v4;
    -[VCMediaStream setupCallbacksWithNWConnectionMonitor:](self, "setupCallbacksWithNWConnectionMonitor:", v4);
  }
  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)destroyNWMonitor
{
  os_unfair_lock_s *p_nwMonitorLock;
  tagVCNWConnectionMonitor *nwMonitor;

  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  nwMonitor = self->_nwMonitor;
  if (nwMonitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)nwMonitor);
    self->_nwMonitor = 0;
  }
  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCMediaStream setStreamIDs:repairStreamIDs:]"), 0));
}

- (void)resetTimeoutHeartbeatTimer:(unint64_t)a3
{
  NSObject *timeoutHeartbeat;

  timeoutHeartbeat = self->_timeoutHeartbeat;
  if (timeoutHeartbeat)
    dispatch_source_set_timer(timeoutHeartbeat, a3, 0x3B9ACA00uLL, 0x5F5E100uLL);
}

- (void)resetTimeoutHeartbeatWithRTPTimeout:(double)a3 rtcpTimeout:(double)a4 decryptionTimeout:(double)a5 currentTime:(double)a6
{
  double v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = fmin(fmin(a3, a4), a5);
  if ((VCMediaStream *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_17;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v18 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136316674;
        v23 = v16;
        v24 = 2080;
        v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
        v26 = 1024;
        v27 = 2125;
        v28 = 2112;
        v29 = *(double *)&v9;
        v30 = 2048;
        v31 = *(double *)&self;
        v32 = 2048;
        v33 = v7;
        v34 = 2048;
        v35 = a6;
        v13 = "VCMediaStream [%s] %s:%d %@(%p) Schedule next timeout @ %f currentTime:%f";
        v14 = v17;
        v15 = 68;
        goto LABEL_13;
      }
      goto LABEL_17;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v22 = 136316674;
    v23 = v16;
    v24 = 2080;
    v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    v26 = 1024;
    v27 = 2125;
    v28 = 2112;
    v29 = *(double *)&v9;
    v30 = 2048;
    v31 = *(double *)&self;
    v32 = 2048;
    v33 = v7;
    v34 = 2048;
    v35 = a6;
    v19 = "VCMediaStream [%s] %s:%d %@(%p) Schedule next timeout @ %f currentTime:%f";
    v20 = v17;
    v21 = 68;
LABEL_19:
    _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v22, v21);
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_17;
  v10 = VRTraceErrorLogLevelToCSTR();
  v11 = *MEMORY[0x1E0CF2758];
  v12 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v22 = 136316162;
    v23 = v10;
    v24 = 2080;
    v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    v26 = 1024;
    v27 = 2125;
    v28 = 2048;
    v29 = v7;
    v30 = 2048;
    v31 = a6;
    v19 = "VCMediaStream [%s] %s:%d Schedule next timeout @ %f currentTime:%f";
    v20 = v11;
    v21 = 48;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136316162;
    v23 = v10;
    v24 = 2080;
    v25 = "-[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:]";
    v26 = 1024;
    v27 = 2125;
    v28 = 2048;
    v29 = v7;
    v30 = 2048;
    v31 = a6;
    v13 = "VCMediaStream [%s] %s:%d Schedule next timeout @ %f currentTime:%f";
    v14 = v11;
    v15 = 48;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, v15);
  }
LABEL_17:
  -[VCMediaStream resetTimeoutHeartbeatTimer:](self, "resetTimeoutHeartbeatTimer:", dispatch_time(0, (uint64_t)((v7 - a6) * 1000000000.0)));
}

- (double)computeNextTimoutWithEnabledTime:(double)a3 timeoutInterval:(double)a4 lastReceivedPacketTime:(double)a5 currentTime:(double)a6 lastTimeoutReportTime:(double)a7
{
  double v7;
  double v8;
  double result;

  v7 = a4 + a5;
  v8 = fmax(a4 + a5, a7 + 1.0);
  if (a7 != 0.0)
    v7 = v8;
  result = v7;
  if (v7 <= a6)
    return a6 + 1.0;
  return result;
}

- (void)checkRTPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  double rtpTimeoutEnabledTime;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *delegateNotificationQueue;
  double v20;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3 - self->_rtpTimeoutEnabledTime;
  -[VCMediaStreamTransport rtpTimeoutInterval](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpTimeoutInterval");
  if (v7 > v8 && a3 - self->_lastRTPTimeoutReportTime > 1.0)
  {
    -[VCMediaStreamTransport rtpTimeoutInterval](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpTimeoutInterval");
    if (a3 - a4 > v9)
    {
      self->_lastRTPTimeoutReportTime = a3;
      if ((VCMediaStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_13;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        rtpTimeoutEnabledTime = self->_rtpTimeoutEnabledTime;
        *(_DWORD *)buf = 136316418;
        v23 = v11;
        v24 = 2080;
        v25 = "-[VCMediaStream checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        v26 = 1024;
        v27 = 2169;
        v28 = 2048;
        v29 = a4;
        v30 = 2048;
        v31 = a3;
        v32 = 2048;
        v33 = rtpTimeoutEnabledTime;
        v14 = "VCMediaStream [%s] %s:%d Last RTP packet receive time:%f now:%f rtpTimeoutEnabledTime=%f";
        v15 = v12;
        v16 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          *(double *)&v10 = COERCE_DOUBLE(-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix));
        else
          *(double *)&v10 = COERCE_DOUBLE(&stru_1E9E58EE0);
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_13;
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v20 = self->_rtpTimeoutEnabledTime;
        *(_DWORD *)buf = 136316930;
        v23 = v17;
        v24 = 2080;
        v25 = "-[VCMediaStream checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        v26 = 1024;
        v27 = 2169;
        v28 = 2112;
        v29 = *(double *)&v10;
        v30 = 2048;
        v31 = *(double *)&self;
        v32 = 2048;
        v33 = a4;
        v34 = 2048;
        v35 = a3;
        v36 = 2048;
        v37 = v20;
        v14 = "VCMediaStream [%s] %s:%d %@(%p) Last RTP packet receive time:%f now:%f rtpTimeoutEnabledTime=%f";
        v15 = v18;
        v16 = 78;
      }
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_13:
      -[VCMediaStream onRTPTimeout](self, "onRTPTimeout");
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__VCMediaStream_checkRTPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      dispatch_async(delegateNotificationQueue, block);
    }
  }
}

uint64_t __73__VCMediaStream_checkRTPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStreamDidRTPTimeOut:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)checkRTCPPacketTimeoutAgainstTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  NSObject *delegateNotificationQueue;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3 - self->_rtcpTimeoutEnabledTime;
  -[VCMediaStreamTransport rtcpTimeoutInterval](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtcpTimeoutInterval");
  if (v7 > v8 && a3 - self->_lastRTCPTimeoutReportTime > 1.0)
  {
    -[VCMediaStreamTransport rtcpTimeoutInterval](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtcpTimeoutInterval");
    if (a3 - a4 > v9)
    {
      self->_lastRTCPTimeoutReportTime = a3;
      self->_rtcpDidTimeout = 1;
      if ((VCMediaStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136316162;
        v23 = v13;
        v24 = 2080;
        v25 = "-[VCMediaStream checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        v26 = 1024;
        v27 = 2191;
        v28 = 2048;
        v29 = a4;
        v30 = 2048;
        v31 = a3;
        v15 = "VCMediaStream [%s] %s:%d Last RTCP packet receive time:%f now:%f";
        v16 = v14;
        v17 = 48;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v10 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136316674;
        v23 = v18;
        v24 = 2080;
        v25 = "-[VCMediaStream checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:]";
        v26 = 1024;
        v27 = 2191;
        v28 = 2112;
        v29 = *(double *)&v10;
        v30 = 2048;
        v31 = *(double *)&self;
        v32 = 2048;
        v33 = a4;
        v34 = 2048;
        v35 = a3;
        v15 = "VCMediaStream [%s] %s:%d %@(%p) Last RTCP packet receive time:%f now:%f";
        v16 = v19;
        v17 = 68;
      }
      _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
LABEL_16:
      -[VCMediaStream onRTCPTimeout](self, "onRTCPTimeout");
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      v12 = block;
      goto LABEL_17;
    }
    if (self->_rtcpDidTimeout && self->_lastRTCPTimeoutReportTime < a4)
    {
      self->_rtcpDidTimeout = 0;
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke_2;
      v20[3] = &unk_1E9E521C0;
      v20[4] = self;
      v12 = v20;
LABEL_17:
      dispatch_async(delegateNotificationQueue, v12);
    }
  }
}

uint64_t __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStreamDidRTCPTimeOut:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __74__VCMediaStream_checkRTCPPacketTimeoutAgainstTime_lastReceivedPacketTime___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStreamDidRecoverFromRTCPTimeOut:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __VCMediaStream_CheckDecryptionTimeoutForMKMRecoveryAgainstTime_block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcMediaStreamDidDecryptionTimeOutForMKMRecovery:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)timeoutHeartbeat
{
  double v3;
  int state;
  const __CFString *v6;
  void *v7;
  double v9;
  double v10;
  double rtpTimeoutEnabledTime;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  double rtcpTimeoutEnabledTime;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VCMediaStream *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = micro();
  if (self)
    pthread_mutex_lock(&self->_streamLock);
  state = self->_state;
  if (state == 3 || state == 0)
  {
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v30 = 136315650;
      v31 = v15;
      v32 = 2080;
      v33 = "-[VCMediaStream timeoutHeartbeat]";
      v34 = 1024;
      v35 = 2284;
      v17 = "VCMediaStream [%s] %s:%d RTCP send heartbeat called while the stream has already stopped.";
      v18 = v16;
      v19 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v30 = 136316162;
      v31 = v20;
      v32 = 2080;
      v33 = "-[VCMediaStream timeoutHeartbeat]";
      v34 = 1024;
      v35 = 2284;
      v36 = 2112;
      v37 = v6;
      v38 = 2048;
      v39 = self;
      v17 = "VCMediaStream [%s] %s:%d %@(%p) RTCP send heartbeat called while the stream has already stopped.";
      v18 = v21;
      v19 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v30, v19);
LABEL_21:
    pthread_mutex_unlock(&self->_streamLock);
    return;
  }
  v7 = (void *)_VCMediaStream_DefaultTransport((uint64_t)self);
  if (-[VCMediaStream isRTPTimeoutEnabled](self, "isRTPTimeoutEnabled"))
  {
    -[VCMediaStream lastReceivedRTPPacketTime](self, "lastReceivedRTPPacketTime");
    v10 = v9;
    -[VCMediaStream checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:](self, "checkRTPPacketTimeoutAgainstTime:lastReceivedPacketTime:", v3, v9);
    rtpTimeoutEnabledTime = self->_rtpTimeoutEnabledTime;
    objc_msgSend(v7, "rtpTimeoutInterval");
    -[VCMediaStream computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:](self, "computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:", rtpTimeoutEnabledTime, v12, v10, v3, self->_lastRTPTimeoutReportTime);
    v14 = v13;
  }
  else
  {
    v14 = NAN;
  }
  if (-[VCMediaStream isRTCPTimeoutEnabled](self, "isRTCPTimeoutEnabled"))
  {
    -[VCMediaStream lastReceivedRTCPPacketTime](self, "lastReceivedRTCPPacketTime");
    v23 = v22;
    -[VCMediaStream checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:](self, "checkRTCPPacketTimeoutAgainstTime:lastReceivedPacketTime:", v3, v22);
    rtcpTimeoutEnabledTime = self->_rtcpTimeoutEnabledTime;
    objc_msgSend(v7, "rtcpTimeoutInterval");
    -[VCMediaStream computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:](self, "computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:", rtcpTimeoutEnabledTime, v25, v23, v3, self->_lastRTCPTimeoutReportTime);
    v27 = v26;
  }
  else
  {
    v27 = NAN;
  }
  if (-[VCMediaStream isDecryptionTimeoutEnabled](self, "isDecryptionTimeoutEnabled"))
  {
    _VCMediaStream_CheckDecryptionTimeoutAgainstTime((uint64_t)self, v3, self->_decryptionErrorStartTime);
    -[VCMediaStream computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:](self, "computeNextTimoutWithEnabledTime:timeoutInterval:lastReceivedPacketTime:currentTime:lastTimeoutReportTime:", self->_decryptionTimeoutEnabledTime, VCMediaStreamTransport_DecryptionTimeoutInterval((uint64_t)v7), self->_decryptionErrorStartTime, v3, self->_lastDecryptionTimeoutReportTime);
    v29 = v28;
  }
  else
  {
    v29 = NAN;
  }
  -[VCMediaStream resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:](self, "resetTimeoutHeartbeatWithRTPTimeout:rtcpTimeout:decryptionTimeout:currentTime:", v14, v27, v29, v3);
  pthread_mutex_unlock(&self->_streamLock);
}

- (void)startTimeoutHeartbeat
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create timeout heartbeat", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __38__VCMediaStream_startTimeoutHeartbeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timeoutHeartbeat");
}

- (void)stopTimeoutHeartbeat
{
  int state;
  BOOL v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *timeoutHeartbeat;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCMediaStream *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_timeoutHeartbeat)
  {
    state = self->_state;
    if (state)
      v4 = state == 3;
    else
      v4 = 1;
    if (!v4)
    {
      v7 = -[VCMediaStream isRTPTimeoutEnabled](self, "isRTPTimeoutEnabled");
      if (v7
        || -[VCMediaStream isRTCPTimeoutEnabled](self, "isRTCPTimeoutEnabled")
        || -[VCMediaStream isDecryptionTimeoutEnabled](self, "isDecryptionTimeoutEnabled"))
      {
        -[VCMediaStream resetTimeoutHeartbeatTimer:](self, "resetTimeoutHeartbeatTimer:", 0);
        return;
      }
    }
    if ((VCMediaStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (v8 = VRTraceErrorLogLevelToCSTR(),
            v9 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_28:
        dispatch_source_cancel((dispatch_source_t)self->_timeoutHeartbeat);
        timeoutHeartbeat = self->_timeoutHeartbeat;
        if (timeoutHeartbeat)
        {
          dispatch_release(timeoutHeartbeat);
          self->_timeoutHeartbeat = 0;
        }
        self->_rtpTimeoutEnabledTime = NAN;
        self->_rtcpTimeoutEnabledTime = NAN;
        self->_decryptionTimeoutEnabledTime = NAN;
        return;
      }
      v23 = 136315650;
      v24 = v8;
      v25 = 2080;
      v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
      v27 = 1024;
      v28 = 2386;
      v10 = "VCMediaStream [%s] %s:%d Tearing down timeout heartbeat!";
      v11 = v9;
      v12 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_28;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v23 = 136316162;
      v24 = v18;
      v25 = 2080;
      v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
      v27 = 1024;
      v28 = 2386;
      v29 = 2112;
      v30 = v5;
      v31 = 2048;
      v32 = self;
      v10 = "VCMediaStream [%s] %s:%d %@(%p) Tearing down timeout heartbeat!";
      v11 = v19;
      v12 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v23, v12);
    goto LABEL_28;
  }
  if ((VCMediaStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v23 = 136315650;
    v24 = v13;
    v25 = 2080;
    v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
    v27 = 1024;
    v28 = 2374;
    v15 = "VCMediaStream [%s] %s:%d heartbeat is not active";
    v16 = v14;
    v17 = 28;
LABEL_35:
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)-[VCMediaStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136316162;
      v24 = v21;
      v25 = 2080;
      v26 = "-[VCMediaStream stopTimeoutHeartbeat]";
      v27 = 1024;
      v28 = 2374;
      v29 = 2112;
      v30 = v6;
      v31 = 2048;
      v32 = self;
      v15 = "VCMediaStream [%s] %s:%d %@(%p) heartbeat is not active";
      v16 = v22;
      v17 = 48;
      goto LABEL_35;
    }
  }
}

- (VCMediaStreamNotification)notificationDelegate
{
  return (VCMediaStreamNotification *)-[VCWeakObjectHolder strong](self->_notificationDelegate, "strong");
}

- (void)setNotificationDelegate:(id)a3
{

  self->_notificationDelegate = (VCWeakObjectHolder *)(id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", a3);
}

- (void)onCallIDChanged
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onCallIDChanged]"), 0));
}

- (id)supportedPayloads
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream supportedPayloads]"), 0));
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCMediaStream onConfigureStreamWithConfiguration:error:]"), 0));
}

- (void)onStartWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onStartWithCompletionHandler:]"), 0));
}

- (void)onStopWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onStopWithCompletionHandler:]"), 0));
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onPauseWithCompletionHandler:]"), 0));
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onResumeWithCompletionHandler:]"), 0));
}

- (void)onSendRTCPPacket
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onSendRTCPPacket]"), 0));
}

- (void)onRTPTimeout
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onRTPTimeout]"), 0));
}

- (void)onRTCPTimeout
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream onRTCPTimeout]"), 0));
}

- (double)lastReceivedRTPPacketTime
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream lastReceivedRTPPacketTime]"), 0));
}

- (double)lastReceivedRTCPPacketTime
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream lastReceivedRTCPPacketTime]"), 0));
}

- (double)rtcpHeartbeatLeeway
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream rtcpHeartbeatLeeway]"), 0));
}

- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream collectRxChannelMetrics:interval:]"), 0));
}

- (void)collectRxChannelMetrics:(id *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream collectRxChannelMetrics:]"), 0));
}

- (void)collectTxChannelMetrics:(id *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream collectTxChannelMetrics:]"), 0));
}

- (BOOL)shouldReportNetworkInterfaceType
{
  return 0;
}

- (void)handleActiveConnectionChange:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream handleActiveConnectionChange:]"), 0));
}

- (int)handleMediaCallbackNotification:(int)a3 inData:(void *)a4 outData:(void *)a5
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *delegateNotificationQueue;
  _QWORD *v11;
  char v12;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[5];
  char v17;
  _QWORD v18[6];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_14;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[VCMediaStream handleMediaCallbackNotification:inData:outData:].cold.2();
        goto LABEL_14;
      }
      v9 = 0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = v6;
        v21 = 2080;
        v22 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
        v23 = 1024;
        v24 = 2535;
        v25 = 1024;
        v26 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: call back is not supported for notification %d.", buf, 0x22u);
        goto LABEL_14;
      }
      return v9;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_2;
      v15[3] = &unk_1E9E52238;
      v15[4] = self;
      v15[5] = a4;
      v11 = v15;
      goto LABEL_13;
    case 4:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke;
      v18[3] = &unk_1E9E52238;
      v18[4] = self;
      v18[5] = a4;
      v11 = v18;
      goto LABEL_13;
    case 5:
      v12 = *(_BYTE *)a4;
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_160;
      v16[3] = &unk_1E9E521E8;
      v16[4] = self;
      v17 = v12;
      v11 = v16;
      goto LABEL_13;
    case 6:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3;
      v14[3] = &unk_1E9E52238;
      v14[4] = self;
      v14[5] = a4;
      v11 = v14;
LABEL_13:
      dispatch_async(delegateNotificationQueue, v11);
LABEL_14:
      v9 = 0;
      break;
    default:
      v9 = -2146369535;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStream handleMediaCallbackNotification:inData:outData:].cold.1();
      }
      break;
  }
  return v9;
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v2;
        v8 = 2080;
        v9 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]_block_invoke";
        v10 = 1024;
        v11 = 2505;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: SRTP key needs update", (uint8_t *)&v6, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_cold_1();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"), "mediaStream:didReceiveNewMediaKeyIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_160(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decryptionStatusChanged:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "notificationDelegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"), "mediaStream:didReceiveFlushRequestWithPayloads:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v2;
        v8 = 2080;
        v9 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]_block_invoke_3";
        v10 = 1024;
        v11 = 2528;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCMediaStream [%s] %s:%d MediaCallback: Gap in RTP sequence number detected", (uint8_t *)&v6, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3_cold_1();
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "notificationDelegate"), "mediaStream:didReceiveRTPGapForMediaKeyIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCMediaStream updateSourcePlayoutTime:]"), 0));
}

- (unsigned)endReason
{
  if (self->_stopError)
    return -[NSError code](self->_stopError, "code");
  if (self->_lastRTCPTimeoutReportTime <= 0.0)
    return 0;
  return 32040;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)mediaControlInfoGenerator
{
  return self->_mediaControlInfoGenerator;
}

- (unsigned)mediaControlInfoGeneratorType
{
  return self->_mediaControlInfoGeneratorType;
}

- (NSArray)transportArray
{
  return &self->_transportArray->super;
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (NSArray)compoundStreamIDs
{
  return (NSArray *)objc_getProperty(self, a2, 752, 1);
}

- (void)setCompoundStreamIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 752);
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 696);
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (int64_t)streamTokenUplink
{
  return self->_streamTokenUplink;
}

- (int64_t)streamTokenDownlink
{
  return self->_streamTokenDownlink;
}

- (int)state
{
  return self->_state;
}

- (tagVCMediaStreamDelegateRealtimeInstanceVTable)delegateFunctions
{
  return self->_delegateFunctions;
}

- (void)setDelegateFunctions:(tagVCMediaStreamDelegateRealtimeInstanceVTable)a3
{
  self->_delegateFunctions = a3;
}

uint64_t ___VCMediaStream_CheckDecryptionTimeoutAgainstTime_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "vcMediaStreamDidDecryptionTimeOut:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)defaultStreamConfig
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d _transportArray is empty, and we are trying to get the default stream config, which does not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)oneToOneStreamConfig
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d _transportArray does not have a oneToOne stream configuration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeTransportSetupInfoWithTransportSession:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d VCTransportSession init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleTransportSessionEvent:info:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Connection Setup Failed error = %@");
  OUTLINED_FUNCTION_3();
}

- (void)dupNWConnectionBackingSocket:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d nwConnection must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnectionWithID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create connectionClientID with %@");
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnectionWithID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create nw_connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnectionWithID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d nw_connection start failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnectionWithID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d VTP_ScheduleReceiveForNWConnection failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupNWConnectionWithID:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d nw_connection ready timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCallbacksWithNWConnectionMonitor:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Setting callbacks for monitor that is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRTPForIDS
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 136315906;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2080;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v1, v2, "VCMediaStream [%s] %s:%d Failed with error %@", v3);
  OUTLINED_FUNCTION_3();
}

- (void)initializeTransportSetupInfoWithIDSDestination:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d DatagramChannel start failed with error %x", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initializeTransportSetupInfoWithIDSDestination:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCMediaStream initializeTransportSetupInfoWithIDSDestination:error:]";
  v3 = 1024;
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d DatagramChannel start failed with error %x", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __70__VCMediaStream_initializeTransportSetupInfoWithIDSDestination_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d IDS eventHandler called without event type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createRTPHandleWithStreamConfig:payloadType:localSSRC:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create RTP extension. Error=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createRTPHandleWithStreamConfig:payloadType:localSSRC:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to set rtp timestamp rate. Error=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaStream createRTPHandleWithStreamConfig:payloadType:localSSRC:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportWithStreamConfig:ssrc:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create RTP handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportWithStreamConfig:ssrc:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to create media stream transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateConnectionWithConfig:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_21_0(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v1, v2, "VCMediaStream [%s] %s:%d Failed to create connection with localAddress=%@ and remoteAddress=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_9_1();
}

- (void)updateConnectionWithConfig:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_12();
  OUTLINED_FUNCTION_21_0(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_3_4(&dword_1D8A54000, v1, v2, "VCMediaStream [%s] %s:%d Failed to retrieve rate sharing group for connection with localAddress=%@ and remoteAddress=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_9_1();
}

- (void)setStreamConfig:withError:.cold.1()
{
  NSObject *v0;
  uint8_t v1[72];

  OUTLINED_FUNCTION_8_12();
  if (OUTLINED_FUNCTION_11_13(*MEMORY[0x1E0C80C00]))
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "description"), "UTF8String");
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_12_7();
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d %s[%p] %s error configuring stream", v1, 0x3Au);
  OUTLINED_FUNCTION_20_0();
}

- (void)setStreamConfig:withError:.cold.2()
{
  NSObject *v0;
  uint8_t v1[72];

  OUTLINED_FUNCTION_8_12();
  if (OUTLINED_FUNCTION_11_13(*MEMORY[0x1E0C80C00]))
    objc_msgSend((id)objc_msgSend((id)OUTLINED_FUNCTION_17_0(), "description"), "UTF8String");
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_12_7();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VCMediaStream [%s] %s:%d %s[%p] %s error configuring stream", v1, 0x3Au);
  OUTLINED_FUNCTION_20_0();
}

- (void)start
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d start timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCMediaStream_startWithCompletionHandler___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to start media", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopWithError:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d stop timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VCMediaStream_stopInternalWithHandler___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Failed to stop media", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setPause:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d pause timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getInvalidParamErrorForSetPause:(NSObject *)a3 didSucceed:.cold.1(uint64_t a1, id *a2, NSObject *a3)
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
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_9();
  v10 = 1577;
  v11 = v5;
  v12 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d error=%s", (uint8_t *)&v7, 0x26u);
}

void __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Error pausing media", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__VCMediaStream_setPause_withCompletionHandler___block_invoke_2_135_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d Error resuming media", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleMediaCallbackNotification:inData:outData:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
  OUTLINED_FUNCTION_4();
  v5 = 2538;
  v6 = v0;
  v7 = 2538;
  v8 = v0;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, "VCMediaStream [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStream.m:%d: MediaCallback: notificaiton %d unknown, no action.", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (void)handleMediaCallbackNotification:inData:outData:.cold.2()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCMediaStream handleMediaCallbackNotification:inData:outData:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCMediaStream [%s] %s:%d MediaCallback: call back is not supported for notification %d.", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d MediaCallback: SRTP key needs update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__VCMediaStream_handleMediaCallbackNotification_inData_outData___block_invoke_3_cold_1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCMediaStream [%s] %s:%d MediaCallback: Gap in RTP sequence number detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
