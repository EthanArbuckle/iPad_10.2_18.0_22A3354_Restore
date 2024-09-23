@implementation VCTransportSessionIDSMultiLink

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 reportingAgent:(id)a4
{
  return -[VCTransportSessionIDSMultiLink initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:](self, "initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:", *(_QWORD *)&a3, 0, a4, 0, 0);
}

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7
{
  return -[VCTransportSessionIDSMultiLink initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:dataPath:](self, "initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:dataPath:", *(_QWORD *)&a3, a4, a5, a6, a7, 0);
}

- (VCTransportSessionIDSMultiLink)initWithCallID:(unsigned int)a3 requireEncryptionInfo:(BOOL)a4 reportingAgent:(id)a5 notificationQueue:(id)a6 isMultiwaySession:(BOOL)a7 dataPath:(int)a8
{
  _BOOL8 v8;
  uint64_t v10;
  VCTransportSessionIDSMultiLink *v11;
  VCConnectionManagerIDS *connectionManager;
  objc_super v14;
  uint64_t v15;

  v8 = a7;
  v10 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCTransportSessionIDSMultiLink;
  v11 = -[VCTransportSessionIDS initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:dataPath:](&v14, sel_initWithCallID_requireEncryptionInfo_reportingAgent_notificationQueue_dataPath_, *(_QWORD *)&a3, a4, a5, a6, *(_QWORD *)&a8);
  if (v11)
  {
    connectionManager = -[VCConnectionManagerIDS initWithMultiwayEnabled:]([VCConnectionManagerIDS alloc], "initWithMultiwayEnabled:", v8);
    v11->super.super._connectionManager = &connectionManager->super;
    if (!v8)
    {
      -[VCConnectionManager setupConnectionHealthMonitor](connectionManager, "setupConnectionHealthMonitor");
      connectionManager = (VCConnectionManagerIDS *)v11->super.super._connectionManager;
    }
    -[VCConnectionManager setReportingAgent:](connectionManager, "setReportingAgent:", a5);
    -[VCConnectionManager setCallID:](v11->super.super._connectionManager, "setCallID:", v10);
    -[VCConnectionManager setDelegate:](v11->super.super._connectionManager, "setDelegate:", v11);
    -[VCConnectionManager setSupportDuplication:](v11->super.super._connectionManager, "setSupportDuplication:", -[VCTransportSession isHandoverSupported](v11, "isHandoverSupported"));
    VTP_RegisterConnectionManagerWithCallID(v11->super.super._connectionManager, -[VCConnectionManager callID](v11->super.super._connectionManager, "callID"));
    if (v8)
      v11->_sessionInfoSynchronizer = -[VCIDSSessionInfoSynchronizer initWithDelegate:connectionManager:reportingAgent:]([VCIDSSessionInfoSynchronizer alloc], "initWithDelegate:connectionManager:reportingAgent:", v11, v11->super.super._connectionManager, a5);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VTP_DeregisterConnectionManagerWithCallID(-[VCConnectionManager callID](self->super.super._connectionManager, "callID"));

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionIDSMultiLink;
  -[VCTransportSessionIDS dealloc](&v3, sel_dealloc);
}

- (int)onStart
{
  -[VCConnectionManager start](self->super.super._connectionManager, "start");
  return 0;
}

- (void)onStop
{
  -[VCConnectionManager stop](self->super.super._connectionManager, "stop");
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  VCConnectionIDS *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E60]);
  if (v4)
  {
    v5 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v29;
      *(_QWORD *)&v7 = 136315906;
      v18 = v7;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!VCConnectionIDSIsKnownRATType(objc_msgSend(v11, "RATType", v18))
            || !VCConnectionIDSIsKnownRATType(objc_msgSend(v11, "remoteRATType")))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCTransportSessionIDSMultiLink handleLinkConnectedWithInfo:].cold.1(v16, v11, v17);
            }
            return;
          }
          if (VCConnectionIDSIsCellularRATType(objc_msgSend(v11, "RATType")))
            -[VCConnectionManager setRealRATType:](self->super.super._connectionManager, "setRealRATType:", objc_msgSend(v11, "RATType"));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v11)
                v14 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              else
                v14 = "<nil>";
              *(_DWORD *)buf = v18;
              v20 = v12;
              v21 = 2080;
              v22 = "-[VCTransportSessionIDSMultiLink handleLinkConnectedWithInfo:]";
              v23 = 1024;
              v24 = 104;
              v25 = 2080;
              v26 = v14;
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new link established with link context %s", buf, 0x26u);
            }
          }
          v15 = -[VCConnectionIDS initWithLinkContext:dataChannelToken:]([VCConnectionIDS alloc], "initWithLinkContext:dataChannelToken:", v11, VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel));
          -[VCConnectionManager addConnection:](self->super.super._connectionManager, "addConnection:", v15);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  VCConnectionIDS *v12;
  id obj;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33E70]);
  if (obj)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v8)
                v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
              else
                v11 = "<nil>";
              *(_DWORD *)buf = 136315906;
              v15 = v9;
              v16 = 2080;
              v17 = "-[VCTransportSessionIDSMultiLink handleLinkDisconnectedWithInfo:]";
              v18 = 1024;
              v19 = 122;
              v20 = 2080;
              v21 = v11;
              _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: link %s disconnected", buf, 0x26u);
            }
          }
          v12 = -[VCConnectionIDS initWithLinkContext:dataChannelToken:]([VCConnectionIDS alloc], "initWithLinkContext:dataChannelToken:", v8, VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel));
          -[VCConnectionManager removeConnection:](self->super.super._connectionManager, "removeConnection:", v12);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v5);
    }
  }
}

- (void)handleSessionInfoResponse:(id)a3
{
  -[VCIDSSessionInfoSynchronizer updateVCIDSSessionInfoResponse:](self->_sessionInfoSynchronizer, "updateVCIDSSessionInfoResponse:", a3);
}

- (void)handleProbingResponse:(id)a3
{
  if (a3)
  {
    -[VCConnectionManager updateProbingResults:](self->super.super._connectionManager, "updateProbingResults:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDSMultiLink handleProbingResponse:].cold.1();
  }
}

- (void)setQuickRelayServerProvider:(int)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2 * (a3 == 2);
  -[VCConnectionManager setRelayServerProvider:](self->super.super._connectionManager, "setRelayServerProvider:", v3);
}

- (void)resetActiveConnection
{
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 18, 0);
}

- (void)setWiFiAssist:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *stateQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v5;
        v13 = 2080;
        v14 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]";
        v15 = 1024;
        v16 = 167;
        v17 = 1024;
        v18 = v3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d try to setWiFiAssist = %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[VCTransportSessionIDSMultiLink setWiFiAssist:].cold.1(v5, v3, v6);
    }
  }
  stateQueue = self->super.super._stateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__VCTransportSessionIDSMultiLink_setWiFiAssist___block_invoke;
  v9[3] = &unk_1E9E521E8;
  v9[4] = self;
  v10 = v3;
  dispatch_async(stateQueue, v9);
}

uint64_t __48__VCTransportSessionIDSMultiLink_setWiFiAssist___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 288) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 288) = v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(v3 + 32) + 288);
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]_block_invoke";
        v11 = 1024;
        v12 = 171;
        v13 = 1024;
        v14 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _isWiFiAssistActive = %d", (uint8_t *)&v7, 0x22u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 232), "setWiFiAssist:", *(unsigned __int8 *)(*(_QWORD *)(v3 + 32) + 288));
  }
  return result;
}

- (void)setDefaultLink:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCTransportSessionIDSMultiLink_setDefaultLink___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __49__VCTransportSessionIDSMultiLink_setDefaultLink___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = VCConnectionIDS_LinkID(*(_QWORD *)(a1 + 32));
  v18 = *MEMORY[0x1E0D33F38];
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v2);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 232));
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCTransportSessionIDSMultiLink setDefaultLink:]_block_invoke";
      v12 = 1024;
      v13 = 181;
      v14 = 1024;
      v15 = v2;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set default link %d on datagram channel %d", (uint8_t *)&v8, 0x28u);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "setChannelPreferences:", v3);
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4 activeConnection:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  VCDatagramChannelIDS *datagramChannel;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int IsLocalOnWiFiOrWired;
  VCDatagramChannelIDS *v16;
  VCIDSSessionInfoSynchronizer *sessionInfoSynchronizer;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a5);
  -[VCTransportSessionIDSMultiLink setDefaultLink:](self, "setDefaultLink:", a3);
  if (-[VCDefaults forceWiFiAssist](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceWiFiAssist"))
  {
    if (!VCConnection_IsLocalOnCellular((uint64_t)a5))
      goto LABEL_12;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        datagramChannel = self->super._datagramChannel;
        *(_DWORD *)buf = 136315906;
        v21 = v9;
        v22 = 2080;
        v23 = "-[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        v24 = 1024;
        v25 = 199;
        v26 = 2048;
        *(_QWORD *)v27 = datagramChannel;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Force wifi assist active always on cellular channel, _datagramChannel %p", buf, 0x26u);
      }
    }
    v12 = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        IsLocalOnWiFiOrWired = VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3);
        v16 = self->super._datagramChannel;
        *(_DWORD *)buf = 136316162;
        v21 = v13;
        v22 = 2080;
        v23 = "-[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:]";
        v24 = 1024;
        v25 = 203;
        v26 = 1024;
        *(_DWORD *)v27 = IsLocalOnWiFiOrWired;
        v27[2] = 2048;
        *(_QWORD *)&v27[3] = v16;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setWiFiAssist = %d, _datagramChannel %p", buf, 0x2Cu);
      }
    }
    v12 = VCConnection_IsLocalOnWiFiOrWired((uint64_t)a5);
  }
  -[VCTransportSessionIDSMultiLink setWiFiAssist:](self, "setWiFiAssist:", v12);
LABEL_12:
  if ((VCConnection_IsEndToEndLink((uint64_t)a3) & 1) != 0)
  {
    if (!self->_oneToOneModeEnabled && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionIDSMultiLink primaryConnectionChanged:oldPrimaryConnection:activeConnection:].cold.1();
    }
  }
  else
  {
    sessionInfoSynchronizer = self->_sessionInfoSynchronizer;
    if (self->_oneToOneModeEnabled)
      -[VCIDSSessionInfoSynchronizer optInAllStreamsForConnection:](sessionInfoSynchronizer, "optInAllStreamsForConnection:", a3);
    else
      -[VCIDSSessionInfoSynchronizer optInStreamIDsForNewPrimaryConnection:oldPrimaryConnection:](sessionInfoSynchronizer, "optInStreamIDsForNewPrimaryConnection:oldPrimaryConnection:", a3, a4);
  }
  v18[0] = CFSTR("transportSessionEventInfoNewPrimary");
  v18[1] = CFSTR("transportSessionEventInfoOldPrimary");
  v19[0] = a3;
  v19[1] = a4;
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
}

- (void)connectionCallback:(id)a3 isInitialConnection:(BOOL)a4
{
  _BOOL8 v4;
  const void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v4 = a4;
  v9[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a3);
    -[TimingCollection stopTimingForKey:](self->super.super._perfTimings, "stopTimingForKey:", 25);
    -[VCTransportSessionIDS setConnectionSetupTime](self, "setConnectionSetupTime");
    -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self->_sessionInfoSynchronizer, "optInStreamIDsForConnection:", a3);
  }
  else if (VCConnection_Priority((uint64_t)a3) != 2
         && !-[VCConnectionManager optIntoExistingSubscribedStreams](self->super.super._connectionManager, "optIntoExistingSubscribedStreams"))
  {
    v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super.super._connectionManager);
    -[VCIDSSessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:sentOnConnection:](self->_sessionInfoSynchronizer, "optOutStreamIDsForNonPrimaryConnection:sentOnConnection:", a3, v7);
    if (v7)
      CFRelease(v7);
  }
  v8[0] = CFSTR("transportSessionEventInfoNewLink");
  v8[1] = CFSTR("transportSessionEventInfoIsFirstLink");
  v9[0] = a3;
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
}

- (void)discardConnection:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__VCTransportSessionIDSMultiLink_discardConnection___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSessionIDSMultiLink discardConnection:].cold.1();
  }
}

uint64_t __52__VCTransportSessionIDSMultiLink_discardConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = VCConnectionIDS_LinkID(*(_QWORD *)(a1 + 32));
  v24[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v2);
  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v22 = *MEMORY[0x1E0D33F40];
  v23 = v3;
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 232));
      *(_DWORD *)buf = 136316162;
      v13 = v5;
      v14 = 2080;
      v15 = "-[VCTransportSessionIDSMultiLink discardConnection:]_block_invoke";
      v16 = 1024;
      v17 = 254;
      v18 = 1024;
      v19 = v2;
      v20 = 1024;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: discard link %d on datagram channel %d", buf, 0x28u);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "setChannelPreferences:", v4);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = CFSTR("transportSessionEventInfoDisconnectedLink");
  v11 = v8;
  return objc_msgSend(*(id *)(a1 + 40), "callEventHandlerWithEvent:info:", 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
}

- (void)didEnableDuplication:(BOOL)a3 activeConnection:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  int IsLocalOnCellular;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int IsRemoteOnCellular;
  _QWORD v24[2];
  _QWORD v25[3];

  v5 = a3;
  v25[2] = *MEMORY[0x1E0C80C00];
  -[VCTransportSession updateBasebandForConnection:](self, "updateBasebandForConnection:", a4);
  v24[0] = CFSTR("transportSessionEventInfoIsDuplicationEnabled");
  v24[1] = CFSTR("transportSessionEventInfoActiveConnection");
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v25[1] = a4;
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316418;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCTransportSessionIDSMultiLink didEnableDuplication:activeConnection:]";
      v16 = 1024;
      v17 = 268;
      v18 = 1024;
      v19 = v5;
      v20 = 1024;
      v21 = IsLocalOnCellular;
      v22 = 1024;
      IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a4);
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _datagramChannel. isDuplicationEnabled = %d, activeConnection: isLocalOnCellular = %d, isRemoteOnCellular = %d", (uint8_t *)&v12, 0x2Eu);
    }
  }
  if (!-[VCDefaults forceWiFiAssist](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceWiFiAssist"))
  {
    v11 = v5 & IsLocalOnCellular;
    if (v11)
      goto LABEL_10;
    if (v5)
    {
      if (!VCConnection_IsEndToEndLink((uint64_t)a4))
        goto LABEL_17;
      goto LABEL_12;
    }
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a4))
LABEL_10:
      -[VCTransportSessionIDSMultiLink setWiFiAssist:](self, "setWiFiAssist:", !v11);
  }
  if ((VCConnection_IsEndToEndLink((uint64_t)a4) & 1) != 0)
  {
LABEL_12:
    if (!self->_oneToOneModeEnabled && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSessionIDSMultiLink didEnableDuplication:activeConnection:].cold.1();
    }
    goto LABEL_21;
  }
  if (v5)
  {
LABEL_17:
    -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self->_sessionInfoSynchronizer, "optInStreamIDsForConnection:", a4);
    goto LABEL_21;
  }
  if (-[VCConnectionManager secondaryConnection](self->super.super._connectionManager, "secondaryConnection")
    && !-[VCConnectionManager optIntoExistingSubscribedStreams](self->super.super._connectionManager, "optIntoExistingSubscribedStreams"))
  {
    -[VCIDSSessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:sentOnConnection:](self->_sessionInfoSynchronizer, "optOutStreamIDsForNonPrimaryConnection:sentOnConnection:", -[VCConnectionManager secondaryConnection](self->super.super._connectionManager, "secondaryConnection"), a4);
  }
LABEL_21:
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 4, v7);
}

- (void)didUpdatePreferredInterfaceForDuplication:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v6 = a6;
  v7 = a4;
  v8 = a3;
  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("transportSessionEventInfoIsDuplicationEnabled");
  v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v10[1] = CFSTR("transportSessionEventInfoPreferredInterfaceForDuplication");
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v10[2] = CFSTR("transportSessionEventInfoNotifyPeer");
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v10[3] = CFSTR("transportSessionEventInfoIsMediaUnrecoverableSignal");
  v11[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 15, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4));
}

- (void)didMediaQualityDegrade:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("transportSessionEventInfoIsMediaQualityDegraded");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
}

- (void)didLocalNetworkQualityChange:(BOOL)a3 isLocalNetworkQualityBad:(BOOL)a4 isRemoteNetworkQualityBad:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v5 = a5;
  v6 = a4;
  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("transportSessionEventInfoDidLocalNetworkConditionChange");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8[1] = CFSTR("transportSessionEventInfoIsLocalNetworkQualityDegraded");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v8[2] = CFSTR("transportSessionEventInfoIsRemoteNetworkQualityDegraded");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  -[VCTransportSession callEventHandlerWithEvent:info:](self, "callEventHandlerWithEvent:info:", 20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
}

- (void)updateParticipantGenerationCounter:(unsigned __int8)a3
{
  -[VCIDSSessionInfoSynchronizer checkVCIDSSessionInfoNeedUpdate:](self->_sessionInfoSynchronizer, "checkVCIDSSessionInfoNeedUpdate:", a3);
}

- (void)resetParticipantGenerationCounter
{
  -[VCIDSSessionInfoSynchronizer resetParticipantGenerationCounter](self->_sessionInfoSynchronizer, "resetParticipantGenerationCounter");
}

- (void)optOutAllStreamsForConnection:(id)a3
{
  const void *v5;

  if (VCConnection_Priority((uint64_t)a3) != 2)
  {
    v5 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->super.super._connectionManager);
    -[VCIDSSessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:sentOnConnection:](self->_sessionInfoSynchronizer, "optOutStreamIDsForNonPrimaryConnection:sentOnConnection:", a3, v5);
    if (v5)
      CFRelease(v5);
  }
}

- (void)optIntoExistingSubscribedStreamsForConnection:(id)a3
{
  -[VCIDSSessionInfoSynchronizer optInAllStreamsForConnection:](self->_sessionInfoSynchronizer, "optInAllStreamsForConnection:", a3);
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *stateQueue;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = "disabled";
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCTransportSessionIDSMultiLink setOneToOneModeEnabled:isInitiator:]";
      if (v5)
        v9 = "enabled";
      v18 = 1024;
      v19 = 340;
      v20 = 2080;
      v21 = v9;
      v22 = 1024;
      v23 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: oneToOneMode %s for isInitiator: %d", buf, 0x2Cu);
    }
  }
  self->_oneToOneModeEnabled = v5;
  -[VCConnectionManager setOptIntoExistingSubscribedStreams:](self->super.super._connectionManager, "setOptIntoExistingSubscribedStreams:", v5);
  if (self->_oneToOneModeEnabled)
    -[VCIDSSessionInfoSynchronizer resetPeerSubscribedStreams](self->_sessionInfoSynchronizer, "resetPeerSubscribedStreams");
  stateQueue = self->super.super._stateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__VCTransportSessionIDSMultiLink_setOneToOneModeEnabled_isInitiator___block_invoke;
  v11[3] = &unk_1E9E52A50;
  v11[4] = self;
  v12 = v5;
  v13 = v4;
  dispatch_async(stateQueue, v11);
}

void *__69__VCTransportSessionIDSMultiLink_setOneToOneModeEnabled_isInitiator___block_invoke(uint64_t a1)
{
  void *result;
  int v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setOneToOneModeEnabled:isInitiator:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  result = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (result)
  {
    result = (void *)objc_msgSend(result, "objectForKey:", CFSTR("qrse_und2"));
    if (result)
    {
      v3 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", CFSTR("qrse_und2")), "BOOLValue");
      v4 = CFSTR("transportSessionEventInfoIsUplinkRetransmissionSupported");
      v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 ^ 1u);
      return (void *)objc_msgSend(*(id *)(a1 + 32), "callEventHandlerWithEvent:info:", 21, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
    }
  }
  return result;
}

- (void)startActiveProbingWithOptions:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCTransportSessionIDSMultiLink_startActiveProbingWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __64__VCTransportSessionIDSMultiLink_startActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F70]);
      v6 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F68]);
      v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F80]);
      v9 = 136316674;
      v10 = v2;
      v11 = 2080;
      v12 = "-[VCTransportSessionIDSMultiLink startActiveProbingWithOptions:]_block_invoke";
      v13 = 1024;
      v14 = 360;
      v15 = 1024;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Start active probing on datagram channel %d on connections with link IDs: %@ with interval: %@ and timeout: %@", (uint8_t *)&v9, 0x40u);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "startActiveProbingWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCTransportSessionIDSMultiLink_stopActiveProbingWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __63__VCTransportSessionIDSMultiLink_stopActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F70]);
      v7 = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCTransportSessionIDSMultiLink stopActiveProbingWithOptions:]_block_invoke";
      v11 = 1024;
      v12 = 367;
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Stop active probing on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "stopActiveProbingWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCTransportSessionIDSMultiLink_queryProbingResultsWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __65__VCTransportSessionIDSMultiLink_queryProbingResultsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F70]);
      v7 = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCTransportSessionIDSMultiLink queryProbingResultsWithOptions:]_block_invoke";
      v11 = 1024;
      v12 = 374;
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Query probing results on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "queryProbingResultsWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCTransportSessionIDSMultiLink_flushLinkProbingStatusWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __68__VCTransportSessionIDSMultiLink_flushLinkProbingStatusWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33F70]);
      v7 = 136316162;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCTransportSessionIDSMultiLink flushLinkProbingStatusWithOptions:]_block_invoke";
      v11 = 1024;
      v12 = 381;
      v13 = 1024;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Flush link probing results on datagram channel %d on connections with link IDs: %@", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "flushLinkProbingStatusWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)setRemoteDeviceVersionIDS
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__VCTransportSessionIDSMultiLink_setRemoteDeviceVersionIDS__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __59__VCTransportSessionIDSMultiLink_setRemoteDeviceVersionIDS__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "remoteDeviceVersionIDS");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCTransportSessionIDSMultiLink setRemoteDeviceVersionIDS]_block_invoke";
      v12 = 1024;
      v13 = 389;
      v14 = 1024;
      v15 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting the remote device version=%d", buf, 0x22u);
    }
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2, *MEMORY[0x1E0D33F58]);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setChannelPreferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
}

- (void)requestStatsWithOptions:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCTransportSessionIDSMultiLink_requestStatsWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __58__VCTransportSessionIDSMultiLink_requestStatsWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = VCDatagramChannelIDS_Token(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 232));
      v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33ED0]);
      v6 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D33FD0]);
      v8 = 136316418;
      v9 = v2;
      v10 = 2080;
      v11 = "-[VCTransportSessionIDSMultiLink requestStatsWithOptions:]_block_invoke";
      v12 = 1024;
      v13 = 397;
      v14 = 1024;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Request stats for datagram channel=%d on connection with link ID=%@ statsID=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "requestStatsWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)logSignalStrength
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v4 = 0;
  -[VCTransportSessionIDS getSignalStrengthBars:displayBars:maxDisplayBars:](self, "getSignalStrengthBars:displayBars:maxDisplayBars:", (char *)&v5 + 4, &v5, &v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCTransportSessionIDSMultiLink logSignalStrength]";
      v10 = 1024;
      v11 = 409;
      v12 = 1024;
      v13 = HIDWORD(v5);
      v14 = 1024;
      v15 = v5;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SignalStrength bars=%d displayBars=%d maxDisplayBars=%d", buf, 0x2Eu);
    }
  }
}

- (void)VCIDSSessionInfoSynchronizer:(void *)a3 sendVCIDSSessionInfoRequest:(id)a4
{
  NSObject *stateQueue;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    stateQueue = self->super.super._stateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__VCTransportSessionIDSMultiLink_VCIDSSessionInfoSynchronizer_sendVCIDSSessionInfoRequest___block_invoke;
    v9[3] = &unk_1E9E52238;
    v9[4] = self;
    v9[5] = a4;
    dispatch_async(stateQueue, v9);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCTransportSessionIDSMultiLink VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:]";
      v14 = 1024;
      v15 = 417;
      v16 = 2048;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d synchronizer = %p, request = %p", buf, 0x30u);
    }
  }
}

uint64_t __91__VCTransportSessionIDSMultiLink_VCIDSSessionInfoSynchronizer_sendVCIDSSessionInfoRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "requestSessionInfoWithOptions:", *(_QWORD *)(a1 + 40));
}

- (VCIDSSessionInfoSynchronizer)sessionInfoSynchronizer
{
  return self->_sessionInfoSynchronizer;
}

- (void)handleLinkConnectedWithInfo:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = 136316162;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCTransportSessionIDSMultiLink handleLinkConnectedWithInfo:]";
  v9 = 1024;
  v10 = 99;
  v11 = 1024;
  v12 = objc_msgSend(a2, "RATType");
  v13 = 1024;
  v14 = objc_msgSend(a2, "remoteRATType");
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Discarding link with unknown RAT local %d remote %d", (uint8_t *)&v5, 0x28u);
}

- (void)handleProbingResponse:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Probing response received is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setWiFiAssist:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
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

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCTransportSessionIDSMultiLink setWiFiAssist:]";
  v7 = 1024;
  v8 = 167;
  v9 = 1024;
  v10 = a2 & 1;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d try to setWiFiAssist = %d", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)primaryConnectionChanged:oldPrimaryConnection:activeConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Primary connection changed to an end-to-end connection in GFT", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)discardConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d got a nil connection, return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didEnableDuplication:activeConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Active connection is end-to-end when updating duplication state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
